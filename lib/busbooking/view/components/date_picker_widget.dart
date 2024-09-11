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
    return Table(
      columnWidths: const {
        0: FixedColumnWidth(150),
        1: FlexColumnWidth(),
      },
      border: TableBorder.all(color: Colors.grey,borderRadius: BorderRadius.circular(10)),
      children: [
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Date:',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            GestureDetector(
              onTap: () => _selectDate(context, false),
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.calendar_today, color: Colors.grey),
                    const SizedBox(width: 8),
                    Text(
                      _selectedDate == null
                          ? 'Select Date'
                          : DateFormat('yyyy-MM-dd').format(_selectedDate!),
                      style: TextStyle(fontSize: 16,fontStyle: Theme.of(context).textTheme.displaySmall?.fontStyle),
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
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Return Date:',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              GestureDetector(
                onTap: () => _selectDate(context, true),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text(
                        _returnDate == null
                            ? 'Select Return Date'
                            : DateFormat('yyyy-MM-dd').format(_returnDate!),
                        style: Theme.of(context).textTheme.bodyLarge,
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
