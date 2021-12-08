import 'package:blood/helper/router/go_router.dart';
import 'package:blood/pages/dashboard_page.dart';
import 'package:blood/pages/donor_page.dart';
import 'package:blood/pages/history_page.dart';
import 'package:blood/pages/profile_page.dart';
import 'package:blood/pages/request_blood_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.path}) : super(key: key);

  final String? path;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, Widget> screens = {
    'dashboard': const DashboardPage(),
    'donor': const DonorPage(),
    'history': HistoryPage(),
    'profile': ProfilePage(),
  }; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  // Widget currentScreen = DashboardPage(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    final path = widget.path ?? screens.keys.first;
    return Scaffold(
      body: screens[path],
      floatingActionButton: FloatingActionButton(
        onPressed: () => goRouter.go('/home/$path/requestBlood'),
        backgroundColor: Colors.red,
        // backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavScope(
        path: widget.path ?? '',
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    _Item(path: 'dashboard', icon: Icons.dashboard, label: 'Dashboard'),
                    _Item(path: 'donor', icon: Icons.assessment, label: 'List'),
                  ],
                ),

                // Right Tab bar icons

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    _Item(path: 'history', icon: Icons.history, label: 'History'),
                    _Item(path: 'profile', icon: Icons.person, label: 'Profile'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    Key? key,
    required this.path,
    required this.icon,
    required this.label,
  }) : super(key: key);

  final String path;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final color = BottomNavScope.of(context) == path ? Colors.red : Colors.grey;

    return MaterialButton(
      minWidth: 40,
      onPressed: () => goRouter.go('/home/$path'),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Text(
            label,
            style: TextStyle(color: color),
          ),
        ],
      ),
    );
  }
}

class BottomNavScope extends InheritedWidget {
  const BottomNavScope({Key? key, required this.path, required Widget child}) : super(key: key, child: child);

  final String path;

  static String of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<BottomNavScope>();
    assert(scope != null, 'You forgot to wrap your widget with _BottomNavScope');
    return scope!.path;
  }

  @override
  bool updateShouldNotify(BottomNavScope oldWidget) => oldWidget.path != path;
}
