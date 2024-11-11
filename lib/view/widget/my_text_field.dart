import 'package:country_picker/country_picker.dart';
import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_fonts.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  MyTextField({
    Key? key,
    this.labelText = '',
    this.controller,
    this.onChanged,
    this.onTap,
    this.validator,
    this.keyboardType,
    this.isObSecure = false,
    this.marginBottom = 16.0,
    this.maxLength,
    this.prefix,
    this.suffix,
    this.hintText,
    this.readOnly = false,
    this.filledColor,
    this.maxLines = 1,
  }) : super(key: key);
  final String? labelText, hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final bool? isObSecure, readOnly;
  int? maxLength, maxLines;
  double? marginBottom;
  final Widget? prefix;
  final Widget? suffix;
  Color? filledColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: marginBottom!,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (labelText!.isNotEmpty)
            MyText(
              text: labelText!,
              size: 13,
              weight: FontWeight.w500,
              paddingBottom: 2,
            ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: TextFormField(
              textAlignVertical: prefix != null || suffix != null
                  ? TextAlignVertical.center
                  : null,
              maxLines: maxLines,
              maxLength: maxLength,
              controller: controller,
              onTap: onTap,
              readOnly: readOnly!,
              onChanged: onChanged,
              validator: validator,
              keyboardType: keyboardType,
              obscureText: isObSecure!,
              obscuringCharacter: '*',
              autovalidateMode: AutovalidateMode.always,
              cursorWidth: 1.0,
              textInputAction: TextInputAction.next,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: kDarkGreyColor,
              ),
              decoration: InputDecoration(
                hintText: hintText ?? '',
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: kDarkGreyColor.withOpacity(0.4),
                ),
                fillColor: filledColor ?? kTertiaryColor.withOpacity(0.065),
                filled: true,
                counterText: '',
                prefixIcon: prefix,
                suffixIcon: suffix,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: maxLines! > 1 ? 15 : 0,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class PhoneField extends StatefulWidget {
  PhoneField({
    Key? key,
    this.controller,
    this.onChanged,
    this.marginBottom = 16.0,
  }) : super(key: key);

  TextEditingController? controller;
  ValueChanged<String>? onChanged;
  double? marginBottom;

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  @override
  Widget build(BuildContext context) {
    final _enableBorder = InputBorder.none;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyText(
            text: 'Phone Number',
            size: 13,
            weight: FontWeight.w500,
            paddingBottom: 2,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: TextFormField(
              textCapitalization: TextCapitalization.sentences,
              cursorColor: kTertiaryColor,
              controller: widget.controller,
              onChanged: widget.onChanged,
              textInputAction: TextInputAction.next,
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: kDarkGreyColor,
              ),
              decoration: InputDecoration(
                fillColor: kTertiaryColor.withOpacity(0.065),
                filled: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                hintText: '123 456 789',
                hintStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: kDarkGreyColor.withOpacity(0.4),
                ),
                prefixIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      height: 32,
                      width: 85,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MyText(
                            paddingLeft: 15,
                            onTap: () {
                              showCountryPicker(
                                context: context,
                                countryListTheme: CountryListThemeData(
                                  flagSize: 25,
                                  backgroundColor: kPrimaryColor,
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    color: kTertiaryColor,
                                    fontFamily: AppFonts.GIL_SANS,
                                  ),
                                  bottomSheetHeight: 500,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25.0),
                                    topRight: Radius.circular(25.0),
                                  ),
                                  searchTextStyle: TextStyle(
                                    fontSize: 14,
                                    color: kDarkGreyColor,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AppFonts.GIL_SANS,
                                  ),
                                  inputDecoration: InputDecoration(
                                    fillColor:
                                        kTertiaryColor.withOpacity(0.065),
                                    filled: true,
                                    hintText: 'Search',
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: kDarkGreyColor,
                                      fontFamily: AppFonts.GIL_SANS,
                                    ),
                                    border: _enableBorder,
                                    enabledBorder: _enableBorder,
                                    focusedBorder: _enableBorder,
                                    focusedErrorBorder: _enableBorder,
                                  ),
                                ),
                                onSelect: (Country country) => print(
                                  'Select country: ${country.displayName}',
                                ),
                              );
                            },
                            text: '🇺🇸  +1',
                            color: kTertiaryColor,
                            size: 15,
                          ),
                          Container(
                            width: 1,
                            color: kBorderColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                enabledBorder: _enableBorder,
                focusedBorder: _enableBorder,
                errorBorder: _enableBorder,
                focusedErrorBorder: _enableBorder,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
