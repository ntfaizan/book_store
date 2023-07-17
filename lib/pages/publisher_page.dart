import 'dart:convert';

import 'package:book_store/pages/publisher_edit_page.dart';
import 'package:flutter/material.dart';

import '../models/publisher.dart';
import '../network/network_client.dart';
import '../widgets/publisher_card.dart';

class PublisherPage extends StatefulWidget {
  const PublisherPage({super.key});

  @override
  State<PublisherPage> createState() => _PublisherPageState();
}

class _PublisherPageState extends State<PublisherPage> {
  List<Publisher> publisherList = [];

  @override
  void initState() {
    initData();
    super.initState();
  }

  Future<void> initData() async {
    publisherList.clear();
    setState(() {});
    final response = await NetworkClient().get('api/publishers');
    Map<String, dynamic> mp = json.decode(response.toString());
    if (response.statusCode == 200) {
      publisherList = (mp['data'] as List)
          .map(
            (m) => Publisher.fromJson(m),
          )
          .toList();
      // order by publisher updatedAt
      publisherList.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
      // publisherList.sort((a, b) => a.updatedAt.compareTo(b.updatedAt));
      setState(() {});
    }
  }

  // void deleteData(int id) {
  //   publisherList.removeWhere((e) => e.id == id);
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Publishers'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PublisherEditPage(initData: initData),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: publisherList.length,
        itemBuilder: (context, index) => PublisherCard(
          publisher: publisherList[index],
          initData: initData,
        ),
      ),
    );
  }
}
