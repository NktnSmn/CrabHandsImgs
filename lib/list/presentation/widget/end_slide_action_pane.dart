import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EndSlideActionPane extends ActionPane {
  EndSlideActionPane({Key? key})
      : super(
          key: key,
          dragDismissible: false,
          motion: const BehindMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                Fluttertoast.showToast(msg: 'On click open in browser');
              },
              backgroundColor: const Color(0xFF7BC043),
              foregroundColor: Colors.white,
              icon: Icons.open_in_browser,
            ),
            SlidableAction(
              onPressed: (context) {
                Fluttertoast.showToast(msg: 'On click share');
              },
              backgroundColor: const Color(0xFF0392CF),
              foregroundColor: Colors.white,
              icon: Icons.share,
            ),
          ],
        );
}
