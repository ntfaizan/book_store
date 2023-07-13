import 'dart:convert';

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
    final response = await NetworkClient().get('api/publishers');
    Map<String, dynamic> mp = json.decode(response.toString());
    if (response.statusCode == 200) {
      publisherList = (mp['data'] as List)
          .map(
            (m) => Publisher.fromJson(m),
          )
          .toList();
      setState(() {});
    }
  }

  void deleteData(int id) {
    publisherList.removeWhere((e) => e.id == id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('publisher Page'),
      ),
      body: ListView.builder(
        itemCount: publisherList.length,
        itemBuilder: (context, index) => PublisherCard(
          publisher: publisherList[index],
          deleteData: deleteData,
        ),
      ),
    );
  }
}
