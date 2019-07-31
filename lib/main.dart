import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/cart.bloc.dart';
import 'package:shopping/blocs/home.bloc.dart';
import 'package:shopping/blocs/theme.bloc.dart';
import 'package:shopping/blocs/user.bloc.dart';
import 'package:shopping/ui/android/pages/tabs.page.dart';

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
        ChangeNotifierProvider<UserBloc>.value(
          value: UserBloc(),
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

    return MaterialApp(
      title: 'Shopping Cart',
      debugShowCheckedModeBanner: false,
      theme: bloc.theme,
      // home: TabsPage(),
      home: DefaultTabController(
        length: 3,
        child: TabsPage(),
      ),
    );
  }
}
