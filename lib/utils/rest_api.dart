import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:orino_smart_village/models/post_list.dart';

class URLS {
  static const String baseUrl =
      'https://www.orinosmartvillage.it/wp-json/wp/v2';
  static const String usersEndpoint = '/users';
  static const String postsEndpoint = '/posts';
  static const String mediaEndpoint = '/media';
}

class ApiService {
  //   Future<List<dynamic>?> getUsers() async {
  //   final response = await http.get(Uri.parse('${URLS.baseUrl}${URLS.usersEndpoint}'));
  //   if (response.statusCode == 200) {
  //     return json.decode(response.body);
  //   } else {
  //     return null;
  //   }
  // }

  static Future<PostList> getPosts({int perPage = 5}) async {
    final response = await http.get(
        (Uri.parse('${URLS.baseUrl}${URLS.postsEndpoint}?_embed&per_page=$perPage')));
    if (response.statusCode == 200) {
      return PostList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
