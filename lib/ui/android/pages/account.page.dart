import 'package:eshop/blocs/theme.bloc.dart';
import 'package:eshop/ui/android/pages/login.page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../settings.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeBloc bloc = Provider.of<ThemeBloc>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 60,
          ),
          FlatButton(
            child: Text("Login"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
          ),
          Text("Tema atual: ${Settings.theme}"),
          FlatButton(
            child: Text("Light"),
            onPressed: () {
              save("light");
              bloc.change('light');
            },
          ),
          FlatButton(
            child: Text("Dark"),
            onPressed: () {
              save("dark");
              bloc.change('dark');
            },
          ),
          FlatButton(
            child: Text("Dark Yellow"),
            onPressed: () {
              save("dark-yellow");
              bloc.change('dark-yellow');
            },
          ),
        ],
      ),
    );
  }

  save(theme) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', theme);
  }
}
