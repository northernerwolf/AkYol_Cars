import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmcars_clone/applications/settings_singleton.dart';
import 'package:tmcars_clone/data/providers/getUser_provider.dart';
import 'package:tmcars_clone/presentation/pages/auth/register.dart';

class DrawerHeaderScreen extends StatefulWidget {
  const DrawerHeaderScreen({Key? key}) : super(key: key);

  @override
  State<DrawerHeaderScreen> createState() => _DrawerHeaderScreenState();
}

class _DrawerHeaderScreenState extends State<DrawerHeaderScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    checkUser();
  }

  int changer = 0;

  Future<void> checkUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? val = preferences.getString('token');

    if (val != null) {
      await Provider.of<GetUserProvider>(context, listen: false)
          .getUserProvider(context, val);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<SettingsSingleton>(builder: (_, authentication, __) {
        authentication.checkAuthStatus();
        return Container(
          color: Colors.white,
          width: double.infinity,
          height: 120,
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.car_crash),
                authentication.isAuthenticated == false
                    ? InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Register()));
                        },
                        child: const Text(
                          'ULGAMA GIRMEK',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Register()));
                        },
                        child: const Text(
                          'Meniň profilim',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
