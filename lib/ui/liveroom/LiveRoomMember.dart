import 'package:clubhouse/ui/liveroom/LiveRoom.dart';
import 'package:clubhouse/utils/DynamicColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LiveRoomMember extends StatefulWidget {
  LiveRoomMember({
    Key? key,
    required this.name,
    required this.imagePath,
    this.color,
    this.isMuted = true,
    this.isNewMember = false,
    this.isModerator = false,
  }) : super(key: key);

  final bool isMuted;
  final bool isNewMember;
  final bool isModerator;
  final String name;
  final String imagePath;
  final Color? color;

  @override
  _LiveRoomMemberState createState() => _LiveRoomMemberState(isMuted);
}

class _LiveRoomMemberState extends State<LiveRoomMember> {
  late bool isMuted;

  _LiveRoomMemberState(isMuted) {
    this.isMuted = isMuted;
  }

  void toggleMute() {
    setState(() {
      isMuted = !isMuted;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              toggleMute();
            },
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: 1 / 1,
                    child: CircleAvatar(
                      backgroundColor: widget.color ?? Colors.grey.shade100,
                      backgroundImage: AssetImage(widget.imagePath),
                    ),
                  ),
                  if (widget.isNewMember)
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: CircleAvatar(
                        radius: 13,
                        child: Text("🎉"),
                        backgroundColor: DynamicColor.withBrightness(
                          context: context,
                          color: Colors.white,
                          darkColor: theme.backgroundColor,
                        ),
                      ),
                    ),
                  if (isMuted)
                    Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        radius: 13,
                        backgroundColor: DynamicColor.withBrightness(
                          context: context,
                          color: Colors.white,
                          darkColor: theme.backgroundColor,
                        ),
                        child: Icon(
                          CupertinoIcons.mic_slash,
                          size: 16,
                          color: DynamicColor.withBrightness(
                            context: context,
                            color: Colors.grey.shade800,
                            darkColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.isModerator)
              Stack(
                children: [
                  Icon(
                    CupertinoIcons.asterisk_circle,
                    color: Colors.white,
                    size: 20,
                  ),
                  Icon(
                    CupertinoIcons.asterisk_circle_fill,
                    color: Color(0xFF3d76f9),
                    size: 20,
                  ),
                ],
              ),
            SizedBox(width: 3),
            Text(
              "${widget.name}",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// class _LiveRoomMemberState extends State<LiveRoomMember> {
//   final bool isMuted;
//   final bool isNewMember;
//   final bool isModerator;
//   final String name;
//   final String imagePath;
//   final Color? color;
//   const LiveRoomMember({
//     Key? key,
//     required this.name,
//     required this.imagePath,
//     this.color,
//     this.isMuted = true,
//     this.isNewMember = false,
//     this.isModerator = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {

//   }
// }
