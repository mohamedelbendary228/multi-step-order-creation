import 'package:baridx_order_creation/core/constants/dimensions.dart';
import 'package:baridx_order_creation/core/enums/payment_mehtod_type.dart';
import 'package:baridx_order_creation/core/resources/app_assets.dart';
import 'package:baridx_order_creation/core/widgets/app_headr.dart';
import 'package:baridx_order_creation/core/widgets/main_button.dart';
import 'package:baridx_order_creation/features/order_steps_flow/presentation/widgets/payment_type_card_widget.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  PaymentMethodType _selectedPaymentType = PaymentMethodType.cashOnDelivery;

  void onSelectPaymentMethod(PaymentMethodType type) {
    setState(() {
      _selectedPaymentType = type;
    });
    print("_selectedPaymentType callled $_selectedPaymentType");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppHeader(
            text: "Payment Method",
            hasBackButton: true,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  PaymentTypeCardWidget(
                    type: PaymentMethodType.cashOnDelivery,
                    title: "Cash on Delivery",
                    assets: AppAssets.cashOnDelivery,
                    onSelectPaymentMethod: onSelectPaymentMethod,
                    selected:
                        _selectedPaymentType == PaymentMethodType.cashOnDelivery ? true : false,
                  ),
                  const SizedBox(height: Dimensions.padding20Px),
                  PaymentTypeCardWidget(
                    type: PaymentMethodType.creditCard,
                    title: "Credit Card",
                    assets: AppAssets.card,
                    onSelectPaymentMethod: onSelectPaymentMethod,
                    selected: _selectedPaymentType == PaymentMethodType.creditCard ? true : false,
                  ),
                  const SizedBox(height: Dimensions.padding20Px),
                  PaymentTypeCardWidget(
                    type: PaymentMethodType.payLater,
                    title: "Pay Later",
                    assets: AppAssets.payLater,
                    onSelectPaymentMethod: onSelectPaymentMethod,
                    selected: _selectedPaymentType == PaymentMethodType.payLater ? true : false,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: Dimensions.padding20Px),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: MainButton(
              text: "Next",
              onTap: () {},
            ),
          ),
          const SizedBox(height: Dimensions.padding35Px),
        ],
      ),
    );
  }
}
