import 'package:eat_sneakers/theme.dart';
import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(primaryTextColor),
              ),
              width: 16,
              height: 16,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Loading',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
          ],
        ),
      ),
    );
  }
}
