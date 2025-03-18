import 'package:baridx_order_creation/core/models/order_model.dart';
import 'package:baridx_order_creation/core/entities/order.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

abstract interface class OrderRemoteDataSource {
  Future<OrderModel> createOrder(OrderEntity order);
  void storeLocalOrder(List<OrderModel> orders);
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
  void storeLocalOrder(List<OrderModel> orders) {
    box.write(() {
      for (int i = 0; i < orders.length; i++) {
        box.put(i.toString(), orders[i].toJson());
      }
    });
  }
}
