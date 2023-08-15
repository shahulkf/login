import 'package:flutter/material.dart';

class ShowPage extends StatelessWidget {
  final String name;
  const ShowPage({Key? key, required this.name}) : super(key: key);

  // const showPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Go Back'),
            ),
            //  Image.network('https://img.freepik.com/free-vector/group-people-illustration-set_52683-33806.jpg')
            Image.network(
                'https://www.freevector.com/uploads/vector/preview/28555/People-with-Activity.jpg')
          ],
        ),
      ),
    );
  }
}
