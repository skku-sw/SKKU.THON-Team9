import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'main.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String patientIdFirst = '';
  String patientIdLast = '';
  String pw = ''; //비밀번호

  String sendPatientId = '';
  String sendPassword = '';

  final _idFirstTextEditController = TextEditingController();
  final _idSecondTextEditController = TextEditingController();
  final _passwordTextEditController = TextEditingController();

  bool isMaleSelected = false;
  bool isFemaleSelected = false;

  final bool loadingOver = true;

  bool acceptAll = false;
  bool acceptAge = false;
  bool acceptProgram = false;
  bool acceptPersonal = false;
  bool acceptEvent = false;
  bool acceptGift = false;

  @override
  Widget build(BuildContext context) {
    return loadingOver
        ? SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Stack(
                  children: <Widget>[
                    // Background Image
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        'assets/login.png', // Replace with your image path
                        fit: BoxFit.cover,
                        height: 300, // Adjust the height as needed
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          // ... (rest of your code)
                          SizedBox(height: 130),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              child: Text(
                                '',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 100),

                          //name
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

                          //password
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'PASSWORD*',
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
                          SizedBox(height: 30),

                          ElevatedButton(
                            onPressed: () {
                              Finish();
                            },
                            child: Text(
                              'Login',
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
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '계정이 없으신가요?',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Register())); // Navigate to the login screen
                                },
                                child: Text(
                                  '가입하기',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue, // 원하는 색상으로 변경할 수 있습니다.
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
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

  void getfromServer() async {
    var url = Uri.parse('http://43.202.67.55:5000/user/login');

    sendPatientId = patientIdFirst + patientIdLast;
    sendPassword = pw;

    try {
      String jsonData = jsonEncode({
        'patient_id': sendPatientId,
        'password': sendPassword,
      });

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonData,
      );

      if (response.statusCode == 200) {
        // Successful login
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

        // Parse the JSON response
        Map<String, dynamic> data = json.decode(response.body);

        // Access the access_token
        String accessToken = data['access_token'];

        // You can do something with the access token here.

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('로그인이 완료되었습니다!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: Text('확인'),
                ),
              ],
            );
          },
        );
      } else {
        // Handle errors from the server
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
      // Handle exceptions
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
    if (patientIdFirst.isEmpty || patientIdLast.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('주민등록번호를 모두 입력해주십시오'),
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
    } else if (pw.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('비밀번호를 입력해주십시오'),
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
      getfromServer();
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('로그인이 완료되었습니다!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
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
}
