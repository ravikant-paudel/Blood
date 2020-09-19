import 'package:blood/component/gaps.dart';
import 'package:blood/utils/resources/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BloodListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'O+',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50.0),
                            child: Text(
                              'Request Blood',
                              style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/person.svg',
                                height: 10,
                                width: 10,
                                color: Colors.red,
                              ),
                              const HorizontalGap(d_margin05),
                              Text(
                                'RaviKant Paudel',
                                style: Theme.of(context).textTheme.overline.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        'O+',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  ),
                  const VerticalGap(d_margin1),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/contact.svg',
                        height: 10,
                        width: 10,
                        color: Colors.red,
                      ),
                      const HorizontalGap(d_margin05),
                      Text(
                        '9841523939',
                        style: Theme.of(context).textTheme.overline,
                      ),
                      const HorizontalGap(d_margin4),
                      SvgPicture.asset(
                        'assets/calender.svg',
                        height: 10,
                        width: 10,
                        color: Colors.red,
                      ),
                      const HorizontalGap(d_margin05),
                      Text(
                        '28 AUG, 2020',
                        style: Theme.of(context).textTheme.overline,
                      ),
                    ],
                  ),
                  const VerticalGap(d_margin2),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 1.0,
                      color: Colors.red,
                    ),
                  ),
                  const VerticalGap(d_margin2),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/pin.svg',
                        height: 10,
                        width: 10,
                        color: Colors.red,
                      ),
                      HorizontalGap(d_margin05),
                      Text(
                        'Mathilo Panighat,',
                        style: Theme.of(context).textTheme.overline,
                      ),
                      Spacer(),
                      SvgPicture.asset(
                        'assets/share.svg',
                        height: 20,
                        width: 20,
                        color: Colors.black87,
                      ),
                      HorizontalGap(),
                      SvgPicture.asset(
                        'assets/phone.svg',
                        height: 20,
                        width: 20,
                        color: Colors.green,
                      ),
                    ],
                  ),
                  const VerticalGap(d_margin1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
