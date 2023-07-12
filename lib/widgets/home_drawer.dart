import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../pages/author_page.dart';
import '../pages/category_page.dart';
import '../pages/publisher_page.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Padding(
            padding: REdgeInsets.all(16.0),
            child: Text(
              'BSI NSSD',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
              ),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          const ListTile(
            leading: Text('Main'),
          ),
          ListTile(
            leading: const Icon(Icons.home_filled),
            title: const Text("Categories"),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CategoryPage(),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Authors"),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AuthorPage(),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text("Publishers"),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const PublisherPage(),
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.book),
            title: Text("Books Library"),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text("Book Settings"),
          ),
          const ListTile(
            leading: Icon(Icons.date_range),
            title: Text("Your Cart"),
          ),
          const ListTile(
            leading: Icon(Icons.date_range),
            title: Text("Cart Checkout"),
          ),
        ],
      ),
    );
  }
}
