import 'package:flutter/material.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 100,
        ),
        child: Card(
          elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          color: Colors.lightBlue[100]?.withOpacity(0.7),
          margin: const EdgeInsets.all(10),
          child: Stack(
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(bottom: 20, right: 60, left: 10, top: 4),
                child: Text(
                  "vfhbngvfhbngnvfvbngvfbnvfdrgbgvfcdbvdjchrgbfnvdhbnfvfjbvftbjvnnvjnvjnvjnjvn",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Row(
                  children: const [
                    Text(
                      "10:45",
                      style: TextStyle(fontSize: 13, color: Colors.blueGrey),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.done_all,
                      size: 20,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
