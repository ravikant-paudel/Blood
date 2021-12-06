import 'package:blood/component/button.dart';
import 'package:blood/component/gaps.dart';
import 'package:blood/helper/router/go_router.dart';
import 'package:blood/providers/request_blood_provider.dart';
import 'package:blood/utils/blood_list_view.dart';
import 'package:blood/utils/resources/colors.dart';
import 'package:blood/utils/resources/dimens.dart';
import 'package:blood/utils/shortcuts.dart';
import 'package:blood/widgets/blood_group_label.dart';
import 'package:blood/widgets/blood_text_form.dart';
import 'package:blood/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart' as picker;
import 'package:nepali_date_picker/nepali_date_picker.dart';

class RequestBloodPage extends StatelessWidget {
  RequestBloodPage({Key? key}) : super(key: key);

  NepaliDateTime? _selectedDateTime = NepaliDateTime.now();

  final List<String> _dropdownItems = ['A+', 'A-', 'B+', 'B-', 'AB+', 'O+', 'O-'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Request Blood',
      ),
      body: Consumer(builder: (context, ref, child) {
        final state = ref.read(requestBloodProvider);
        final reqBloodProvider = ref.read(requestBloodProvider.notifier);
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.isSuccess) {
          goRouter.pop(context);
        }
        return BloodListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: reqBloodProvider.requestFormKey,
                child: Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16, top: 0, right: 16, left: 16),
                        child: DropdownButtonFormField<String>(
                          validator: (value) => value == null ? 'Please select district' : null,
                          isExpanded: true,
                          hint: const Text('-- Select District --'),
                          items: dropdownDistrict.map((String value) {
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
                    const VerticalGap(d_margin05),
                    BloodTextForm(
                      onChanged: reqBloodProvider.updatePatientName,
                      labelText: 'Patient Name',
                      validator: (value) => RegExp(r'\w{4,}').hasMatch(value ?? '') ? null : 'At least 4 character',
                    ),
                    const VerticalGap(d_margin05),
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
                    InkWell(
                      onTap: () async {
                        _selectedDateTime = await showMaterialDatePicker(
                          context: context,
                          initialDate: _selectedDateTime ?? NepaliDateTime.now(),
                          firstDate: NepaliDateTime(1970, 2, 5),
                          lastDate: NepaliDateTime(2099, 11, 6),
                          initialDatePickerMode: DatePickerMode.day,
                        );
                        print(_selectedDateTime);
                      },
                      child: Card(
                        child: Column(
                          children: const [
                            Text('Date'),
                            Text('Choose date'),
                          ],
                        ),
                      ),
                    ),
                    BloodTextForm(
                      onChanged: reqBloodProvider.updateContactNumber,
                      validator: (value) => value,
                      keyboardType: TextInputType.phone,
                      labelText: 'Contact Number',
                    ),
                    const VerticalGap(d_margin05),
                    BloodTextForm(
                      onChanged: reqBloodProvider.updatePatientAge,
                      validator: (value) => value,
                      keyboardType: TextInputType.phone,
                      labelText: 'Patient Age',
                    ),
                    const VerticalGap(d_margin05),
                    BloodTextForm(
                      onChanged: reqBloodProvider.updatePatientLocation,
                      validator: (value) => value,
                      labelText: 'Address / Location',
                    ),
                    const VerticalGap(d_margin6),
                    BloodButton(
                      buttonText: 'Request Blood',
                      onPressed: () {
                        if (reqBloodProvider.requestFormKey.currentState?.validate() ?? false) {
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
          bloodGroup,
          firstTextStyle: Theme.of(context).textTheme.headline6!.copyWith(
                color: primaryTextDark,
                fontWeight: FontWeight.w900,
                height: 1.3,
              ),
          secTextStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: primaryTextDark,
                height: 1,
              ),
        ),
      ),
    );
  }

  final List<String> dropdownDistrict = [
    'Achham',
    'Arghakhanchi',
    'Baglung',
    'Baitadi',
    'Bajhang',
    'Bajura',
    'Banke',
    'Bara',
    'Bardiya',
    'Bhaktapur',
    'Bhojpur',
    'Chitwan',
    'Dadeldhura',
    'Dailekh',
    'Dang Deukhuri',
    'Darchula',
    'Dhading',
    'Dhankuta',
    'Dhanusha',
    'Dolakha',
    'Dolpa',
    'Doti',
    'Gorkha',
    'Gulmi',
    'Humla',
    'Ilam',
    'Jajarkot',
    'Jhapa',
    'Jumla',
    'Kailali',
    'Kalikot',
    'Kanchanpur',
    'Kapilvastu',
    'Kaski',
    'Kathmandu',
    'Kavrepalanchok',
    'Khotang',
    'Lalitpur',
    'Lamjung',
    'Mahottari',
    'Makwanpur',
    'Manang',
    'Morang',
    'Mugu',
    'Mustang',
    'Myagdi',
    'Nawalparasi',
    'Nuwakot',
    'Okhaldhunga',
    'Palpa',
    'Panchthar',
    'Parbat',
    'Parsa',
    'Pyuthan',
    'Ramechhap'
  ];
}
