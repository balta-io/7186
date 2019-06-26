import 'package:eshop/blocs/cart.bloc.dart';
import 'package:eshop/blocs/home.bloc.dart';
import 'package:eshop/blocs/theme.bloc.dart';
import 'package:eshop/settings.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ui/android/pages/tabs.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeBloc>.value(
          value: HomeBloc(),
        ),
        ChangeNotifierProvider<CartBloc>.value(
          value: CartBloc(),
        ),
        ChangeNotifierProvider<ThemeBloc>.value(
          value: ThemeBloc(),
        ),
      ],
      child: Main(),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeBloc bloc = Provider.of<ThemeBloc>(context);

    loadSettings().then((x) {
      bloc.change(Settings.theme);
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'eShop',
      theme: bloc.theme,
      home: DefaultTabController(
        length: 3,
        child: TabsPage(),
      ),
    );
  }

  Future loadSettings() async {
    var prefs = await SharedPreferences.getInstance();
    var theme = prefs.getString('theme');
    Settings.theme = theme.isEmpty ? 'light' : theme;
  }
}
