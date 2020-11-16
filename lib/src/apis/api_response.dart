import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class API {
  String apiLink = "https://api-fakebook.herokuapp.com/it4788/";

  Future<http.Response> signUpApi(
      String phone, String password, String uuid) async {
    return await http.post(
      apiLink +
          'signup' +
          "/?" +
          "phonenumber=$phone&password=$password&uuid=$uuid",
    );
  }

  Future<http.Response> logInApi(
      String phone, String password, String uuid) async {
    return await http.post(
      apiLink +
          'login' +
          "/?" +
          "phonenumber=$phone&password=$password&uuid=$uuid",
    );
  }
}

/*
void display(){
  FetchData a = new FetchData();
  a.logInApi("0987654321","123456789", "04a30d27315c665b").then((value){
    final b = jsonDecode(value.body);
    print(b["data"]["ids"]);

  });
}

 */
