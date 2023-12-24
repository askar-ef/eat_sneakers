import "package:eat_sneakers/theme.dart";
import "package:flutter/material.dart";

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Widget header() {
    return Container(
      margin: EdgeInsets.all(defaultMargin),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: defaultMargin),
            width: 64,
            height: 64,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/icon_profile_blue.png'),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Halo, Alex!',
                  style: primaryTextStyle.copyWith(
                      fontSize: 24, fontWeight: semibold),
                ),
                Text(
                  '@alexkein',
                  style: tertiaryTextStyle.copyWith(fontSize: 16),
                )
              ],
            ),
          ),
          Image.asset(
            'assets/icon_logout.png',
            width: 30,
          )
        ],
      ),
    );
  }

  Widget content() {
    return Container(
      margin: EdgeInsets.only(left: defaultMargin),
      child: Column(
        children: [
          Text(
            'Account',
            style:
                primaryTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Edit Profile',
              style: secondaryTextStyle.copyWith(fontSize: 12),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Edit Profile',
              style: secondaryTextStyle.copyWith(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [header(), content()],
      ),
    );
  }
}
