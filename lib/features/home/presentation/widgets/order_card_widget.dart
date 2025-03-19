import 'package:baridx_order_creation/core/resources/app_colors.dart';
import 'package:baridx_order_creation/core/widgets/app_deafult_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderCardWidget extends StatelessWidget {
  final String orderId;
  final String address;
  final String paymentMethod;
  final String createdDate;
  final String packageType;
  final String weight;
  const OrderCardWidget({
    super.key,
    required this.address,
    required this.paymentMethod,
    required this.orderId,
    required this.createdDate,
    required this.packageType,
    required this.weight,
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
          const SizedBox(width: 10),
          AppDefaultText(
            "Order# $orderId",
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.naturalDarkGray,
          ),
          AppDefaultText(
            DateFormat('yMMMEd').format(DateTime.parse(createdDate)),
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: AppColors.darkGray,
            height: 1.1,
          ),
          const SizedBox(height: 10),
          AppDefaultText(
            address,
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: AppColors.darkGray,
            height: 1.2,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppDefaultText(
                "$packageType, $weight Kg",
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor,
              ),
              AppDefaultText(
                paymentMethod,
                fontSize: 8,
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
