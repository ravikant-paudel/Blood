import 'package:blood/component/button.dart';
import 'package:blood/component/gaps.dart';
import 'package:blood/helper/router/router.gr.dart';
import 'package:blood/utils/resources/dimens.dart';
import 'package:blood/utils/shortcuts.dart';
import 'package:blood/widgets/custom_app_bar.dart';
import 'package:blood/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DonorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Donors',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    navigator.push(Routes.donorListPage, arguments: DonorListPageArguments(bloodGroup: 'A+'));
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.red[400], shape: BoxShape.circle),
                    height: 80,
                    width: 80,
                    child: const Center(
                      child: BloodText('A+', style: TextStyle(fontSize: 28)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    navigator.push(Routes.donorListPage, arguments: DonorListPageArguments(bloodGroup: 'A-'));
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.red[400], shape: BoxShape.circle),
                    height: 80,
                    width: 80,
                    child: const Center(
                      child: BloodText('A-', style: TextStyle(fontSize: 28)),
                    ),
                  ),
                ),
              ],
            ),
            const VerticalGap(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    navigator.push(Routes.donorListPage, arguments: DonorListPageArguments(bloodGroup: 'B+'));
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.red[400], shape: BoxShape.circle),
                    height: 80,
                    width: 80,
                    child: const Center(
                      child: BloodText('B+', style: TextStyle(fontSize: 28)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    navigator.push(Routes.donorListPage, arguments: DonorListPageArguments(bloodGroup: 'B-'));
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.red[400], shape: BoxShape.circle),
                    height: 80,
                    width: 80,
                    child: const Center(
                      child: BloodText('B-', style: TextStyle(fontSize: 28)),
                    ),
                  ),
                ),
              ],
            ),
            const VerticalGap(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    navigator.push(Routes.donorListPage, arguments: DonorListPageArguments(bloodGroup: 'AB+'));
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.red[400], shape: BoxShape.circle),
                    height: 80,
                    width: 80,
                    child: const Center(
                      child: BloodText('AB+', style: TextStyle(fontSize: 28)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    navigator.push(Routes.donorListPage, arguments: DonorListPageArguments(bloodGroup: 'AB-'));
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.red[400], shape: BoxShape.circle),
                    height: 80,
                    width: 80,
                    child: const Center(
                      child: BloodText('AB-', style: TextStyle(fontSize: 28)),
                    ),
                  ),
                ),
              ],
            ),
            const VerticalGap(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    navigator.push(Routes.donorListPage, arguments: DonorListPageArguments(bloodGroup: 'O+'));
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.red[400], shape: BoxShape.circle),
                    height: 80,
                    width: 80,
                    child: const Center(
                      child: BloodText('O+', style: TextStyle(fontSize: 28)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    navigator.push(Routes.donorListPage, arguments: DonorListPageArguments(bloodGroup: 'O-'));
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.red[400], shape: BoxShape.circle),
                    height: 80,
                    width: 80,
                    child: const Center(
                      child: BloodText('O-', style: TextStyle(fontSize: 28)),
                    ),
                  ),
                ),
              ],
            ),
            const VerticalGap(d_margin8),
            BloodButton(
              buttonText: 'Add Blood',
              onPressed: () {
                navigator.push(Routes.addDonorPage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
