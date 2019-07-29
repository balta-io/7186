import 'package:eshop/ui/android/pages/signup.page.dart';
import 'package:flutter/material.dart';
import 'package:eshop/ui/android/pages/login.page.dart';

class UnauthenticatedUserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 60,
        ),
        FlatButton(
          child: Text("Autentique-se"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
          },
        ),
        FlatButton(
          child: Text("Ainda não sou cadastrado"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignupPage(),
              ),
            );
          },
        ),
      ],
    );
  }
}
