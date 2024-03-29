import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:mohit_ui_collection/const/consts.dart';

class TaskDoneScreen extends StatefulWidget {
  const TaskDoneScreen({Key? key}) : super(key: key);

  @override
  _TaskDoneScreenState createState() => _TaskDoneScreenState();
}

class _TaskDoneScreenState extends State<TaskDoneScreen> {
  //   @override
  // void dispose() {
  //   setStatusBarColor(context.scaffoldBackgroundColor);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          20.height,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Task Done', style: boldTextStyle(size: 20)),
                  85.width,
                  IconButton(
                    icon: Icon(Icons.add, size: 30),
                    onPressed: () {
                      toast('Add Task');
                    },
                  ).paddingOnly(right: 32),
                ],
              ),
              16.height,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  Mohit_UI_KitShortText,
                  style: primaryTextStyle(size: 15),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          150.height,
          commonCachedNetworkImage(
              '${GlobalUrl}images/emptyScreen1/taskDone1.png',
              height: 250),
        ],
      ).paddingSymmetric(vertical: 32),
    );
  }
}
