import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PopularItem extends StatefulWidget {
  final Map<String, dynamic> data;
  final double radius;
  final GestureTapCallback? onTap;

  PopularItem({Key? key, required this.data, this.onTap, this.radius = 20}) : super(key: key);

  @override
  _PopularItemState createState() => _PopularItemState();
}

class _PopularItemState extends State<PopularItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to get the screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
        }
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      child: Container(
        width: screenWidth * 0.5, // Set width as a percentage of screen width
        height: screenHeight * 0.45, // Set height as a percentage of screen height
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        child: Stack(
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(widget.radius),
                child: CachedNetworkImage(
                  imageUrl: widget.data["image"],
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Center(
                    child: Icon(
                      Icons.broken_image,
                      color: Colors.grey,
                      size: screenWidth * 0.12, // Adjust size based on screen width
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.radius),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(.5),
                    Colors.white.withOpacity(.01),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: screenHeight * 0.03, // Adjust position based on screen height
              left: screenWidth * 0.03, // Adjust position based on screen width
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data["name"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.045, // Adjust font size based on screen width
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01), // Adjust spacing based on screen height
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/marker.svg",
                        width: screenWidth * 0.04, // Adjust size based on screen width
                        height: screenWidth * 0.04, // Adjust size based on screen width
                        color: Colors.white,
                      ),
                      SizedBox(width: screenWidth * 0.02), // Adjust spacing based on screen width
                      Text(
                        widget.data["location"],
                        style: TextStyle(
                          fontSize: screenWidth * 0.035, // Adjust font size based on screen width
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: screenHeight * 0.03, // Adjust position based on screen height
              right: screenWidth * 0.03, // Adjust position based on screen width
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.white,
                size: screenWidth * 0.07, // Adjust size based on screen width
              ),
            ),
          ],
        ),
      ),
    );
  }
}
