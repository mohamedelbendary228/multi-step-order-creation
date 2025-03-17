import 'package:baridx_order_creation/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

class NoParams {}
