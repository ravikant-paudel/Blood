import 'package:blood/component/gaps.dart';
import 'package:blood/utils/resources/dimens.dart';
import 'package:blood/widgets/blood_group_label.dart';
import 'package:blood/widgets/text.dart';
import 'package:flutter/material.dart';

class ChooseBloodGroupComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const BloodText('Your Blood Group'),
            const VerticalGap(d_margin1),
            BloodGroupLabel(
              'AB+',
              firstTextStyle: Theme.of(context).textTheme.headline6.copyWith(
                fontWeight: FontWeight.w900,
                height: 1.3,
              ),
              secTextStyle: Theme.of(context).textTheme.bodyText2.copyWith(
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
