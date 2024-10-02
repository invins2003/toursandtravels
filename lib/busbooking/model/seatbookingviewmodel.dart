import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateNotifier for managing seat selection
class SeatSelectionNotifier extends StateNotifier<Set<int>> {
  SeatSelectionNotifier() : super({});

  void toggleSeat(int seatNumber) {
    if (state.contains(seatNumber)) {
      state = {...state}..remove(seatNumber); // Deselect
    } else {
      state = {...state}..add(seatNumber); // Select
    }
  }
}

// Provider to expose seat selection
final seatSelectionProvider = StateNotifierProvider<SeatSelectionNotifier, Set<int>>((ref) {
  return SeatSelectionNotifier();
});

// Reserved and taken seats are constant, so we can create simple providers
final reservedSeatsProvider = Provider<List<int>>((ref) => [2, 7, 4,11,5,8]);
final takenSeatsProvider = Provider<List<int>>((ref) => [3, 6, 9]);
