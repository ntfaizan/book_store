import 'package:book_store/network/network_client.dart';
import 'package:book_store/utils/utility.dart';
import 'package:flutter/material.dart';

import '../models/publisher.dart';

class PublisherEditPage extends StatefulWidget {
  const PublisherEditPage({super.key, this.publisher, required this.initData});
  final Publisher? publisher;
  final Function initData;

  @override
  State<PublisherEditPage> createState() => _PublisherEditPageState();
}

class _PublisherEditPageState extends State<PublisherEditPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  @override
  void initState() {
    if (widget.publisher != null) {
      nameController.text = widget.publisher!.name;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Publisher'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value == null) {
                    return 'Name required';
                  } else if (value.trim().isEmpty) {
                    return 'Name required';
                  }
                  return null;
                },
                decoration:
                    const InputDecoration(hintText: 'Type publisher name here'),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.maxFinite,
                child: FilledButton(
                  onPressed: () async {
                    bool isValid = formKey.currentState!.validate();
                    if (!isValid) {
                      return;
                    }
                    if (widget.publisher != null) {
                      // update
                      // api/publishers/{id}
                      var qParam = {
                        '_method': 'PUT',
                        'name': nameController.text.trim(),
                      };
                      final res = await NetworkClient().post(
                        'api/publishers/${widget.publisher!.id}',
                        queryParameters: qParam,
                      );
                      if (res.statusCode == 200) {
                        widget.initData();
                        nameController.clear();
                        // ignore: use_build_context_synchronously
                        Utility.showMessage(context, 'publisher updated');
                      }
                    } else {
                      // post or add or save
                      var qParam = {
                        'name': nameController.text.trim(),
                      };
                      final res = await NetworkClient().post(
                        'api/publishers',
                        queryParameters: qParam,
                      );
                      if (res.statusCode == 201) {
                        widget.initData();
                        nameController.clear();
                        // ignore: use_build_context_synchronously
                        Utility.showMessage(context, 'publisher saved');
                      }
                    }
                  },
                  child: Text(widget.publisher != null ? 'Update' : 'Save'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
