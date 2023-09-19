import 'dart:convert';
import 'package:http/http.dart' as http;

class MarioCharacter {
  final String name;
  final String purpose;
  final bool isEnemy;

  MarioCharacter(
      {required this.name, required this.purpose, required this.isEnemy});

  factory MarioCharacter.fromJson(Map<String, dynamic> json) {
    return MarioCharacter(
      name: json['Name'],
      purpose: json['Purpose'],
      isEnemy: json['Enemy'] == 'true',
    );
  }

  static Future<List<MarioCharacter>> fetchAll() async {
    final response = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbyNKq8_vqEKHHnWSzqFlB_bBMnw78XOIRa67uNOgXejwYVWHB7bcfQTdRdS_xwzcaxXeg/exec"));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => MarioCharacter.fromJson(data)).toList();
    } else {
      throw Exception('Failed to fetch data from API');
    }
  }
}

/* 
Apps Script Code 

function doGet() {
  var sheet = SpreadsheetApp.openById('1Z8mwKXZTRYlt5ph_e7wQS2Y5YaBnMN0CpJHim7O3tK0').getSheetByName('sheet1');
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

  Logger.log(result);

  var output = ContentService.createTextOutput(JSON.stringify(result));
  output.setMimeType(ContentService.MimeType.JSON);

  return output;
}
*/