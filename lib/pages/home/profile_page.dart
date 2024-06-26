import "package:eat_sneakers/models/user_model.dart";
import "package:eat_sneakers/providers/auth_provider.dart";
import "package:eat_sneakers/theme.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
            right: defaultMargin,
            top: defaultMargin,
            left: defaultMargin,
            bottom: 15),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: defaultMargin),
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(user.profilePhotoUrl),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Halo, ${user.name}!',
                    style: primaryTextStyle.copyWith(
                        fontSize: 24, fontWeight: semibold),
                  ),
                  Text(
                    '@${user.username}',
                    style: tertiaryTextStyle.copyWith(fontSize: 16),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/sign-in', (route) => false);
              },
              child: Image.asset(
                'assets/icon_logout.png',
                width: 30,
              ),
            )
          ],
        ),
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: secondaryTextStyle.copyWith(fontSize: 13),
              ),
              Icon(
                Icons.chevron_right,
                color: secondaryTextColor,
              )
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor3,
          padding: EdgeInsets.only(
              left: defaultMargin, top: defaultMargin, right: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Account',
                style: primaryTextStyle.copyWith(
                    fontSize: 16, fontWeight: semibold),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/edit-profile');
                  },
                  child: menuItem('Edit Profile')),
              menuItem('Your Orders'),
              menuItem('Help'),
              SizedBox(height: 30),
              Text(
                'General',
                style: primaryTextStyle.copyWith(
                    fontSize: 16, fontWeight: semibold),
              ),
              menuItem('Privacy and Policy'),
              menuItem('Term of Service'),
              menuItem('Rate App'),
            ],
          ),
        ),
      );
    }

    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [header(), content()],
      ),
    );
  }
}
