import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key? key,
    required this.text,
    required this.color,
    required this.press,
    required this.icon, required this.size, required this.align,
  }) : super(key: key);

  final String text;
  final Color color;
  final VoidCallback press;
  final Icon icon;
  final Size size;
  final Alignment align;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ElevatedButton.icon(
        icon: icon,
        onPressed: press,
        label: Text(text),
        style: ElevatedButton.styleFrom(
            alignment: align,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            primary: color,
            shape: StadiumBorder()),
      ),
    );
  }
}
