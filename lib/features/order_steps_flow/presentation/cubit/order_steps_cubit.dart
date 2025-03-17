import 'package:baridx_order_creation/features/order_steps_flow/domain/entities/order.dart';
import 'package:baridx_order_creation/features/order_steps_flow/domain/usecase/create_order_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'order_steps_state.dart';

class OrderStepsCubit extends Cubit<OrderStepsState> {
  final CreateOrderUseCase _createOrderUseCase;
  OrderStepsCubit(CreateOrderUseCase createOrderUseCase)
      : _createOrderUseCase = createOrderUseCase,
        super(OrderStepsInitial());

  Future<void> saveCustomerInfo({
    required String name,
    required String phoneNumber,
    required String address,
  }) async {
    emit(CustomerInfoLoading());
    await Future.delayed(const Duration(seconds: 2));
    emit(
      CustomerInfoLoaded(
        name: name,
        phoneNumber: phoneNumber,
        address: address,
      ),
    );
  }

  void createOrder(OrderParams params) async {
    emit(CreateOrderLoading());
    final result = await _createOrderUseCase(params);
    result.fold(
      (failure) => emit(CreateOrderFailure(message: failure.message)),
      (order) => emit(CreateOrderLoaded(order: order)),
    );
  }

  @override
  void onChange(Change<OrderStepsState> change) {
    super.onChange(change);
    print("OrderStepsCubit $change");
  }
}
