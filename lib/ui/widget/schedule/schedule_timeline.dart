// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:apsensi_mobile/models/schedule.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScheduleTimeline extends StatelessWidget {
  final List<Schedule> scheduleList;
  const ScheduleTimeline({Key? key, required this.scheduleList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
      bottom: 35,
    ),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10)
        )
      ),
       child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align Column ke kiri
              children: [
                for (var schedule in scheduleList)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            schedule.startTime ?? '',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            ),
                          Text(
                            schedule.endTime ?? '',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFBCC1CD),
                            ),
                            ),
                        ],
                      ),
                      SizedBox(width: 8), // Menambahkan jarak horizontal antara waktu dan kartu
                      _buildCard(
                        schedule.bgColorActive,
                        schedule.bgColorInactive ?? Colors.transparent,
                        schedule.course ?? '',
                        schedule.subject ?? '',
                        schedule.room ?? '',
                        schedule.teacher ?? '',
                        schedule.pinIcon ?? Icons.location_on_outlined,
                        schedule.profileIcon ?? CupertinoIcons.profile_circled,
                        schedule.iconColorActive ?? Colors.white,
                        schedule.iconColorInactive ?? Colors.grey,
                        schedule.textColorActive ?? Colors.black,
                        schedule.textColorInactive ?? Colors.black,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
    Gradient? bgColorActive, 
    Color bgColorInactive, 
    String course, 
    String subject,
    String room, 
    String teacher, 
    IconData pinIcon, 
    IconData profileIcon, 
    Color iconColorActive, 
    Color iconColorInactive,
    Color textColorActive,
    Color textColorInactive,
  ) {
    // final Color iconColor = iconColorActive ?? iconColorInactive;

    // final Color textColor = bgColorActive != null ? textColorActiveInactive : textColorActiveInactive; // Gunakan warna teks yang sesuai dengan status aktif atau non-aktif


    final BoxDecoration decoration = BoxDecoration(
      color: bgColorActive != null ? null : bgColorInactive,
      gradient: bgColorActive,
      borderRadius: BorderRadius.circular(16),
    );

    return Expanded(
      child: Container(
        decoration: decoration,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              course,
                style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: bgColorActive != null ? textColorActive : textColorInactive, //color mengikuti active atau inactive
              ),
            ),
            SizedBox(height: 4),
            Text(
              subject,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: bgColorActive != null ? textColorActive : textColorInactive, //color mengikuti active atau inactive
              ),
            ),
            SizedBox(height: 15),
            Row( // Baris untuk pinIcon dan room
              children: [
                Icon(
                  pinIcon,
                  color: bgColorActive != null ? iconColorActive : iconColorInactive,
                  size: 16,
                ),
                SizedBox(width: 10),
                Text(
                  room,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: bgColorActive != null ? textColorActive : textColorInactive, //color mengikuti active atau inactive
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row( // Baris untuk profileIcon dan teacher
              children: [
                Icon(
                  profileIcon,
                  color: bgColorActive != null ? iconColorActive : iconColorInactive,
                  size: 16,
                ),
                SizedBox(width: 10),
                Text(
                  teacher,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: bgColorActive != null ? textColorActive : textColorInactive, //color mengikuti active atau inactive
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );  
  }
}