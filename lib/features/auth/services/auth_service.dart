import 'dart:convert';

import 'package:ahmed_rascic_tech387_flutter/constants/error_handling.dart';
import 'package:ahmed_rascic_tech387_flutter/constants/utils.dart';
import 'package:ahmed_rascic_tech387_flutter/features/home/screens/home_screen.dart';
import 'package:ahmed_rascic_tech387_flutter/models/user.dart';
import 'package:ahmed_rascic_tech387_flutter/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        }
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          
          Navigator.pushNamedAndRemoveUntil(
            context, 
            HomeScreen.routeName,
            (route) => false
          );
        }
      );
    } 
    catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
