import 'package:flutter/material.dart';
import 'package:apsensi_mobile/shared/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Container(
        // decoration: BoxDecoration(
        //   gradient: background,
        // ),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/home/profil_picture.png'),
                    ),
                  ),
                  SizedBox(width: 20),
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello,",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: buttonDisableColor, // seharusnya whiteColor, itu hanya untuk lihat hasilnya
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Ahmad Irsyadul Ibad",
                          style: TextStyle(
                            fontSize: 16,
                            color: buttonDisableColor, // seharusnya whiteColor, itu hanya untuk lihat hasilnya
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.home),
        backgroundColor: buttonActiveColor,
        foregroundColor: whiteColor,
        elevation: 0,
        shape: CircleBorder(),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5.0,
        shape: CircularNotchedRectangle(),
        color: whiteColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.calendar_month_outlined,
                    color: buttonDisableColor,
                  ),
                  Text(
                    "Kalender",
                    style: greyTextStyle,
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 20.0, top: 10.0, bottom: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.book_outlined,
                    color: buttonDisableColor,
                  ),
                  Text(
                    "Jadwal",
                    style: greyTextStyle,
                  )
                ],
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0), // adjust padding
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.boy,
                    color: buttonDisableColor,
                  ),
                  Text(
                    "Presensi",
                    style: greyTextStyle,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.document_scanner_outlined,
                    color: buttonDisableColor,
                  ),
                  Text(
                    "Perizinan",
                    style: greyTextStyle,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
