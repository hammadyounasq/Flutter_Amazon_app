import 'dart:convert';

import 'package:amazon_clone_flutter/common/widgets/bottom_bar.dart';
import 'package:amazon_clone_flutter/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:amazon_clone_flutter/constants/error_handing.dart';
import 'package:amazon_clone_flutter/constants/globlal_variables.dart';
import 'package:amazon_clone_flutter/constants/utils.dart';
import 'package:amazon_clone_flutter/models/user.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    User user = User(
      id: '',
      name: name,
      email: email,
      password: password,
      address: '',
      type: '',
      token: '',
      cart: [],
    );

    http.Response res = await http
        .post(Uri.parse('$uri/api/singnup'), body: user.toJson(), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    });

    httpErrorHandle(
      response: res,
      context: context,
      onSuccess: () {
        showSnackBar(
          context,
          'account created! login with same credential!',
        );
      },
    );
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    http.Response res = await http.post(Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        });

    print(res.body);
    httpErrorHandle(
      response: res,
      context: context,
      onSuccess: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        Provider.of<UserProvider>(context, listen: false).setUser(res.body);
        await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
        Navigator.pushNamedAndRemoveUntil(
            context, BottomBar.routeName, (route) => false);
      },
    );
  }

  void getUserData({
    required BuildContext context,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      //  var tokenRes = await http.post(Uri.parse('$uri/tokenIsValid'),
      //  headers: {
      //    'Content-Type': 'application/json; charset=UTF-8',
      //    'x-auth-token':token!,
      //    });

      //   var response=jsonDecode(tokenRes.body);

      //  if(response==true){
      http.Response userRes = await http.get(Uri.parse('$uri/'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': token!,
      });

      var userProvider = Provider.of<UserProvider>(context, listen: false)
          .setUser(userRes.body);

      //   }

    } catch (e) {
      print(e.toString() + 'hgg');
      // showSnackBar(context, e.toString());
    }
  }
}
