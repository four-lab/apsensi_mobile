import 'package:flutter/material.dart';
import 'package:apsensi_mobile/shared/theme.dart';
import 'package:apsensi_mobile/ui/pages/profile_page.dart';

Widget buildProfile(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(
      top: 40,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello,',
              style: whiteTextStyle.copyWith(
                fontSize: 19,
                fontWeight: bold,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              'Irsyadul Ibad',
              style: whiteTextStyle.copyWith(
                fontSize: 19,
                fontWeight: bold,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              '3456245678',
              style: whiteTextStyle.copyWith(
                fontSize: 10,
                fontWeight: semibold,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfilePage()));
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('assets/home/profil_picture.png')),
            ),
          ),
        )
      ],
    ),
  );
}
