import 'package:apsensi_mobile/ui/pages/login_page.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();

    final _formKey = GlobalKey<FormState>();
    final RegExp passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$');

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
              'Buat Password Baru',
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
              'Password wajib terdiri dari minimal 8 karakter meliputi 1 huruf kapital, 1 huruf kecil, 1 angka dan 1 simbol.',
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: superlight,
              ),
            ),
            const SizedBox(
              height: 20,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Password Baru',
                        style: blackTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a Password';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }
                          if (!passwordRegex.hasMatch(value)) {
                            return 'Password must contain at least 1 uppercase letter, 1 lowercase letter, 1 digit, and 1 special character';
                          }
                          return null;
                        },
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
                    child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginPage();
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
                  )
                ],
              ),

              ),
            )
          ],
        ),
      ),
    );
  }
}
