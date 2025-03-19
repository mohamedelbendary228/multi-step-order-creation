import 'package:baridx_order_creation/core/models/order_model.dart';
import 'package:baridx_order_creation/core/entities/order.dart';
import 'package:hive/hive.dart';

abstract interface class OrderRemoteDataSource {
  Future<OrderModel> createOrder(OrderEntity order);
  void storeLocalOrder(OrderModel orders);
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final Box box;

  OrderRemoteDataSourceImpl({required this.box});

  @override
  Future<OrderModel> createOrder(OrderEntity order) async {
    await Future.delayed(const Duration(seconds: 2));
    final Map<String, dynamic> orderJson = {
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      'createdDate': DateTime.now().toIso8601String().toString(),
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

  //* Here you can find that I write a list of orders in hive using to json method
  //* And also I read the data using the from json method
  //* This list will contain only one item every time, The last order created
  //* beacuse
  @override
  void storeLocalOrder(OrderModel orders) {
    box.write(() {
      box.add(orders.toJson());
    });
  }
}
