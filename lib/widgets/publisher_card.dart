import 'package:book_store/pages/publisher_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/publisher.dart';
import '../network/network_client.dart';
import '../utils/utility.dart';

class PublisherCard extends StatelessWidget {
  final Publisher publisher;
  final Function initData;
  const PublisherCard(
      {super.key, required this.publisher, required this.initData});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          CircleAvatar(
            // child: Text(publisher.name[0]),
            child: Text('${publisher.id}'),
          ),
          SizedBox(width: 29.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(publisher.name),
              Row(
                children: [
                  Text(publisher.createdAt),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PublisherEditPage(
                            publisher: publisher,
                            initData: initData,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(publisher.updatedAt),
                  IconButton(
                    onPressed: () async {
                      final res = await NetworkClient()
                          .delete('api/publishers/${publisher.id}');
                      if (res.statusCode == 200) {
                        initData();
                        // ignore: use_build_context_synchronously
                        Utility.showMessage(context,
                            'Author: ${publisher.id} successfully deleted');
                      }
                    },
                    icon: const Icon(Icons.delete),
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
