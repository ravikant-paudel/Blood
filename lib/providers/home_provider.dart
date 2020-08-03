import 'package:blood/pages/dashboard_page.dart';
import 'package:blood/pages/donor_page.dart';
import 'package:blood/pages/history_page.dart';
import 'package:blood/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final StateNotifierProvider<HomeProvider> homeProvider = StateNotifierProvider((_) => HomeProvider());

class HomeProvider extends StateNotifier<HomeState> {
  HomeProvider() : super(HomeState(currentTab: 0, currentScreen: DashboardPage()));

    Widget updateScreen(int currentTab) {
    state = state.copyWith(currentTab: currentTab);
    switch (currentTab) {
      case 0:
        return DashboardPage();
      case 1:
        return DonorPage();
      case 2:
        return HistoryPage();
      case 3:
        return ProfilePage();
    }
    return DashboardPage();
  }
}

class HomeState {
  final int currentTab;
  final Widget currentScreen;

  HomeState({
    this.currentTab,
    this.currentScreen,
  });

  HomeState copyWith({int currentTab, Widget currentScreen}) => HomeState(
        currentTab: currentTab ?? this.currentTab,
        currentScreen: currentScreen ?? this.currentScreen,
      );

  @override
  String toString() => 'HomeState(currentTab: $currentTab, currentScreen: $currentScreen)';
}
