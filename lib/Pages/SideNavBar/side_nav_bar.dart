import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sample/Pages/Leader/leaderDash.dart';
import 'package:sample/Pages/SideNavBar/chat.dart';
import 'package:sample/Pages/SideNavBar/history.dart';
import 'package:sample/Pages/SideNavBar/invites.dart';
import 'package:sample/Pages/SideNavBar/payment.dart';
import 'package:sample/Pages/SideNavBar/search.dart';
import 'package:sample/Pages/login.dart';
import 'package:sample/Utils/constants.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: 341,
            height: 250,
            decoration: const BoxDecoration(color: primaryColor),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 109,
                    height: 109,
                    decoration: ShapeDecoration(
                      image: const DecorationImage(
                        image: AssetImage("images/u0.png"),
                        fit: BoxFit.cover,
                      ),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 3, color: tertiaryColor),
                        borderRadius: BorderRadius.circular(79),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 143,
                    height: 26.60,
                    child: Text(
                      user.email!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(
                    width: 58,
                    height: 12.81,
                    child: Text(
                      'View Profile',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.white,
                        fontSize: 11,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  )
                ]),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text("Search Community"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SearchComm()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text("Community Chat"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Chat()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_add_alt_1),
            title: const Text("Invites"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Invitations()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payments),
            title: const Text("Payment"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PaymentPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text("Your contribution"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const History()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Leader Actions"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LeaderDash()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.arrow_back),
            title: const Text("Log Out"),
            onTap: () async {
              FirebaseAuth.instance.signOut();
              Navigator.of(context).popUntil((route) => route.isFirst);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LogIn()),
              );
            },
          ),
        ],
      ),
    ));
  }
}
