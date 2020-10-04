import 'package:blood/component/button.dart';
import 'package:blood/component/gaps.dart';
import 'package:blood/providers/request_blood_provider.dart';
import 'package:blood/utils/resources/colors.dart';
import 'package:blood/utils/resources/dimens.dart';
import 'package:blood/utils/shortcuts.dart';
import 'package:blood/widgets/blood_group_label.dart';
import 'package:blood/widgets/blood_text_form.dart';
import 'package:blood/widgets/choose_blood_group_component.dart';
import 'package:blood/widgets/custom_app_bar.dart';
import 'package:blood/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RequestBloodPage extends StatelessWidget {
  final List<String> _dropdownItems = ['A+', 'A-', 'B+', 'B-', 'AB+', 'O+', 'O-'];


  // final GlobalKey<FormState> requestFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Request Blood',
      ),
      body: Consumer(builder: (context, read, child) {
        final state = read(requestBloodProvider.state);
        final reqBloodProvider = read(requestBloodProvider);
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.isSuccess) {
          navigator.pop(context);
        }
        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: reqBloodProvider.requestFormKey,
                child: Column(
                  children: <Widget>[
                    ChooseBloodGroupComponent(),
                    BloodTextForm(
                      onChanged: reqBloodProvider.updatePatientName,
                      labelText: 'Patient Name',
                      validator: (value) =>  RegExp(r'\w{4,}').hasMatch(value) ? null : 'At least 4 character',
                    ),
                    const VerticalGap(d_margin1),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16, top: 0, right: 16, left: 16),
                        child: DropdownButtonFormField<String>(
                          validator: (value) => value == null ? 'Please select blood group' : null,
                          isExpanded: true,
                          hint: const Text('-- Select Group --'),
                          items: _dropdownItems.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          value: state.bloodGroup,
                          onChanged: reqBloodProvider.updateBloodGroup,
                        ),
                      ),
                    ),
                    const VerticalGap(d_margin1),
                    BloodTextForm(
                      onChanged: reqBloodProvider.updateContactNumber,
                      validator: (value) => value.isNotEmpty ? null : 'error',
                      keyboardType: TextInputType.phone,
                      labelText: 'Contact Number',
                    ),
                    const VerticalGap(d_margin1),
                    BloodTextForm(
                      onChanged: reqBloodProvider.updatePatientLocation,
                      validator: (value) => value.isNotEmpty ? null : 'error',
                      labelText: 'Address / Location',
                    ),
                    const VerticalGap(d_margin1),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16, top: 0, right: 16, left: 16),
                        child: DropdownButtonFormField<String>(
                          validator: (value) => value == null ? 'Please select district' : null,
                          isExpanded: true,
                          hint: const Text('-- District / State --'),
                          items: reqBloodProvider.dropdownDistrict.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          value: state.district,
                          onChanged: reqBloodProvider.updateDistrict,
                        ),
                      ),
                    ),
                    BloodTextForm(
                      onChanged: reqBloodProvider.updatePatientAge,
                      validator: (value) => value.isNotEmpty ? null : 'error',
                      keyboardType: TextInputType.phone,
                      labelText: 'Patient Age',
                    ),
                    const VerticalGap(d_margin1),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const BloodText('Your Blood Group'),
                            const VerticalGap(d_margin1),
                            Row(
                              children: [
                                bloodCard(context, 'AB+'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const VerticalGap(d_margin6),
                    BloodButton(
                      buttonText: 'Add Donor',
                      onPressed: () {
                        if (reqBloodProvider.requestFormKey.currentState.validate()) {
                          reqBloodProvider.submitBloodRequest();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Card bloodCard(BuildContext context, String bloodGroup) {
    return Card(
      color: Colors.grey[300],
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: BloodGroupLabel(
          bloodGroup ?? '',
          firstTextStyle: Theme.of(context).textTheme.headline6.copyWith(
                color: primaryTextDark,
                fontWeight: FontWeight.w900,
                height: 1.3,
              ),
          secTextStyle: Theme.of(context).textTheme.bodyText2.copyWith(
                color: primaryTextDark,
                height: 1,
              ),
        ),
      ),
    );
  }
}
