import 'package:flutter/material.dart';

import '../../main.dart';

class SignInButton extends StatelessWidget {
  final void Function() onPressed;

  const SignInButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Size.infinite.width,
      child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9.0))),
            backgroundColor: MaterialStateProperty.all(App.primaryAccent),
          ),
          onPressed: () => onPressed(),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
              "SIGN IN",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          )),
    );
  }
}

class GoogleSignInButton extends StatelessWidget {
  final void Function() onPressed;

  const GoogleSignInButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Size.infinite.width,
      child: ElevatedButton.icon(
        onPressed: () => onPressed(),
        icon: const FlutterLogo(),
        label: const Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          child: Text(
            "SIGN IN WITH GOOGLE",
            style: TextStyle(
                color: App.primaryAccent, fontWeight: FontWeight.w500),
          ),
        ),
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9.0))),
            elevation: MaterialStateProperty.all(0),
            side: MaterialStateProperty.all(
                const BorderSide(color: App.primaryAccent)),
            backgroundColor: MaterialStateProperty.all(Colors.white)),
      ),
    );
  }
}
