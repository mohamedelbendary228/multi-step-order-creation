import 'package:baridx_order_creation/core/error/failure.dart';
import 'package:baridx_order_creation/core/models/order_model.dart';
import 'package:baridx_order_creation/core/entities/order.dart';
import 'package:dartz/dartz.dart';

abstract class OrderStepsRepository {
  Future<Either<Failure, OrderEntity>> createOrder(OrderModel order);
}
