import 'dart:convert';
import 'package:fakebook_flutter_app/src/models/post.dart';
import 'package:http/http.dart' as http;

class FetchData{

  static String apiLink = "https://api-fakebook.herokuapp.com/it4788/";
  //static String apiLink = "http://localhost:3000/it4788/";

  static Future<http.Response> signUpApi(String phone, String password, String uuid) async {
    return await http.post(
        apiLink + 'signup'+ "/?"+"phonenumber=$phone&password=$password&uuid=$uuid",);
  }
  static Future<http.Response> logInApi(
      String phone, String password, String uuid) async {
    return await http.post(
      apiLink + 'login'+ "/?"+"phonenumber=$phone&password=$password&uuid=$uuid",
      //headers: {HttpHeaders.authorizationHeader: "Basic your_api_token_here"},
    );
  }

  static Future<http.Response> logOutApi(String token) async {
    return await http.post(
      apiLink + 'logout'+ "/?"+"token=${token}",
    );
  }

  Future<PostModel> fetchPost() async {
    final response = await http.get('https://jsonplaceholder.typicode.com/albums/1');
    if (response.statusCode == 200) {
      return PostModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch Post');
    }
  }
}