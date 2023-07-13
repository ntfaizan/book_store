import 'package:book_store/network/network_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/author.dart';

class AuthorCard extends StatelessWidget {
  final Author author;
  const AuthorCard({super.key, required this.author});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          CircleAvatar(
            // child: Text(author.name[0]),
            child: Text('${author.id}'),
          ),
          SizedBox(width: 29.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(author.name),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(author.createdAt),
                  const SizedBox(width: 40),
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
                  Text(author.updatedAt),
                  const SizedBox(width: 40),
                  IconButton(
                    onPressed: () async {
                      final res = await NetworkClient()
                          .delete('api/authors/', author.id);
                      if (res.statusCode == 200) {
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
