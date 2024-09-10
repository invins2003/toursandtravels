import 'package:flutter/material.dart';

class SeatSelectionPage extends StatefulWidget {
  @override
  _SeatSelectionPageState createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  // Seat availability, using the format: 'seat_number': 'status'
  Map<String, String> seats = {
    '1': 'standard', '2': 'standard', '3': 'standard', '4': 'standard',
    '5': 'premium', '6': 'premium', '7': 'table', '8': 'premium',
    '9': 'table', '10': 'premium', '11': 'standard', '12': 'standard',
    '13': 'taken', '14': 'standard', '15': 'taken', '16': 'taken',
    '17': 'standard', '18': 'taken', '19': 'standard', '20': 'taken',
    '21': 'taken', '22': 'standard', '23': 'taken', '24': 'taken',
    '25': 'taken', '26': 'standard', '27': 'taken', '28': 'standard',
    '29': 'standard', '30': 'standard', '31': 'standard',
  };
  
  Set<String> selectedSeats = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Seat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Seat legend at the top
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SeatLegend(color: Colors.red, label: 'Standard'),
                SeatLegend(color: Colors.orange, label: 'Premium'),
                SeatLegend(color: Colors.grey, label: 'Taken'),
              ],
            ),
            SizedBox(height: 20),

            // Seat grid layout
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,  // Adjust grid size
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: seats.length,
                itemBuilder: (context, index) {
                  String seatNumber = seats.keys.elementAt(index);
                  String seatStatus = seats[seatNumber]!;

                  bool isSelected = selectedSeats.contains(seatNumber);
                  bool isAvailable = seatStatus != 'taken' && seatStatus != 'table';

                  Color seatColor = getSeatColor(seatStatus, isSelected);
                  Border border = isSelected ? Border.all(color: Colors.red, width: 2) : Border.all(color: Colors.black);

                  return GestureDetector(
                    onTap: isAvailable
                        ? () {
                            setState(() {
                              if (isSelected) {
                                selectedSeats.remove(seatNumber);
                              } else {
                                selectedSeats.add(seatNumber);
                              }
                            });
                          }
                        : null,  // Disable tap on unavailable seats
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: seatColor,
                        borderRadius: BorderRadius.circular(8),
                        border: border,
                      ),
                      child: seatStatus == 'table'
                          ? Text('Table', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))
                          : Text(
                              seatNumber,
                              style: TextStyle(
                                color: seatStatus == 'taken' ? Colors.black45 : Colors.white,
                              ),
                            ),
                    ),
                  );
                },
              ),
            ),

            // Selected seat count and confirm button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Seat: ${selectedSeats.length}/1'),
                  ElevatedButton(
                    onPressed: selectedSeats.isEmpty
                        ? null
                        : () {
                            // Show selected seats
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Seats Selected: ${selectedSeats.join(", ")}',
                                ),
                              ),
                            );
                          },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15), backgroundColor: Colors.red,
                    ),
                    child: Text('Confirm'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to determine seat colors based on seat type and selection
  Color getSeatColor(String seatStatus, bool isSelected) {
    if (isSelected) {
      return Colors.red;
    } else if (seatStatus == 'premium') {
      return Colors.orange;
    } else if (seatStatus == 'standard') {
      return Colors.grey;
    } else if (seatStatus == 'taken') {
      return Colors.black12;
    } else if (seatStatus == 'table') {
      return Colors.grey.shade400;
    }
    return Colors.grey;
  }
}

class SeatLegend extends StatelessWidget {
  final Color color;
  final String label;

  SeatLegend({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.black),
          ),
        ),
        SizedBox(width: 5),
        Text(label),
      ],
    );
  }
}
