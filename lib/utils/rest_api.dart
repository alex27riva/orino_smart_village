import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:orino_smart_village/models/post_list.dart';

class URLS {
  static const String baseUrl =
      'https://www.orinosmartvillage.it/wp-json/wp/v2';
  static const String usersEndpoint = '/users';
  static const String postsEndpoint = '/posts';
  static const String mediaEndpoint = '/media';
}

class ApiService {
  var dio = Dio();

  ApiService(String baseUrl) {
    dio.options.baseUrl = baseUrl;
    dio.options.responseType = ResponseType.plain;
    dio.interceptors
        .add(DioCacheManager(CacheConfig(baseUrl: baseUrl)).interceptor);
  }

  Future<PostList> getPosts({int perPage = 5}) async {
    final response = await dio.get(URLS.postsEndpoint,
        options: buildCacheOptions(const Duration(days: 7)),
        queryParameters: {'perPage': perPage, 'page': 2});
    print(response.requestOptions);
    if (response.statusCode == 200) {
      return PostList.fromJson(json.decode(response.data));
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
