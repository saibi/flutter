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
