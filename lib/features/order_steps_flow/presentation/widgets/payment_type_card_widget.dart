import 'package:baridx_order_creation/core/constants/dimensions.dart';
import 'package:baridx_order_creation/core/enums/payment_mehtod_type.dart';
import 'package:baridx_order_creation/core/resources/app_colors.dart';
import 'package:baridx_order_creation/core/widgets/app_deafult_text.dart';
import 'package:flutter/material.dart';

class PaymentTypeCardWidget extends StatelessWidget {
  final PaymentMethodType type;
  final String title;
  final String assets;
  final bool selected;
  final ValueChanged<PaymentMethodType>? onSelectPaymentMethod;
  const PaymentTypeCardWidget({
    super.key,
    required this.type,
    required this.title,
    required this.assets,
    this.onSelectPaymentMethod,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => onSelectPaymentMethod?.call(type),
      child: Container(
        alignment: Alignment.center,
        width: size.width,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          border: Border.all(
            color: selected ? AppColors.primaryColor : AppColors.naturalDarkGray,
          ),
          borderRadius: BorderRadius.circular(Dimensions.radius5Px),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Radio(
                    value: true,
                    groupValue: selected,
                    activeColor: AppColors.primaryColor,
                    onChanged: (value) {},
                  ),
                  AppDefaultText(
                    title,
                    color: AppColors.blackColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            Image.asset(
              assets,
              height: 35,
            ),
          ],
        ),
      ),
    );
  }
}
