import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:stringee_flutter_plugin_example/config/app_config.dart';
import 'package:stringee_flutter_plugin_example/models/user.dart';

class RegistrationService {
  Future<User> fetchRegister({
    String name,
    String phone_number,
    String date_of_birth,
    String image_path,
    String account,
    String password,
    String token_call,
  }) async {
    var body = Map<String, dynamic>();
    body['name'] = name;
    body['phone_number'] = phone_number;
    body['date_of_birth'] = date_of_birth;
    body['image_path'] = image_path;
    body['account'] = account;
    body['password'] = password;
    body['token_call'] = token_call;
    final response = await http.post(
      // Uri.parse('${AppConfig.baseApi}/register'),
      Uri.parse('http://192.168.1.11/api/register'),
      body: body,
    );
    print('create...${response.body}');
    if (response.statusCode == 201) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete company.');
    }
  }

  Future<User> fetchRegister1({
    String name,
    String phone_number,
    String date_of_birth,
    dynamic image_path,
    String account,
    String password,
    String token_call,
  }) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${AppConfig.baseApi}/register'));
    request.fields['name'] = name;
    request.fields['phone_number'] = phone_number;
    request.fields['date_of_birth'] = date_of_birth;
    request.fields['account'] = account;
    request.fields['password'] = password;
    request.fields['token_call'] = token_call;
    request.files
        .add(await http.MultipartFile.fromPath('image_path', image_path));

    print('request .... ${request.fields}');
    var response = await request.send();
    print(response.stream);
    print(response.statusCode);
    final res = await http.Response.fromStream(response);
    print('body ${res.body}');
  }
}
