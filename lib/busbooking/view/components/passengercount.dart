import 'package:flutter/material.dart';

class PassengerCounter extends StatefulWidget {
  @override
  _PassengerCounterState createState() => _PassengerCounterState();
}

class _PassengerCounterState extends State<PassengerCounter> {
  int _passengerCount = 1;

  void _incrementPassenger() {
    setState(() {
      _passengerCount++;
    });
  }

  void _decrementPassenger() {
    if (_passengerCount > 1) {
      setState(() {
        _passengerCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Passengers', style: Theme.of(context).textTheme.displayLarge),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(20), // Curved border
          ),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: _passengerCount > 1 ? _decrementPassenger : null, // Disable if count is 1
                splashRadius: 20,
                padding: EdgeInsets.zero,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  '$_passengerCount',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: _incrementPassenger,
                splashRadius: 20,
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
