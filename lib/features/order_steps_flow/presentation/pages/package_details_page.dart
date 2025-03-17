import 'package:baridx_order_creation/core/constants/dimensions.dart';
import 'package:baridx_order_creation/core/resources/app_colors.dart';
import 'package:baridx_order_creation/core/utils/text_input_validators.dart';
import 'package:baridx_order_creation/core/utils/toast.dart';
import 'package:baridx_order_creation/core/widgets/app_headr.dart';
import 'package:baridx_order_creation/core/widgets/app_text_field.dart';
import 'package:baridx_order_creation/core/widgets/main_button.dart';
import 'package:baridx_order_creation/core/widgets/text_field_label.dart';
import 'package:baridx_order_creation/features/order_steps_flow/presentation/cubit/order_steps_cubit.dart';
import 'package:baridx_order_creation/routes/routes.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PackageDetailsPage extends StatefulWidget {
  const PackageDetailsPage({super.key});

  @override
  State<PackageDetailsPage> createState() => _PackageDetailsPageState();
}

class _PackageDetailsPageState extends State<PackageDetailsPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController weightController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  String? _selectedPackageType;

  List<String> packageTypes = [
    'Document',
    'Parcel',
    'Fragile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppHeader(
            text: "Package Details",
            hasBackButton: true,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextFieldLabel("Package Type"),
                      const SizedBox(height: Dimensions.padding10Px),
                      DropdownButton2<String>(
                        items: packageTypes.map((type) {
                          return DropdownMenuItem<String>(
                            value: type,
                            child: Text(type),
                          );
                        }).toList(),
                        value: _selectedPackageType,
                        onChanged: (value) {
                          setState(() {
                            _selectedPackageType = value!;
                          });
                        },
                        isExpanded: true,
                        style: TextStyle(
                          color: AppColors.naturalDarkGray,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                        ),
                        dropdownStyleData: const DropdownStyleData(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        underline: const SizedBox.shrink(),
                        buttonStyleData: ButtonStyleData(
                          padding: const EdgeInsetsDirectional.only(end: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: AppColors.darkGray.withOpacity(0.5)),
                          ),
                        ),
                      ),
                      const SizedBox(height: Dimensions.padding25Px),
                      const TextFieldLabel("Weight"),
                      const SizedBox(height: Dimensions.padding5Px),
                      AppTextField(
                        controller: weightController,
                        keyboardType: TextInputType.number,
                        hintText: "KG",
                        validator: (value) => TextInputValidators.weightValidation(value!),
                      ),
                      const SizedBox(height: Dimensions.padding25Px),
                      const Row(
                        children: [
                          TextFieldLabel("Notes"),
                          SizedBox(width: 5),
                          TextFieldLabel(
                            "(Optional)",
                            fontSize: 10,
                            color: AppColors.darkGray,
                          ),
                        ],
                      ),
                      const SizedBox(height: Dimensions.padding5Px),
                      AppTextField(
                        controller: notesController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
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
              onTap: () {
                final isValid = formKey.currentState?.validate();
                if ((isValid ?? false) && _selectedPackageType != null) {
                  context.read<OrderStepsCubit>().savePackageDetails(
                        packageType: _selectedPackageType!,
                        weight: weightController.text,
                        notes: notesController.text.isNotEmpty ? notesController.text : null,
                      );
                  context.push(Routes.payment);
                } else if (_selectedPackageType == null) {
                  showToast(message: "Please select a package type");
                }
              },
            ),
          ),
          const SizedBox(height: Dimensions.padding35Px),
        ],
      ),
    );
  }
}
