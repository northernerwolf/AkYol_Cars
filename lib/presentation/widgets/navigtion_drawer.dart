import 'package:flutter/material.dart';
import 'package:tmcars_clone/presentation/pages/adds/adds.dart';
import 'package:tmcars_clone/presentation/pages/cars/cars.dart';
import 'package:tmcars_clone/presentation/pages/house/house.dart';
import 'package:tmcars_clone/presentation/pages/initial/initial.dart';
import 'package:tmcars_clone/presentation/pages/lost_found/lost_found.dart';
import 'package:tmcars_clone/presentation/pages/parts/parst.dart';
import 'package:tmcars_clone/presentation/widgets/drawer_header.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: MediaQuery.of(context).size.width - 100,
      child: SingleChildScrollView(
          // ignore: avoid_unnecessary_containers
          child: Container(
        child: Column(
          children: [
            const DrawerHeaderScreen(),
            const SizedBox(
              height: 30,
            ),
            InkWell(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const Initial()),
                      (route) => false);
                },
                child: menuItem('Baş sahypa', Icons.abc, false, '123', 18)),
            InkWell(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const CarsScreen()),
                      (route) => false);
                },
                child: menuItem('Awtoulaglar', Icons.abc, false, '3', 16)),
            InkWell(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const PartsScreen()),
                      (route) => false);
                },
                child: menuItem('Awtoşaýlar', Icons.abc, false, '23', 17)),
            InkWell(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const Lostfoundscreen()),
                      (route) => false);
                },
                child: menuItem(
                    'Ýitrilen we tapylan', Icons.abc, false, '1238', 17)),

            InkWell(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const HouseScreen()),
                      (route) => false);
                },
                child: menuItem('Emläk', Icons.abc, false, '123', 18)),

            InkWell(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const AddsScreen()),
                      (route) => false);
                },
                child: menuItem('Bildirş goşmak', Icons.abc, false, '123', 18)),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.grey,
              height: 1,
              width: double.infinity,
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => const HabarlashmakScreen()));
                },
                child: menuItemDrawer(
                    'Sazlamalar', Icons.abc_outlined, false, 19)),
            InkWell(
                onTap: () {},
                child: menuItemDrawer(
                    'Biz barada', Icons.abc_outlined, false, 19)),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6.5,
            ),
            // const Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Material(
            //       color: Colors.transparent,
            //       child: Padding(
            //         padding: EdgeInsets.only(left: 15, right: 15),
            //         child: Row(children: [
            //           Icon(
            //             Icons.logout,
            //             size: 20,
            //             color: Colors.red,
            //           ),
            //           SizedBox(
            //             width: 15,
            //           ),
            //           Text(
            //             'Ulgamdan çykmak',
            //             style: TextStyle(
            //                 color: Colors.red,
            //                 fontFamily: 'Roboto',
            //                 fontSize: 14,
            //                 fontWeight: FontWeight.normal),
            //           ),
            //         ]),
            //       ),
            //     ),
            //     // const Padding(
            //     //   padding: EdgeInsets.only(left: 25, top: 30),
            //     //   child: Text(
            //     //     '2024',
            //     //     style: TextStyle(
            //     //         color: Color.fromARGB(255, 131, 130, 130),
            //     //         fontFamily: 'Roboto',
            //     //         fontSize: 12,
            //     //         fontWeight: FontWeight.bold),
            //     //   ),
            //     // ),
            //   ],
            // )
          ],
        ),
      )),
    );
  }

  Widget menuItemDrawer(
      String title, IconData icon, bool selected, double size) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 7, top: 7),
        child: Row(children: [
          Icon(
            icon,
            size: size,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            title,
            style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
        ]),
      ),
    );
  }

  Widget menuItem(
      String title, IconData icon, bool selected, String count, double size) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 7, top: 7),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Icon(
                icon,
                size: size,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                title,
                style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
              color: Color.fromARGB(255, 59, 109, 147),
            ),
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 6, right: 6, bottom: 3, top: 3),
                child: Text(
                  count,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontFamily: "Roboto",
                      fontSize: 14),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
