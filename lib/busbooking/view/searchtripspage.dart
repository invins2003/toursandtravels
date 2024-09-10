import 'package:flutter/material.dart';
import 'package:toursandtravels/busbooking/view/seatselectionpage.dart';

class SearchTripsPage extends StatelessWidget {
  final List<Map<String, String>> trips = [
    {
      'departure': '6:30',
      'arrival': '12:40',
      'price': '12.90',
      'amenities': 'WiFi, Recliner'
    },
    {
      'departure': '10:30',
      'arrival': '16:40',
      'price': '15.90',
      'amenities': 'WiFi, Meal'
    },
    {
      'departure': '16:20',
      'arrival': '22:30',
      'price': '11.50',
      'amenities': 'WiFi, Entertainment'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search for Trips'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: trips.length,
        itemBuilder: (context, index) {
          final trip = trips[index];
          return TripCard(
            departure: trip['departure']!,
            arrival: trip['arrival']!,
            price: trip['price']!,
            amenities: trip['amenities']!,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SeatSelectionPage()),
              );
            },
          );
        },
      ),
    );
  }
}

class TripCard extends StatelessWidget {
  final String departure;
  final String arrival;
  final String price;
  final String amenities;
  final VoidCallback onTap;

  TripCard({
    required this.departure,
    required this.arrival,
    required this.price,
    required this.amenities,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text('Departure: $departure, Arrival: $arrival'),
        subtitle: Text('Amenities: $amenities'),
        trailing: Text('\$$price per ticket'),
        onTap: onTap,
      ),
    );
  }
}
