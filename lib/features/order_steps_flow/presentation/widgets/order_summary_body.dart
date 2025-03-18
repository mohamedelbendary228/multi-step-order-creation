import 'package:baridx_order_creation/core/constants/dimensions.dart';
import 'package:baridx_order_creation/core/widgets/main_button.dart';
import 'package:baridx_order_creation/core/entities/order.dart';
import 'package:baridx_order_creation/features/order_steps_flow/presentation/widgets/review_item.dart';
import 'package:flutter/material.dart';

class OrderSummaryBody extends StatelessWidget {
  final OrderEntity order;
  final VoidCallback? onCheckout;
  final bool isLoading;
  const OrderSummaryBody({super.key, required this.order, this.onCheckout, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: Dimensions.padding15Px),
                    ReviewItem(title: "Name", value: order.customerName ?? ""),
                    ReviewItem(title: "Phone Number", value: order.phoneNumber ?? ""),
                    ReviewItem(title: "Address", value: order.address ?? ""),
                    ReviewItem(title: "Package Type", value: order.packageType ?? ""),
                    ReviewItem(title: "Weight", value: "${order.weight} KG"),
                    if (order.notes != null) ReviewItem(title: "Notes", value: order.notes!),
                    ReviewItem(
                      title: "Payment Method",
                      value: order.paymentMethod ?? "",
                      isLast: order.cardNumber != null ? false : true,
                    ),
                    if (order.cardNumber != null)
                      ReviewItem(
                        title: "Card Number",
                        value: order.cardNumber!,
                        isLast: true,
                      ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: MainButton(
              loadingWidget: isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : null,
              text: "Checkout",
              onTap: onCheckout,
            ),
          ),
          const SizedBox(height: Dimensions.padding35Px),
        ],
      ),
    );
  }
}
