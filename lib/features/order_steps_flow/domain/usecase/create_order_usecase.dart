import 'package:baridx_order_creation/core/error/failure.dart';
import 'package:baridx_order_creation/core/usecase/usecase.dart';
import 'package:baridx_order_creation/features/order_steps_flow/data/models/order_model.dart';
import 'package:baridx_order_creation/features/order_steps_flow/domain/entities/order.dart';
import 'package:baridx_order_creation/features/order_steps_flow/domain/repository/order_steps_repository.dart';
import 'package:dartz/dartz.dart';

class CreateOrderUseCase implements UseCase<OrderEntity, OrderParams> {
  final OrderStepsRepository orderStepsRepository;

  CreateOrderUseCase({required this.orderStepsRepository});

  @override
  Future<Either<Failure, OrderEntity>> call(OrderParams params) async {
    return await orderStepsRepository.createOrder(
      OrderModel(
        customerName: params.customerName,
        phoneNumber: params.phoneNumber,
        address: params.address,
        packageType: params.packageType,
        weight: params.weight,
        paymentMethod: params.paymentMethod,
        cardNumber: params.cardNumber,
        notes: params.notes,
      ),
    );
  }
}

class OrderParams {
  final String customerName;
  final String phoneNumber;
  final String address;
  final String packageType;
  final String weight;
  final String? notes;
  final String paymentMethod;
  final String? cardNumber;

  OrderParams({
    required this.customerName,
    required this.phoneNumber,
    required this.address,
    required this.packageType,
    required this.weight,
    required this.paymentMethod,
    this.cardNumber,
    this.notes,
  });
}
