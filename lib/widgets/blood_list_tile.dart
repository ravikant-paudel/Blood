import 'package:blood/component/gaps.dart';
import 'package:blood/models/request_blood/request_blood_model.dart';
import 'package:blood/utils/resources/colors.dart';
import 'package:blood/utils/resources/dimens.dart';
import 'package:blood/utils/shortcuts.dart';
import 'package:blood/widgets/blood_group_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BloodListTile extends StatelessWidget {
  final RequestBloodModel requestBlood;

  const BloodListTile(this.requestBlood, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {},
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(80.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BloodGroupLabel(
                      requestBlood.bloodGroup,
                      firstTextStyle: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                            height: 1.3,
                          ),
                      secTextStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Theme.of(context).accentColor,
                            height: 1,
                          ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Text(
                                  'Request Blood',
                                  style: Theme.of(context).textTheme.headline6!.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              const VerticalGap(d_margin05),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.,
                                children: [
                                  SvgPicture.asset(
                                    'assets/person.svg',
                                    height: 10,
                                    width: 10,
                                  ),
                                  const HorizontalGap(d_margin05),
                                  Expanded(
                                    child: Text(
                                      requestBlood.patientName,
                                      style: Theme.of(context).textTheme.headline6!.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const HorizontalGap(d_margin05),
                                  Container(
                                    decoration:
                                        BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(6)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                                      child: Text(
                                        'Age: ${requestBlood.patientAge}',
                                        // 'M|Age: 30',
                                        style: Theme.of(context).textTheme.overline!.copyWith(
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white,
                                            ),
                                      ),
                                    ),
                                  ),
                                  const HorizontalGap(d_margin1),
                                ],
                              ),
                            ],
                          ),
                        ),
                        BloodGroupLabel(
                          requestBlood.bloodGroup,
                        ),
                      ],
                    ),
                    const VerticalGap(d_margin105),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/contact.svg',
                          height: 10,
                          width: 10,
                        ),
                        const HorizontalGap(d_margin05),
                        Text(
                          requestBlood.contactNumber,
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontSize: 10,
                              ),
                        ),
                        const HorizontalGap(d_margin4),
                        SvgPicture.asset(
                          'assets/calender.svg',
                          height: 10,
                          width: 10,
                        ),
                        const HorizontalGap(d_margin05),
                        Text(
                          requestBlood.createdAt.toString(),
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 10),
                        ),
                      ],
                    ),
                    const VerticalGap(d_margin1),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Container(
                        color: Theme.of(context).colorScheme.primary,
                        height: 0.5,
                      ),
                    ),
                    const VerticalGap(d_margin105),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/pin.svg',
                          height: 10,
                          width: 10,
                        ),
                        const HorizontalGap(d_margin05),
                        Expanded(
                          child: Text(
                            requestBlood.patientLocation,
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 12),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const HorizontalGap(d_margin1),
                        InkWell(
                          onTap: () {
                            logThis('message when share click');
                          },
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(color: bloodGroupColor, borderRadius: BorderRadius.circular(6)),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: SvgPicture.asset(
                                'assets/share.svg',
                                height: 20,
                                width: 20,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                        const HorizontalGap(),
                        InkWell(
                          onTap: () {
                            logThis('message when phone click');
                          },
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(color: buttonColor, borderRadius: BorderRadius.circular(6)),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: SvgPicture.asset(
                                'assets/phone.svg',
                                color: Colors.white,
                              ),
                            ),
                          ),
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
      ),
    );
  }
}
