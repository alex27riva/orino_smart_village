import 'dart:convert';
import 'package:http/http.dart' as http;

class URLS {
  static const String baseUrl = 'https://www.orinosmartvillage.it/wp-json/wp/v2';
  static const String usersEndpoint = '/users';
}

class ApiService {
  static Future<List<dynamic>?> getUsers() async {
    // RESPONSE JSON :
    // {
    //   "id": 1,
    // "name": "orinosmartvillage",
    // "url": "https://www.orinosmartvillage.it",
    // "description": "",
    // "link": "https://www.orinosmartvillage.it/author/orinosmartvillage/",
    // "slug": "orinosmartvillage",
    // "avatar_urls": {
    // "24": "https://secure.gravatar.com/avatar/05f975051796d8a918a0b3596a348e4d?s=24&d=mm&r=g",
    // "48": "https://secure.gravatar.com/avatar/05f975051796d8a918a0b3596a348e4d?s=48&d=mm&r=g",
    // "96": "https://secure.gravatar.com/avatar/05f975051796d8a918a0b3596a348e4d?s=96&d=mm&r=g"
    // },
    // ...
    final response = await http.get(Uri.parse('${URLS.baseUrl}${URLS.usersEndpoint}'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }

  // static Future<bool> addEmployee(body) async {
  //   // BODY
  //   // {
  //   //   "name": "test",
  //   //   "age": "23"
  //   // }
  //   final response = await http.post('${URLS.BASE_URL}/create', body: body);
  //   if (response.statusCode == 200) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}