import 'package:blood/component/button.dart';
import 'package:blood/component/gaps.dart';
import 'package:blood/helper/router/router.gr.dart';
import 'package:blood/utils/resources/dimens.dart';
import 'package:blood/utils/shortcuts.dart';
import 'package:blood/widgets/custom_app_bar.dart';
import 'package:blood/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DonorListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Donor List',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(color: Colors.red[100], shape: BoxShape.circle),
                  height: 80,
                  width: 80,
                  child: const Center(
                    child: BloodText('A+', style: TextStyle(fontSize: 28)),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.red[100], shape: BoxShape.circle),
                  height: 80,
                  width: 80,
                  child: const Center(
                    child: BloodText('A-', style: TextStyle(fontSize: 28)),
                  ),
                ),
              ],
            ),
            const VerticalGap(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(color: Colors.red[100], shape: BoxShape.circle),
                  height: 80,
                  width: 80,
                  child: const Center(
                    child: BloodText('B+', style: TextStyle(fontSize: 28)),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.red[100], shape: BoxShape.circle),
                  height: 80,
                  width: 80,
                  child: const Center(
                    child: BloodText('B-', style: TextStyle(fontSize: 28)),
                  ),
                ),
              ],
            ),
            const VerticalGap(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(color: Colors.red[100], shape: BoxShape.circle),
                  height: 80,
                  width: 80,
                  child: const Center(
                    child: BloodText('AB+', style: TextStyle(fontSize: 28)),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.red[100], shape: BoxShape.circle),
                  height: 80,
                  width: 80,
                  child: const Center(
                    child: BloodText('AB-', style: TextStyle(fontSize: 28)),
                  ),
                ),
              ],
            ),
            const VerticalGap(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(color: Colors.red[100], shape: BoxShape.circle),
                  height: 80,
                  width: 80,
                  child: const Center(
                    child: BloodText('O+', style: TextStyle(fontSize: 28)),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.red[100], shape: BoxShape.circle),
                  height: 80,
                  width: 80,
                  child: const Center(
                    child: BloodText('O-', style: TextStyle(fontSize: 28)),
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
