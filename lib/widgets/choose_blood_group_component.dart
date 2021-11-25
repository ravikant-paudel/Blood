import 'package:blood/component/gaps.dart';
import 'package:blood/utils/resources/dimens.dart';
import 'package:blood/widgets/blood_group_label.dart';
import 'package:blood/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ChooseBloodGroupComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BloodText(
              'Choose Blood Group',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: 14,
                  ),
            ),
            const VerticalGap(d_margin1),
            ToggleButtons(
              isSelected: [],
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: BloodGroupLabel(
                      'AB+',
                      firstTextStyle: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.w900,
                            height: 1.3,
                          ),
                      secTextStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                            height: 1,
                          ),
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: BloodGroupLabel(
                      'AB+',
                      firstTextStyle: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.w900,
                            height: 1.3,
                          ),
                      secTextStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                            height: 1,
                          ),
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: BloodGroupLabel(
                      'AB+',
                      firstTextStyle: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.w900,
                            height: 1.3,
                          ),
                      secTextStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                            height: 1,
                          ),
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: BloodGroupLabel(
                      'AB+',
                      firstTextStyle: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.w900,
                            height: 1.3,
                          ),
                      secTextStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                            height: 1,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
