import 'package:blood/providers/theme_provider.dart';
import 'package:blood/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Profile',
        ),
        body: Consumer(builder: (context, ref, child) {
          final themeState = ref.watch(themeProvider);
          final themePro = ref.watch(themeProvider.notifier);
          return ListView(
            children: [
              TextFormField(
                  // onChanged: reqBloodProvider.updatePatientName,
                  // validator: (value) => RegExp(r'\w{4,}').hasMatch(value) ? null : 'At least 4 character',
                  decoration: const InputDecoration(
                hintText: 'Patient name',
              )),
              // ListTile(
              //   title: const Text('Dark Theme'),
              //   contentPadding: const EdgeInsets.only(left: 16.0),
              //   trailing: Transform.scale(
              //       scale: 0.4,
              //       child: DayNightSwitch(
              //         value: themeState.brightness == Brightness.dark,
              //         onChanged: themePro.onThemeChange,
              //       )),
              // ),
            ],
          );
        }));
  }
}
