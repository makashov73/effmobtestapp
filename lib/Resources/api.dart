import 'dart:convert';
import 'package:effmobtestapp/Models/dishes.dart';
import 'package:http/http.dart' as http;
import 'package:effmobtestapp/Models/categories.dart';
import 'package:effmobtestapp/Resources/constants.dart';

class ApiCategories {
  Future<List<Data>> getCatigoryList() async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.listEndpoint);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> result =
          jsonDecode(response.body)['сategories'] as List;
      return result
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}

class ApiDishes {
  Future<List<Dishes>> getDishesList() async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.dishesEndpoint);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body)['dishes'] as List;
      return result
          .map((e) => Dishes.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}
