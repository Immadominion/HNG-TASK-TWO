import 'package:flutter/material.dart';

import '../../../data/ model/product_model.dart';
import '../../screens/home.dart';
import 'home_image.dart';

class HomeDescription extends StatelessWidget {
  final Items product;
  const HomeDescription({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final photoUrl = (product.photos != null && product.photos!.isNotEmpty)
        ? product.photos!.first.url
        : "";

    final priceList = product.currentPrice?.first.price?["NGN"] ?? [];
    final priceString =
        priceList.isNotEmpty ? priceList.first.toString() : "Free";

    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          product.name ?? "Loading",
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeImageViewer(
            imageUrl: "https://api.timbu.cloud/images/$photoUrl",
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              // color: Theme.of(context).colorScheme.primaryContainer,
            ),
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            padding: EdgeInsets.symmetric(horizontal: w / 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name ?? "",
                  textScaler: const TextScaler.linear(1.4),
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montesserat",
                  ),
                ),
                Text(
                  formatBalance(priceString),
                  textScaler: const TextScaler.linear(1.4),
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    fontFamily: "Montesserat",
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                Text(
                  "Created on ${formattedCreatedAt(product.dateCreated ?? "")}",
                  textScaler: const TextScaler.linear(1.4),
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 9,
                    fontFamily: "Montesserat",
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                Text(
                  product.description ?? "No description",
                  textScaler: const TextScaler.linear(1.4),
                  maxLines: 10,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                    fontFamily: "Montesserat",
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
