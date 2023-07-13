import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/publisher.dart';

class PublisherCard extends StatelessWidget {
  final Publisher publisher;
  final Function deleteData;
  const PublisherCard(
      {super.key, required this.publisher, required this.deleteData});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          CircleAvatar(
            child: Text(publisher.name[0]),
          ),
          SizedBox(width: 29.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(publisher.name),
              Text(publisher.createdAt),
              Text(publisher.updatedAt),
            ],
          ),
        ],
      ),
    );
  }
}
