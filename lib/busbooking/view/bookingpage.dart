import 'package:flutter/material.dart';
import 'package:toursandtravels/busbooking/view/components/date_picker_widget.dart';
import 'package:toursandtravels/busbooking/view/components/passengercount.dart';
import 'package:toursandtravels/busbooking/view/components/to_from.dart';
import 'package:toursandtravels/busbooking/view/searchtripspage.dart';
import 'package:toursandtravels/utils/constant/colors.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  bool tripType = false;

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height using MediaQuery
    final mediaQuery = MediaQuery.of(context).size;
    final screenWidth = mediaQuery.width;
    final screenHeight = mediaQuery.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            screenWidth * 0.05,  // Adjust horizontal padding relative to screen width
            screenHeight * 0.05, // Adjust top padding relative to screen height
            screenWidth * 0.05,
            screenHeight * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Book Tickets for your",
                style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: screenWidth * 0.065), // Adjust font size relative to screen width
              ),
              SizedBox(height: screenHeight * 0.01), // Responsive spacing
              Text(
                'next trip!',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: screenWidth * 0.065), // Adjust font size
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: screenHeight * 0.04), // Responsive margin
                  height: screenHeight * 0.08,  // Increased container height
                  width: screenWidth * 0.75,    // Adjust container width
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(32),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenHeight * 0.015), // Adjust padding
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
                                  child: Center(
                                    child: Text(
                                      "One Way",
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.045,  // Adjust font size
                                        fontWeight: FontWeight.bold,
                                        color: TColors.primaryLight,
                                      ),
                                    ),
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    "One Way",
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.045,  // Adjust font size
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
                                  child: Center(
                                    child: Text(
                                      "Round Trip",
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.045,  // Adjust font size
                                        fontWeight: FontWeight.bold,
                                        color: TColors.primaryLight,
                                      ),
                                    ),
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    "Round Trip",
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.045,  // Adjust font size
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
              SizedBox(height: screenHeight * 0.05), // Increased responsive spacing
              DatePickerWidget(isRoundTrip: !tripType),
              SizedBox(height: screenHeight * 0.05), // Increased responsive spacing
              PassengerCounter(),
              SizedBox(height: screenHeight * 0.05), // Increased responsive spacing before the button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SearchTripsPage()),
                    );
                    print('Search for Trips button pressed');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.12, vertical: screenHeight * 0.015), // Increased padding for the button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child: Text(
                    'Search for Trips',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05, // Adjusted font size
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
