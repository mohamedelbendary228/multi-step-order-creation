import 'package:baridx_order_creation/core/resources/app_colors.dart';
import 'package:baridx_order_creation/core/widgets/app_deafult_text.dart';
import 'package:flutter/material.dart';

class OrderCardWidget extends StatelessWidget {
  final String orderId;
  final String customerName;
  final String address;
  final String paymentMethod;
  const OrderCardWidget({
    super.key,
    required this.customerName,
    required this.address,
    required this.paymentMethod,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        border: Border.all(color: AppColors.naturalGray),
        boxShadow: const [
          BoxShadow(
            color: AppColors.naturalGray,
            blurRadius: 3.0,
            spreadRadius: 2.0,
            offset: Offset(-1, 0),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppDefaultText(
            "# $orderId",
            fontSize: 12,
            fontWeight: FontWeight.w600,
            height: 1.2,
            color: AppColors.primaryColor,
          ),
          AppDefaultText(
            customerName,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 5),
          AppDefaultText(
            address,
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: AppColors.naturalDarkGray,
            height: 1.2,
          ),
          const SizedBox(height: 5),
          AppDefaultText(
            paymentMethod,
            fontSize: 8,
            fontWeight: FontWeight.w500,
            color: AppColors.naturalDarkGray,
          ),
        ],
      ),
    );
  }
}
