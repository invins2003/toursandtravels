import 'package:flutter/material.dart';
import 'package:toursandtravels/utils/device/device_utils.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPage();
}

class _BookingPage extends State<BookingPage> {
  bool tripType = false; // One Way or Round Trip selection (false = One Way)
  int _counter = 1; // Initialize passengers count
  final TextEditingController _fromTec = TextEditingController();
  final TextEditingController _toTec = TextEditingController();

  DateTime? departureDate;
  DateTime? returnDate;

  @override
  Widget build(BuildContext context) {
    bool isTablet = DeviceUtil.isTablet(context);
    double screenWidth = DeviceUtil.screenWidth(context);
    double fontSizeTitle = isTablet ? 32 : 24;
    double fontSizeSubtitle = isTablet ? 28 : 20;
    double buttonHeight = isTablet ? 70 : 58;
    double margin = isTablet ? 32 : 16;
    double locationInputHeight = isTablet ? 160 : 120; // Adjusted height

    return Scaffold(
      appBar: AppBar(
        title: Text("Booking"),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(margin, 64, margin, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Book tickets for your",
              style: TextStyle(fontSize: fontSizeTitle),
            ),
            const SizedBox(height: 8),
            Text(
              "next trip",
              style: TextStyle(fontSize: fontSizeSubtitle, fontWeight: FontWeight.bold),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                height: buttonHeight,
                width: screenWidth - (isTablet ? 320 : 160),
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
                            tripType = false; // One Way selected
                          });
                        },
                        child: !tripType
                            ? Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                child: const Center(
                                  child: Text(
                                    "One Way",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            : const Center(
                                child: Text(
                                  "One Way",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            tripType = true; // Round Trip selected
                          });
                        },
                        child: tripType
                            ? Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Round Trip",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            : const Center(
                                child: Text(
                                  "Round Trip",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      top: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildLocationInput("From", _fromTec),
                          buildLocationInput("To", _toTec),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 16,
                      bottom: 16,
                      top: 16,
                      child: GestureDetector(
                        onTap: () {
                          final tmpText = _fromTec.text;
                          _fromTec.text = _toTec.text;
                          _toTec.text = tmpText;
                          setState(() {});
                        },
                        child: const Center(
                          child: CircleAvatar(
                            radius: 32,
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            child: Icon(Icons.sync),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: buildDateInput("Date", departureDate, context),
                  ),
                  const SizedBox(width: 16),
                  if (tripType)
                    Expanded(
                      child: buildDateInput("Returning", returnDate, context),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: buildPassengerInput(),
            ),
            const Text(
              "Do you have a promocode?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 32),
            GestureDetector(
              onTap: () {
                // Navigate to the details page (assuming "/detail" is configured in your routing)
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(48),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.search, color: Colors.white),
                    SizedBox(width: 12),
                    Text(
                      "Search for Trips",
                      style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
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

  Widget buildLocationInput(String label, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          const SizedBox(width: 14),
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDateInput(String label, DateTime? date, BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime(2030),
        );
        if (pickedDate != null) {
          setState(() {
            if (label == "Date") {
              departureDate = pickedDate;
            } else {
              returnDate = pickedDate;
            }
          });
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            date == null ? "Select $label" : "${date.toLocal()}".split(' ')[0],
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget buildPassengerInput() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (_counter > 1) {
              setState(() {
                _counter--;
              });
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(32),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: const Icon(Icons.remove, color: Colors.white),
          ),
        ),
        const SizedBox(width: 16),
        Text("$_counter Passengers", style: const TextStyle(fontSize: 24)),
        const SizedBox(width: 16),
        GestureDetector(
          onTap: () {
            setState(() {
              _counter++;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(32),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
