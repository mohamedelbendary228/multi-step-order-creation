import 'package:baridx_order_creation/core/resources/app_colors.dart';
import 'package:baridx_order_creation/core/widgets/app_deafult_text.dart';
import 'package:flutter/material.dart';

class OrderCardWidget extends StatelessWidget {
  final String customerName;
  final String address;
  final String paymentMethod;
  const OrderCardWidget({
    super.key,
    required this.customerName,
    required this.address,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppDefaultText(
            "Mohamed Elbendary",
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 5),
          AppDefaultText(
            "Itay Elbaroud, Elbehira, Gamal Abd El naser street Itay Elbaroud, Elbehira, Gamal Abd El naser street",
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: AppColors.naturalDarkGray,
            height: 1.2,
          ),
          SizedBox(height: 5),
          AppDefaultText(
            "Cash on Delivery",
            fontSize: 8,
            fontWeight: FontWeight.w500,
            color: AppColors.naturalDarkGray,
          ),
        ],
      ),
    );
  }
}
