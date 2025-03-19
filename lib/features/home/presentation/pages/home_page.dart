import 'package:baridx_order_creation/core/entities/order.dart';
import 'package:baridx_order_creation/core/resources/app_colors.dart';
import 'package:baridx_order_creation/core/widgets/app_deafult_text.dart';
import 'package:baridx_order_creation/core/widgets/app_headr.dart';
import 'package:baridx_order_creation/features/home/presentation/cubit/home_cubit.dart';
import 'package:baridx_order_creation/features/home/presentation/widgets/order_card_widget.dart';
import 'package:baridx_order_creation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeCubit>().getOrders();
    super.initState();
  }

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
      body: Column(
        children: [
          const AppHeader(text: "Orders"),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoaded) {
                //* initialize orders list with reversed order to view the latest created orders first
                final List<OrderEntity> orders = state.orders.reversed.toList();
                return orders.isNotEmpty
                    ? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: orders.length,
                            itemBuilder: (context, index) {
                              return OrderCardWidget(
                                orderId: orders[index].id ?? "",
                                createdDate: orders[index].createdDate ?? "",
                                address: orders[index].address ?? "",
                                paymentMethod: orders[index].paymentMethod ?? "",
                                packageType: orders[index].packageType ?? "",
                                weight: orders[index].weight ?? "",
                              );
                            },
                          ),
                        ),
                      )
                    : const Expanded(
                        child: Center(
                          child: AppDefaultText(
                            "You haven't any orders yet",
                            fontWeight: FontWeight.w600,
                            color: AppColors.naturalDarkGray,
                          ),
                        ),
                      );
              } else if (state is HomeLoading) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  ),
                );
              } else if (state is HomeFailure) {
                return Expanded(
                  child: Center(
                    child: AppDefaultText(
                      state.message,
                      fontWeight: FontWeight.w600,
                      color: AppColors.naturalDarkGray,
                    ),
                  ),
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
