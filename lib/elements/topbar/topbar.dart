import 'package:flutter/material.dart';
import 'ava.dart';
import 'location.dart';
import 'date.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.location_on_outlined),
                        Location(index: 0), // хардкодим Питер
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Row(
                      children: <Widget>[
                        Date(),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: UserProfile(
                        userProfilePictureURL:
                            'https://s3-alpha-sig.figma.com/img/738e/6e77/a92971e6075b85d18be0de93205d90cb?Expires=1687132800&Signature=FCndYJlBm8TzTblrx4DM7V0imqSpU9dyyIVL2LpAf6P1W4xO0gsuJp53OVqWc1A-qzsUHRK8NKhJnfmZOybn7AV7~OQGYAeKe7dnvh2ywbE6k5ojSxoesLjHn1f6bUAAF66dpBswZxD4M-hegplqKA0FCK5IrU99uIQQ33w0~UfrGOvaIJexw4h1emgUoNYpE6wdlpHgVx~6C1mc-K-YqSqGBr8dIcQa90ZnWL~mDWtPq67oJBWVUFrelJGlHKgsekVmYdVzbf9sYZdEj5279pqdinp2ps66tsgNJk3p3VG0Uew9WviJ8Bp2VacU8Czs4Bg5nzCOI2yHLGP6LTkm1g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4'),
                  ),
                ],
              )
            ]),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
