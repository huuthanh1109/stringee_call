import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stringee_flutter_plugin_example/config/app_config.dart';
import 'package:stringee_flutter_plugin_example/models/user.dart';

class UserService {
  Future<List<User>> fetchUsers() async {
    final response =
        await http.get(Uri.parse('${AppConfig.baseApi}/users/list'));

    dynamic result = json.decode(response.body);
    List data = result["users"];
    List<User> items = [];
    for (int i = 0; i < data.length; i++) {
      items.add(User.fromJson(data[i]));
    }
    return items;
  }

  Future<User> fetchUser(dynamic account) async {
    final response =
        await http.get(Uri.parse('${AppConfig.baseApi}/users/$account'));
    dynamic result = json.decode(response.body)["user"];
    User items = User.fromJson(result);
    return items;
  }
}
