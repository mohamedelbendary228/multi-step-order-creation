import 'package:baridx_order_creation/core/entities/order.dart';
import 'package:baridx_order_creation/core/error/failure.dart';
import 'package:baridx_order_creation/core/models/order_model.dart';
import 'package:baridx_order_creation/features/home/data/datasource/home_local_datasource.dart';
import 'package:baridx_order_creation/features/home/domain/respository/home_respository.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepositoryImpl({required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<OrderEntity>>> getOrders() async {
    try {
      final List<OrderModel> orders = await homeLocalDataSource.getOrders();
      return Right(orders);
    } on DatabaseFailure {
      return const Left(DatabaseFailure('An error has occurred'));
    }
  }
}
