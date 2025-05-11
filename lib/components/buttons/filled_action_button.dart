import 'package:flutter/material.dart';

class FilledActionButton extends StatefulWidget {
  final String text;
  final double width, height;
  final VoidCallback onPressedAction;
  final MaterialColor color;

  const FilledActionButton(this.text, this.width, this.height, this.color, this.onPressedAction, {super.key});

  @override
  State<FilledActionButton> createState() => _FilledActionButtonState();
}

class _FilledActionButtonState extends State<FilledActionButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.height,
        width: widget.width,
        child: FilledButton(
          onPressed: widget.onPressedAction,
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(widget.color)
          ),
          child: Text(
              widget.text,
              style: TextStyle(
                fontSize: 20,
              )
          ),
        )
    );
  }
}


