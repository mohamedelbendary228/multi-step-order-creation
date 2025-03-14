import 'package:baridx_order_creation/core/constants/dimensions.dart';
import 'package:baridx_order_creation/core/resources/app_colors.dart';
import 'package:baridx_order_creation/core/utils/text_input_validators.dart';
import 'package:baridx_order_creation/core/widgets/app_deafult_text.dart';
import 'package:baridx_order_creation/core/widgets/app_headr.dart';
import 'package:baridx_order_creation/core/widgets/app_text_field.dart';
import 'package:baridx_order_creation/core/widgets/main_button.dart';
import 'package:baridx_order_creation/core/widgets/text_field_label.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class CustomerInfoPage extends StatefulWidget {
  const CustomerInfoPage({super.key});

  @override
  State<CustomerInfoPage> createState() => _CustomerInfoPageState();
}

class _CustomerInfoPageState extends State<CustomerInfoPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  //* initialize default country
  Country selectedCountry = Country(
    phoneCode: '966',
    countryCode: 'SA',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'Saudi Arabia',
    example: '500123456',
    displayName: 'Saudi Arabia (SA) [+966]',
    displayNameNoCountryCode: 'Saudi Arabia (SA)',
    e164Key: '966-SA-0',
  );

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  void pickCountry() {
    showCountryPicker(
      context: context,
      countryListTheme: CountryListThemeData(
        bottomSheetHeight: MediaQuery.of(context).size.height * 0.8,
        borderRadius: const BorderRadius.horizontal(
          left: Radius.circular(20),
          right: Radius.circular(20),
        ),
      ),
      onSelect: (Country country) {
        setState(() {
          selectedCountry = country;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppHeader(
            text: "Customer Info",
            hasBackButton: true,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextFieldLabel("Name"),
                      const SizedBox(height: Dimensions.padding5Px),
                      AppTextField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        validator: (value) => TextInputValidators.nameValidation(value!),
                      ),
                      const SizedBox(height: Dimensions.padding25Px),
                      const TextFieldLabel("Phone Number"),
                      const SizedBox(height: Dimensions.padding5Px),
                      SizedBox(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: AppTextField(
                                controller: phoneController,
                                keyboardType: TextInputType.phone,
                                validator: (value) => TextInputValidators.phoneValidation(value!),
                              ),
                            ),
                            const SizedBox(width: 5),
                            InkWell(
                              onTap: pickCountry,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                height: 48,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: AppColors.naturalGray),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                child: AppDefaultText(
                                  "${selectedCountry.flagEmoji}"
                                  "  +${selectedCountry.phoneCode}",
                                  fontSize: Dimensions.fontSize14Px,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: Dimensions.padding25Px),
                      const TextFieldLabel("Address"),
                      const SizedBox(height: Dimensions.padding5Px),
                      AppTextField(
                        controller: addressController,
                        keyboardType: TextInputType.streetAddress,
                        maxLines: 4,
                        validator: (value) => TextInputValidators.addressValidation(value!),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: Dimensions.padding20Px),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: MainButton(
              text: "Next",
              onTap: () {},
            ),
          ),
          const SizedBox(height: Dimensions.padding35Px),
        ],
      ),
    );
  }
}
