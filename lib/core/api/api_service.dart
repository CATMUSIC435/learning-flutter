import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants.dart';
import '../../models/home_page_model.dart';

class ApiService {
  static const baseUrl = AppConstants.baseUrl;
  static Future<HomePageModel> fetchHomePage() async {
    final response = await http.get(Uri.parse('$baseUrl/pages?slug=trang-chu'));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return HomePageModel.fromJson(data.first);
    } else {
      throw Exception('Failed to load home page');
    }
  }

  static Future<String> fetchImageUrl(int id) async {
    final res = await http.get(
      Uri.parse('$baseUrl/image/$id'),
    );

    final data = jsonDecode(res.body);
    return data['media_details']['size']['full']['source_url'];
  }
}
