import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/reporter.jpg'),
              //** To make the image full screen */
              fit: BoxFit.cover),
        ),
        //** To add the black gradient on the image */
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: [0.2, 0.7],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0),
                Colors.black.withOpacity(0.85),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Stay Informed From Day One',
                  style: GoogleFonts.spaceGrotesk(
                    color: Colors.white,
                    fontSize: 46,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Gap(12),
                const Text(
                  'Discover the Latest News with our Seamless OnBoarding Experiences',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Gap(12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: Colors.indigo.shade700,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      minimumSize: Size(double.infinity, 55)),
                  onPressed: () => context.go('/dashboard'),
                  child: const Text(
                    'Getting Started',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
