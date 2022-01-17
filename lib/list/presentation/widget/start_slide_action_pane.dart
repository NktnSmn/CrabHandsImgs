import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StartSlideActionPane extends ActionPane {
  StartSlideActionPane({Key? key})
      : super(
          key: key,
          dragDismissible: false,
          motion: const BehindMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                Fluttertoast.showToast(msg: 'On click download');
              },
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.download,
            ),
            SlidableAction(
              onPressed: (context) {
                Fluttertoast.showToast(msg: 'On click bookmark');
              },
              backgroundColor: const Color(0xFF21B7CA),
              foregroundColor: Colors.white,
              icon: Icons.bookmark_border,
            ),
          ],
        );
}
