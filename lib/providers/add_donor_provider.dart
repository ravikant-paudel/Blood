import 'package:blood/utils/shortcuts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final StateNotifierProvider<AddDonorProvider> addDonorProvider =
StateNotifierProvider((_) => AddDonorProvider());

class AddDonorProvider extends StateNotifier<AddDonorState> {
  AddDonorProvider() : super(AddDonorState());

  Future<void> submitDonorName() {
    logThis(state.toString());
    return null;
  }

  void updateName(String name) {
    state = state.copyWith(nameDonor: name);
  }

  void updateNumber(String number) {
    state = state.copyWith(numberDonor: number);
  }

  void updateBloodGroup(String blood) {
    state = state.copyWith(bloodDonor: blood);
  }
}

class AddDonorState {
  final String nameDonor, numberDonor, bloodDonor;

  AddDonorState({
    this.nameDonor,
    this.numberDonor,
    this.bloodDonor,
  });

  AddDonorState copyWith({String nameDonor, String numberDonor, String bloodDonor}) => AddDonorState(
        nameDonor: nameDonor ?? this.nameDonor,
        numberDonor: numberDonor ?? this.numberDonor,
        bloodDonor: bloodDonor ?? this.bloodDonor,
      );

  @override
  String toString() => 'AddDonorState(nameDonor: $nameDonor,numberDonor: $numberDonor,bloodDonor: $bloodDonor)';
}
