import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final String customerName;
  final String phoneNumber;
  final String address;
  final String packageType;
  final String weight;
  final String paymentMethod;
  final String? notes;
  final String? cardNumber;

  const OrderEntity({
    required this.customerName,
    required this.phoneNumber,
    required this.address,
    required this.packageType,
    required this.weight,
    required this.paymentMethod,
    this.notes,
    this.cardNumber,
  });

  @override
  List<Object?> get props => [phoneNumber, cardNumber];
}
