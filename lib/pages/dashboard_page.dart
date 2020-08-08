import 'package:blood/providers/dashboard_provider.dart';
import 'package:blood/widgets/custom_app_bar.dart';
import 'package:blood/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    onReady((_) {
      dashboardProvider.read(context).obtainRequestDb();
    });
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Donor List',
        ),
        body: Consumer((context, read) {
          final donorListState = read(dashboardProvider.state);
//       final provider = addDonorProvider.read(context);
          if (donorListState.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          final donors = donorListState.request;
          if (donors.isEmpty) {
            return const Center(
              child: BloodText('No donor found'),
            );
          }
          return ListView(children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: donors.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Text(
                              donors[index].bloodGroup,
                            ),
                          ),
                          title: BloodText(
                            donors[index].patientName.toString(),
                          ),
                          subtitle: BloodText(
                            donors[index].contactNumber.toString(),
                          ),
//                          trailing: ,
                        ),
                      ],
                    ),
                  );
                })
          ]);
        }));
  }
}

void onReady(void Function(Duration) callback) {
//  if (SchedulerBinding.instance.schedulerPhase == SchedulerPhase.persistentCallbacks) {
  SchedulerBinding.instance.addPostFrameCallback(callback);
//  }
}
