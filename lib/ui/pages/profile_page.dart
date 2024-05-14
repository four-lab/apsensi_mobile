import 'package:apsensi_mobile/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Profile',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              fotoprofil(),
              nama(),
              boxprofile(),
              nextProfile(),
              editButton(),
            ],
          ),
        ),
      ),
    ); 
  }
}

Widget fotoprofil() {
  return CircleAvatar(
    radius: 50,
    backgroundImage: AssetImage('assets/profile/user.png'),
  );
}

Widget nama(){
  return Column(
    children: [
      SizedBox(height: 20),
      Text(
        'Ahmad Irsyadul Ibad',
        style: blackTextStyle.copyWith(
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
      ),
      SizedBox( height: 20,),
      Text(
        'ahmadirsyadulibad7@gmail.com',
        style: greyTextStyle.copyWith(
          decoration: TextDecoration.underline,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      SizedBox(height: 20,)
    ],
  );
}

Widget boxprofile(){
  return Container(
    child: Card(
      color: buttonActiveColor,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'NIK',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    '3456245678',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Jabatan',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Guru',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Sekolah',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'SMK Trunojoyo Jember',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget nextProfile(){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 8),
    child: Column(
      children: [
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'NIK',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  '3456245678',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Jabatan',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Guru',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Sekolah',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'SMK Trunojoyo Jember',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Alamat',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'RT. 001, RW. 005, Rejosari, Tembokrejo, Gumukmas, Jember',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20,)
            ],
          )
        ),
      ],
    ),
  );
}

Widget editButton(){
  return SizedBox(
    width: double.infinity,
    height: 50,
    child: TextButton(
      onPressed: () {
        // Fungsi yang akan dijalankan saat tombol ditekan
      },
      style: TextButton.styleFrom(
        backgroundColor: buttonActiveColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.edit, color: Colors.white),
          SizedBox(width: 8),
          Text(
            'Edit Profile',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semibold,
            ),
          ),
        ],
      ),
    ),
  );
}