import 'package:anymex/controllers/settings/methods.dart';
import 'package:anymex/widgets/common/glow.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String) onSubmitted;
  final Function(String)? onChanged;
  final VoidCallback? onPrefixIconPressed;
  final VoidCallback? onSuffixIconPressed;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final Widget? suffixWidget;
  final bool disableIcons;
  final String hintText;

  const CustomSearchBar({
    super.key,
    this.controller,
    required this.onSubmitted,
    this.onChanged,
    this.onPrefixIconPressed,
    this.onSuffixIconPressed,
    this.prefixIcon = IconlyLight.search,
    this.suffixIcon = IconlyLight.filter,
    this.disableIcons = false,
    this.hintText = 'Search...',
    this.suffixWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      decoration: BoxDecoration(boxShadow: [lightGlowingShadow(context)]),
      child: TextField(
        controller: controller,
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor:
              Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.5),
          prefixIcon: IconButton(
            icon: Icon(prefixIcon),
            onPressed: onPrefixIconPressed,
          ),
          suffix: suffixWidget,
          suffixIcon: disableIcons
              ? null
              : IconButton(
                  icon: Icon(suffixIcon),
                  onPressed: onSuffixIconPressed,
                ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.multiplyRadius()),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondaryContainer,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.multiplyRadius()),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondaryContainer,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
