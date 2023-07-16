import '../network/network_client.dart';
import '../utils/utility.dart';
import 'package:flutter/material.dart';

import '../models/author.dart';

// ignore: must_be_immutable
class AuthorEditPage extends StatefulWidget {
  AuthorEditPage({super.key, this.author, required this.initData});
  final Function initData;
  Author? author;

  @override
  State<AuthorEditPage> createState() => _AuthorEditPageState();
}

class _AuthorEditPageState extends State<AuthorEditPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  @override
  void initState() {
    if (widget.author != null) {
      nameController.text = widget.author!.name;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Author'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration:
                    const InputDecoration(hintText: 'Type author name here'),
                validator: (value) {
                  if (value == null) {
                    return 'Name required';
                  } else if (value.trim().isEmpty) {
                    return 'Name required';
                  }
                  return null;
                },
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
                    if (widget.author != null) {
                      // update
                      var queryParameters = {
                        '_method': 'PUT',
                        'name': nameController.text.trim(),
                      };
                      final res = await NetworkClient().post(
                        'api/authors/${widget.author!.id}',
                        queryParameters: queryParameters,
                      );
                      if (res.statusCode == 200) {
                        nameController.clear();
                        widget.initData();
                        // ignore: use_build_context_synchronously
                        Utility.showMessage(
                            context, 'Record Successfully Updated');
                      }
                    } else {
                      // save new
                      var queryParameters = {
                        'name': nameController.text.trim(),
                      };
                      final res = await NetworkClient().post(
                        'api/authors',
                        queryParameters: queryParameters,
                      );
                      if (res.statusCode == 200) {
                        nameController.clear();
                        widget.initData();
                        // ignore: use_build_context_synchronously
                        Utility.showMessage(
                            context, 'Record Successfully Saved');
                      }
                    }
                  },
                  child: Text(widget.author != null ? 'Update' : 'Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
