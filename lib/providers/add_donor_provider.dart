import 'package:flutter_riverpod/flutter_riverpod.dart';

final addDonorProvider = StateNotifierProvider.autoDispose<AddDonorNotifier, AddDonorState>(
  (ref) => AddDonorNotifier(),
);

class AddDonorNotifier extends StateNotifier<AddDonorState> {
  AddDonorNotifier() : super(AddDonorState(isLoading: false, isSuccess: false, nameDonor: '', bloodDonor: '', numberDonor: ''));

  void updateName(String name) => state = state.copyWith(nameDonor: name);
  void updateNumber(String number) => state = state.copyWith(numberDonor: number);
  void updateBloodGroup(String? blood) => state = state.copyWith(bloodDonor: blood);

  Future<void> submitDonor() async {
    state = state.copyWith(isLoading: true);
    // Simulate async operation
    await Future.delayed(const Duration(seconds: 1));
    state = state.copyWith(isLoading: false, isSuccess: true);
  }
}

class AddDonorState {
  final bool isLoading;
  final bool isSuccess;
  final String nameDonor, numberDonor, bloodDonor;

  AddDonorState({
    this.isLoading = false,
    this.isSuccess = false,
    required this.nameDonor,
    required this.numberDonor,
    required this.bloodDonor,
  });

  AddDonorState copyWith({bool? isLoading, bool? isSuccess, String? nameDonor, String? numberDonor, String? bloodDonor}) => AddDonorState(
        isLoading: isLoading ?? this.isLoading,
        isSuccess: isSuccess ?? this.isSuccess,
        nameDonor: nameDonor ?? this.nameDonor,
        numberDonor: numberDonor ?? this.numberDonor,
        bloodDonor: bloodDonor ?? this.bloodDonor,
      );
}
