import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:orino_smart_village/constants/urls.dart';
import 'package:orino_smart_village/models/post_list.dart';

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
    if (response.statusCode == 200) {
      return PostList.fromJson(json.decode(response.data));
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
