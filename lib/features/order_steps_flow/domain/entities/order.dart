class OrderEntity {
  final String customerName;
  final String phoneNumber;
  final String address;
  final String packageType;
  final String weight;
  final String? notes;
  final String paymentMethod;
  final String? cardNumber;

  OrderEntity({
    required this.customerName,
    required this.phoneNumber,
    required this.address,
    required this.packageType,
    required this.weight,
    required this.paymentMethod,
    this.notes,
    this.cardNumber,
  });
}
