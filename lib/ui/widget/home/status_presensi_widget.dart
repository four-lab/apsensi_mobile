import 'package:flutter/material.dart';
import 'package:apsensi_mobile/shared/theme.dart';

Widget buildCardStatusPresensi() {
  return Container(
      width: double.infinity,
      height: 149,
      margin: const EdgeInsets.only(
        top: 26,
      ),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(
            'Presensi Saat Ini             Kamis, 07 Maret 2024',
            style: blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: bold,
            ),
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
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.infinity,
            height: 30,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff0099FF)),
              child: Text(
                'Check In',
                style: TextStyle(fontSize: 10, fontWeight: bold),
              ),
            ),
          ),
        ],
      ));
}
