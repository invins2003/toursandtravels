import 'package:flutter/material.dart';
import 'package:toursandtravels/busbooking/view/bookingpage.dart';
import 'package:toursandtravels/home_screen.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  _NavigationMenuState createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _selectedIndex = 2;  // Default selected index
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    // Initialize the PageController with the selected index as the initial page
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    // Dispose of the PageController to free up resources
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental),
            label: 'Car',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bus_alert),
            label: 'Bus',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children:  [
          Center(child: Text('Explore Page')),// Home page
          Center(child: Text('Car Page')),
           HomePage(),
          BookingPage(),
           Center(child: Text('Settings Page')),
        ],
      ),
    );
  }
}
