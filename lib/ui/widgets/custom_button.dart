import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.title,
    required this.backgroundColor,
    required this.onPress,
    this.isDisabled = false,
  });

  final Widget title;
  final Color backgroundColor;
  final Function onPress;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isDisabled ? Colors.grey : backgroundColor,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: isDisabled
                ? MaterialStateProperty.all(Colors.grey)
                : MaterialStateProperty.all(backgroundColor)),
        onPressed: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }

          if (!isDisabled) {
            onPress();
          }
          ;
        },
        child: title,
      ),
    );
  }
}
