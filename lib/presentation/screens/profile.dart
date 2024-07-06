import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/controllers/theme_notifier.dart';
import '../widgets/profile/profile_stat.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: false,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 24,
            fontFamily: "Mont",
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Info
              Center(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Mont",
                      ),
                    ),
                    Text(
                      'john.doe@example.com',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.7),
                        fontFamily: "Mont",
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // User Statistics
              const Text(
                'Statistics',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Mont",
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  children: [
                    ProfileStat(title: 'Total Things Bought', value: '15'),
                    ProfileStat(title: 'Total Amount', value: '\$11,500'),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Settings Options
              const Text(
                'Settings',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Mont",
                ),
              ),
              const SizedBox(height: 10),
              const ListTile(
                leading: Icon(Icons.edit_square),
                title: Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Mont",
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.dark_mode),
                title: const Text(
                  'Dark Mode',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Mont",
                  ),
                ),
                trailing: Switch(
                  activeColor: Theme.of(context).colorScheme.primary,
                  activeTrackColor:
                      Theme.of(context).colorScheme.inversePrimary,
                  inactiveThumbColor: Theme.of(context).colorScheme.secondary,
                  inactiveTrackColor: Theme.of(context).colorScheme.onPrimary,
                  splashRadius: 70.0,
                  value: isDarkMode,
                  onChanged: (value) {
                    ref.read(themeProvider.notifier).setDarkMode(value);
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Mont",
                  ),
                ),
                onTap: () {
                  // Handle logout
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
