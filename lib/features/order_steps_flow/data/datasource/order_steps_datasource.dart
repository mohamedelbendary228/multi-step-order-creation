import 'package:baridx_order_creation/features/order_steps_flow/data/models/order_model.dart';
import 'package:baridx_order_creation/features/order_steps_flow/domain/entities/order.dart';

abstract interface class OrderRemoteDataSource {
  Future<OrderModel> createOrder(OrderEntity order);
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  @override
  Future<OrderModel> createOrder(OrderEntity order) async {
    await Future.delayed(const Duration(seconds: 2));
    return OrderModel(
      customerName: order.customerName,
      phoneNumber: order.phoneNumber,
      address: order.address,
      packageType: order.packageType,
      weight: order.weight,
      paymentMethod: order.paymentMethod,
      cardNumber: order.cardNumber,
      notes: order.notes,
    );
  }
}
