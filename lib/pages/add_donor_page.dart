import 'package:blood/component/button.dart';
import 'package:blood/component/gaps.dart';
import 'package:blood/providers/add_donor_provider.dart';
import 'package:blood/utils/resources/dimens.dart';
import 'package:blood/utils/shortcuts.dart';
import 'package:blood/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/src/framework.dart';

class AddDonorPage extends StatelessWidget {
  final List<String> _dropdownItems = ['A+', 'A-', 'B+', 'B-', 'AB+', 'O+', 'O-'];

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final addDProvider = addDonorProvider.readOwner(ProviderStateOwnerScope.of(context, listen: false));
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'AddDonorPage',
      ),
      body: Consumer((context, read){
        var state = read(addDonorProvider.state);
        if (state.isLoading) {
          return Center(child: CircularProgressIndicator());
        } if (state.isSuccess) {
          navigator.pop(context);
        }
        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Consumer((context, read) {
                final addDonorState = read(addDonorProvider.state);
                return Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                          onChanged: addDProvider.updateName,
                          validator: (value) => RegExp(r'\w{6,}').hasMatch(value) ? null : 'At least 6 character',
                          decoration: const InputDecoration(
                            hintText: 'Donor name',
                          )),
                      const VerticalGap(),
                      TextFormField(
                          onChanged: addDProvider.updateNumber,
                          validator: (value) => value.isNotEmpty ? null : 'error',
                          style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 16),
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            hintText: 'Donor Number',
                          )),
                      const VerticalGap(),
                      DropdownButtonFormField<String>(
                        validator: (value) => value.isNotEmpty ? null : 'error',
                        isExpanded: true,
//              isDense: true,
                        hint: const Text('-- Select Group --'),
                        items: _dropdownItems.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: addDonorState.bloodDonor,
                        onChanged: addDProvider.updateBloodGroup,
                      ),
                      const VerticalGap(d_margin6),
                      BloodButton(
                        buttonText: 'Add Donor',
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            //call provider
                            addDProvider.submitDonorName();
                          }
                        },
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        );
      }),
    );
  }
}
