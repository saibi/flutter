import 'dart:convert';
import 'package:http/http.dart' as http;

class TestModel {
  final String name;
  final String description;

  TestModel({
    required this.name,
    required this.description,
  });

  factory TestModel.fromJson(Map<String, dynamic> json) {
    return TestModel(
      name: json['Name'],
      description: json['Description'],
    );
  }

  static Future<List<TestModel>> fetchAll() async {
    final response = await http.get(Uri.parse("DBG set valid uri"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => TestModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to fetch data from API');
    }
  }
}


/* 

Apps Script Code

function doGet(e) {
  var sheet = SpreadsheetApp.openById('sheet id here').getSheetByName('sheet name here');
  var values = sheet.getDataRange().getValues();

  var headers = values.shift();
  var result = [];

  values.forEach(function(row) {
    var obj = {};
    row.forEach(function(value, index) {
      obj[headers[index]] = value;
    });
    result.push(obj);
  });
  if ( e != null && e.parameters != null ) {
    var names = e.parameters.Name; // Column 'Name' here
    if ( names != null ) {
      var filteredResult = [];
      for ( const name of names ) {
        filteredResult.push(...result.filter( row => row.Name == name));
      }
      result = filteredResult;
    }
  }
  Logger.log(result);
  
  var output = ContentService.createTextOutput(JSON.stringify(result));
  output.setMimeType(ContentService.MimeType.JSON);

  return output;
}

function tester() {
  var req = {"contextPath":"","parameter":{"Name":"hello"},"parameters":{"Name":["hello"]},"contentLength":-1,"queryString":"Name=hello"}

  doGet(req);
}

*/