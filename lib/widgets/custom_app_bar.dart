/*
 * Copyright (c) 2020 The Catch Square Authors. All rights reserved.
 * Created by Ravikant Paudel
 * Last modified on April 26, 2020 by ravikant
 */

import 'package:blood/utils/preference_util.dart';
import 'package:blood/utils/shortcuts.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final List<Widget> actions;
  final Widget leading;
  final bool centerTitle;
  final bool toolbarOnly;
  final double elevation;

  const CustomAppBar({
    Key key,
    this.title = '',
    this.subtitle = '',
    this.actions,
    this.leading,
    this.centerTitle = true,
    this.toolbarOnly,
    this.elevation = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AppBar(
          backgroundColor: Theme.of(context).accentColor,
          elevation: 0,
          leading: leading,
          actions: actions,
          centerTitle: centerTitle,
          title: Text(
            title,
            style: Theme.of(context).textTheme.headline6.copyWith(fontStyle: FontStyle.italic),
          ),
          iconTheme: IconThemeData(
            color:  preference.get(PreferenceKey.THEME_MODE) != null ? Colors.white : Colors.black,
          ),
        ),
        const Divider(
          height: 0,
          color:Color(0xFFDE2C2C),
//          color:Theme.of(context).primaryColor,
          thickness: 3,
        ),
      ],
    );
  }

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight + 18);
}
