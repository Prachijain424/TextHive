import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 25,
      ),
      title: const Text("Dev Stack" , style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      )),
      subtitle: Row(
        children: const [
          Icon(Icons.done_all),
          SizedBox(
            width: 3,
          ),
          Text(
            "Hi Dev Stack",
            style: TextStyle(
              fontSize: 13,
            ),
          )
        ],
      ),
      trailing : const Text("18:04"),
    );
  }
}
