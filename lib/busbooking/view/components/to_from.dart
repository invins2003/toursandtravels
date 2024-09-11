import 'package:flutter/material.dart';
import 'package:toursandtravels/utils/constant/colors.dart';

class ToFromDropdownWidget extends StatefulWidget {
  @override
  _ToFromDropdownWidgetState createState() => _ToFromDropdownWidgetState();
}

class _ToFromDropdownWidgetState extends State<ToFromDropdownWidget> {
  // List of place names
  final List<String> places = [
    'Puri',
    'Konark',
    'Tara Tarini',
    'Maa Kalijai',
    'Chilika',
    'Bhubaneswar',
    'Cuttack'
  ];

  // Selected 'From' and 'To' places
  String? selectedFromPlace;
  String? selectedToPlace;

  // Function to swap 'From' and 'To' places
  void swapPlaces() {
    setState(() {
      String? temp = selectedFromPlace;
      selectedFromPlace = selectedToPlace;
      selectedToPlace = temp;
    });
  }

  @override
Widget build(BuildContext context) {
  return Stack(
    clipBehavior: Clip.none, // Allows the button to float outside the container
    children: [
      // Main Container with 'From' and 'To' dropdowns
      Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            // Row for 'From' dropdown
            Row(
              children: [
                Text(
                  'From: ',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedFromPlace,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    ),
                    hint: Text('Select destination place'),
                    onChanged: (newValue) {
                      if (newValue != selectedToPlace) {
                        setState(() {
                          selectedFromPlace = newValue;
                        });
                      } else {
                        // Optionally show an error message or handle the case where the selected value is the same
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('The selected place is already in the "To" field.'),
                          ),
                        );
                      }
                    },
                    items: places.map((place) {
                      return DropdownMenuItem(
                        value: place,
                        child: Text(
                          place,
                          style: TextStyle(fontStyle: Theme.of(context).textTheme.displaySmall?.fontStyle), // Change text color here
                        ),
                      );
                    }).toList(),
                    dropdownColor: Colors.grey, // Optional: Set background color of the dropdown menu
                    iconSize: 24, // Adjust the icon size if needed
                    isExpanded: true, // Make the dropdown button occupy the full width
                  ),
                ),
              ],
            ),
            SizedBox(height: 16), // Spacing between the two rows

            // Row for 'To' dropdown
            Row(
              children: [
                Text(
                  'To: ',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 36), // Adjust spacing to align with 'From'
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedToPlace,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    ),
                    hint: Text('Select destination place'),
                    onChanged: (newValue) {
                      if (newValue != selectedFromPlace) {
                        setState(() {
                          selectedToPlace = newValue;
                        });
                      } else {
                        // Optionally show an error message or handle the case where the selected value is the same
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('The selected place is already in the "From" field.'),
                          ),
                        );
                      }
                    },
                    items: places.map((place) {
                      return DropdownMenuItem(
                        value: place,
                        child: Text(
                          place,
                          style: TextStyle(fontStyle: Theme.of(context).textTheme.displaySmall?.fontStyle), // Change text color here
                        ),
                      );
                    }).toList(),
                    dropdownColor: Colors.grey, // Optional: Set background color of the dropdown menu
                    iconSize: 24, // Adjust the icon size if needed
                    isExpanded: true, // Make the dropdown button occupy the full width
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      // Floating action button for swapping 'From' and 'To'
      Positioned(
        top: 55, // Position between the dropdowns, slightly below "From"
        right: 20, // Align the button to the right
        child: FloatingActionButton(
          onPressed: swapPlaces,
          child: Icon(Icons.swap_vert),
          mini: true, // Makes the button smaller
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0), // Adjust the radius to your preference
            side: BorderSide(color: TColors.primaryLight, width: 1.0), // Border color and width
          ),
        ),
      ),
    ],
  );
}
}
