import 'package:e_commerce/utils/widgets/bottom_navigation.dart';
import 'package:e_commerce/utils/widgets/profile_avatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void signOutAccount() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1A1F),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF1B1A1F),
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: IconButton(
            icon: Icon(CupertinoIcons.chevron_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text('Profile', style: TextStyle(fontSize: 18)),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Profile Image
                  ProfileAvatar(),
                  SizedBox(height: 20),

                  // user details
                  Column(
                    children: [
                      // user profile image
                      Text(
                        'First Last Name',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 5),

                      // user email
                      Text(
                        'Euser123@gmail.com',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 5),

                      // user phone number
                      Text(
                        '555-1234',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Divider - styling purposes
                  Divider(),
                  SizedBox(height: 20),

                  // profile settings - listtiles
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        // Handle notifications
                        ListTile(
                          leading: Icon(Icons.notifications),
                          title: Text('Push Notifications'),
                          subtitle: Text('See all notifications related...'),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(CupertinoIcons.ellipsis_vertical),
                          ),
                          onTap: () {},
                        ),
                        SizedBox(height: 10),

                        // See order history
                        ListTile(
                          leading: Icon(Icons.history),
                          title: Text('Orders'),
                          subtitle: Text('See previous orders here...'),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(CupertinoIcons.ellipsis_vertical),
                          ),
                          onTap: () {},
                        ),
                        SizedBox(height: 10),

                        // Track order
                        ListTile(
                          leading: Icon(CupertinoIcons.cube_box),
                          title: Text('Track order'),
                          subtitle: Text('Track you order with order...'),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(CupertinoIcons.ellipsis_vertical),
                          ),
                          onTap: () {},
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),

                  // Signout button
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
                        signOutAccount();
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          'Sign out',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: CBottomNavigation(),
    );
  }
}
