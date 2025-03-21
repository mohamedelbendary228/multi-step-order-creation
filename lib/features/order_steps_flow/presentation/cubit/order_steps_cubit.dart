import 'package:baridx_order_creation/core/models/order_model.dart';
import 'package:baridx_order_creation/core/entities/order.dart';
import 'package:baridx_order_creation/features/order_steps_flow/domain/usecase/create_order_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'order_steps_state.dart';

class OrderStepsCubit extends Cubit<OrderStepsState> {
  final CreateOrderUseCase _createOrderUseCase;
  OrderStepsCubit(CreateOrderUseCase createOrderUseCase)
      : _createOrderUseCase = createOrderUseCase,
        super(OrderStepsInitial());

  /// Initialize object of order model to update the state of every step using [copyWith] method
  /// by this we can update the state of the order model without losing the data.
  /// And view it in review page
  OrderModel order = OrderModel();

  Future<void> saveCustomerInfo({
    required String name,
    required String phoneNumber,
    required String address,
  }) async {
    emit(OrderInfoLoading());
    order = order.copyWith(
      customerName: name,
      phoneNumber: phoneNumber,
      address: address,
    );
    emit(OrderInfoLoaded(order: order));
  }

  Future<void> savePackageDetails({
    required String packageType,
    required String weight,
    String? notes,
  }) async {
    emit(OrderInfoLoading());
    order = order.copyWith(
      packageType: packageType,
      weight: weight,
      notes: notes,
    );
    emit(OrderInfoLoaded(order: order));
  }

  Future<void> savePaymentMethodDetails({
    required String paymentMethod,
    String? cardNumber,
  }) async {
    emit(OrderInfoLoading());
    order = order.copyWith(
      paymentMethod: paymentMethod,
      cardNumber: cardNumber,
    );
    emit(OrderInfoLoaded(order: order));
  }

  /// use this method when tap on checkout button
  /// in [ReviewOrderPage]
  void createOrder(OrderParams params) async {
    emit(CreateOrderLoading());
    final result = await _createOrderUseCase(params);
    result.fold(
      (failure) => emit(CreateOrderFailure(message: failure.message)),
      (order) => emit(CreateOrderLoaded(order: order)),
    );
  }

  /// reset the order model after creating an order
  void resetData() {
    order = OrderModel();
  }
}
