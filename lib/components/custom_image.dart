import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  CustomImage(
    this.image, {
    this.width = 100,
    this.height = 100,
    this.bgColor,
    this.borderWidth = 0,
    this.borderColor,
    this.trBackground = false,
    this.fit = BoxFit.cover,
    this.isNetwork = true,
    this.radius = 50,
    this.isShadow = true,
  });

  final String image;
  final double width;
  final double height;
  final double borderWidth;
  final bool isShadow;
  final Color? borderColor;
  final Color? bgColor;
  final bool trBackground;
  final bool isNetwork;
  final double radius;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: bgColor ?? Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          if (isShadow)
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1), // changes position of shadow
            ),
        ],
      ),
      child: isNetwork
          ? CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, url) => const BlankImageWidget(),
              errorWidget: (context, url, error) {
                debugPrint('Image load failed: $error');
                return const BlankImageWidget();
              },
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  image: DecorationImage(image: imageProvider, fit: fit),
                ),
              ),
            )
          : _loadLocalImage(context),
    );
  }

  Widget _loadLocalImage(BuildContext context) {
    try {
      return Image.asset(
        image,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          debugPrint('Local image load failed: $error');
          return const BlankImageWidget();
        },
      );
    } catch (e) {
      debugPrint('Exception loading local image: $e');
      return const BlankImageWidget();
    }
  }
}

class BlankImageWidget extends StatelessWidget {
  const BlankImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Center(
        child: SizedBox(
          child: Card(
            color: Theme.of(context).colorScheme.surfaceVariant,
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias,
            elevation: 0.0,
            child: Icon(
              Icons.image,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
