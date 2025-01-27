import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tech_tak/core/responsive/app_text_styles.dart';
import 'package:uuid/uuid.dart';
import 'package:tech_tak/core/config/colors_box.dart';
import 'package:tech_tak/core/widgets/custom_primary_button.dart';
import 'package:tech_tak/features/booking_page/view/pages/form_submitted_page.dart';
import 'package:tech_tak/generated/l10n.dart';

class BookingForm extends StatefulWidget {
  const BookingForm({super.key});

  @override
  State<BookingForm> createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isSubmitting = false; // To manage loading state
  String? selectedCountry;
  String? projectType;
  final uuid = Uuid();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController projectDescriptionController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _CustomTextFormField(
            controller: nameController,
            title: S.of(context).name,
            hintText: S.of(context).yourName,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).fieldRequired;
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          _CustomCountryPickerField(
            title: S.of(context).country,
            selectedCountry: selectedCountry,
            onCountrySelected: (country) {
              setState(() {
                selectedCountry = country.displayName;
              });
            },
          ),
          // if (selectedCountry == null)
          //   Padding(
          //     padding: const EdgeInsets.only(top: 5),
          //     child: Text(
          //       S.of(context).fieldRequired,
          //       style: const TextStyle(color: Colors.red, fontSize: 12),
          //     ),
          //   ),
          const SizedBox(height: 10),
          _CustomTextFormField(
            controller: phoneNumberController,
            title: S.of(context).phoneNumber,
            hintText: S.of(context).yourNumber,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).fieldRequired;
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          _CustomDropdownField(
            onChanged: (value) {
              setState(() {
                projectType = value;
              });
            },
            title: S.of(context).projectType,
            items: [
              S.of(context).website,
              S.of(context).mobileApp,
              '${S.of(context).website} & ${S.of(context).mobileApp}'
            ],
          ),
          // if (projectType == null)
          //   Padding(
          //     padding: const EdgeInsets.only(top: 5),
          //     child: Text(
          //       S.of(context).fieldRequired,
          //       style: const TextStyle(color: Colors.red, fontSize: 12),
          //     ),
          //   ),
          const SizedBox(height: 20),
          _CustomTextFormField(
            controller: projectDescriptionController,
            title: S.of(context).projectDescription,
            hintText: S.of(context).describe,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).fieldRequired;
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomPrimaryButton(
            onPressed: () async {
              if (_isSubmitting) return;

              if (!_formKey.currentState!.validate() ||
                  selectedCountry == null ||
                  projectType == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(S.of(context).fieldRequired),
                    duration: const Duration(seconds: 2),
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
                return;
              }

              setState(() {
                _isSubmitting = true;
              });

              try {
                String uniqueId = uuid.v4();

                await Supabase.instance.client
                    .from('tech_tak_form')
                    .insert({
                  'id': uniqueId,
                  'name': nameController.text,
                  'country': selectedCountry,
                  'phone_number': phoneNumberController.text,
                  'project_type': projectType,
                  'project_description': projectDescriptionController.text,
                }).then((onValue) {
                  GoRouter.of(context).push(FormSubmittedPage.routeName);
                });
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(S.of(context).error),
                    duration: const Duration(seconds: 2),
                    backgroundColor: Colors.red,
                    behavior:
                        SnackBarBehavior.floating, // يجعل الـ SnackBar يطفو
                  ),
                );
              } finally {
                setState(() {
                  _isSubmitting = false;
                });
              }
            },
            title: S.of(context).submit,
            enabled: !_isSubmitting, // Disable button when submitting
            buttonHeight: 46,
            buttonWidth: 140,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;
  final String? Function(String?)? validator;

  const _CustomTextFormField({
    super.key,
    required this.controller,
    required this.title,
    required this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: AppTextStyles.regular10()
                .copyWith(color: ColorsBox.primaryColor)),
        TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorsBox.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CustomDropdownField extends StatelessWidget {
  final String title;
  final List<String> items;
  final void Function(String?) onChanged;

  const _CustomDropdownField({
    super.key,
    required this.title,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: AppTextStyles.regular10()
                .copyWith(color: ColorsBox.primaryColor)),
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorsBox.primaryColor),
            ),
          ),
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChanged,
          hint: Text(
            S.of(context).choose,
            style: const TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}

class _CustomCountryPickerField extends StatelessWidget {
  final String title;
  final String? selectedCountry;
  final void Function(Country) onCountrySelected;

  const _CustomCountryPickerField({
    super.key,
    required this.title,
    required this.selectedCountry,
    required this.onCountrySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: AppTextStyles.regular10()
                .copyWith(color: ColorsBox.primaryColor)),
        GestureDetector(
          onTap: () {
            showCountryPicker(
              context: context,
              onSelect: onCountrySelected,
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedCountry ?? S.of(context).chooseCountry,
                  style: const TextStyle(color: Colors.grey),
                ),
                const Icon(
                  FontAwesomeIcons.chevronDown,
                  size: 16,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
