import 'package:flutter/material.dart';
import 'package:flutter_provider/models/auth.dart';
import 'package:flutter_provider/view/auth_view.dart';
import 'package:flutter_provider/view/products_detail_view.dart';
import 'package:provider/provider.dart';

class AuthOrHomeView extends StatelessWidget {
  const AuthOrHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);

    return FutureBuilder(
      future: auth.tryAutoLogin(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.error != null) {
          return Center(
            child: Text('Ocorreu um erro!'),
          );
        } else {
          return auth.isAuth ? ProductsViewDetail() : AuthView();
        }
      },
    );
  }
}
