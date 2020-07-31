import 'package:blood/component/button.dart';
import 'package:blood/component/gaps.dart';
import 'package:blood/utils/resources/dimens.dart';
import 'package:blood/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AddDonorPage extends StatelessWidget {
  final List<String> _dropdownItems = ['A+', 'A-', 'B+', 'B-', 'AB+', 'O+', 'O-'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'AddDonorPage',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const TextField(
                decoration: InputDecoration(
              hintText: 'Donor name',
            )),
            const VerticalGap(),
            const TextField(
                decoration: InputDecoration(
              hintText: 'Donor Number',
            )),
            const VerticalGap(),
            DropdownButton<String>(
              isExpanded: true,
//              isDense: true,
              hint: const Text('-- Select Group --'),
              items: _dropdownItems.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
//              value: ,
              onChanged: (String value) {},
            ),
            const VerticalGap(d_margin6),
            BloodButton(
              buttonText: 'Add Donor',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
