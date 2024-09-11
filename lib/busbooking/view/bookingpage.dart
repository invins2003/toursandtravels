import 'package:flutter/material.dart';
import 'package:toursandtravels/busbooking/view/components/date_picker_widget.dart';
import 'package:toursandtravels/busbooking/view/components/passengercount.dart';
import 'package:toursandtravels/busbooking/view/components/to_from.dart';
import 'package:toursandtravels/busbooking/view/searchtripspage.dart';
import 'package:toursandtravels/utils/constant/colors.dart'; // Import the new widget

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  bool tripType = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Book Tickets for your",
                style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 26),
              ),
              const SizedBox(height: 8),
              Text(
                'next trip!',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 26),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 32),
                  height: 50,
                  width: MediaQuery.of(context).size.width - 120,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(32),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              tripType = true;
                            });
                          },
                          child: tripType
                              ? Container(
                                  decoration: BoxDecoration(
                                    color: TColors.primaryDark,
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "One Way",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: TColors.primaryLight,
                                      ),
                                    ),
                                  ),
                                )
                              : const Center(
                                  child: Text(
                                    "One Way",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: TColors.primaryDark,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              tripType = false;
                            });
                          },
                          child: !tripType
                              ? Container(
                                  decoration: BoxDecoration(
                                    color: TColors.primaryDark,
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Round Trip",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: TColors.primaryLight,
                                      ),
                                    ),
                                  ),
                                )
                              : const Center(
                                  child: Text(
                                    "Round Trip",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: TColors.primaryDark,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ToFromDropdownWidget(),
              const SizedBox(height: 20,),
              DatePickerWidget(isRoundTrip: !tripType), 
              const SizedBox(height: 20,),
              PassengerCounter(), // Use the new widget
              const SizedBox(height: 20), // Add spacing before the button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchTripsPage()),
              );
                    print('Search for Trips button pressed');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ), // Use your theme color
                  ),
                  child: const Text(
                    'Search for Trips',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
