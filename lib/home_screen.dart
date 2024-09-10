import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:toursandtravels/components/category.dart';
import 'package:toursandtravels/components/notificationbox.dart';
import 'package:toursandtravels/components/popular.dart';
import 'package:toursandtravels/models/temp_data.dart';
import 'package:toursandtravels/utils/constant/colors.dart';
import 'package:toursandtravels/utils/device/device_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    final screenWidth = DeviceUtil.screenWidth(context);
    final screenHeight = DeviceUtil.screenHeight(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            snap: true,
            floating: true,
            title: getAppBar(context),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                buildBody(screenWidth, screenHeight),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi, Ambit Misra",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,),
                ),
                const SizedBox(height: 3),
                
              ],
            ),
          ),
          NotificationBox(
            notifiedNumber: 1,
            onTap: () {
              // Handle notification box tap
            },
          ),
        ],
      ),
    );
  }

  Widget buildBody(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.only(
        top: 0,
        bottom: screenHeight * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              screenWidth * 0.04,
              0,
              screenWidth * 0.04,
              0,
            ),
            child: Text(
              "Let's Explore",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),),
          SizedBox(height: screenHeight * 0.03),
          getCategories(screenWidth),
          SizedBox(height: screenHeight * 0.03),
          Padding(
            padding: EdgeInsets.fromLTRB(
              screenWidth * 0.04,
              0,
              screenWidth * 0.04,
              screenHeight * 0.03,
            ),
            child: Text(
              "Most Popular",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          getPopulars(screenWidth, screenHeight),
          SizedBox(height: screenHeight * 0.03),
        ],
      ),
    );
  }

  Widget getCategories(double screenWidth) {
    if (categories.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Text(
          "No categories available.",
          style: TextStyle(color: Colors.red, fontSize: 16),
        ),
      );
    }

    List<Widget> categoryWidgets = List.generate(
      categories.length,
      (index) => CategoryItem(
        data: categories[index],
        color: listColors[index % listColors.length],
        onTap: () {
          // Handle category tap
        },
      ),
    );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(
        bottom: screenWidth * 0.01,
        left: screenWidth * 0.04,
        right: screenWidth * 0.02,
      ),
      child: Row(children: categoryWidgets),
    );
  }

  Widget getPopulars(double screenWidth, double screenHeight) {
    if (populars.isEmpty) {
      return Center(
        child: Text(
          "No popular items available.",
          style: TextStyle(color: Colors.red, fontSize: 16),
        ),
      );
    }

    return CarouselSlider(
      options: CarouselOptions(
        height: screenHeight * 0.5, // Dynamically set height based on screen height
        enlargeCenterPage: true,
        autoPlay: true, // Automatically play the carousel
        autoPlayInterval: Duration(seconds: 3), // Duration between automatic slides
        viewportFraction: 0.75,
        aspectRatio: 16/9,
        initialPage: 0,
        disableCenter: true,
      ),
      items: populars.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return PopularItem(
              data: item,
              onTap: () {
                // Handle popular item tap
              },
            );
          },
        );
      }).toList(),
    );
  }
}
