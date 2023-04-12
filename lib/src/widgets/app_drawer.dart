import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  void initState() {
    super.initState();
  }

  Widget appMenuItem(IconData iconData, String label, String route) => ListTile(
      leading: Icon(
        iconData,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        label,
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      onTap: () {
        Navigator.pop(context);
        context.push(route);
      });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 3;
    return Consumer<AppStateProvider>(
      builder: (context, provider, child) {
        var user = provider.user;
        return Drawer(
            backgroundColor: Colors.white,
            child: SingleChildScrollView(
              child: Column(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                        width: width,
                        image: const AssetImage('assets/images/logo.jpeg')),
                    const SizedBox(height: 4),
                    Text(
                      "${user?.firstName} ${user?.lastName ?? ''}",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    const SizedBox(height: 4),
                    Text(user?.adminHierarchyName ?? ''),
                    Text(provider.currentVersion ?? '')
                  ],
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                appMenuItem(
                    Icons.settings, 'Pos Configuration', AppRoute.posConfig),
                appMenuItem(Icons.money, 'Revenue Source Config',
                    AppRoute.revenueSource),
                appMenuItem(Icons.calendar_month, 'Financial year',
                    AppRoute.financialYear),
                appMenuItem(
                    Icons.house, 'Household Registration', AppRoute.houseHold),
                appMenuItem(Icons.currency_exchange_rounded, 'Currency',
                    AppRoute.currency),
                appMenuItem(Icons.update, 'App Update', AppRoute.appUpdate),
                appMenuItem(Icons.logout_sharp, 'Logout', AppRoute.logout),
              ]),
            ));
      },
    );
  }
}
