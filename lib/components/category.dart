import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({
    Key? key,
    required this.data,
    this.onTap,
    this.color,
  }) : super(key: key);

  final Map<String, dynamic> data;
  final Color? color;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    // Use the color from the theme if no color is passed
    final themeColor = color ?? Theme.of(context).colorScheme.primary;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(right: 10),
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary, // Using surface color from theme
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.2),
              spreadRadius: 0.5,
              blurRadius: 0.5,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: themeColor.withOpacity(0.2),
              ),
              child: Icon(
                data["icon"],
                size: 25,
                color: themeColor,
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: Text(
                data["name"],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 13,
                      color: Theme.of(context).colorScheme.onSurface, // Adjust text color based on theme
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
