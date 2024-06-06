import 'package:flutter/material.dart';
import 'package:apsensi_mobile/shared/theme.dart';
import 'package:intl/intl.dart';

Widget buildCardStatusPresensi(BuildContext context) {
  String currentDate =
      DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(DateTime.now());

  return Container(
    width: double.infinity,
    height: 160,
    margin: const EdgeInsets.only(
      top: 26,
      left: 16,
      right: 16,
    ),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Presensi Saat Ini',
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: extrabold,
              ),
            ),
            Text(
              currentDate,
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: extrabold,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 7,
        ),
        Text(
          '09.30-11.00',
          style: blackTextStyle.copyWith(
            fontSize: 19,
            fontWeight: bold,
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Text(
          'Kimia',
          style: blackTextStyle.copyWith(
            fontSize: 13,
            fontWeight: bold,
          ),
        ),
        Spacer(),
        SizedBox(
          width: double.infinity,
          height: 30,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff0099FF),
            ),
            child: Text(
              'Check In',
              style: TextStyle(
                fontSize: 10,
                fontWeight: bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
