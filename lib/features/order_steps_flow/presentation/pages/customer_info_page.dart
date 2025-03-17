import 'package:baridx_order_creation/core/constants/dimensions.dart';
import 'package:baridx_order_creation/core/utils/text_input_validators.dart';
import 'package:baridx_order_creation/core/widgets/app_headr.dart';
import 'package:baridx_order_creation/core/widgets/app_text_field.dart';
import 'package:baridx_order_creation/core/widgets/main_button.dart';
import 'package:baridx_order_creation/core/widgets/text_field_label.dart';
import 'package:baridx_order_creation/features/order_steps_flow/presentation/cubit/order_steps_cubit.dart';
import 'package:baridx_order_creation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
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
                      AppTextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        validator: (value) => TextInputValidators.phoneValidation(value!),
                        hintText: "(e.g., +20 10*********)",
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
          BlocConsumer<OrderStepsCubit, OrderStepsState>(
            listener: (context, state) {
              if (state is CustomerInfoLoaded) {
                context.push(Routes.packageDetails);
              }
            },
            builder: (context, state) {
              if (state is CustomerInfoLoading) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: MainButton(
                    loadingWidget: CircularProgressIndicator(color: Colors.white),
                    text: "",
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: MainButton(
                  text: "Next",
                  onTap: () {
                    final isValid = formKey.currentState?.validate();
                    if (isValid ?? false) {
                      context.read<OrderStepsCubit>().saveCustomerInfo(
                            name: nameController.text,
                            phoneNumber: phoneController.text,
                            address: addressController.text,
                          );
                    }
                  },
                ),
              );
            },
          ),
          const SizedBox(height: Dimensions.padding35Px),
        ],
      ),
    );
  }
}
