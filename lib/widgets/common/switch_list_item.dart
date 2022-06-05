import 'package:flutter/material.dart';

class SwitchListItem extends StatefulWidget {
  final String title;
  final String? subtitle;
  final void Function(bool checked) onSwitch;
  final bool checked;

  const SwitchListItem(
      {Key? key,
      required this.title,
      this.subtitle,
      required this.onSwitch,
      required this.checked})
      : super(key: key);

  @override
  State<SwitchListItem> createState() => _SwitchListItemState();
}

class _SwitchListItemState extends State<SwitchListItem> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      value: widget.checked,
      onChanged: (value) => setState(() {
        widget.onSwitch(value);
      }),
      title: Text(widget.title),
      subtitle: widget.subtitle == null ? null : Text(widget.subtitle!),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      activeColor: Theme.of(context).primaryColorDark,
    );
  }
}
