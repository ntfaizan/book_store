import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_placeholder/models/publisher.dart';
import 'package:dio/dio.dart';
import 'package:json_placeholder/widgets/publisher_card.dart';

class PublisherPage extends StatefulWidget {
  const PublisherPage({super.key});

  @override
  State<PublisherPage> createState() => _PublisherPageState();
}

class _PublisherPageState extends State<PublisherPage> {
  List<Publisher> publisherList = [];
  final dio = Dio();

  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('publisher Page'),
      ),
      body: ListView.builder(
        itemCount: publisherList.length,
        itemBuilder: (context, index) =>
            PublisherCard(publisher: publisherList[index]),
      ),
    );
  }

  Future<void> initData() async {
    final response =
        await dio.get('http://mad.codewithfaizan.com/api/publishers');
    Map<String, dynamic> mp = json.decode(response.toString());
    if (mp['success']) {
      publisherList = (mp['data'] as List)
          .map(
            (m) => Publisher.fromJson(m),
          )
          .toList();
      setState(() {});
    }
  }
}
