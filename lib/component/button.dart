import 'package:blood/utils/resources/dimens.dart';
import 'package:flutter/material.dart';

enum _BloodButtonType {
  primary,
  secondary,
  outline,
  flat,
}

class BloodButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final _BloodButtonType _buttonType;
  final EdgeInsetsGeometry padding;
  final bool autoUnFocus;
  final Widget icon;
  final Size minSize;
  final bool capitalize;

  const BloodButton({
    Key key,
    @required this.buttonText,
    @required this.onPressed,
    this.padding = EdgeInsets.zero,
    this.autoUnFocus = true,
    this.icon,
    this.minSize = const Size(double.maxFinite, d_buttonHeight),
    this.capitalize = true,
  })  : _buttonType = _BloodButtonType.primary,
        super(key: key);

  const BloodButton.secondary({
    Key key,
    @required this.buttonText,
    @required this.onPressed,
    this.padding = EdgeInsets.zero,
    this.autoUnFocus = true,
    this.icon,
    this.minSize = const Size(double.maxFinite, d_buttonHeight),
    this.capitalize = true,
  })  : _buttonType = _BloodButtonType.secondary,
        super(key: key);

  const BloodButton.outline({
    Key key,
    @required this.buttonText,
    @required this.onPressed,
    this.padding = EdgeInsets.zero,
    this.autoUnFocus = true,
    this.icon,
    this.minSize = const Size(double.maxFinite, d_buttonHeight),
    this.capitalize = true,
  })  : _buttonType = _BloodButtonType.outline,
        super(key: key);

  const BloodButton.flat({
    Key key,
    @required this.buttonText,
    @required this.onPressed,
    this.padding = EdgeInsets.zero,
    this.autoUnFocus = true,
    this.icon,
    this.minSize = const Size(double.maxFinite, d_buttonHeight),
    this.capitalize = true,
  })  : _buttonType = _BloodButtonType.flat,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final _text = capitalize ? buttonText.toUpperCase() : buttonText;
    const textStyle = TextStyle(
      fontSize: 16 ,
      height: 1.5,
    );
   /* final textStyle = context.textTheme.button.copyWith(
      fontSize: 16.sp,
      height: 1.5,
    );*/
    final child = Text(
      _text,
//      style: context.textTheme.button.copyWith(color: context.color.primary),
    );
    final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(d_buttonRadius));
    return Builder(
      builder: (context) {
        switch (_buttonType) {
          case _BloodButtonType.primary:
            return ElevatedButton(
              onPressed: onPressed == null ? null : () => _onPressed(context),
              style: ElevatedButton.styleFrom(
                textStyle: textStyle,
                onPrimary: Colors.white,
                shape: shape,
                primary: Colors.red,
//                primary: context.color.primary,
//                shadowColor: context.color.surface.withOpacity(0.24),
                padding: padding,
                minimumSize: minSize,
              ),
              child: Text(_text),
            );
          case _BloodButtonType.secondary:
            return ElevatedButton(
              onPressed: onPressed == null ? null : () => _onPressed(context),
              style: ElevatedButton.styleFrom(
                textStyle: textStyle,
                onPrimary: Colors.red ,
                primary:  Colors.red ,
//                onPrimary: context.color.surface.shade100,
//                primary: context.color.surface.shade10,
                shape: shape,
//                shadowColor: context.color.surface.withOpacity(0.24),
                padding: padding,
                minimumSize: minSize,
              ),
              child: Text(_text),
            );
          case _BloodButtonType.outline:
            return OutlinedButton(
              onPressed: onPressed == null ? null : () => _onPressed(context),
              style: OutlinedButton.styleFrom(
//                textStyle: textStyle.copyWith(color: context.color.primary),
                side: BorderSide(color: Colors.red),
//                side: BorderSide(color: context.color.primary),
                shape: shape,
                padding: padding,
                minimumSize: minSize,
              ),
              child: child,
            );
          case _BloodButtonType.flat:
            return TextButtonTheme(
              data: TextButtonThemeData(
                style: TextButton.styleFrom(
//                  textStyle: context.textTheme.button.copyWith(color: context.color.primary),
                  padding: padding,
                  minimumSize: minSize,
                ),
              ),
              child: icon == null
                  ? TextButton(onPressed: onPressed == null ? null : () => _onPressed(context), child: child)
                  : TextButton.icon(onPressed: onPressed == null ? null : () => _onPressed(context), icon: icon, label: child),
            );
        }
        return const SizedBox();
      },
    );
  }

  void _onPressed(BuildContext context) {
    if (autoUnFocus) FocusScope.of(context).unfocus();
    onPressed();
  }
}

class BloodAction extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const BloodAction({
    Key key,
    @required this.onPressed,
    @required this.text,
  }) : super(key: key);

  const BloodAction.ok({
    Key key,
    @required this.onPressed,
  })  : text = 's_ok',
        super(key: key);

  const BloodAction.goBack({
    Key key,
    @required this.onPressed,
  })  : text = 's_goBack',
        super(key: key);

  const BloodAction.cancel({
    Key key,
    @required this.onPressed,
  })  : text = 's_cancel',
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      textColor: DefaultTextStyle.of(context).style.color,
      child: Text(text),
    );
  }
}
