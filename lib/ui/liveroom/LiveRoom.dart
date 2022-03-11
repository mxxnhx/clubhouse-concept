import 'package:clubhouse/ui/liveroom/LiveRoomMember.dart';
import 'package:clubhouse/utils/DynamicColor.dart';
import 'package:clubhouse/utils/MemojiColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LiveRoom extends StatelessWidget {
  const LiveRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Design talk and chill"),
          leading: Padding(
            padding: EdgeInsets.only(left: 20),
            child: IconButton(
              icon: Icon(CupertinoIcons.chevron_down),
              onPressed: () {
                Navigator.maybePop(context);
              },
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 15, 20, 20),
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 6,
                    width: 70,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          maxLines: null,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFF8281ea),
                            hintText: "Type a thought here...",
                            hintStyle: TextStyle(color: Colors.white70),
                            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white,
                        foregroundColor: theme.primaryColor,
                        child: Icon(CupertinoIcons.paperplane_fill),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: ColoredBox(
          color: theme.primaryColor,
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            height: 110,
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: SafeArea(
              top: false,
              child: Row(
                children: [
                  TextButton.icon(
                    icon: Text(
                      "✌🏼",
                      style: TextStyle(fontSize: 18),
                    ),
                    label: Text("Leave quietly"),
                    style: TextButton.styleFrom(
                      primary: DynamicColor.withBrightness(
                        context: context,
                        color: theme.primaryColor,
                        darkColor: Color(0xFF9d97ec),
                      ),
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      backgroundColor: DynamicColor.withBrightness(
                        context: context,
                        color: Color(0xFFeff0f5),
                        darkColor: Color(0xFF2a2b29),
                      ),
                    ),
                    onPressed: () {},
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: DynamicColor.withBrightness(
                      context: context,
                      color: Color(0xFFeff0f5),
                      darkColor: Color(0xFF2a2b29),
                    ),
                    child: Text(
                      "✋🏼",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    radius: 24,
                    child: Image.asset("assets/images/10.png"),
                    backgroundColor: DynamicColor.withBrightness(
                      context: context,
                      color: Color(0xFFeff0f5),
                      darkColor: Color(0xFF2a2b29),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
