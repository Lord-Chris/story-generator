import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/_constants.dart';

class AppTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? initialValue;
  final bool obscureText;
  final InputBorder? border;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextAlignVertical? textAlignVertical;
  final TextAlign? textAlign;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? bottomRightWidget;
  final bool readOnly;
  final bool expands;
  final bool hasBorder;
  final int? minLines, maxLines, maxLength;
  final bool enabled;
  final Color? fillColor;
  final InputDecoration? decoration;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextField({
    Key? key,
    this.label,
    this.hint,
    this.controller,
    this.validator,
    this.border,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.suffix,
    this.obscureText = false,
    this.prefix,
    this.initialValue,
    this.focusNode,
    this.readOnly = false,
    this.expands = false,
    this.hasBorder = true,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.enabled = true,
    this.onChanged,
    this.onFieldSubmitted,
    this.fillColor,
    this.onTap,
    this.onEditingComplete,
    this.decoration,
    this.textAlign,
    this.textAlignVertical,
    this.bottomRightWidget,
    this.inputFormatters,
  })  : assert(initialValue == null || controller == null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: AppTextStyles.medium14.copyWith(
              color: AppColors.black,
            ),
          ),
        if (label != null) Spacing.vertExtraTiny(),
        if (label != null) Spacing.vertTiny(),
        TextFormField(
          enabled: enabled,
          controller: controller,
          initialValue: initialValue,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          onTap: onTap,
          keyboardType: keyboardType,
          cursorWidth: 1,
          textCapitalization: textCapitalization,
          obscureText: obscureText,
          obscuringCharacter: '●',
          readOnly: readOnly,
          focusNode: focusNode,
          expands: expands,
          maxLines: maxLines,
          validator: validator,
          minLines: minLines,
          // maxLength: maxLength,
          inputFormatters: [
            LengthLimitingTextInputFormatter(maxLength),
            ...inputFormatters ?? []
          ],
          textAlignVertical: textAlignVertical ?? TextAlignVertical.bottom,
          textAlign: textAlign ?? TextAlign.start,
          onEditingComplete:
              onEditingComplete ?? () => FocusScope.of(context).nextFocus(),
          style: AppTextStyles.regular16.copyWith(
            height: 1.2,
          ),
          decoration: decoration ??
              kOutlineDecoration().copyWith(
                hintText: hint,
                suffixIcon: suffix,
                prefixIcon: (prefix != null)
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.r),
                            child: prefix!,
                          ),
                        ],
                      )
                    : null,
                enabled: enabled,
                border: border,
                alignLabelWithHint:
                    maxLines != null && keyboardType == TextInputType.multiline,
              ),
        ),
      ],
    );
  }

  static InputDecoration kOutlineDecoration() => InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 13.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.gray300, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.gray300, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.gray300, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.gray300, width: 1),
        ),
        filled: true,
        fillColor: AppColors.white,
        hintStyle: AppTextStyles.regular16,
      );
}

class AppDropdownField<T> extends StatelessWidget {
  final List<T> items;
  final T? value;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final Widget Function(T)? customItem;
  final String Function(T)? displayItem;
  final String? label, hint;
  final String? headingText;
  final Widget? prefix;
  final FocusNode? focusNode;
  final bool enabled;
  final Color? fillColor;
  final bool hasBorder;

