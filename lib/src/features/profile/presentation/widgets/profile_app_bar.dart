import 'dart:async';

import 'package:dbtech_tdd_clean_archecture_bloc/src/core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Account',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        PopupMenuButton(
          offset: const Offset(0, 50),
          surfaceTintColor: Colors.white,
          icon: const Icon(Icons.more_horiz),
          itemBuilder: (context) => [
            PopupMenuItem<void>(
              child: const PopUpItem(
                title: 'Edit Profile',
                icon: Icon(
                  Icons.edit_outlined,
                  color: Colours.neutralTextColour,
                ),
              ),
              onTap: () => context.pushTab(const Placeholder()),
            ),
            PopupMenuItem<void>(
              child: const PopUpItem(
                title: 'Notification',
                icon: Icon(
                  IconlyLight.notification,
                  color: Colours.neutralTextColour,
                ),
              ),
              onTap: () => context.pushTab(const Placeholder()),
            ),
            PopupMenuItem<void>(
              child: const PopUpItem(
                title: 'Help',
                icon: Icon(
                  Icons.help_outline_outlined,
                  color: Colours.neutralTextColour,
                ),
              ),
              onTap: () => context.pushTab(const Placeholder()),
            ),
            PopupMenuItem<void>(
              height: 1,
              padding:  EdgeInsets.zero,
              child: Divider(
                height: 1,
                color: Colors.grey.shade300,
                indent: 16,
                endIndent: 16,
              ),
            ),
            PopupMenuItem<void>(
              child: const PopUpItem(
                title: 'Logout',
                icon: Icon(
                  Icons.logout_rounded,
                  color: Colors.black,
                ),
              ),
              onTap: () async {
                final navigator = Navigator.of(context);
                await sl<FirebaseAuth>().signOut();
                unawaited(
                  navigator.pushNamedAndRemoveUntil(
                    '/',
                    (route) => false,
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
