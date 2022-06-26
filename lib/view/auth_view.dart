import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_provider/components/auth_form.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(153, 1, 100, 54),
                  Color.fromARGB(153, 77, 141, 214),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 50,
                    ),
                    transform: Matrix4.rotationZ(10 / 180)..translate(-5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(65, 129, 129, 1),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 15,
                            color: Color.fromARGB(255, 20, 20, 20),
                            offset: Offset(0, 2),
                          ),
                        ]),
                    child: const Text(
                      'Mercadinho',
                      style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          color: Colors.white),
                    ),
                  ),
                  const AuthForm(),
                ],
              )),
        ],
      ),
    );
  }
}
