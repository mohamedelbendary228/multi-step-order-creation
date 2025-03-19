import 'package:baridx_order_creation/core/entities/order.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    super.id,
    super.createdDate,
    super.customerName,
    super.phoneNumber,
    super.address,
    super.packageType,
    super.weight,
    super.paymentMethod,
    super.cardNumber,
    super.notes,
  });

  //* fromJson method, converts a JSON map to an OrderModel object.
  //* I use to read the data from hive
  //* And return an OrderModel object when creating an order
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      createdDate: json['createdDate'],
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

  //* toJson method, converts the OrderModel object to a JSON map.
  //* I use to to write the data locally in hive
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdDate': createdDate,
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

  //* copyWith method, creates a new copy of the OrderModel object with optional updated properties.
  //* If a property is not provided, it defaults to the original value.
  OrderModel copyWith({
    String? id,
    String? createdDate,
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
      id: id ?? this.id,
      createdDate: createdDate ?? this.createdDate,
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
        id: id,
        createdDate: createdDate,
        customerName: customerName,
        phoneNumber: phoneNumber,
        address: address,
        packageType: packageType,
        weight: weight,
        notes: notes,
        paymentMethod: paymentMethod,
        cardNumber: cardNumber,
      );

  @override
  String toString() {
    return 'OrderModel{'
        'id: $id, '
        'createdDate: $createdDate, '
        'customerName: $customerName, '
        'phoneNumber: $phoneNumber, '
        'address: $address, '
        'packageType: $packageType, '
        'weight: $weight, '
        'notes: $notes, '
        'paymentMethod: $paymentMethod, '
        'cardNumber: $cardNumber, '
        '}';
  }
}
