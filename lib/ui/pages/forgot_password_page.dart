import 'package:apsensi_mobile/ui/pages/login_page.dart';
import 'package:apsensi_mobile/ui/pages/otp_page.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class ForgotPage extends StatelessWidget {
  const ForgotPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    final _formKey = GlobalKey<FormState>();
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        gradient: background,
        
      ),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 31),
          children: [
            Container(
              width: 150,
              height: 47,
              margin: const EdgeInsets.only(
                top: 100,
                bottom: 10,
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
                top: 10,
                bottom: 10,
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
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // EMAIL INPUT UNTUK FORGOT PASSWORD
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
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!emailRegex.hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            // border: OutlineInputBorder(
                            //   borderRadius: BorderRadius.circular(14)
                            // ),
                            contentPadding: EdgeInsets.all(4),
                          ),
                          
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
                      child: TextButton( 
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.of(context).pop();
                            String enteredEmail = emailController.text;
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return OtpPage(email: enteredEmail);
                                },
                              ),
                            );
                          }
                        },
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
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
            height: 25,
            ),
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const LoginPage();
                      },
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back_ios_new_rounded, size: 15,),
                    const SizedBox(width: 8,),
                    Text(
                    "Kembali ke Login",
                    style: blackTextStyle,
                  ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
