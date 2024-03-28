import 'package:apsensi_mobile/ui/pages/forgot_password_page.dart';
import 'package:apsensi_mobile/ui/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:apsensi_mobile/shared/theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
          Text(
            textAlign: TextAlign.center,
            'Login',
            style: blackTextStyle.copyWith(
              fontSize: 27,
              fontWeight: black,
            ),
          ),
          const SizedBox(
            height: 30,
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

                // PASSWORD INPUT

                const SizedBox(
                  height: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Password',
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          // border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(14)
                          // ),
                          contentPadding: EdgeInsets.all(4)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const ForgotPage();
                        },
                      ),
                    );
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot Password?",
                      style: blueTextStyle,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 8,
                ),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      // Navigator.of(context).pop();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const HomePage();
                          },
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: buttonActiveColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(56),
                      ),
                    ),
                    child: Text(
                      'Login',
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
