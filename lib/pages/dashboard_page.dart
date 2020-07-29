import 'package:blood/component/bottom_nav_bar.dart';
import 'package:blood/utils/universal_variables.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('aklsdjf'),
      ),
      body: Container(
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: UniversalVariables.primaryColor,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BloodBottomNavBar(),
    );
  }
}


