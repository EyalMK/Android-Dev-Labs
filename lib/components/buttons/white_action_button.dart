import 'package:flutter/material.dart';

class WhiteActionButton extends StatefulWidget {
  final String text;
  final double width, height;
  final VoidCallback onPressedAction;

  const WhiteActionButton(this.text, this.width, this.height, this.onPressedAction, {super.key});

  @override
  State<WhiteActionButton> createState() => _WhiteActionButtonState();
}

class _WhiteActionButtonState extends State<WhiteActionButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.height,
        width: widget.width,
        child: OutlinedButton(
          onPressed: widget.onPressedAction,
          child: Text(
              widget.text,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black
              )
          ),
        )
    );
  }
}


