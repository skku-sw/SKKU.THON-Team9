import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String name = ''; //이름
  String patientIdFirst = ''; //주민등록번호
  String patientIdLast = '';
  String pw = ''; //비밀번호
  String repw = ''; //비밀번호 재확인

  String sendName = '';
  String sendPatientId = '';
  String sendPassword = '';
  String sendBirth = '';
  String sendSex = '';

  //성별
  bool isMaleSelected = false;
  bool isFemaleSelected = false;

  final _nameTextEditController = TextEditingController();
  final _idFirstTextEditController = TextEditingController();
  final _idSecondTextEditController = TextEditingController();
  final _passwordTextEditController = TextEditingController();
  final _repasswordTextEditController = TextEditingController();

  final bool loadingOver = true;

  bool acceptAll = false;
  bool acceptAge = false;
  bool acceptProgram = false;
  bool acceptPersonal = false;

  @override
  Widget build(BuildContext context) {
    return loadingOver
        ? SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
// ---이름--- //
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '이름*',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: _nameTextEditController,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          name = value;
                        },
                        decoration: InputDecoration(
                          hintText: '  이름 입력',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 20),

// ---주민등록번호--- //
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '주민등록번호*',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _idFirstTextEditController,
                              keyboardType:
                                  TextInputType.number, // 숫자 입력 타입으로 변경
                              maxLength: 6,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]'))
                              ],
                              onChanged: (value) {
                                patientIdFirst = value;
                              },
                              decoration: InputDecoration(
                                counterText: '',
                                hintText: '  주민등록번호 앞자리 입력',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: TextField(
                              controller: _idSecondTextEditController,
                              keyboardType:
                                  TextInputType.number, // 숫자 입력 타입으로 변경
                              maxLength: 7,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]'))
                              ],
                              onChanged: (value) {
                                patientIdLast = value;
                              },
                              decoration: InputDecoration(
                                counterText: '',
                                hintText: '  주민등록번호 뒷자리 입력',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 14,
                              ),
                              obscureText: true, // 입력된 텍스트를 '*'로 가립니다.
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

// ---성별--- //
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '성별*',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(100, 40),
                              primary: isMaleSelected
                                  ? Color.fromARGB(255, 80, 77, 77)
                                  : Colors.grey, // 선택 상태에 따라 색상 변경
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(8.0),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                isMaleSelected = !isMaleSelected;
                                isFemaleSelected = false; // 다른 버튼 선택 해제
                              });
                            },
                            child: Text("남성"),
                          ),
                          SizedBox(width: 16),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(100, 40),
                              primary: isFemaleSelected
                                  ? Color.fromARGB(255, 80, 77, 77)
                                  : Colors.grey, // 선택 상태에 따라 색상 변경
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(8.0),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                isFemaleSelected = !isFemaleSelected;
                                isMaleSelected = false; // 다른 버튼 선택 해제
                              });
                            },
                            child: Text("여성"),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

// ---비밀번호--- //
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '비밀번호*',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: _passwordTextEditController,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          pw = value;
                        },
                        decoration: InputDecoration(
                          hintText: '  비밀번호 입력',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: _repasswordTextEditController,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          repw = value;
                        },
                        decoration: InputDecoration(
                          hintText: '  비밀번호 재입력',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 20),

