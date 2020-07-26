import 'package:blood/features/login/login_page.dart';
import 'package:flutter/material.dart';

class BloodApp extends StatelessWidget {
//  const BloodApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
   /*   builder: (context, widget) => Navigator(
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(
              child: widget,
            )),
      ),*/
      home: LoginPage(),
    );
  }
}
