import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  static const id = '/search';

  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _formKey = GlobalKey<FormState>();
  var _autovalidateMode = AutovalidateMode.disabled;
  String? _city;

  void _submit() {
    setState(() => _autovalidateMode = AutovalidateMode.always);

    final form = _formKey.currentState;

    if (form != null && form.validate()) {
      form.save();
      Navigator.pop(context, _city!.trim());
    }
  }

  String? validator(String? value) {
    if (value == null || value.trim().length < 2) {
      return 'City name should be at least 2 characters';
    }

    return null;
  }

  String? _onSaved(String? value) => _city = value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 60),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                autofocus: true,
                autovalidateMode: _autovalidateMode,
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                  labelText: 'City',
                  hintText: 'Must be at least 2 characters',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                validator: validator,
                onSaved: _onSaved,
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: _submit,
            child: const Text(
              'How\'s Weather?',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
