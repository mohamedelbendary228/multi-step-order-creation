import 'package:baridx_order_creation/core/constants/dimensions.dart';
import 'package:baridx_order_creation/core/widgets/app_headr.dart';
import 'package:baridx_order_creation/core/widgets/main_button.dart';
import 'package:baridx_order_creation/features/order_steps_flow/presentation/cubit/order_steps_cubit.dart';
import 'package:baridx_order_creation/features/order_steps_flow/presentation/widgets/review_item.dart';
import 'package:baridx_order_creation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ReviewOrderPage extends StatelessWidget {
  const ReviewOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppHeader(
            text: "Review Order",
            hasBackButton: true,
          ),
          BlocBuilder<OrderStepsCubit, OrderStepsState>(
            builder: (context, state) {
              if (state is OrderInfoLoaded) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: Dimensions.padding15Px),
                          ReviewItem(title: "Name", value: state.order.customerName ?? ""),
                          ReviewItem(title: "Phone Number", value: state.order.phoneNumber ?? ""),
                          ReviewItem(title: "Address", value: state.order.address ?? ""),
                          ReviewItem(title: "Package Type", value: state.order.packageType ?? ""),
                          ReviewItem(title: "Weight", value: "${state.order.weight} KG"),
                          if (state.order.notes != null)
                            ReviewItem(title: "Notes", value: state.order.notes!),
                          ReviewItem(
                            title: "Payment Method",
                            value: state.order.paymentMethod ?? "",
                            isLast: state.order.cardNumber != null ? false : true,
                          ),
                          if (state.order.cardNumber != null)
                            ReviewItem(
                              title: "Card Number",
                              value: state.order.cardNumber!,
                              isLast: true,
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: MainButton(
              text: "Checkout",
              onTap: () async {
                context.go(Routes.success);
              },
            ),
          ),
          const SizedBox(height: Dimensions.padding35Px),
        ],
      ),
    );
  }
}
