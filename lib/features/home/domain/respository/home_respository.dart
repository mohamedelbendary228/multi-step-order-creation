import 'package:baridx_order_creation/core/entities/order.dart';
import 'package:baridx_order_creation/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<OrderEntity>>> getOrders();
}
