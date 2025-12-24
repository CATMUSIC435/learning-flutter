import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants.dart';
import '../../models/home_page_model.dart';

class ApiService {
  static Future<HomePageModel> fetchHomePage() async {
    final response = await http.get(Uri.parse(AppConstants.baseUrl));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return HomePageModel.fromJson(data.first);
    } else {
      throw Exception('Failed to load home page');
    }
  }
}