// ---약관--- //
                      Row(
                        children: [
                          Checkbox(
                            value: acceptAll,
                            onChanged: (value) {
                              setState(() {
                                acceptAll = value!;
                                acceptAge = value!;
                                acceptPersonal = value!;
                                acceptProgram = value!;
                              });
                            },
                            checkColor: Color.fromARGB(255, 255, 255, 255),
                            activeColor: Color.fromARGB(255, 80, 77, 77),
                          ),
                          Text(
                            "약관 모두 동의",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 156, 155, 155),
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 35,
                                  width: 50,
                                  child: Transform.scale(
                                    scale: 0.6,
                                    child: Checkbox(
                                      value: acceptAge,
                                      onChanged: (value) {
                                        setState(() {
                                          acceptAge = value!;
                                          if (!acceptAge) {
                                            acceptAll = false;
                                          }
                                          if (acceptAge &&
                                              acceptPersonal &&
                                              acceptProgram) {
                                            acceptAll = true;
                                          }
                                        });
                                      },
                                      checkColor:
                                          Color.fromARGB(255, 255, 255, 255),
                                      activeColor:
                                          Color.fromARGB(255, 80, 77, 77),
                                    ),
                                  ),
                                ),
                                Text(
                                  "만 14세 이상입니다",
                                  style: TextStyle(
                                    fontSize: 13,
                                    height: 1.3,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 35,
                                  width: 50,
                                  child: Transform.scale(
                                    scale: 0.6,
                                    child: Checkbox(
                                      value: acceptProgram,
                                      onChanged: (value) {
                                        setState(() {
                                          acceptProgram = value!;
                                          if (!acceptProgram) {
                                            acceptAll = false;
                                          }
                                          if (acceptAge &&
                                              acceptPersonal &&
                                              acceptProgram) {
                                            acceptAll = true;
                                          }
                                        });
                                      },
                                      checkColor:
                                          Color.fromARGB(255, 255, 255, 255),
                                      activeColor:
                                          Color.fromARGB(255, 80, 77, 77),
                                    ),
                                  ),
                                ),
                                Text(
                                  "SKKU-MEDICAL 약관 동의",
                                  style: TextStyle(
                                    fontSize: 13,
                                    height: 1.3,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 35,
                                  width: 50,
                                  child: Transform.scale(
                                    scale: 0.6,
                                    child: Checkbox(
                                      value: acceptPersonal,
                                      onChanged: (value) {
                                        setState(() {
                                          acceptPersonal = value!;
                                          if (!acceptPersonal) {
                                            acceptAll = false;
                                          }
                                          if (acceptAge &&
                                              acceptPersonal &&
                                              acceptProgram) {
                                            acceptAll = true;
                                          }
                                        });
                                      },
                                      checkColor:
                                          Color.fromARGB(255, 255, 255, 255),
                                      activeColor:
                                          Color.fromARGB(255, 80, 77, 77),
                                    ),
                                  ),
                                ),
                                Text(
                                  "개인정보수집 및 이용에 대한 안내",
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    height: 35,
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: TextButton(
                                        onPressed: Finish,
                                        child: Text(
                                          "내용보기",
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xFFA3A3A3),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      ElevatedButton(
                        onPressed: () {
                          Finish();
                        },
                        child: Text(
                          '가입하기',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize:
                              Size(MediaQuery.of(context).size.width, 55),
                          primary: Color.fromARGB(255, 80, 77, 77),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(40.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : Center(
            child: Image.asset(
              'assets/loading.png',
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
          );
  }

  void updateServer() async {
    var url = Uri.parse(
        'http://43.202.67.55:5000/user/register'); // 수정: Uri.parse를 사용하고 'https'를 추가

    String lastDigit = patientIdLast[0];
    sendName = name;
    sendPatientId = patientIdFirst + patientIdLast;
    sendPassword = pw;

    if (lastDigit == '0') {
      sendBirth = '18' + patientIdFirst;
    } else if (lastDigit == '1' ||
        lastDigit == '2' ||
        lastDigit == '5' ||
        lastDigit == '6') {
      sendBirth = '19' + patientIdFirst;
    } else if (lastDigit == '3' ||
        lastDigit == '4' ||
        lastDigit == '7' ||
        lastDigit == '8') {
      sendBirth = '20' + patientIdFirst;
    }

    String year = sendBirth.substring(0, 4);
    String month = sendBirth.substring(4, 6);
    String day = sendBirth.substring(6, 8);
    sendBirth = year + '-' + month + '-' + day;
    print('$sendBirth');

    if (isMaleSelected) {
      sendSex = 'Male';
    } else {
      sendSex = 'Female';
    }

    try {
      String jsonData = jsonEncode({
        'patient_id': sendPatientId,
        'full_name': sendName,
        'gender': sendSex,
        'address': 'temp',
        'date_of_birth': sendBirth,
        'password': sendPassword,
      });

// HTTP POST 요청
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'}, // JSON 형식임을 명시
        body: jsonData,
      );

      if (response.statusCode == 200) {
        // 성공적인 응답 처리
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

        // 회원가입 성공 다이얼로그 표시
      } else {
        // 서버에서 에러 응답을 받은 경우 처리
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('서버에서 오류가 발생했습니다.'),
              content: Text('다시 시도해주세요.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('확인'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      // 예외 발생 시 처리
      print('Error: $e');

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('오류가 발생했습니다.'),
            content: Text('다시 시도해주세요.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('확인'),
              ),
            ],
          );
        },
      );
    }
  }

  void Finish() {
    if (name.isEmpty ||
        patientIdFirst.isEmpty ||
        patientIdLast.isEmpty ||
        pw.isEmpty ||
        repw.isEmpty ||
        (!isMaleSelected && !isFemaleSelected) ||
        !(acceptAge && acceptPersonal && acceptProgram)) {
      // Show error dialog
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('입력하지 않은 항목이 있거나 동의하지 않은 약관이 있습니다.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('확인'),
              ),
            ],
          );
        },
      );
    } else if (patientIdFirst.length != 6 || patientIdLast.length != 7) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('주민등록번호 형식이 올바르지 않습니다.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('확인'),
              ),
            ],
          );
        },
      );
    } else if (pw != repw) {
      // 비밀번호 확인이 일치하지 않을 때 오류 메시지 표시
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('비밀번호 확인이 일치하지 않습니다.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('확인'),
              ),
            ],
          );
        },
      );
    } else {
      // Registration successful dialog
      updateServer();
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('회원가입이 완료되었습니다!'),
            actions: [
              TextButton(
                onPressed: () {
                  // 회원가입 완료 후 로그인 페이지로 이동
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                  );
                },
                child: Text('확인'),
              ),
            ],
          );
        },
      );
    }
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Registration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Register(), // Register 위젯을 앱의 첫 화면으로 설정
    );
  }
}
