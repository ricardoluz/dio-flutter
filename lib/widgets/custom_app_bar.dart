import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String titleApp;

  const CustomAppbar({
    super.key,
    required this.titleApp,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(titleApp),
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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 4, 8),
        child: ListView(children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Ricardo Luz"),
            accountEmail: const Text("contato@ricardoluz.com.br"),
            currentAccountPicture: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/my_image.jpg")),
              ),
            ),
          ),
          const CustomListTile(
            title: "Home",
            icon: Icons.home,
            targetPage: "home",
          ),
          const CustomListTile(
            icon: Icons.person,
            title: "Registro",
            targetPage: "registration",
          ),
          const CustomListTile(
            title: "Números Aleatórios",
            icon: Icons.numbers,
            targetPage: "randomNumbers",
          ),
          const TermsOfUseListTile(),
          const Divider(),
          const LogoutListTile(),
          const Divider(),
        ]),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String targetPage;

  const CustomListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.targetPage,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, targetPage);
        // Navigator.pushReplacementNamed(context, targetPage);
      },
    );
  }
}

class TermsOfUseListTile extends StatelessWidget {
  const TermsOfUseListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.cases),
      title: const Text("Termo de uso"),
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32, 8, 16, 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        "Termo de uso\n",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      const Text(
                        textAlign: TextAlign.justify,
                        "Lorem ipsum dolor sit amet, consectetur adipisc"
                        "ing elit, sed do eiusmod tempor incididunt ut la"
                        "bore et dolore magna aliqua. Ut enim ad minim veni"
                        "am, quis nostrud exercitation ullamco laboris nisi"
                        "ut aliquip ex ea commodo consequat. Duis aute irure"
                        " dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla",
                      ),
                      ElevatedButton(
                        child: const Text('Fechar'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              );
            });
        // Navigator.pushNamed(context, "registration");
      },
    );
  }
}

class LogoutListTile extends StatelessWidget {
  const LogoutListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.exit_to_app),
      title: const Text("Sair"),
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext bc) {
              return AlertDialog(
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Não")),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "home");
                      },
                      child: const Text("Sim")),
                ],
                elevation: 16.0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0)),
                ),
                // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0) ),
                title: const Text("titleApp"),
                content: const Wrap(
                  children: [
                    Text("Finalizar a aplicação?"),
                  ],
                ),
              );
            });
      },
    );
  }
}

// -------------------------------------

// ListTile(
//   leading: const Icon(Icons.logout),
//   title: const Text("Logout"),
//   onTap: () {
//     logout();
//   },
// ),
