// FirstPage.dart
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CrossShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Color.fromARGB(255, 8, 4, 29) // 십자가 모양의 색상 설정
      ..strokeWidth = 170.0; // 십자가 모양의 선 두께 설정

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double rectWidth = 310.0; // 사각형 너비
    final double rectHeight = 310.0; // 사각형 높이

    // 수평선을 그립니다.
    canvas.drawLine(Offset(centerX - rectWidth / 2, centerY),
        Offset(centerX + rectWidth / 2, centerY), paint);

    // 수직선을 그립니다.
    canvas.drawLine(Offset(centerX, centerY - rectHeight / 2),
        Offset(centerX, centerY + rectHeight / 2), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '증명서 QR코드',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: const Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Color.fromARGB(255, 8, 4, 29), // body 영역의 배경 색상을 회색으로 변경

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "QR코드를 스캔해주세요!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    width: 300, // Container의 너비
                    height: 300, // Container의 높이
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white, // 테두리 색상
                        width: 5.0, // 테두리 두께
                      ),
                    ),
                    child: CustomPaint(
                      size: Size(250, 250), // 도형의 크기 설정
                      painter: CrossShapePainter(),
                    ),
                  ),
                  QrImageView(
                    data: 'http://localhost:3000',
                    version: QrVersions.auto,
                    size: 200.0,
                    foregroundColor: Colors.white,
                    embeddedImageStyle: QrEmbeddedImageStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "필수 제출 정보",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Container(
                height: 60,
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 40, 40, 40),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "고유개인정보",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 40, 40, 40),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "진료기록",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 40, 40, 40),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "담당의정보",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
