// import 'package:flutter/material.dart';
//
// void main() => runApp(MaterialApp(
//   home: FancyAuthScreen(),
//   debugShowCheckedModeBanner: false,
// ));
//
// class FancyAuthScreen extends StatefulWidget {
//   const FancyAuthScreen({super.key});
//
//   @override
//   FancyAuthScreenState createState() => FancyAuthScreenState();
// }
//
// class FancyAuthScreenState extends State<FancyAuthScreen> with SingleTickerProviderStateMixin {
//   bool showLogin = false; // Start with signup shown, adjust as desired
//
//   late AnimationController _controller;
//
//   // Animations for the login form
//   late Animation<double> _loginOffsetX;
//   late Animation<double> _loginOffsetY;
//   late Animation<Color?> _loginBackgroundColor;
//
//   // Animations for the signup form
//   late Animation<double> _signupOffsetX;
//   late Animation<double> _signupOffsetY;
//   late Animation<double> _signupScaleY;
//   late Animation<Color?> _signupBackgroundColor;
//
//   final Duration _duration = const Duration(milliseconds: 300);
//   final Color _mainBgColor = const Color(0xFF2b3350); // Dark background
//   final Color _accentGreen = const Color(0xFFA7E245);
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(vsync: this, duration: _duration);
//
//     // If showLogin = false => Signup visible (controller=0)
//     // If showLogin = true => Login visible (controller=1)
//
//     _loginOffsetX = Tween<double>(begin: 0.40, end: 0.35).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );
//     _loginOffsetY = Tween<double>(begin: 10.0, end: -20.0).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );
//     _loginBackgroundColor = ColorTween(
//       begin: const Color(0xFFD7E7F1),
//       end: Colors.white,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
//
//     _signupOffsetX = Tween<double>(begin: -0.35, end: -0.40).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );
//     _signupOffsetY = Tween<double>(begin: -20.0, end: 10.0).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );
//     _signupScaleY = Tween<double>(begin: 1.0, end: 0.8).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );
//     _signupBackgroundColor = ColorTween(
//       begin: Colors.white,
//       end: const Color(0xFFD7E7F1),
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
//
//     // Start with signup shown
//     _controller.value = 0.0;
//   }
//
//   void _toggleForms(bool login) {
//     setState(() {
//       showLogin = login;
//       if (showLogin) {
//         _controller.forward();
//       } else {
//         _controller.reverse();
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final containerWidth = 300.0;
//
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         color: _mainBgColor,
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 const SizedBox(height: 50),
//                 Text(
//                   'Login & Signup Forms',
//                   style: TextStyle(
//                     fontSize: 24,
//                     letterSpacing: 1,
//                     color: Colors.white.withOpacity(0.9),
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 // Tabs row
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     _buildTabButton("LOGIN", showLogin, () => _toggleForms(true)),
//                     SizedBox(width: 40),
//                     _buildTabButton("SIGN UP", !showLogin, () => _toggleForms(false)),
//                   ],
//                 ),
//                 const SizedBox(height: 40),
//                 SizedBox(
//                   width: containerWidth,
//                   height: 370,
//                   child: AnimatedBuilder(
//                     animation: _controller,
//                     builder: (context, child) {
//                       final loginDx = _loginOffsetX.value * containerWidth;
//                       final loginDy = _loginOffsetY.value;
//                       final loginBg = _loginBackgroundColor.value ?? Colors.white;
//
//                       final signupDx = _signupOffsetX.value * containerWidth;
//                       final signupDy = _signupOffsetY.value;
//                       final signupScale = _signupScaleY.value;
//                       final signupBg = _signupBackgroundColor.value ?? Colors.white;
//
//                       return Stack(
//                         alignment: Alignment.topCenter,
//                         children: [
//                           // Signup form behind when login is shown
//                           Positioned.fill(
//                             child: Transform(
//                               transform: Matrix4.identity()
//                                 ..translate(signupDx, signupDy)
//                                 ..scale(1.0, signupScale),
//                               origin: Offset(containerWidth / 2, 0),
//                               child: Container(
//                                 width: containerWidth,
//                                 decoration: BoxDecoration(
//                                   color: signupBg,
//                                   borderRadius: BorderRadius.circular(5),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.black26,
//                                       blurRadius: 10,
//                                       offset: Offset(0, 5),
//                                     ),
//                                   ],
//                                 ),
//                                 padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
//                                 child: Opacity(
//                                   opacity: showLogin ? (1 - _controller.value) : 1.0,
//                                   child: _buildSignupForm(),
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                           // Login form on top when login is shown
//                           Positioned.fill(
//                             child: Transform(
//                               transform: Matrix4.identity()
//                                 ..translate(loginDx, loginDy),
//                               origin: Offset(containerWidth / 2, 0),
//                               child: Container(
//                                 width: containerWidth,
//                                 decoration: BoxDecoration(
//                                   color: loginBg,
//                                   borderRadius: BorderRadius.circular(5),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.black26,
//                                       blurRadius: 10,
//                                       offset: Offset(0, 5),
//                                     ),
//                                   ],
//                                 ),
//                                 padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
//                                 child: Opacity(
//                                   opacity: showLogin ? 1.0 : _controller.value,
//                                   child: _buildLoginForm(),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 80),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTabButton(String label, bool active, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Column(
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: 16,
//               letterSpacing: 0.5,
//               color: active ? Colors.white : Colors.grey[400],
//               fontWeight: active ? FontWeight.bold : FontWeight.normal,
//             ),
//           ),
//           const SizedBox(height: 5),
//           Container(
//             width: 60,
//             height: 2,
//             color: active ? Colors.white : Colors.transparent,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildLoginForm() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         const Text(
//           'Login',
//           style: TextStyle(
//             fontSize: 22,
//             color: Colors.black87,
//             fontWeight: FontWeight.bold,
//           ),
//           textAlign: TextAlign.center,
//         ),
//         const SizedBox(height: 30),
//         _buildInputField(label: 'Username'),
//         _buildInputField(label: 'E-mail'),
//         _buildInputField(label: 'Password', obscureText: true),
//         const SizedBox(height: 30),
//         ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.black87,
//             minimumSize: const Size(120, 40),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(25),
//             ),
//           ),
//           onPressed: () {},
//           child: const Text(
//             'Login',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildSignupForm() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         const Text(
//           'Sign Up',
//           style: TextStyle(
//             fontSize: 22,
//             color: Colors.black87,
//             fontWeight: FontWeight.bold,
//           ),
//           textAlign: TextAlign.center,
//         ),
//         const SizedBox(height: 30),
//         _buildInputField(label: 'Username'),
//         _buildInputField(label: 'E-mail'),
//         _buildInputField(label: 'Password', obscureText: true),
//         const SizedBox(height: 30),
//         ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.white,
//             side: BorderSide(color: _accentGreen, width: 2),
//             minimumSize: const Size(120, 40),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(25),
//             ),
//           ),
//           onPressed: () {},
//           child: Text(
//             'Sign Up',
//             style: TextStyle(
//               color: _accentGreen,
//               fontSize: 18,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildInputField({required String label, bool obscureText = false}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(fontSize: 14, color: Color(0xFFA1B4B4)),
//         ),
//         const SizedBox(height: 8),
//         TextField(
//           obscureText: obscureText,
//           decoration: InputDecoration(
//             filled: true,
//             fillColor: const Color(0xFFEEF9FE),
//             contentPadding: const EdgeInsets.symmetric(horizontal: 15),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(2),
//               borderSide: const BorderSide(
//                 color: Color(0xFFCDDBEF),
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 20),
//       ],
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

