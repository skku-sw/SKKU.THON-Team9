// FirstPage.dart
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            color: Colors.white,
            height: 800,
            width: 380,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬 설정
              children: [
                SizedBox(
                  height: 100,
                ),
                Text(
                  "SKKU-Medical",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 15, 43, 153),
                  ),
                ),
                SizedBox(
                  height: 110,
                ),
                Text(
                  "환영합니다.",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "원하시는 작업을 선택 해주세요.",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 90,
                ),
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        SizedBox(
                          width: 180,
                          height: 300,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 136, 157, 233),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          width: 150,
                          height: 150,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 200, 211, 255),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Icon(
                              Icons.qr_code_scanner_outlined,
                              size: 100,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 180, 0, 0),
                          width: 150,
                          height: 50,
                          child: Text(
                            "QR 인증",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 230, 90, 0),
                          width: 100,
                          height: 50,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 31, 73, 239),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Icon(
                              Icons.arrow_back_outlined,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        SizedBox(
                          width: 180,
                          height: 300,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 150, 162, 207),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          width: 150,
                          height: 150,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 184, 195, 241),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Icon(
                              Icons.edit_document,
                              size: 100,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 180, 0, 0),
                          width: 150,
                          height: 50,
                          child: Text(
                            "  진료서 보기",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(90, 230, 0, 0),
                          width: 100,
                          height: 50,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 38, 62, 157),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Icon(
                              Icons.arrow_forward_outlined,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
