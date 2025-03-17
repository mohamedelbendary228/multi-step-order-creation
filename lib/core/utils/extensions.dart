import 'package:baridx_order_creation/core/enums/payment_mehtod_type.dart';

extension PaymentTypeExtension on PaymentMethodType {
  String get paymentType {
    switch (this) {
      case PaymentMethodType.cashOnDelivery:
        return "Cash on Delivery";
      case PaymentMethodType.creditCard:
        return "Credit Card";
      case PaymentMethodType.payLater:
        return "Pay Later";
    }
  }
}
