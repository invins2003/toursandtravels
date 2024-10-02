import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toursandtravels/busbooking/model/seatbookingviewmodel.dart';

// Create a provider to manage the toggle state
final seatTypeProvider = StateProvider<SeatType>((ref) => SeatType.seating);

enum SeatType { seating, sleeper }

class BusBookingSelectPage extends ConsumerWidget {
  const BusBookingSelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalSeats = 30;
    final totalSleeperSeats = 10;
    final selectedSeats = ref.watch(seatSelectionProvider);
    final reservedSeats = ref.watch(reservedSeatsProvider);
    final takenSeats = ref.watch(takenSeatsProvider);
    final seatType = ref.watch(seatTypeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Seat"),
        titleTextStyle: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w900,
          color: Colors.black,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Toggle between seating and sleeper seats
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _legendBox(Colors.green, "AVAILABLE"),
                  _legendBox(Colors.red, "RESERVED"),
                  _legendBox(Colors.grey[400]!, "TAKEN", isTaken: true),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                border: Border.all(),
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ToggleButtons(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        borderColor: Colors.white,
                        selectedBorderColor: Colors.black,
                        selectedColor: Colors.black,
                        isSelected: [seatType == SeatType.seating, seatType == SeatType.sleeper],
                        onPressed: (index) {
                          if (index == 0) {
                            ref.read(seatTypeProvider.notifier).state = SeatType.seating;
                          } else {
                            ref.read(seatTypeProvider.notifier).state = SeatType.sleeper;
                          }
                        },
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text("Seats", style: TextStyle(fontSize: 16)),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text("Sleeper", style: TextStyle(fontSize: 16)),
                          ),
                        ],
                      ),
                    ),
                    seatType == SeatType.seating
                        ? Column(
                            children: _buildSeatLayout(
                                ref, totalSeats, selectedSeats, reservedSeats, takenSeats),
                          )
                        : Column(
                            children: _buildSleeperSeatLayout(
                                ref, totalSleeperSeats, selectedSeats, reservedSeats, takenSeats),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 84,
        child: BottomAppBar(
          elevation: 64,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                Text(
                  "Seat: ${selectedSeats.length}/${seatType == SeatType.seating ? totalSeats : totalSleeperSeats}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(width: 24),
                Flexible(
                  child: Container(
                    height: 54,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: const Center(
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Creates the seat layout for the bus dynamically
  List<Widget> _buildSeatLayout(WidgetRef ref, int totalSeats, Set<int> selectedSeats, List<int> reservedSeats, List<int> takenSeats) {
    List<Widget> seatRows = [];
    for (int i = 1; i <= totalSeats; i += 4) {
      seatRows.add(
        Row(
          children: [
            _GeneralSeatComponent(
              seatNumber: i,
              isSelected: selectedSeats.contains(i),
              isReserved: reservedSeats.contains(i),
              isTaken: takenSeats.contains(i),
              onTap: () => ref.read(seatSelectionProvider.notifier).toggleSeat(i),
            ),
            const SizedBox(width: 10),
            _GeneralSeatComponent(
              seatNumber: i + 1,
              isSelected: selectedSeats.contains(i + 1),
              isReserved: reservedSeats.contains(i + 1),
              isTaken: takenSeats.contains(i + 1),
              onTap: () => ref.read(seatSelectionProvider.notifier).toggleSeat(i + 1),
            ),
            const Spacer(),
            _GeneralSeatComponent(
              seatNumber: i + 2,
              isSelected: selectedSeats.contains(i + 2),
              isReserved: reservedSeats.contains(i + 2),
              isTaken: takenSeats.contains(i + 2),
              onTap: () => ref.read(seatSelectionProvider.notifier).toggleSeat(i + 2),
            ),
            const SizedBox(width: 10),
            _GeneralSeatComponent(
              seatNumber: i + 3,
              isSelected: selectedSeats.contains(i + 3),
              isReserved: reservedSeats.contains(i + 3),
              isTaken: takenSeats.contains(i + 3),
              onTap: () => ref.read(seatSelectionProvider.notifier).toggleSeat(i + 3),
            ),
          ],
        ),
      );
      seatRows.add(const SizedBox(height: 16)); // Space between rows
    }
    return seatRows;
  }

  // Creates the sleeper seat layout for the bus dynamically
  // Creates the sleeper seat layout for the bus dynamically
List<Widget> _buildSleeperSeatLayout(WidgetRef ref, int totalSleeperSeats, Set<int> selectedSeats, List<int> reservedSeats, List<int> takenSeats) {
  List<Widget> seatRows = [];
  for (int i = 1; i <= totalSleeperSeats; i += 2) {
    seatRows.add(
      Center( // Center the row of sleeper seats
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center align the seats in the row
          children: [
            _SleeperSeatComponent(
              seatNumber: i,
              isSelected: selectedSeats.contains(i),
              isReserved: reservedSeats.contains(i),
              isTaken: takenSeats.contains(i),
              onTap: () => ref.read(seatSelectionProvider.notifier).toggleSeat(i),
            ),
            const SizedBox(width: 20),
            _SleeperSeatComponent(
              seatNumber: i + 1,
              isSelected: selectedSeats.contains(i + 1),
              isReserved: reservedSeats.contains(i + 1),
              isTaken: takenSeats.contains(i + 1),
              onTap: () => ref.read(seatSelectionProvider.notifier).toggleSeat(i + 1),
            ),
          ],
        ),
      ),
    );
    seatRows.add(const SizedBox(height: 16)); // Space between rows
  }
  return seatRows;
}


  // Widget for seat legends
  Widget _legendBox(Color color, String label, {bool isTaken = false}) {
    return Row(
      children: [
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
          child: isTaken
              ? const Center(
                  child: Icon(
                    Icons.clear,
                  ),
                )
              : null,
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15),
        ),
      ],
    );
  }
}

class _GeneralSeatComponent extends StatelessWidget {
  final int seatNumber;
  final bool isSelected;
  final bool isReserved;
  final bool isTaken;
  final VoidCallback onTap;

  const _GeneralSeatComponent({
    Key? key,
    required this.seatNumber,
    this.isSelected = false,
    this.isReserved = false,
    this.isTaken = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color seatColor;
    if (isTaken) {
      seatColor = Colors.grey[400]!;
    } else if (isReserved) {
      seatColor = Colors.red;
    } else if (isSelected) {
      seatColor = Colors.green;
    } else {
      seatColor = Colors.green[200]!;
    }

    return GestureDetector(
      onTap: isReserved || isTaken ? null : onTap,
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: seatColor,
        ),
        child: Center(
          child: isTaken
              ? const Icon(Icons.clear, color: Colors.black)
              : Text(
                  "$seatNumber",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: seatColor == Colors.green ? Colors.black : Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}

class _SleeperSeatComponent extends StatelessWidget {
  final int seatNumber;
  final bool isSelected;
  final bool isReserved;
  final bool isTaken;
  final VoidCallback onTap;

  const _SleeperSeatComponent({
    Key? key,
    required this.seatNumber,
    this.isSelected = false,
    this.isReserved = false,
    this.isTaken = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color seatColor;
    if (isTaken) {
      seatColor = Colors.grey[400]!;
    } else if (isReserved) {
      seatColor = Colors.red;
    } else if (isSelected) {
      seatColor = Colors.green;
    } else {
      seatColor = Colors.green[200]!;
    }

    return GestureDetector(
      onTap: isReserved || isTaken ? null : onTap,
      child: Container(
        height: 75,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: seatColor,
        ),
        child: Center(
          child: isTaken
              ? const Icon(Icons.clear, color: Colors.black)
              : Text(
                  "$seatNumber",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: seatColor == Colors.green ? Colors.black : Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
