import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppbar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // ListTile(
          //   leading: const Icon(Icons.logout),
          //   title: const Text("Logout"),
          //   onTap: () {
          //     logout();
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Registro"),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'registration');
              // Navigator.pushNamed(context, "registration");
            },
          )
        ],
      ),
    );
  }
}
