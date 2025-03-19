import 'package:baridx_order_creation/core/error/exception.dart';
import 'package:baridx_order_creation/core/error/failure.dart';
import 'package:baridx_order_creation/features/order_steps_flow/data/datasource/order_steps_datasource.dart';
import 'package:baridx_order_creation/core/models/order_model.dart';
import 'package:baridx_order_creation/core/entities/order.dart';
import 'package:baridx_order_creation/features/order_steps_flow/domain/repository/order_steps_repository.dart';
import 'package:dartz/dartz.dart';

class OrderStepsRepositoryImpl implements OrderStepsRepository {
  final OrderRemoteDataSource orderRemoteDataSource;

  OrderStepsRepositoryImpl({required this.orderRemoteDataSource});

  //* - Here you can find the implementation of the OrderStepsRepository.
  //* - This method is used to create an order and return and entity or a failure.
  //* - After creating the order, the order is stored in the local database.
  @override
  Future<Either<Failure, OrderEntity>> createOrder(OrderModel order) async {
    try {
      final result = await orderRemoteDataSource.createOrder(order);
      orderRemoteDataSource.storeLocalOrder(result);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    }
  }
}
