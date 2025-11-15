import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatefulWidget {
  const ProfileAvatar({super.key});

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: CircleAvatar(radius: 80),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFDAD9DF),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.pencil, size: 32),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
