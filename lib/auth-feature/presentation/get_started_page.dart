import 'package:e_commerce/utils/routes/route_manager.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold background color
      backgroundColor: Colors.grey[100],

      // Screen layout
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image / App logo
              SizedBox(
                height: 500,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('')],
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Greetings
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    // Welcome user
                    Text(
                      'Welcome to Bag',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 10),

                    // friendly message
                    Text(
                      'Bag what you want anytime, anywhere you are!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              // Actions
              Column(
                children: [
                  // Get started button for new users
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B1A1F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pushNamed(RouteManager.registerPage);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Login Button for existing users
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          237,
                          237,
                          240,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(RouteManager.loginPage);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 18,
                            color: const Color(0xFF1B1A1F),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // End screen layout
    );
  }
}
