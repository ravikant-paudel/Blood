import 'package:blood/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Profile',
        ),
        body: ListView(
          children: [
           /* Switch(
//      value: _darkTheme,
              onChanged: (val) {
                setState(() {
//    _darkTheme = val;
                });
//    onThemeChanged(val, themeNotifier);
              },
            )*/
          ],
        ));
  }
}
