import 'package:baridx_order_creation/core/error/exception.dart';
import 'package:baridx_order_creation/core/error/failure.dart';
import 'package:baridx_order_creation/features/order_steps_flow/data/datasource/order_steps_datasource.dart';
import 'package:baridx_order_creation/features/order_steps_flow/data/models/order_model.dart';
import 'package:baridx_order_creation/features/order_steps_flow/domain/entities/order.dart';
import 'package:baridx_order_creation/features/order_steps_flow/domain/repository/order_steps_repository.dart';
import 'package:dartz/dartz.dart';

class OrderStepsRepositoryImpl implements OrderStepsRepository {
  final OrderRemoteDataSource orderRemoteDataSource;

  OrderStepsRepositoryImpl({required this.orderRemoteDataSource});
  @override
  Future<Either<Failure, OrderEntity>> createOrder(OrderModel order) async {
    try {
      final result = await orderRemoteDataSource.createOrder(order);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    }
  }
}
