import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task8/model/model.dart';


class Api {
  static Future<FactModel> fetchFact() async {
    var response = await http.get(Uri.parse("https://catfact.ninja/fact"));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      FactModel fact = FactModel.fromJson(data);
      return fact;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
