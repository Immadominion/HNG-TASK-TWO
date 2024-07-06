import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnt_task_2/core/constants/enum.dart';
import 'package:hnt_task_2/data/controllers/products_controller.dart';
import 'package:hnt_task_2/presentation/widgets/home/home_description.dart';
import 'package:intl/intl.dart';
import '../widgets/home/card_widget.dart';

// Method to get formatted created date string
String formattedCreatedAt(String dateString) {
  try {
    // Parse the date string
    DateTime parsedDate = DateFormat("yyyy-MM-ddTHH:mm:ss").parse(dateString);

    // Format the date
    return DateFormat("dd MMM, yyyy hh:mm:ss a").format(parsedDate);
  } catch (e) {
    // Handle any parsing errors
    return '';
  }
}

String formatBalance(String balance, {bool noShowNaira = false}) {
  // Convert the balance string to a double
  final balanceValue = double.tryParse(balance);

  if (balanceValue != null) {
    // Create a NumberFormat instance with the desired formatting
    final formatter = NumberFormat.currency(
      symbol: !noShowNaira
          ? '₦'
          : '', // Set the currency symbol if needed (e.g., '$')
      decimalDigits: 2, // Set the number of decimal places
    );

    // Format the balance value
    final formattedBalance = formatter.format(balanceValue);

    return formattedBalance;
  }

  // Return the original balance string if it couldn't be parsed as a double
  return balance;
}

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => ref.read(allProductsController.notifier).toGetAllProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: false,
        title: const Text(
          'Shoppo',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final productState = ref.watch(allProductsController);
          final products = productState.product.items ?? [];

          if (productState.loadingState == LoadingState.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (products.isEmpty) {
            return const Center(child: Text('No products available.'));
          }

          return GridView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 230,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: ((context, index) {
              final product = products[index];
              final photoUrl =
                  (product.photos != null && product.photos!.isNotEmpty)
                      ? product.photos!.first.url
                      : "";

              final priceList = product.currentPrice?.first.price?["NGN"] ?? [];
              final priceString =
                  priceList.isNotEmpty ? priceList.first.toString() : "Free";

              return CardWidget(
                title: product.name ?? "",
                subtitle: formatBalance(priceString),
                imageUrl: photoUrl ?? "",
                route: HomeDescription(
                  product: product,
                ),
                context: context,
                saveUp: () {},
              );
            }),
          );
        },
      ),
    );
  }
}
