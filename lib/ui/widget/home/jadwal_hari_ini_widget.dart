import 'package:flutter/material.dart';
import 'package:apsensi_mobile/shared/theme.dart';

Widget buildCardJadwalHariIni() {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.only(
      top: 26,
    ),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Jadwal Hari Ini',
          style: blackTextStyle.copyWith(
            fontSize: 12,
            fontWeight: extrabold,
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                'Kimia',
                style: blackTextStyle.copyWith(
                  fontSize: 10,
                  fontWeight: bold,
                ),
              ),
            ),
            Expanded(
              child: Text(
                'XII BD-2',
                style: blackTextStyle.copyWith(
                  fontSize: 10,
                  fontWeight: bold,
                ),
              ),
            ),
            Expanded(
              child: Text(
                '09.30-11.00 WIB',
                style: blackTextStyle.copyWith(
                  fontSize: 10,
                  fontWeight: bold,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                'Bimbingan Karir',
                style: blackTextStyle.copyWith(
                  fontSize: 10,
                  fontWeight: bold,
                ),
              ),
            ),
            Expanded(
              child: Text(
                'X AKL-2',
                style: blackTextStyle.copyWith(
                  fontSize: 10,
                  fontWeight: bold,
                ),
              ),
            ),
            Expanded(
              child: Text(
                '12:30 - 14:00 WIB',
                style: blackTextStyle.copyWith(
                  fontSize: 10,
                  fontWeight: bold,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
