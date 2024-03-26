import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class ForgotPage extends StatelessWidget {
  const ForgotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 31),
        children: [
          Container(
            width: 150,
            height: 47,
            margin: const EdgeInsets.only(
              top: 100,
              bottom: 100,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/login/logo_title.png'),
              ),
            ),
          ),
          Container(
            width: 150,
            height: 47,
            margin: const EdgeInsets.only(
              top: 20,
              bottom: 100,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/login/logo_forgot.png'),
              ),
            ),
          ),
          Text(
            textAlign: TextAlign.center,
            'Lupa Password',
            style: blackTextStyle.copyWith(
              fontSize: 27,
              fontWeight: black,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            textAlign: TextAlign.center,
            'Jangan khawatir, kami akan mengirimkan petunjuk penyetelan ulang sandi kepada Anda.',
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: superlight,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            textAlign: TextAlign.left,
            '*Pastikan email yang anda masukkan aktif',
            style: blackTextStyle.copyWith(
              fontSize: 11,
              fontWeight: superlight,
              color: Colors.red
            ),
          ),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // EMAIL INPUT

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(14)
                        // ),
                          contentPadding: EdgeInsets.all(4)),
                    )
                  ],
                ),


                const SizedBox(
                  height: 8,
                ),

                const SizedBox(
                  height: 8,
                ),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(56),
                      ),
                    ),
                    child: Text(
                      'Confirm',
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semibold,
                      ),
                    ),
                  ),
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
