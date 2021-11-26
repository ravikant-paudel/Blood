import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DonorListPage extends StatelessWidget {
  final String bloodGroup;

  const DonorListPage({required this.bloodGroup});

  @override
  Widget build(BuildContext context) {
    onReady((_) {
      // context.read(donorListProvider).obtainDb(bloodGroup);
    });
    return Container();
    // return Scaffold(
    //     appBar: const CustomAppBar(
    //       title: 'Donor List',
    //     ),
    //     body: Consumer(builder: (context, watch, child) {
    //       final donorListState = watch(donorListProvider.state);
    //       if (donorListState.isLoading) {
    //         return const Center(child: CircularProgressIndicator());
    //       }
    //       final donors = donorListState.donors;
    //       if (donors.isEmpty) {
    //         return const Center(
    //           child: BloodText('No donor found'),
    //         );
    //       }
    //       return ListView(children: [
    //         ListView.builder(
    //             shrinkWrap: true,
    //             itemCount: donors.length,
    //             itemBuilder: (context, index) {
    //               return InkWell(
    //                 onTap: () {},
    //                 child: Column(
    //                   children: <Widget>[
    //                     ListTile(
    //                       title: BloodText(
    //                         donors[index].donorName.toString(),
    //                       ),
    //                       subtitle: BloodText(
    //                         donors[index].donorNumber.toString(),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               );
    //             })
    //       ]);
    //     }));
  }
}

void onReady(void Function(Duration) callback) {
  SchedulerBinding.instance!.addPostFrameCallback(callback);
}
