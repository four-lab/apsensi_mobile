import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Schedule {
  String? startTime;
  String? endTime;
  String? course;
  String? subject;
  String? room;
  String? teacher;
  // IconData pinIcon = Icons.location_on_outlined;
  IconData? pinIcon;
  // IconData profileIcon = CupertinoIcons.profile_circled;
  IconData? profileIcon;
  Color? iconColorActive;
  Color? iconColorInactive;
  Gradient? bgColorActive;
  // Color? bgColorActive;
  Color? bgColorInactive;
  Color? textColorActive;
  Color? textColorInactive;

  Schedule({
    this.startTime, 
    this.endTime, 
    this.course, 
    this.subject, 
    this.room,
    this.teacher, 
    this.pinIcon = Icons.location_on_outlined, 
    this.profileIcon = CupertinoIcons.profile_circled, 
    this.iconColorActive = Colors.white,
    this.iconColorInactive = Colors.grey, 
    this.bgColorActive, 
    this.bgColorInactive = Colors.white,
    this.textColorActive = Colors.white,
    this.textColorInactive = Colors.black,});
    
  static List<Schedule> generateSchedule() {
    var scheduleList = [
      Schedule( //value data schedule ke 1
        startTime: '10:30',
        endTime: '12:30',
        course: 'Science',
        subject: 'Physics',
        room: 'Room 102',
        teacher: 'Ms. Johnson',
        iconColorActive: Colors.white,
        textColorActive: Colors.white,
        bgColorActive: LinearGradient(
          begin: Alignment(0.00, -1.00),
          end: Alignment(0, 1),
          colors: [Color(0xFF66CCFF), Color(0xFF0099FF), Color(0xFF005B99)],
        ),
      ),
      Schedule( //value data schedule ke 2
        startTime: '13:00',
        endTime: '15:00',
        course: 'Biology',
        subject: 'Evolution',
        room: 'Room 103',
        teacher: 'Ms. William',
        iconColorInactive: Colors.grey,
        textColorInactive: Colors.black,
        bgColorInactive: Colors.white,
      ),
      Schedule( //value data schedule ke 3
        startTime: '15:00',
        endTime: '17:00',
        course: 'Sport',
        subject: 'Basketball',
        room: 'School Court',
        teacher: 'Mr. Lebron',
        iconColorInactive: Colors.grey,
        textColorInactive: Colors.black,
        bgColorInactive: Colors.white,
      ),
    ];
    scheduleList.sort((a, b) => a.startTime!.compareTo(b.startTime!));

  return scheduleList;
  }
}