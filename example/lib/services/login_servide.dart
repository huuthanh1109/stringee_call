import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:stringee_flutter_plugin_example/config/app_config.dart';

class LoginService {
  Future<dynamic> fetchLogin({String account, String pass}) async {
    final response = await http.post(Uri.parse(
        '${AppConfig.baseApi}/login?account=$account&password=$pass'));
    // print('token is ${json.decode(response.body)["user"]["token"]}');

    return {'statusCode': response.statusCode, 'body': response.body};
  }
}
