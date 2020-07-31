import 'package:blood/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Dashboard',
      ),
      body: Container(),
    );
  }
}
