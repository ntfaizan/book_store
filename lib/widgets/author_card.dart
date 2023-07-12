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
            child: Text(author.name[0]),
          ),
          SizedBox(width: 29.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(author.name),
              Text(author.createdAt),
              Text(author.updatedAt),
            ],
          ),
        ],
      ),
    );
  }
}
