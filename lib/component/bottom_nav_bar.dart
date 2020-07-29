// Copyright (c) 2020 The Blood Authors. All rights reserved.

import 'package:blood/utils/universal_variables.dart';
import 'package:flutter/material.dart';

class BloodBottomNavBar extends StatefulWidget {
  @override
  _BloodBottomNavBarState createState() => _BloodBottomNavBarState();
}

class _BloodBottomNavBarState extends State<BloodBottomNavBar> {

  int currentTab = 0; // to keep track of active tab index
//  final List<Widget> screens = [
//    Dashboard(),
//    Chat(),
//    Profile(),
//    Settings(),
//  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();

//  Widget currentScreen = Dashboard(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
//                      setState(() {
//                        currentScreen =
//                            Dashboard(); // if user taps on this dashboard tab will be active
//                        currentTab = 0;
//                      });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.dashboard,
//                          color: currentTab == 0 ? Colors.blue : Colors.grey,
                      ),
                      const Text(
                        'Home',
//                          style: TextStyle(
//                            color: currentTab == 0 ? Colors.blue : Colors.grey,
//                          ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
//                      setState(() {
//                        currentScreen =
//                            Chat(); // if user taps on this dashboard tab will be active
//                        currentTab = 1;
//                      });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.assessment,
//                          color: currentTab == 1 ? Colors.blue : Colors.grey,
                      ),
                      const Text(
                        'Donor List',
//                          style: TextStyle(
//                            color: currentTab == 1 ? Colors.blue : Colors.grey,
//                          ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            // Right Tab bar icons

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
//                      setState(() {
//                        currentScreen =
//                            Profile(); // if user taps on this dashboard tab will be active
//                        currentTab = 2;
//                      });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.history,
//                          color: currentTab == 2 ? Colors.blue : Colors.grey,
                      ),
                      const Text(
                        'History',
//                          style: TextStyle(
//                            color: currentTab == 2 ? Colors.blue : Colors.grey,
//                          ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
//                      setState(() {
//                        currentScreen =
//                            Settings(); // if user taps on this dashboard tab will be active
//                        currentTab = 3;
//                      });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.account_circle,
//                          color: currentTab == 3 ? Colors.blue : Colors.grey,
                      ),
                      const Text(
                        'Profile',
//                        style: TextStyle(
//                          color: currentTab == 3 ? Colors.blue : Colors.grey,
//                        ),
                      ),
                    ],
                  ),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}