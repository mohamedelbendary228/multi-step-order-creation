import 'package:baridx_order_creation/core/widgets/app_headr.dart';
import 'package:baridx_order_creation/features/order_steps_flow/domain/usecase/create_order_usecase.dart';
import 'package:baridx_order_creation/features/order_steps_flow/presentation/cubit/order_steps_cubit.dart';
import 'package:baridx_order_creation/features/order_steps_flow/presentation/widgets/order_summary_body.dart';
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
          BlocConsumer<OrderStepsCubit, OrderStepsState>(
            listener: (context, state) {
              if (state is CreateOrderLoaded) {
                context.go(Routes.success);
              }
            },
            builder: (context, state) {
              if (state is OrderInfoLoaded) {
                final order = state.order;
                return OrderSummaryBody(
                  order: order,
                  onCheckout: () async {
                    final params = OrderParams(
                      customerName: order.customerName ?? "",
                      phoneNumber: order.phoneNumber ?? "",
                      address: order.address ?? "",
                      packageType: order.packageType ?? "",
                      weight: order.weight ?? "",
                      paymentMethod: order.paymentMethod ?? "",
                      cardNumber: order.cardNumber,
                      notes: order.notes,
                    );
                    context.read<OrderStepsCubit>().createOrder(params);
                  },
                );
              } else if (state is CreateOrderLoading) {
                return OrderSummaryBody(
                  isLoading: true,
                  order: context.read<OrderStepsCubit>().order,
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
