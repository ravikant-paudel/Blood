import 'package:blood/utils/resources/colors.dart';
import 'package:flutter/material.dart';

class BloodGroupLabel extends StatelessWidget {
  final TextStyle firstTextStyle;
  final TextStyle secTextStyle;
  final String bloodGroup;

  const BloodGroupLabel({
    Key key,
    this.firstTextStyle,
    this.secTextStyle,
    @required this.bloodGroup,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          bloodGroup?.substring(0, 1) ?? ' ',
          style: firstTextStyle ??
              Theme.of(context).textTheme.headline3.copyWith(
                    color: bloodGroupColor,
                    fontWeight: FontWeight.w900,
                    height: 1,
                  ),
        ),
        Text(
          bloodGroup?.substring(1, 2)?.toUpperCase() ?? ' ',
          style: secTextStyle ??
              Theme.of(context).textTheme.headline5.copyWith(
                    color: bloodGroupColor,
                    height: 1,
                  ),
        ),
      ],
    );
  }
}
