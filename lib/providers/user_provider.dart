import 'dart:convert';

import 'package:get/get.dart';

class UserProvider extends GetConnect {
  final url =
      "https://getconnect-90806-default-rtdb.asia-southeast1.firebasedatabase.app/";

  // method post data
  Future<Response> postData(String name, String email, String phone) {
    final data = json.encode({
      "name": name,
      "email": email,
      "phone": phone,
    });
    return post("$url/users.json", data);
  }

  // method edit data
  Future<Response> editData(String id, String name, String email, String phone) {
    final data = json.encode({
      "name": name,
      "email": email,
      "phone": phone,
    });
    return patch("$url/users/$id.json", data);
  }

  // method delete data
  Future<Response> deleteData(String id) {
    return delete("$url/users/$id.json");
  }
}
