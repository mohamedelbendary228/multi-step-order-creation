import 'package:baridx_order_creation/core/models/order_model.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  Future<List<OrderModel>> getOrders();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final Box box;

  HomeLocalDataSourceImpl({required this.box});

  @override
  Future<List<OrderModel>> getOrders() async {
    List<OrderModel> orders = [];
    await Future.delayed(const Duration(seconds: 2));
    box.read(() {
      for (int i = 0; i < box.length; i++) {
        orders.add(OrderModel.fromJson(box.get(i.toString())));
      }
    });
    return orders;
  }
}
