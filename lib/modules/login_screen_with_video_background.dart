import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_reference_in_flutter/main.dart';
import 'package:video_player/video_player.dart';

class LoginScreenWithVideoBackground extends StatefulWidget {
  const LoginScreenWithVideoBackground({Key? key}) : super(key: key);

  @override
  State<LoginScreenWithVideoBackground> createState() =>
      _LoginScreenWithVideoBackgroundState();
}

class _LoginScreenWithVideoBackgroundState
    extends State<LoginScreenWithVideoBackground> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset('assets/videos/video2.mp4')
      ..initialize().then((_) {
        controller.play();
        controller.setLooping(true);

        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.fill,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: 3,
                    sigmaY: 3,
                  ),
                  child: VideoPlayer(controller)),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Form(
              child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.ac_unit_outlined , color: Color(0xff8CBBF1),size: 40,),
                      Text(
                        'MyApp Logo',
                        style: GoogleFonts.gloriaHallelujah(
                          textStyle: const TextStyle(
                              fontSize: 40 ,
                              color: Color(0xff8CBBF1),
                              fontWeight: FontWeight.w700,
                          )
                        )
                      ),
                    ],
                  ),
                  const SizedBox(height: 100),
                  TextFormField(
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      labelStyle: const TextStyle(
                          color: Colors.white60, fontSize: 16, letterSpacing: 1),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.transparent.withAlpha(120),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: CircleAvatar(
                            backgroundColor: Colors.white.withAlpha(24),
                            child: const Icon(
                              Icons.email_outlined,
                              color: Color(0xff8CBBF1),
                            )),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 8,),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: const TextStyle(
                          color: Colors.white60, fontSize: 16, letterSpacing: 1),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.transparent.withAlpha(120),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: CircleAvatar(
                            backgroundColor: Colors.white.withAlpha(24),
                            child: const Icon(
                              Icons.lock_open,
                              color: Color(0xff8CBBF1),
                            )),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: CircleAvatar(
                            backgroundColor: Colors.white.withAlpha(24),
                            child: const Icon(Icons.visibility_off , color: Colors.white38,),
                        ),


                      )
                      
                      
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 8,),
                  MaterialButton(
                    minWidth: double.infinity,
                    color: const Color(0xff8CBBF1),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    onPressed: () { },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                      child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white60 , fontSize: 19)
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                    child: Divider(
                      color: Colors.black54,
                      thickness: 1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account ? ',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17 , color: Colors.white60)
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MyHomePage())
                            );
                          },
                          child: const Text(
                              'Register',
                              style: TextStyle(fontSize: 17 , color: Color(0xff8CBBF1))
                          )),
                    ],
                  ),

            ])),
          ),
        )
    )
      ],
    );
  }
}
