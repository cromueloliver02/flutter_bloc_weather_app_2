import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  static const id = '/search';

  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              autofocus: true,
              style: const TextStyle(fontSize: 18),
              decoration: const InputDecoration(
                labelText: 'City',
                hintText: 'Must be at least 2 characters',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
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
