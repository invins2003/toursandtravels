import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatefulWidget {
  final bool isRoundTrip;

  const DatePickerWidget({Key? key, required this.isRoundTrip}) : super(key: key);

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? _selectedDate;
  DateTime? _returnDate;

  Future<void> _selectDate(BuildContext context, bool isReturnDate) async {
    final DateTime initialDate = _selectedDate ?? DateTime.now();
    final DateTime firstDate = DateTime(2000);
    final DateTime lastDate = DateTime(2101);

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        if (isReturnDate) {
          _returnDate = pickedDate;
        } else {
          _selectedDate = pickedDate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height using MediaQuery
    final mediaQuery = MediaQuery.of(context).size;
    final screenWidth = mediaQuery.width;
    final screenHeight = mediaQuery.height;

    return Table(
      columnWidths: {
        // Adjust column widths based on screen width
        0: FixedColumnWidth(screenWidth * 0.4),
        1: FlexColumnWidth(),
      },
      border: TableBorder.all(color: Colors.grey, borderRadius: BorderRadius.circular(10)),
      children: [
        TableRow(
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
              child: Text(
                'Date:',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: screenWidth * 0.045), // Responsive font size
              ),
            ),
            GestureDetector(
              onTap: () => _selectDate(context, false),
              child: Container(
                padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
                child: Row(
                  children: [
                    Icon(Icons.calendar_today, color: Colors.grey, size: screenWidth * 0.06), // Responsive icon size
                    SizedBox(width: screenWidth * 0.02), // Responsive spacing
                    Text(
                      _selectedDate == null
                          ? 'Select Date'
                          : DateFormat('yyyy-MM-dd').format(_selectedDate!),
                      style: TextStyle(
                        fontSize: screenWidth * 0.03, // Responsive font size
                        fontStyle: Theme.of(context).textTheme.displaySmall?.fontStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        if (widget.isRoundTrip) ...[
          TableRow(
            children: [
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
                child: Text(
                  'Return Date:',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: screenWidth * 0.045), // Responsive font size
                ),
              ),
              GestureDetector(
                onTap: () => _selectDate(context, true),
                child: Container(
                  padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.grey, size: screenWidth * 0.06), // Responsive icon size
                      SizedBox(width: screenWidth * 0.02), // Responsive spacing
                      Text(
                        _returnDate == null
                            ? 'Select Return Date'
                            : DateFormat('yyyy-MM-dd').format(_returnDate!),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: screenWidth * 0.03), // Responsive font size
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
