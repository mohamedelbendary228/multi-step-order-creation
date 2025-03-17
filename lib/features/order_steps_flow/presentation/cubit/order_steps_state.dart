part of 'order_steps_cubit.dart';

sealed class OrderStepsState extends Equatable {
  const OrderStepsState();

  @override
  List<Object> get props => [];
}

final class OrderStepsInitial extends OrderStepsState {}

class CreateOrderLoading extends OrderStepsState {}

class CreateOrderLoaded extends OrderStepsState {
  final OrderEntity order;
  const CreateOrderLoaded({required this.order});
}

class CreateOrderFailure extends OrderStepsState {
  final String message;
  const CreateOrderFailure({required this.message});
}

//* Customer Info State

class OrderInfoLoading extends OrderStepsState {}

class OrderInfoLoaded extends OrderStepsState {
  final OrderEntity order;
  const OrderInfoLoaded({required this.order});
}
