import 'package:blood/providers/donor_list_provider.dart';
import 'package:blood/widgets/custom_app_bar.dart';
import 'package:blood/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DonorListPage extends StatelessWidget {
  final String bloodGroup;

  const DonorListPage(this.bloodGroup);

  @override
  Widget build(BuildContext context) {
    onReady((_) {
      donorListProvider.read(context).obtainDb(bloodGroup);
    });
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Donor List',
        ),
        body: Consumer((context, read) {
          final donorListState = read(donorListProvider.state);
//       final provider = addDonorProvider.read(context);
          if (donorListState.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          final donors = donorListState.donors;
          if (donors.length == 0) {
            return Center(
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
                          title: BloodText(
                            donors[index].donorName.toString(),
                          ),
                          subtitle: BloodText(
                            donors[index].donorNumber.toString(),
                          ),
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
