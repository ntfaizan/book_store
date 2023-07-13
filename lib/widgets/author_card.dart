import 'package:book_store/network/network_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../models/author.dart';

class AuthorCard extends StatelessWidget {
  final Author author;
  final Function deleteData;
  const AuthorCard({super.key, required this.author, required this.deleteData});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Lottie.asset(
            'assets/svgs/books.json',
            repeat: false,
            height: 111.h,
            width: 82.w,
          ),
          SizedBox(width: 29.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(author.name),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Created At: ${author.createdAt}'),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Updated At: ${author.updatedAt}'),
                  IconButton(
                    onPressed: () async {
                      final res = await NetworkClient()
                          .delete('api/authors/', author.id);
                      if (res.statusCode == 200) {
                        deleteData(author.id);
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Author: ${author.id} successfully deleted'),
                          ),
                        );
                      }
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