  const AppDropdownField({
    Key? key,
    required this.items,
    required this.value,
    this.onChanged,
    this.validator,
    this.label,
    this.hint,
    this.headingText,
    this.prefix,
    this.enabled = true,
    this.fillColor,
    this.focusNode,
    this.customItem,
    this.displayItem,
    this.hasBorder = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: AppTextStyles.medium14.copyWith(
              color: AppColors.black,
            ),
          ),
        if (label != null) Spacing.vertExtraTiny(),
        if (label != null) Spacing.vertTiny(),
        DropdownButtonFormField<T>(
          items: items.map(
            (T item) {
              if (customItem != null) {
                return DropdownMenuItem(
                  value: item,
                  child: customItem!(item),
                );
              }
              return DropdownMenuItem(
                value: item,
                child: Text(
                  displayItem != null ? displayItem!(item) : item.toString(),
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: AppTextStyles.medium16.copyWith(
                    color: AppColors.gray600,
                    height: .4,
                  ),
                ),
              );
            },
          ).toList(),
          isExpanded: true,
          onChanged: onChanged,
          validator: validator,
          value: value,
          focusNode: focusNode,
          icon: const Icon(Icons.keyboard_arrow_down, size: 0),
          style: AppTextStyles.medium16,
          decoration: AppTextField.kOutlineDecoration().copyWith(
            hintText: hint,
            prefixIcon: prefix,
            enabled: enabled,
            suffixIcon: Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.gray500,
              size: 25.sp,
            ),
          ),
        ),
      ],
    );
  }
}

// class AppSearchField<T> extends HookWidget {
//   final String? label;
//   final String? hint;
//   final String? initialValue;
//   final InputBorder? border;
//   final TextEditingController? controller;
//   final FocusNode? focusNode;
//   final String? Function(String?)? validator;
//   final void Function(String)? onChanged;
//   final void Function(String)? onFieldSubmitted;
//   final void Function()? onTap;
//   final void Function()? onEditingComplete;
//   final TextInputType? keyboardType;
//   final TextAlignVertical? textAlignVertical;
//   final TextCapitalization? textCapitalization;
//   final TextAlign? textAlign;
//   final Widget? suffix;
//   final Widget? prefix;
//   final Widget? bottomRightWidget;
//   final bool expands;
//   final bool hasBorder;
//   final bool enabled;
//   final Color? fillColor;
//   final InputDecoration? decoration;
//   final List<T> suggestions;
//   final bool Function(String, T) itemComparator;
//   final String Function(T)? displayItem;
//   final void Function(T)? onSuggestionTap;

