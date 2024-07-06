import 'package:flutter/material.dart';

class HomeImageViewer extends StatelessWidget {
  final String imageUrl;

  const HomeImageViewer({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: 300,
        decoration: const BoxDecoration(
          color: Color(0xff5C71F3),
        ),
        alignment: Alignment.center,
        child: Image.network(
          imageUrl,
          fit: BoxFit.fitHeight,
          width: double.maxFinite,
          height: 300,
          loadingBuilder: (
            BuildContext context,
            Widget child,
            ImageChunkEvent? loadingProgress,
          ) {
            if (loadingProgress == null) {
              return child;
            } else {
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          (loadingProgress.expectedTotalBytes ?? 1)
                      : null,
                ),
              );
            }
          },
          errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) {
            return const Center(
              child: Icon(
                Icons.error,
                color: Colors.red,
              ),
            );
          },
        ));
  }
}
