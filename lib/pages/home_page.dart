import 'package:blood/helper/router/router.gr.dart';
import 'package:blood/pages/dashboard_page.dart';
import 'package:blood/pages/donor_page.dart';
import 'package:blood/pages/history_page.dart';
import 'package:blood/pages/profile_page.dart';
import 'package:blood/utils/shortcuts.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    DashboardPage(),
    DonorPage(),
    HistoryPage(),
    ProfilePage(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = DashboardPage(); // Our first view in viewport
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    _getToken();
    _firebaseMessaging.configure(
      onMessage: (msg) async {
        logThis('This is onMessage $msg');
        logThis('This is onMessage==> ${msg['notification']['title']}');
        logThis('This is onMessage===> ${msg['notification']['body']}');
      },
      onLaunch: (msg) async {
        logThis('This is onLaunch $msg');
        logThis('This is onLaunch==>   ${msg['notification']['title']}');
        logThis('This is onLaunch==>   ${msg['notification']['body']}');
      },
      onResume: (msg) async {
        logThis('This is onResume $msg');
        logThis('This is onResume==> ${msg['data']['title']}');
      },
      /*onBackgroundMessage: (msg) async {
        logThis('This is onBackgroundMessage $msg');
      },*/
    );
  }

  _getToken() {
    _firebaseMessaging.getToken().then((deviceToken) {
      logThis('Device TOken : $deviceToken');
    });
  }

  @override
  Widget build(BuildContext context) {
//    return Consumer((context, read) {
//      final homeState = read(homeProvider.state);
////        homeProvider.read(context);
//      final homePro = homeProvider.readOwner(ProviderStateOwnerScope.of(context, listen: false));
    return Scaffold(
      body: screens[currentTab],
      /*body: PageStorage(
          bucket: bucket,
//          child: homePro.updateScreen(homeState.currentTab),
        child: currentScreen,
        ),*/
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigator.push(Routes.requestBloodPage);
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
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
                          'List',
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
      ),
    );
//    }
//    );
  }
}
