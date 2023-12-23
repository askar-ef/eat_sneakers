import "package:eat_sneakers/theme.dart";
import "package:flutter/material.dart";

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign Up',
              style: secondaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semibold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Register and Happy Shopping',
              style: tertiaryTextStyle,
            ),
          ],
        ),
      );
    }

    Widget fullnameInput() {
      return Container(
        margin: EdgeInsets.only(top: 40),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Full Name',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: backgroundColor2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
                child: Row(
              children: [
                Image.asset(
                  'assets/icon_fullname.png',
                  width: 20,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: TextFormField(
                  style: primaryTextStyle,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Your Full Name', hintStyle: tertiaryTextStyle),
                )),
              ],
            )),
          ),
        ]),
      );
    }

    Widget usernameInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Username',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: backgroundColor2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
                child: Row(
              children: [
                Image.asset(
                  'assets/icon_username.png',
                  width: 20,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: TextFormField(
                  style: primaryTextStyle,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Your Username', hintStyle: tertiaryTextStyle),
                )),
              ],
            )),
          ),
        ]),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Email Address',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: backgroundColor2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
                child: Row(
              children: [
                Image.asset(
                  'assets/icon_email.png',
                  width: 20,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: TextFormField(
                  style: primaryTextStyle,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Your Email', hintStyle: tertiaryTextStyle),
                )),
              ],
            )),
          ),
        ]),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Password',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: backgroundColor2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
                child: Row(
              children: [
                Image.asset(
                  'assets/icon_password.png',
                  width: 17,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: TextFormField(
                  obscureText: true,
                  style: primaryTextStyle,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Password', hintStyle: tertiaryTextStyle),
                )),
              ],
            )),
          ),
        ]),
      );
    }

    Widget signUpButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/sign-in');
          },
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )),
          child: Text(
            'Sign Up',
            style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Already have an account?',
            style: secondaryTextStyle.copyWith(fontSize: 14),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/sign-in');
            },
            child: Text(
              ' Sign In',
              style: TextStyle(
                color: primaryColor,
                fontSize: 14,
                fontWeight: bold,
              ),
            ),
          ),
        ]),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            header(),
            fullnameInput(),
            usernameInput(),
            emailInput(),
            passwordInput(),
            signUpButton(),
            Spacer(),
            footer()
          ]),
        ),
      ),
    );
  }
}
