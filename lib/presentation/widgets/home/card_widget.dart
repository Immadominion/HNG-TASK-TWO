import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../my_fade_route.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final Widget route;
  final BuildContext context;
  final Function()? saveUp;

  const CardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.route,
    required this.context,
    this.saveUp,
  });

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        Navigator.of(context).push(MyFadeRoute(route: route));
        if (saveUp != null) {
          saveUp!();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 50),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: w / 2.6,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              alignment: Alignment.center,
              child: CachedNetworkImage(
                imageUrl: "https://api.timbu.cloud/images/$imageUrl",
                fit: BoxFit.contain,
                width: double.maxFinite,
                height: w / 2.6,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
              ),
            ),
            Container(
              height: w / 6,
              width: w / 2.36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                // color: Theme.of(context).colorScheme.primaryContainer,
              ),
              padding: EdgeInsets.symmetric(horizontal: w / 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    textScaler: const TextScaler.linear(1.4),
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black.withOpacity(.8),
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Montesserat",
                    ),
                  ),
                  Text(
                    subtitle,
                    textScaler: const TextScaler.linear(1.4),
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 8,
                      fontFamily: "Montesserat",
                      color: Colors.black.withOpacity(.7),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
