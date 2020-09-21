import 'package:blood/component/button.dart';
import 'package:blood/component/gaps.dart';
import 'package:blood/providers/request_blood_provider.dart';
import 'package:blood/utils/resources/dimens.dart';
import 'package:blood/utils/shortcuts.dart';
import 'package:blood/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RequestBloodPage extends StatelessWidget {
  final List<String> _dropdownItems = ['A+', 'A-', 'B+', 'B-', 'AB+', 'O+', 'O-'];
  final List<String> _dropdownDistrict = ['Achham', 'Arghakhanchi', 'Baglung', 'Baitadi','Bajhang','Bajura','Banke','Bara','Bardiya','Bhaktapur',
  'Bhojpur','Chitwan','Dadeldhura','Dailekh','Dang Deukhuri','Darchula','Dhading','Dhankuta','Dhanusha','Dolakha','Dolpa','Doti','Gorkha','Gulmi','Humla',
  'Ilam','Jajarkot','Jhapa','Jumla','Kailali','Kalikot','Kanchanpur','Kapilvastu','Kaski','Kathmandu','Kavrepalanchok','Khotang','Lalitpur','Lamjung',
  'Mahottari','Makwanpur','Manang','Morang', 'Mugu','Mustang','Myagdi','Nawalparasi','Nuwakot','Okhaldhunga','Palpa','Panchthar','Parbat','Parsa','Pyuthan',
  'Ramechhap'];

  final GlobalKey<FormState> requestFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Request Blood',
      ),
      body: Consumer(builder:(context, read, child) {
        var state = read(requestBloodProvider.state);
        var reqBloodProvider = read(requestBloodProvider);
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
                key: requestFormKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        // onChanged: reqBloodProvider.updatePatientName,
                        // validator: (value) => RegExp(r'\w{4,}').hasMatch(value) ? null : 'At least 4 character',
                        decoration: const InputDecoration(
                          hintText: 'Patient name',
                        )),
                    const VerticalGap(),
                    // DropdownButtonFormField<String>(
                    //   validator: (value) => value == null ? 'Please select blood group' : null,
                    //   isExpanded: true,
                    //   hint: const Text('-- Select Group --'),
                    //   items: _dropdownItems.map((String value) {
                    //     return DropdownMenuItem<String>(
                    //       value: value,
                    //       child: Text(value),
                    //     );
                    //   }).toList(),
                    //   value: state.bloodGroup,
                    //   onChanged: reqBloodProvider.updateBloodGroup,
                    // ),
                    // const VerticalGap(),
                    // TextFormField(
                    //     onChanged: reqBloodProvider.updateContactNumber,
                    //     validator: (value) => value.isNotEmpty ? null : 'error',
                    //     keyboardType: TextInputType.phone,
                    //     decoration: const InputDecoration(
                    //       hintText: 'Contact Number',
                    //     )),
                    // const VerticalGap(),
                    // TextFormField(
                    //     onChanged: reqBloodProvider.updatePatientAge,
                    //     validator: (value) => value.isNotEmpty ? null : 'error',
                    //     keyboardType: TextInputType.phone,
                    //     decoration: const InputDecoration(
                    //       hintText: 'Patient Age',
                    //     )),
                    // const VerticalGap(),
                    // TextFormField(
                    //     onChanged: reqBloodProvider.updatePatientLocation,
                    //     validator: (value) => value.isNotEmpty ? null : 'error',
                    //     decoration: const InputDecoration(
                    //       hintText: 'Location',
                    //     )),
                    // const VerticalGap(),
                    // DropdownButtonFormField<String>(
                    //   validator: (value) => value == null ? 'Please select district' : null,
                    //   isExpanded: true,
                    //   hint: const Text('-- Select District --'),
                    //   items: _dropdownDistrict.map((String value) {
                    //     return DropdownMenuItem<String>(
                    //       value: value,
                    //       child: Text(value),
                    //     );
                    //   }).toList(),
                    //   value: state.district,
                    //   onChanged: reqBloodProvider.updateDistrict,
                    // ),
                    // const VerticalGap(d_margin6),
                    // BloodButton(
                    //   buttonText: 'Add Donor',
                    //   onPressed: () {
                    //     if (requestFormKey.currentState.validate()) {
                    //       reqBloodProvider.submitBloodRequest();
                    //     }
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
