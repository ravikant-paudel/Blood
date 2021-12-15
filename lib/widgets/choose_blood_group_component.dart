import 'package:blood/component/gaps.dart';
import 'package:blood/utils/resources/dimens.dart';
import 'package:blood/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:blood/utils/shortcuts.dart';

class ChooseBloodGroupComponent extends StatefulWidget {
  const ChooseBloodGroupComponent({Key? key, required this.onChanged}) : super(key: key);

  final ValueChanged<String?> onChanged;

  @override
  State<ChooseBloodGroupComponent> createState() => _ChooseBloodGroupComponentState();
}

class _ChooseBloodGroupComponentState extends State<ChooseBloodGroupComponent> {
  String? _bloodGroup;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BloodText(
              'Choose Blood Group',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: 14,
                  ),
            ),
            const VerticalGap(d_margin1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: d_margin2, vertical: d_margin1),
              child: ChooseBloodScope(
                groupValue: _bloodGroup,
                child: Wrap(
                  spacing: d_margin1,
                  crossAxisAlignment: WrapCrossAlignment.end,
                  children: [
                    for (final group in ['A+', 'A-'])
                      _Button(
                        value: group,
                        onChanged: (group) {
                          setState(() => _bloodGroup = group);
                          widget.onChanged(_bloodGroup);
                        },
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String value;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onChanged(value),
      child: Text(value),
      style: _style(context),
    );
  }

  ButtonStyle _style(BuildContext context) {
    if (value == ChooseBloodScope.of(context)) {
      return ElevatedButton.styleFrom(
        primary: Color(0xFFCB2C28),
        onPrimary: Colors.white,
      );
    }
    return ElevatedButton.styleFrom(
      primary: Color(0xFFEBEBEB),
      onPrimary: Color(0xFFC6C1C1),
    );
  }
}

class ChooseBloodScope extends InheritedWidget {
  const ChooseBloodScope({Key? key, required this.groupValue, required Widget child}) : super(key: key, child: child);

  final String? groupValue;

  static String? of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<ChooseBloodScope>();
    assert(scope != null, 'You forgot to wrap your widget with _ChooseBloodScope');
    return scope!.groupValue;
  }

  @override
  bool updateShouldNotify(ChooseBloodScope oldWidget) => oldWidget.groupValue != groupValue;
}
