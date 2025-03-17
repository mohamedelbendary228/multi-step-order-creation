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

class CustomerInfoLoading extends OrderStepsState {}

class CustomerInfoLoaded extends OrderStepsState {
  final String name;
  final String phoneNumber;
  final String address;
  const CustomerInfoLoaded({
    required this.name,
    required this.phoneNumber,
    required this.address,
  });

  @override
  List<Object> get props => [phoneNumber];
}

class PackageDetailsLoading extends OrderStepsState {}

class PackageDetailsLoaded extends OrderStepsState {
  final String packageType;
  final String weight;
  final String? notes;
  const PackageDetailsLoaded({
    required this.packageType,
    required this.weight,
    this.notes,
  });
}

class PaymentMethodLoading extends OrderStepsState {}

class PaymentMethodLoaded extends OrderStepsState {
  final String paymentMethod;
  final String? cardNumber;
  const PaymentMethodLoaded({
    required this.paymentMethod,
    this.cardNumber,
  });
}
