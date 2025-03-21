import 'package:chandrima_real_estate/utils/app_color.dart';
import 'package:chandrima_real_estate/utils/dimensions.dart';
import 'package:chandrima_real_estate/utils/styles.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  final List<String>? items;
  final String? titleText;
  final bool showTitle;
  final bool isRequired;
  final String? hintText;
  final Function(String?)? onChanged;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final FontWeight? titleFontWeight;
  final String? selectedValue;
  final List<DropdownMenuItem<String>>? dropdownMenuItems;

  const CustomDropdownButton({
    super.key,
    this.items,
    this.titleText,
    this.showTitle = true,
    this.isRequired = false,
    this.hintText,
    this.onChanged,
    this.validator,
    this.onSaved,
    this.titleFontWeight,
    this.selectedValue,
    this.dropdownMenuItems,
  });

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      decoration: InputDecoration(
        border: border(),
        filled: true,
        fillColor: AppColors.grey.withValues(alpha: 0.2),
      ),

      hint: Text(widget.hintText ?? 'Select an option'),
      value: widget.selectedValue,
      items: (widget.dropdownMenuItems ?? widget.items?.map((item) => DropdownMenuItem<String>(
        value: item,
        child: Text(item),
      )).toList()) ?? [
        const DropdownMenuItem<String>(
          value: null,
          child: Text('No data available'),
        ),
      ],
      validator: widget.validator ?? (value) {
        if (value == null) {
          return 'Please select an option.';
        }
        return null;
      },
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),

      iconStyleData: const IconStyleData(
        icon: Icon(Icons.arrow_drop_down, color: AppColors.black, size: 30),
      ),
      dropdownStyleData: DropdownStyleData(
        maxHeight: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radiusFive),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }

  OutlineInputBorder border () {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimensions.radiusFifteen),
      borderSide: BorderSide.none,
    );
  }
}