import 'dart:ui';

import 'package:flutter/material.dart';



class FancyAuthScreen extends StatefulWidget {
  @override
  FancyAuthScreenState createState() => FancyAuthScreenState();
}

class FancyAuthScreenState extends State<FancyAuthScreen> with SingleTickerProviderStateMixin {
  bool showLogin = true; // Start with login shown

  late AnimationController _controller;
  final Duration _duration = const Duration(milliseconds: 300);
  final Color _mainBgColor = const Color(0xFF2b3350);
  final Color _accentGreen = const Color(0xFFA7E245);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);
    // If showLogin is true, we set the controller to 1.0 (login front)
    // If showLogin is false, we set the controller to 0.0 (signup front)
    _controller.value = showLogin ? 1.0 : 0.0;
  }

  void _toggleForms(bool login) {
    setState(() {
      showLogin = login;
      if (showLogin) {
        _controller.forward(); // Animate towards login front
      } else {
        _controller.reverse(); // Animate towards signup front
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final containerWidth = 300.0;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: _mainBgColor,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Text(
                  'Login & Signup Forms',
                  style: TextStyle(
                    fontSize: 24,
                    letterSpacing: 1,
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                // Tabs row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTabButton("LOGIN", showLogin, () => _toggleForms(true)),
                    const SizedBox(width: 40),
                    _buildTabButton("SIGN UP", !showLogin, () => _toggleForms(false)),
                  ],
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: containerWidth,
                  height: 370,
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      // controller.value = t in [0,1]
                      // t=1: login front, t=0: signup front

                      // Positions and scaling based on t:
                      // When login front (t=1):
                      //   login: near left (-0.2), y slightly up (-20), scale=1.0
                      //   signup: far right (+0.8), y=+10, scale=0.8
                      // When signup front (t=0):
                      //   signup: near right (+0.2), y=-20, scale=1.0
                      //   login: far left (-0.8), y=+10, scale=0.8

                      double t = _controller.value;
                      // Interpolate values for login form
                      double loginX = lerpDouble(-0.8, -0.2, t)!;
                      double loginY = lerpDouble(10.0, -20.0, t)!;
                      double loginScale = lerpDouble(0.8, 1.0, t)!;
                      Color loginBg = Color.lerp(const Color(0xFFD7E7F1), Colors.white, t)!;

                      // Interpolate values for signup form
                      double signupX = lerpDouble(0.35, 0.8, t)!;
                      double signupY = lerpDouble(-20.0, 10.0, t)!;
                      double signupScale = lerpDouble(1.0, 0.8, t)!;
                      Color signupBg = Color.lerp(Colors.white, const Color(0xFFD7E7F1), t)!;

                      // If showLogin = true, login is front, signup behind
                      // If showLogin = false, signup is front, login behind
                      // We can reorder stack children based on showLogin:
                      Widget behindForm, frontForm;

                      if (showLogin) {
                        // Login front
                        behindForm = _buildPositionedForm(
                          x: signupX,
                          y: signupY,
                          scale: signupScale,
                          width: containerWidth,
                          color: signupBg,
                          child: Opacity(
                            opacity: 1.0 - t,
                            child: _buildSignupForm(),
                          ),
                        );

                        frontForm = _buildPositionedForm(
                          x: loginX,
                          y: loginY,
                          scale: loginScale,
                          width: containerWidth,
                          color: loginBg,
                          child: Opacity(
                            opacity: t,
                            child: _buildLoginForm(),
                          ),
                        );
                      } else {
                        // Signup front
                        behindForm = _buildPositionedForm(
                          x: loginX,
                          y: loginY,
                          scale: loginScale,
                          width: containerWidth,
                          color: loginBg,
                          child: Opacity(
                            opacity: t,
                            child: _buildLoginForm(),
                          ),
                        );

                        frontForm = _buildPositionedForm(
                          x: lerpDouble(0.35,0.2,1-t)!, // Adjust to center it a bit more nicely
                          y: lerpDouble(-20.0,-20.0,1-t)!,
                          scale: lerpDouble(1.0,1.0,1-t)!,
                          width: containerWidth,
                          color: signupBg,
                          child: Opacity(
                            opacity: 1.0 - (1.0 - t),
                            child: _buildSignupForm(),
                          ),
                        );
                        // Actually, for signup front, we already have signupX,
                        // let's just reuse them for simplicity:
                        double sX = lerpDouble(0.35,0.2,t)!;
                        double sY = -20.0;
                        double sScale = 1.0;
                        frontForm = _buildPositionedForm(
                          x: sX,
                          y: sY,
                          scale: sScale,
                          width: containerWidth,
                          color: signupBg,
                          child: _buildSignupForm(),
                        );
                      }

                      return Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          behindForm,
                          frontForm,
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPositionedForm({
    required double x,
    required double y,
    required double scale,
    required double width,
    required Color color,
    required Widget child,
  }) {
    return Positioned.fill(
      child: Transform(
        transform: Matrix4.identity()
          ..translate(x * width, y)
          ..scale(1.0, scale),
        origin: Offset(width / 2, 0),
        child: Container(
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: child,
        ),
      ),
    );
  }

  Widget _buildTabButton(String label, bool active, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              letterSpacing: 0.5,
              color: active ? Colors.white : Colors.grey[400],
              fontWeight: active ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            width: 60,
            height: 2,
            color: active ? Colors.white : Colors.transparent,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Login',
          style: TextStyle(
            fontSize: 22,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        _buildInputField(label: 'Username'),
        _buildInputField(label: 'E-mail'),
        _buildInputField(label: 'Password', obscureText: true),
        const SizedBox(height: 30),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black87,
            minimumSize: const Size(120, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          onPressed: () {},
          child: const Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignupForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 22,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        _buildInputField(label: 'Username'),
        _buildInputField(label: 'E-mail'),
        _buildInputField(label: 'Password', obscureText: true),
        const SizedBox(height: 30),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            side: BorderSide(color: _accentGreen, width: 2),
            minimumSize: const Size(120, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Sign Up',
            style: TextStyle(
              color: _accentGreen,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInputField({required String label, bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Color(0xFFA1B4B4)),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFEEF9FE),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: const BorderSide(
                color: Color(0xFFCDDBEF),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}


