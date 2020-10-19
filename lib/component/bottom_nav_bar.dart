// Copyright (c) 2020 The Blood Authors. All rights reserved.

import 'package:flutter/material.dart';

class BloodBottomNavBar extends StatefulWidget {
  @override
  _BloodBottomNavBarState createState() => _BloodBottomNavBarState();
}

class _BloodBottomNavBarState extends State<BloodBottomNavBar> {
  // final int _selectedIndex = 0;

  /* final _navItems = [
    _NavItem(a_home, 'Home'),
    _NavItem(a_bazaar, 'Bazaar'),
    _NavItem(a_scanPay, 'Scan & Pay'),
    _NavItem(a_transactions, 'Transactions'),
    _NavItem(a_more, 'More'),
  ];*/

  @override
  Widget build(BuildContext context) {
    return Container();
    /*return BottomAppBar(
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
//                        homePro.updateScreen(0);
                    setState(() {
                      currentScreen = DashboardPage(); // if user taps on this dashboard tab will be active
                      currentTab = 0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.dashboard,
                        color: currentTab == 0 ? Colors.red : Colors.grey,
                      ),
                      Text(
                        'Dashboard',
                        style: TextStyle(
                          color: currentTab == 0 ? Colors.red : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
//                        homePro.updateScreen(1);
                    setState(() {
                      currentScreen = DonorPage(); // if user taps on this dashboard tab will be active
                      currentTab = 1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.assessment,
                        color: currentTab == 1 ? Colors.red : Colors.grey,
                      ),
                      Text(
                        'Donor List',
                        style: TextStyle(
                          color: currentTab == 1 ? Colors.red : Colors.grey,
                        ),
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
//                        homePro.updateScreen(2);
                    setState(() {
                      currentScreen = HistoryPage(); // if user taps on this dashboard tab will be active
                      currentTab = 2;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.history,
                        color: currentTab == 2 ? Colors.red : Colors.grey,
                      ),
                      Text(
                        'History',
                        style: TextStyle(
                          color: currentTab == 2 ? Colors.red : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
//                        homePro.updateScreen(3);
                    setState(() {
                      currentScreen = ProfilePage(); // if user taps on this dashboard tab will be active
                      currentTab = 3;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.account_circle,
                        color: currentTab == 3 ? Colors.red : Colors.grey,
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                          color: currentTab == 3 ? Colors.red : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );*/
  }

  @override
  void dispose() {
//    _navItems?.clear();
    super.dispose();
  }
}
