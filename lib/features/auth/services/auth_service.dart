import 'package:ahmed_rascic_tech387_flutter/constants/error_handling.dart';
import 'package:ahmed_rascic_tech387_flutter/constants/utils.dart';
import 'package:ahmed_rascic_tech387_flutter/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../../constants/global_variables.dart';

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name
  }) async {
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

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, "Uspješno kreiran account.");
        }
      );
    } 
    catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
