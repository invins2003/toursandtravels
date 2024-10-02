import 'package:flutter/material.dart';
import 'package:toursandtravels/busbooking/view/seatselectionpage.dart'; // Assuming you have defined colors here

class SearchTripsPage extends StatefulWidget {
  const SearchTripsPage({super.key});

  @override
  State<SearchTripsPage> createState() => _SearchTripsPageState();
}

class _SearchTripsPageState extends State<SearchTripsPage> {
  // Bus route and multiple times for that route
  final String from = 'New York';
  final String to = 'Boston';

  // List of trips for the same route but different times
  final List<Map<String, dynamic>> busTrips = [
    {
      'departure': '10:00 AM',
      'arrival': '2:00 PM',
      'price': '\$30',
      'facilities': ['Wi-Fi', 'AC', 'Seats']
    },
    {
      'departure': '12:00 PM',
      'arrival': '4:00 PM',
      'price': '\$32',
      'facilities': ['Wi-Fi', 'Snacks', 'Charging']
    },
    {
      'departure': '2:00 PM',
      'arrival': '6:00 PM',
      'price': '\$35',
      'facilities': ['AC', 'Wi-Fi', 'Blankets']
    },
  ];

  // List of available dates for the trip
  final List<DateTime> availableDates = List.generate(
    7,
    (index) => DateTime.now().add(Duration(days: index)), // Generates 7 dates starting from today
  );

  DateTime selectedDate = DateTime.now(); // Initially, today’s date is selected

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      body: Column(
        children: [
          // SafeArea for the top portion
          SafeArea(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
                    vertical: mediaQuery.padding.top + 16,
                  ),
                  child: Text(
                    '$from to $to',
                    style: TextStyle(
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // Horizontal ScrollView for Date Selection
                Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: availableDates.map((date) {
                        final isSelected = date.day == selectedDate.day &&
                            date.month == selectedDate.month &&
                            date.year == selectedDate.year;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDate = date; // Update selected date
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                            padding: EdgeInsets.symmetric(
                              vertical: screenWidth * 0.02,
                              horizontal: screenWidth * 0.04,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.blue : Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '${date.day}/${date.month}',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.04,
                                    color: isSelected ? Colors.white : Colors.black,
                                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  getWeekday(date),
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.03,
                                    color: isSelected ? Colors.white : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: busTrips.length,
              itemBuilder: (context, index) {
                final trip = busTrips[index];
                return BusTripCard(trip: trip);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to get the weekday name
  String getWeekday(DateTime date) {
    switch (date.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }
}

class BusTripCard extends StatelessWidget {
  final Map<String, dynamic> trip;

  BusTripCard({required this.trip});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    return Card(
      elevation: 2,
      margin: EdgeInsets.all(screenWidth * 0.03),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Departure',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      trip['departure'],
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Arrival',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      trip['arrival'],
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var facility in trip['facilities']) ...[
                  getFacilityIcon(facility),
                  SizedBox(width: 8),
                ]
              ],
            ),
            SizedBox(height: 12),
            // Full-width button with icon above the text
            SizedBox(
              width: double.infinity, // Makes the button cover the full width
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BusBookingSelectPage()),
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 4),
                    Text(
                      'Book for ${trip['price']}',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to return the corresponding icon based on facility name
  Widget getFacilityIcon(String facility) {
    switch (facility) {
      case 'Wi-Fi':
        return Icon(Icons.wifi, color: Colors.black);
      case 'AC':
        return Icon(Icons.ac_unit, color: Colors.black);
      case 'Seats':
        return Icon(Icons.event_seat, color: Colors.black);
      case 'Snacks':
        return Icon(Icons.fastfood, color: Colors.black);
      case 'Charging':
        return Icon(Icons.power, color: Colors.black);
      case 'Blankets':
        return Icon(Icons.airline_seat_flat, color: Colors.black);
      default:
        return Icon(Icons.help_outline, color: Colors.black);
    }
  }
}
