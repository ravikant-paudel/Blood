import 'package:blood/component/button.dart';
import 'package:blood/component/gaps.dart';
import 'package:blood/helper/router/router.gr.dart';
import 'package:blood/utils/blood_list_view.dart';
import 'package:blood/utils/resources/dimens.dart';
import 'package:blood/utils/shortcuts.dart';
import 'package:blood/widgets/custom_app_bar.dart';
import 'package:blood/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DonorPage extends StatelessWidget {
  const DonorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Donors',
      ),
      body: BloodListView(
        padding: const EdgeInsets.symmetric(vertical: d_margin4, horizontal: d_margin2),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _BloodGroupItem(bloodGroup: 'A+'),
              _BloodGroupItem(bloodGroup: 'A-'),
            ],
          ),
          const VerticalGap(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _BloodGroupItem(bloodGroup: 'B+'),
              _BloodGroupItem(bloodGroup: 'B-'),
            ],
          ),
          const VerticalGap(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _BloodGroupItem(bloodGroup: 'AB+'),
              _BloodGroupItem(bloodGroup: 'AB-'),
            ],
          ),
          const VerticalGap(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _BloodGroupItem(bloodGroup: 'O+'),
              _BloodGroupItem(bloodGroup: 'O-'),
            ],
          ),
          const VerticalGap(d_margin4),
          BloodButton(
            buttonText: 'Add Blood',
            onPressed: () {
              router.push(const AddDonorPageRoute());
            },
          ),
        ],
      ),
    );
  }
}

class _BloodGroupItem extends StatelessWidget {
  final String bloodGroup;

  const _BloodGroupItem({Key? key, required this.bloodGroup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        router.push(DonorListPageRoute(bloodGroup: bloodGroup));
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.red[400], shape: BoxShape.circle),
        height: 80,
        width: 80,
        child: Center(
          child: BloodText(bloodGroup, style: const TextStyle(fontSize: 28)),
        ),
      ),
    );
  }
}
