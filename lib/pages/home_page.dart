import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/book.dart';
import '../network/network_client.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  int nextPageCallAt = -1;
  String? nextPageUrl;
  List<Book> bookList = [];

  @override
  void initState() {
    bookList.clear();
    initData();
    super.initState();
  }

  Future<void> initData() async {
    if (currentPage > 0 && nextPageUrl == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('No more books found')));
    } else {
      final res =
          await NetworkClient().get('api/books?page=${currentPage + 1}');
      if (res.statusCode == 200) {
        Map<String, dynamic> mp = json.decode(res.toString());
        currentPage = mp['current_page'];
        nextPageUrl = mp['next_page_url'];
        nextPageCallAt = mp['to'] - (mp['per_page'] ~/ 5);
        bookList.addAll((mp['data'] as List)
            .map(
              (m) => Book.fromJson(m),
            )
            .toList());
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
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
            const ListTile(
              leading: Icon(Icons.home_filled),
              title: Text("Categories"),
            ),
            const ListTile(
              leading: Icon(Icons.person),
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
      ),
      appBar: AppBar(
        title: const Text('Books Library'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_checkout),
          ),
        ],
      ),
      body: bookList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: bookList.length,
              itemBuilder: (context, index) {
                if (index == nextPageCallAt) {
                  initData();
                }
                return Card(
                  child: Padding(
                    padding: REdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          clipBehavior: Clip.hardEdge,
                          child: Image.network(
                            bookList[index].coverUrl,
                            height: 111.h,
                            width: 82.w,
                          ),
                        ),
                        SizedBox(width: 29.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                bookList[index].title,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.sp,
                                ),
                              ),
                              SizedBox(height: 6.h),
                              SizedBox(
                                height: 15.h,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: bookList[index].authorList.length,
                                  itemBuilder: (context, aIndex) => Text(
                                    '${bookList[index].authorList[aIndex].name},',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 6.h),
                              Text(
                                bookList[index].publisher.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                ),
                              ),
                              SizedBox(height: 6.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Padding(
                                      padding: REdgeInsets.all(4.0),
                                      child: Text(
                                        bookList[index].edition,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Padding(
                                      padding: REdgeInsets.all(4.0),
                                      child: Text(
                                        '${bookList[index].unitPrice} ${bookList[index].unitCurrency}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.shopping_cart_checkout,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
