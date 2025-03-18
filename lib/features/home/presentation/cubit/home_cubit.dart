import 'package:baridx_order_creation/core/entities/order.dart';
import 'package:baridx_order_creation/core/usecase/usecase.dart';
import 'package:baridx_order_creation/features/home/domain/uscase/get_orders_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetOrdersUseCase _getOrdersUseCase;
  HomeCubit(GetOrdersUseCase getOrdersUseCase)
      : _getOrdersUseCase = getOrdersUseCase,
        super(HomeInitial());

  Future<void> getOrders() async {
    emit(HomeLoading());
    final result = await _getOrdersUseCase(NoParams());
    result.fold(
      (failure) => emit(HomeFailure(message: failure.message)),
      (orders) => emit(HomeLoaded(orders: orders)),
    );
  }
}
