import 'package:blood/providers/add_donor_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddDonorPage extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final List<String> _bloodGroups = ['A+', 'A-', 'B+', 'B-', 'AB+', 'O+', 'O-'];

  AddDonorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addDonorProvider);
    final notifier = ref.read(addDonorProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Add Donor')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) => value!.length >= 3 ? null : 'Minimum 3 characters',
                onChanged: notifier.updateName,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
                validator: (value) => _validatePhoneNumber(value),
                onChanged: notifier.updateNumber,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: state.bloodDonor,
                items: _bloodGroups
                    .map((group) => DropdownMenuItem(
                          value: group,
                          child: Text(group),
                        ))
                    .toList(),
                onChanged: notifier.updateBloodGroup,
                decoration: const InputDecoration(labelText: 'Blood Group'),
                validator: (value) => value == null ? 'Select blood group' : null,
              ),
              const SizedBox(height: 24),
              state.isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () => _submitForm(ref, context),
                      child: const Text('Submit'),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) return 'Enter phone number';
    if (!RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$').hasMatch(value)) {
      return 'Invalid phone number';
    }
    return null;
  }

  Future<void> _submitForm(WidgetRef ref, BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      await ref.read(addDonorProvider.notifier).submitDonor();
      if (ref.read(addDonorProvider).isSuccess) {
        Navigator.of(context).pop();
      }
    }
  }
}
