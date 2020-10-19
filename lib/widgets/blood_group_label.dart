import 'package:flutter/material.dart';

class BloodGroupLabel extends StatelessWidget {
  final TextStyle firstTextStyle;
  final TextStyle secTextStyle;
  final String bloodGroup;

  const BloodGroupLabel(
    this.bloodGroup, {
    Key key,
    this.firstTextStyle,
    this.secTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgRegex = RegExp(r'(A|B|O|AB)([+-])');
    final bloodGroupMatch = bgRegex.firstMatch(bloodGroup);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          bloodGroupMatch.group(1) ?? ' ',
          style: firstTextStyle ??
              Theme.of(context).textTheme.headline5.copyWith(
                    fontWeight: FontWeight.w900,
                    fontSize: 48,
                    height: 1,
                    color: const Color(0xFFebebeb),
                  ),
        ),
        Text(
          bloodGroupMatch.group(2) ?? ' ',
          style: secTextStyle ??
              Theme.of(context).textTheme.headline5.copyWith(
                    height: 1,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xFFebebeb),
                  ),
        ),
      ],
    );
  }
}

/*firstTextStyle: Theme.of(context).textTheme.headline6.copyWith(
                    fontWeight: FontWeight.w900,
                    height: 1.3,
                  ),
              secTextStyle: Theme.of(context).textTheme.bodyText2.copyWith(
                    height: 1,
                  ),*/
