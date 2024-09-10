import 'package:badges/badges.dart' as badges; // Import the badges package
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationBox extends StatelessWidget {
  NotificationBox({Key? key, this.onTap, this.notifiedNumber = 0}) : super(key: key);
  final GestureTapCallback? onTap;
  final int notifiedNumber;

  @override
  Widget build(BuildContext context) {
    // Get theme-based colors
    final Color badgeColor =Colors.red;
    final Color iconColor = Theme.of(context).iconTheme.color ?? Theme.of(context).colorScheme.onSurface;
    final Color containerColor = Theme.of(context).appBarTheme.backgroundColor ?? Theme.of(context).colorScheme.surface;
    final Color borderColor = Theme.of(context).dividerColor.withOpacity(0.3);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: containerColor,
          border: Border.all(color: borderColor),
        ),
        child: notifiedNumber > 0
            ? badges.Badge(  // Use `badges.Badge` instead of just `Badge`
                badgeStyle: badges.BadgeStyle(
                  badgeColor: badgeColor,
                  padding: const EdgeInsets.all(3),
                ),
                position: badges.BadgePosition.topEnd(top: -7, end: 2),
                badgeContent: Text(
                  notifiedNumber.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                child: SvgPicture.asset(
                  "assets/icons/bell.svg",
                  width: 25,
                  height: 25,
                  color: iconColor, // Apply theme-based icon color
                ),
              )
            : SvgPicture.asset(
                "assets/icons/bell.svg",
                width: 25,
                height: 25,
                color: iconColor, // Apply theme-based icon color
              ),
      ),
    );
  }
}