//   const AppSearchField({
//     Key? key,
//     this.label,
//     this.hint,
//     this.controller,
//     this.validator,
//     this.border,
//     this.keyboardType,
//     this.suffix,
//     this.prefix,
//     this.initialValue,
//     this.focusNode,
//     this.expands = false,
//     this.hasBorder = true,
//     this.enabled = true,
//     this.onChanged,
//     this.onFieldSubmitted,
//     this.fillColor,
//     this.onTap,
//     this.onEditingComplete,
//     this.decoration,
//     this.textAlign,
//     this.textAlignVertical,
//     this.bottomRightWidget,
//     required this.suggestions,
//     required this.itemComparator,
//     this.displayItem,
//     this.onSuggestionTap,
//     this.textCapitalization,
//   })  : assert(initialValue == null || controller == null),
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final focusNode = this.focusNode ?? useFocusNode();
//     final showedSuggestion = useState(<T>[]);
//     final hasFocus = useListenableSelector(focusNode, () => focusNode.hasFocus);
//     return FormField<String?>(
//       validator: validator,
//       builder: (state) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               alignment: Alignment.topLeft,
//               decoration: BoxDecoration(
//                 color: AppColors.inputFieldBg,
//                 borderRadius: BorderRadius.circular(12.r),
//                 border: hasBorder
//                     ? Border.all(
//                         color: hasFocus
//                             ? AppColors.lightColor2
//                             : state.hasError
//                                 ? AppColors.errorNotStrong
//                                 : AppColors.inputFieldBg,
//                         width: 0.4,
//                       )
//                     : null,
//               ),
//               child: Column(
//                 children: [
//                   TextFormField(
//                     enabled: enabled,
//                     controller: controller,
//                     initialValue: initialValue,
//                     onChanged: (val) {
//                       state.didChange(val);
//                       showedSuggestion.value = val.isEmpty
//                           ? []
//                           : suggestions
//                               .where((e) => itemComparator(val, e))
//                               .toList();
//                       if (onChanged != null) onChanged!(val);
//                     },
//                     onFieldSubmitted: onFieldSubmitted,
//                     onTap: onTap,
//                     keyboardType: keyboardType,
//                     cursorColor: AppColors.lightColor2,
//                     cursorWidth: 1,
//                     obscuringCharacter: "●",
//                     focusNode: focusNode,
//                     expands: expands,
//                     textCapitalization:
//                         textCapitalization ?? TextCapitalization.none,
//                     textAlignVertical:
//                         textAlignVertical ?? TextAlignVertical.bottom,
//                     textAlign: textAlign ?? TextAlign.start,
//                     onEditingComplete: onEditingComplete ??
//                         () => FocusScope.of(context).nextFocus(),
//                     style: AppTextStyles.medium14.copyWith(
//                       height: 1.2,
//                     ),
//                     decoration: decoration ??
//                         kOutlineDecoration().copyWith(
//                           hintText: hint,
//                           labelText: label,
//                           suffixIcon: (suffix != null)
//                               ? Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsets.only(right: 10.w),
//                                       child: suffix!,
//                                     ),
//                                   ],
//                                 )
//                               : null,
//                           prefixIcon: (prefix != null)
//                               ? Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsets.only(left: 10.r),
//                                       child: prefix!,
//                                     ),
//                                   ],
//                                 )
//                               : null,
//                           filled: fillColor != null,
//                           enabled: enabled,
//                           fillColor: AppColors.black,
//                           border: border,
//                           alignLabelWithHint:
//                               keyboardType == TextInputType.multiline,
//                         ),
//                   ),
//                   if (bottomRightWidget != null)
//                     Container(
//                       alignment: Alignment.bottomRight,
//                       padding: EdgeInsets.all(11.r),
//                       child: bottomRightWidget,
//                     )
//                 ],
//               ),
//             ),
//             Stack(
//               children: [
//                 if (showedSuggestion.value.isNotEmpty)
//                   Material(
//                     color: AppColors.inputFieldBg,
//                     elevation: 10,
//                     shadowColor: AppColors.black,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12.r),
//                     ),
//                     child: ListView.separated(
//                       itemCount: min(showedSuggestion.value.length, 3),
//                       shrinkWrap: true,
//                       separatorBuilder: (_, __) => const Divider(height: 1),
//                       padding: EdgeInsets.zero,
//                       itemBuilder: (context, index) {
//                         final value = showedSuggestion.value[index];
//                         return InkWell(
//                           onTap: () {
//                             if (onSuggestionTap != null) {
//                               onSuggestionTap!(value);
//                               showedSuggestion.value = [];
//                             }
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.all(10),
//                             child: Text(
//                               displayItem != null
//                                   ? displayItem!(value)
//                                   : value.toString(),
//                               style: AppTextStyles.regular13.copyWith(
//                                 color: AppColors.bodyGrey,
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 Spacing.vertTiny(),
//                 if (state.hasError)
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.error,
//                         color: AppColors.errorNotStrong,
//                         size: 12.sp,
//                       ),
//                       Spacing.horizExtraTiny(),
//                       Text(
//                         state.errorText!,
//                         style: AppTextStyles.regular12.copyWith(
//                           color: AppColors.errorNotStrong,
//                         ),
//                       ),
//                     ],
//                   )
//               ],
//             )
//           ],
//         );
//       },
//     );
//   }

//   static InputDecoration kOutlineDecoration() => InputDecoration(
//         contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 13.w),
//         border: InputBorder.none,
//         enabledBorder: InputBorder.none,
//         disabledBorder: InputBorder.none,
//         focusedBorder: InputBorder.none,
//         labelStyle: AppTextStyles.medium14.copyWith(
//           color: AppColors.lightColor3,
//         ),
//         floatingLabelStyle: AppTextStyles.regular12.copyWith(
//           color: AppColors.lightColor3,
//         ),
//         hintStyle: AppTextStyles.medium14.copyWith(
//           color: AppColors.lightColor3,
//         ),
//       );
// }
