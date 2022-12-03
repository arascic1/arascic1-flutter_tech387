import 'package:ahmed_rascic_tech387_flutter/models/user.dart';
import 'package:http/http.dart' as http;

import '../../../constants/global_variables.dart';

class AuthService {
  void signUpUser(
      {required String email,
      required String password,
      required String name}) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          address: '',
          type: '',
          token: ''
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        }
      );
    } catch (e) {}
  }
}
