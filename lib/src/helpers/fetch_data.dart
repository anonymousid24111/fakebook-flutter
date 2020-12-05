import 'dart:convert';
import 'dart:io';
import 'package:fakebook_flutter_app/src/models/post.dart';
import 'package:http/http.dart' as http;
import 'package:multi_image_picker/multi_image_picker.dart';

class FetchData {
  static String apiLink = "https://api-fakebook.herokuapp.com/it4788/";
  //static String apiLink = "http://localhost:3000/it4788/";

  static Future<http.Response> signUpApi(
      String phone, String password, String username, String uuid) async {
    return await http.post(
      apiLink +
          'signup' +
          "/?" +
          "phonenumber=$phone&password=$password&username=$username&uuid=$uuid",
    );
  }

  static Future<http.Response> logInApi(
      String phone, String password, String uuid) async {
    return await http.post(
      apiLink +
          'login' +
          "/?" +
          "phonenumber=$phone&password=$password&uuid=$uuid",
      //headers: {HttpHeaders.authorizationHeader: "Basic your_api_token_here"},
    );
  }

  static Future<http.Response> logOutApi(String token) async {
    return await http.post(
      apiLink + 'logout' + "/?" + "token=${token}",
    );
  }

  static Future<http.Response> createPostApi(
      String token,
      List<String> images,
      String video,
      String described,
      String status,
      String state,
      bool can_edit,
      String asset_type) async {
    Map<String, dynamic> image_body = {'image': images};
    Map<String, dynamic> video_body = {'video': video};
    print(images.length);
    return await http.post(
      apiLink +
          'add_post' +
          "/?" +
          "token=$token&described=$described&status=$status&state=$state&can_edit=$can_edit",
      body: images.length == 0 ? [] : {'image': images[0]},
      //headers: {HttpHeaders.authorizationHeader: "Basic your_api_token_here"},
    );
  }

  Future<PostModel> fetchPost() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/albums/1');
    if (response.statusCode == 200) {
      return PostModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch Post');
    }
  }

  static Future<http.Response> getUserInfo(String token, String userId) async {
    return await http.post(
      apiLink + "get_user_info/?token=$token&user_id=$userId",
    );
  }

  static Future<http.Response> getUserFriends(String token, String index, String count) async {
    return await http.post(
      apiLink + "get_user_friends/?token=$token&index=$index&count=$count",
    );
  }

  static Future<http.Response> getRequestedFriends(String token, String index, String count) async {
    return await http.post(
      apiLink + "get_requested_friends/?token=$token&index=$index&count=$count",
    );
  }

  static Future<http.Response> getListSuggestedFriends(String token, String index, String count) async {
    return await http.post(
      apiLink + "get_list_suggested_friends/?token=$token&index=$index&count=$count",
    );
  }
}
