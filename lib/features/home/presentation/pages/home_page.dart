import 'package:baridx_order_creation/core/resources/app_colors.dart';
import 'package:baridx_order_creation/core/widgets/app_headr.dart';
import 'package:baridx_order_creation/features/home/presentation/widgets/order_card_widget.dart';
import 'package:baridx_order_creation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(Routes.customerInfo);
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: AppColors.primaryColor,
        ),
      ),
      body: const Column(
        children: [
          const AppHeader(text: "Orders"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  OrderCardWidget(
                    customerName: 'Mohamed Elbendary',
                    address: 'Itay Elbaroud, Elbehira, Gamal Abd El naser street',
                    paymentMethod: "Cash on Delivery",
                  ),
                  // Center(
                  //   child: AppDefaultText(
                  //     "You haven't any orders yet",
                  //     fontWeight: FontWeight.w600,
                  //     color: AppColors.naturalDarkGray,
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
