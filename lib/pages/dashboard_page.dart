import 'package:blood/providers/dashboard_provider.dart';
import 'package:blood/utils/empty_util.dart';
import 'package:blood/utils/shortcuts.dart';
import 'package:blood/widgets/blood_list_tile.dart';
import 'package:blood/widgets/custom_app_bar.dart';
import 'package:blood/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardPage extends StatelessWidget {
  final container = ProviderContainer();
  @override
  Widget build(BuildContext context) {
    onReady((_) {
      container.read(dashboardProvider.notifier).obtainRequestDb();
    });
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Donor List',
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final donorListState = ref.read(dashboardProvider);
          if (donorListState.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          final donors = donorListState.requests;
          logThis(donors, tag: 'Donor LIst', developer: Developer.ravi);
          if (donors?.isNullOrEmpty ?? true) {
            return const Center(
              child: BloodText('No donor found'),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView(
              children: donors!
                  .map((donor) => BloodListTile(
                        requestBlood: donor,
                      ))
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}

void onReady(void Function(Duration) callback) {
  SchedulerBinding.instance!.addPostFrameCallback(callback);
}
