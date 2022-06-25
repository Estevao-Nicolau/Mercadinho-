
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Auth with ChangeNotifier {
  static const _url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyAJumMdPHBHt5fYvmR-KnRrxytBdfDDeVg';
  Future<void> signup(String email, String password) async {
    final response = await post(
      Uri.parse(_url),
      body: jsonEncode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );
    print(jsonDecode(response.body));
  }
}