import 'package:blood/providers/theme.dart';
import 'package:blood/widgets/custom_app_bar.dart';
import 'package:day_night_switch/day_night_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/src/framework.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themePro = themeProvider.readOwner(ProviderStateOwnerScope.of(context, listen: false));
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Profile',
        ),
        body: Consumer((context, read) {
          final themeState = read(themeProvider.state);
          return ListView(
            children: [
              ListTile(
                title: Text('Dark Theme'),
                contentPadding: const EdgeInsets.only(left: 16.0),
                trailing: Transform.scale(
                  scale: 0.4,
                  child: DayNightSwitch(
                    value: themeState.brightness == Brightness.dark,
                    onChanged: themePro.onThemeChange,
                  )
                ),
              ),
            
            ],
          );
        }));
  }
}
