import 'package:blood/component/gaps.dart';
import 'package:blood/utils/blood_list_view.dart';
import 'package:blood/utils/divider.dart';
import 'package:blood/utils/resources/colors.dart';
import 'package:blood/utils/resources/dimens.dart';
import 'package:blood/utils/shortcuts.dart';
import 'package:blood/widgets/blood_group_label.dart';
import 'package:blood/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardDetailPage extends StatelessWidget {
  const DashboardDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Detail',
      ),
      body: BloodListView(
        padding: const EdgeInsets.fromLTRB(d_margin2, d_topPaddingForToolbar, d_margin2, 0),
        children: [
          Card(
            child: Stack(
              children: [
                const Positioned(child: BloodGroupLabel('A+'), bottom: d_margin05, right: d_margin2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 45,
                            height: 43,
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
                                'A+',
                                firstTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                                      color: Theme.of(context).colorScheme.secondary,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 14,
                                      height: 1.3,
                                    ),
                                secTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: Theme.of(context).colorScheme.secondary,
                                      height: 1,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        const HorizontalGap(),
                        Expanded(
                          child: Text(
                            'Request Blood',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ),
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
                          onTap: () => locator.urlLauncher.launchDialer('9841523939'),
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
                        const HorizontalGap(),
                      ],
                    ),
                    const VerticalGap(d_margin05),
                    const BloodDivider(indent: d_margin205),
                    const VerticalGap(d_margin2),
                    const _DetailItem(textLabel: 'Patient Name', textValue: 'Ravikant PAudel'),
                    // _DetailItem(textLabel: 'Contact number', textValue: '9851180561'),
                    // _DetailItem(textLabel: 'Contact number', textValue: '9851180561'),
                    // _DetailItem(textLabel: 'Contact number', textValue: '9851180561'),
                    // _DetailItem(textLabel: 'Contact number', textValue: '9851180561'),
                    // _DetailItem(textLabel: 'Contact number', textValue: '9851180561'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailItem extends StatelessWidget {
  final String textLabel;
  final String textValue;

  const _DetailItem({super.key, required this.textLabel, required this.textValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: d_margin2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textLabel,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontStyle: FontStyle.italic,
                  fontSize: 10,
                ),
          ),
          const VerticalGap(d_margin05),
          Text(
            textValue,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                  fontSize: 11,
                ),
          ),
          const VerticalGap(d_margin105),
        ],
      ),
    );
  }
}
