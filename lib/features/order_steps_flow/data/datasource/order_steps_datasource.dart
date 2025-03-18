import 'package:baridx_order_creation/features/order_steps_flow/data/models/order_model.dart';
import 'package:baridx_order_creation/features/order_steps_flow/domain/entities/order.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

abstract interface class OrderRemoteDataSource {
  Future<OrderModel> createOrder(OrderEntity order);
  void storeLocalOrder(OrderModel order);
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final Box box;

  OrderRemoteDataSourceImpl({required this.box});

  @override
  Future<OrderModel> createOrder(OrderEntity order) async {
    await Future.delayed(const Duration(seconds: 2));
    final Map<String, dynamic> orderJson = {
      'id': const Uuid().v1(),
      'customerName': order.customerName,
      'phoneNumber': order.phoneNumber,
      'address': order.address,
      'packageType': order.packageType,
      'weight': order.weight,
      'notes': order.notes,
      'paymentMethod': order.paymentMethod,
      'cardNumber': order.cardNumber,
    };
    return OrderModel.fromJson(orderJson);
  }

  @override
  void storeLocalOrder(OrderModel order) {
    box.write(() {
      box.put(order.id ?? "", order.toJson());
    });
  }
}
