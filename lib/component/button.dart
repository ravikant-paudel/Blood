import 'package:blood/utils/resources/dimens.dart';
import 'package:blood/widgets/text.dart';
import 'package:flutter/material.dart';

enum _BloodButtonType {
  primary,
  secondary,
  outline,
  flat,
  text,
}

class BloodButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final _BloodButtonType _buttonType;
  final EdgeInsetsGeometry padding;
  final bool autoUnFocus;
  final Widget? icon;

//  final double height;
  final double minWidth;

  const BloodButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(vertical: 14.0),
    this.autoUnFocus = true,
    this.icon,
//    this.height = d_buttonHeight,
    this.minWidth = double.infinity,
  })  : _buttonType = _BloodButtonType.primary,
        super(key: key);

  const BloodButton.secondary({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(vertical: 14.0),
    this.autoUnFocus = true,
    this.icon,
//    this.height = d_buttonHeight,
    this.minWidth = double.infinity,
  })  : _buttonType = _BloodButtonType.secondary,
        super(key: key);

  const BloodButton.outline({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(vertical: 14.0),
    this.autoUnFocus = true,
    this.icon,
//    this.height = d_buttonHeight,
    this.minWidth = double.infinity,
  })  : _buttonType = _BloodButtonType.outline,
        super(key: key);

  const BloodButton.flat({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(vertical: 14.0),
    this.autoUnFocus = true,
    this.icon,
//    this.height = d_buttonHeight,
    this.minWidth = double.infinity,
  })  : _buttonType = _BloodButtonType.flat,
        super(key: key);

  const BloodButton.text({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.padding = EdgeInsets.zero,
    this.autoUnFocus = false,
    this.icon,
//    this.height = d_buttonHeight,
    this.minWidth = double.infinity,
  })  : _buttonType = _BloodButtonType.text,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = BloodText(
      buttonText,
      style: Theme.of(context).textTheme.button!.copyWith(
            color: Colors.white,
          ),
    );
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(80),
    );
    return ButtonTheme(
//      height: height,
      minWidth: minWidth,
      padding: padding,
      child: Builder(
        builder: (context) {
          switch (_buttonType) {
            case _BloodButtonType.primary:
              return MaterialButton(
                onPressed: () => _onPressed(context),
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                shape: shape,
                child: BloodText(buttonText),
              );
            case _BloodButtonType.secondary:
              return MaterialButton(
                onPressed: () => _onPressed(context),
                textColor: Colors.white,
                shape: shape,
                child: BloodText(buttonText),
              );
            case _BloodButtonType.outline:
              return OutlinedButton(
                onPressed: () => _onPressed(context),
                child: child,
              );
            case _BloodButtonType.flat:
              return icon == null
                  ? TextButton(
                      onPressed: () => _onPressed(context),
                      child: child,
                    )
                  : TextButton.icon(
                      onPressed: () => _onPressed(context),
                      icon: ConstrainedBox(constraints: const BoxConstraints(maxWidth: d_iconMedium), child: icon!),
                      label: child,
                    );
            case _BloodButtonType.text:
              return GestureDetector(
                onTap: () => _onPressed(context),
                child: Padding(
                  padding: padding,
                  child: child,
                ),
              );
          }
        },
      ),
    );
  }

  void _onPressed(BuildContext context) {
    if (autoUnFocus) FocusScope.of(context).unfocus();
    onPressed!();
  }
}

class BloodAction extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const BloodAction({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
