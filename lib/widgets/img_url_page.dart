import 'package:flutter/material.dart';

class ImageUrlPage extends StatefulWidget {
  final String labelText;
  final TextEditingController textController;
  const ImageUrlPage(
      {super.key, required this.textController, required this.labelText});

  @override
  State<ImageUrlPage> createState() => _ImageUrlPageState();
}

class _ImageUrlPageState extends State<ImageUrlPage> {
  String imgUrl = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.center,
            height: 105,
            width: 105,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: imgUrl.isNotEmpty
                ? Image.network(
                    imgUrl,
                    fit: BoxFit.cover,
                    height: 105,
                    width: 105,
                    errorBuilder: (
                      BuildContext context,
                      Object error,
                      StackTrace? stackTrace,
                    ) {
                      return Text(
                        "Rasm linkini xato kiritdingiz",
                        textAlign: TextAlign.center,
                      );
                    },
                    loadingBuilder: (
                      BuildContext context,
                      Widget child,
                      ImageChunkEvent? loadingProgress,
                    ) {
                      if (loadingProgress == null) return child;
                      return CircularProgressIndicator();
                    },
                  )
                : Text("Rasim kiriting"),
          ),
          SizedBox(width: 10),
          Expanded(
              child: TextField(
            controller: widget.textController,
            decoration: InputDecoration(labelText: widget.labelText),
            onSubmitted: (value) {
              setState(() {
                imgUrl = value;
              });
            },
          ))
        ],
      ),
    );
  }
}
