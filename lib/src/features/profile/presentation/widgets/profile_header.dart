import 'package:dbtech_tdd_clean_archecture_bloc/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalUserProvider>(
      builder: (_, provider, __) {
        final user = provider.user;
        final image = user?.profilePic == null || user!.profilePic!.isEmpty
            ? null
            : user.profilePic;
        return Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.transparent,
              backgroundImage: image == null
                  ? const AssetImage(MediaRes.user) as ImageProvider
                  : NetworkImage(image),
            ),
            const SizedBox(height: 16),
            Text(
              user?.fullName ?? 'No user',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (user?.bio != null && user!.bio!.isNotEmpty) ...[
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.width * .15),
                child: Text(
                  user.bio!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colours.neutralTextColour,
                  ),
                ),
              ),
            ],
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
