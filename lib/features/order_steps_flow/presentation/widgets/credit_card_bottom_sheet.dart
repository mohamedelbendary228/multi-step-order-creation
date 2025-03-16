import 'package:baridx_order_creation/core/resources/app_assets.dart';
import 'package:baridx_order_creation/core/resources/app_colors.dart';
import 'package:baridx_order_creation/core/utils/card_number_formatter.dart';
import 'package:baridx_order_creation/core/utils/text_input_validators.dart';
import 'package:baridx_order_creation/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CreditCardBottomSheet extends StatefulWidget {
  const CreditCardBottomSheet({super.key});

  @override
  State<CreditCardBottomSheet> createState() => _CreditCardBottomSheetState();
}

class _CreditCardBottomSheetState extends State<CreditCardBottomSheet> {
  final OutlineInputBorder border = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey.withOpacity(0.7),
      width: 2.0,
    ),
  );

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String cardNumber = '';

  final TextEditingController cardController = TextEditingController();

  void onCardNumberChanged(String value) {
    setState(() {
      cardNumber = value;
    });
  }

  void addCardNumber() {
    final isValid = formKey.currentState?.validate();
    if (isValid ?? false) {
      Navigator.of(context).pop(cardController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.close),
            ),
            const SizedBox(height: 15),
            CreditCardWidget(
              enableFloatingCard: false,
              cardNumber: cardNumber,
              expiryDate: '05/30',
              cardHolderName: 'Mohamed Elbendary',
              cvvCode: '123',
              bankName: 'BaridX',
              frontCardBorder: Border.all(color: Colors.grey),
              backCardBorder: Border.all(color: Colors.grey),
              showBackView: false,
              obscureCardNumber: true,
              obscureCardCvv: true,
              isHolderNameVisible: true,
              cardBgColor: const Color(0xff999999),
              backgroundImage: AppAssets.cardBg,
              isSwipeGestureEnabled: true,
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                height: 1.6,
              ),
              onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
              padding: 0,
              customCardTypeIcons: <CustomCardTypeIcon>[
                CustomCardTypeIcon(
                  cardType: CardType.mastercard,
                  cardImage: Image.asset(
                    AppAssets.mastercard,
                    height: 48,
                    width: 48,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: cardController,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CardNumberFormatter(),
              ],
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              onTapOutside: (_) {
                FocusScope.of(context).unfocus();
              },
              maxLength: 19,
              cursorColor: AppColors.primaryColor,
              cursorHeight: 20,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Mastercard-logo.svg/800px-Mastercard-logo.svg.png',
                    height: 30,
                    width: 30,
                  ),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.darkGray, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.darkGray, width: 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                hintText: 'XXXX XXXX XXXX XXXX',
                labelText: 'Card Number',
                labelStyle: const TextStyle(
                  color: AppColors.darkGray,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                hintStyle: const TextStyle(
                  color: AppColors.darkGray,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                errorStyle: const TextStyle(
                  fontSize: 10,
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.w600,
                ),
              ),
              onChanged: onCardNumberChanged,
              validator: (value) => TextInputValidators.cardNumberValidation(value!),
            ),
            const SizedBox(height: 5),
            MainButton(
              text: "Add Card",
              onTap: addCardNumber,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
