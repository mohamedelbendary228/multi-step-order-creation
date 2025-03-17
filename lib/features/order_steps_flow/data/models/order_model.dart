import 'package:baridx_order_creation/features/order_steps_flow/domain/entities/order.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    super.customerName,
    super.phoneNumber,
    super.address,
    super.packageType,
    super.weight,
    super.paymentMethod,
    super.cardNumber,
    super.notes,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      customerName: json['customerName'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      packageType: json['packageType'],
      weight: json['weight'],
      notes: json['notes'],
      paymentMethod: json['paymentMethod'],
      cardNumber: json['cardNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customerName': customerName,
      'phoneNumber': phoneNumber,
      'address': address,
      'packageType': packageType,
      'weight': weight,
      'notes': notes,
      'paymentMethod': paymentMethod,
      'cardNumber': cardNumber,
    };
  }

  OrderModel copyWith({
    String? customerName,
    String? phoneNumber,
    String? address,
    String? packageType,
    String? weight,
    String? notes,
    String? paymentMethod,
    String? cardNumber,
  }) {
    return OrderModel(
      customerName: customerName ?? this.customerName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      packageType: packageType ?? this.packageType,
      weight: weight ?? this.weight,
      notes: notes ?? this.notes,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      cardNumber: cardNumber ?? this.cardNumber,
    );
  }

  OrderEntity toEntity() => OrderEntity(
        customerName: customerName,
        phoneNumber: phoneNumber,
        address: address,
        packageType: packageType,
        weight: weight,
        notes: notes,
        paymentMethod: paymentMethod,
        cardNumber: cardNumber,
      );
}
