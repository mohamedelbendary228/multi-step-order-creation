import 'package:baridx_order_creation/core/entities/order.dart';
import 'package:baridx_order_creation/core/error/failure.dart';
import 'package:baridx_order_creation/core/usecase/usecase.dart';
import 'package:baridx_order_creation/features/home/domain/respository/home_respository.dart';
import 'package:dartz/dartz.dart';

class GetOrdersUseCase implements UseCase<List<OrderEntity>, NoParams> {
  final HomeRepository homeRepository;

  GetOrdersUseCase({required this.homeRepository});

  @override
  Future<Either<Failure, List<OrderEntity>>> call(NoParams params) async {
    return await homeRepository.getOrders();
  }
}
