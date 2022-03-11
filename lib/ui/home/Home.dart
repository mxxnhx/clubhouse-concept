import 'dart:math';

import 'package:clubhouse/utils/DynamicColor.dart';
import 'package:clubhouse/utils/MemojiColors.dart';
import 'package:clubhouse/widgets/SquircleIconButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final topics = [
      "🎨 Design",
      "🌍 Flutter",
      "🎯 Figma",
      "👀 Clone",
      "⛱ Saturday",
    ];
    return Scaffold(
      // CHECK: Scaffold는 material design의 기본 layout 구조입니다.
      extendBody: true,
      appBar: AppBar(
        centerTitle: false,
        title: Text("Good Morning,\nLeslie"),
        actions: [
          // TODO: 1. 우측 상단에 검색 버튼을 넣어보세요.
          // TODO: 2. 우측 상단에 프로필 이미지를 넣어보세요.
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: SizedBox(
            height: 50,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: topics.length,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              separatorBuilder: (_, __) => SizedBox(width: 10),
              itemBuilder: (context, index) {
                final color = MemojiColors.values[
                    Random.secure().nextInt(MemojiColors.values.length - 1) +
                        1];
                return InputChip(
                  backgroundColor: DynamicColor.withBrightness(
                    context: context,
                    color: color,
                    darkColor: color.withOpacity(0.15),
                  ),
                  label: Text(
                    "${topics[index]}",
                    style: TextStyle(
                      height: 1.2,
                      color: theme.textTheme.bodyText2!.color,
                    ),
                  ),
                  onPressed: () {},
                );
              },
            ),
          ),
        ),
      ),
      // TODO: 3. 채팅방을 표시해보세요.
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0.35, 1],
            colors: [
              theme.scaffoldBackgroundColor.withOpacity(0),
              theme.scaffoldBackgroundColor,
              theme.scaffoldBackgroundColor,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 25, 20, 10),
          child: SafeArea(
            top: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SquircleIconButton(
                  icon: Icon(Icons.calendar_today_outlined),
                  onPressed: () {},
                ),
                ElevatedButton.icon(
                  icon: Icon(CupertinoIcons.plus_circle_fill),
                  label: Text("Start room"),
                  onPressed: () {},
                ),
                SquircleIconButton(
                  icon: Icon(CupertinoIcons.person),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
