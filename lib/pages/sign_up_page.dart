import "package:eat_sneakers/pages/widget/loading_button.dart";
import "package:eat_sneakers/providers/auth_provider.dart";
import "package:eat_sneakers/theme.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // const SignUpPage({super.key});
  final TextEditingController nameController = TextEditingController(text: '');

  final TextEditingController usernameController =
      TextEditingController(text: '');

  final TextEditingController emailController = TextEditingController(text: '');

  final TextEditingController passwordController =
      TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleSignUp() async {
      setState(() {
        isLoading = true;
      });
      if (await authProvider.register(
        name: nameController.text,
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
      )) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Sign Up Failed',
              style: primaryTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
      setState(() {
        isLoading = false;
      });
    }

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
                  controller: nameController,
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
                  controller: usernameController,
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
                  controller: emailController,
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
                  controller: passwordController,
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
            handleSignUp();
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
        margin: EdgeInsets.only(bottom: defaultMargin),
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
            isLoading ? LoadingButton() : signUpButton(),
            Spacer(),
            footer()
          ]),
        ),
      ),
    );
  }
}
