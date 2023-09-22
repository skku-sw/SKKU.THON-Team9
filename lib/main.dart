import 'package:flutter/material.dart';
import 'amplifyconfiguration.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class LoginData {
  String email;
  String password;

  LoginData({
    required this.email,
    required this.password,
  });
}

class _RegisterState extends State<Register> {
  String name = '';
  String email = '';
  String pw = '';
  String repw = '';
  String txt = '';
  String firstPhone = '';
  String secondPhone = '';
  String thirdPhone = '';

  bool loadingOver = true;
  bool acceptAll = false;
  bool acceptAge = false;
  bool acceptProgram = false;
  bool acceptPersonal = false;
  bool acceptEvent = false;
  bool acceptGift = false;

  void _verifyCode(LoginData data, String code) async {
    safePrint("verifying code: $code");
    try {
      SignUpResult res = await Amplify.Auth.confirmSignUp(
          username: data.email, confirmationCode: code);
      if (res.isSignUpComplete) {
        safePrint("Confirmed!");
      }
    } on AuthException catch (e) {
      safePrint("Error occurred: ${e.message}");
      // 에러 핸들링
    }
  }

  Future<String> _onSignUp() async {
    try {
      await Amplify.Auth.signUp(
        username: email,
        password: pw,
      );
      return 'Sign Up successful';
    } on AuthException catch (e) {
      return '${e.message} - ${e.recoverySuggestion}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return loadingOver
        ? SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          child: Text(
                            'Lifelog',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
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
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          name = value;
                        },
                        onSubmitted: (_) {
                          submitId();
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '이메일*',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: TextEditingController(),
                        onChanged: (value) {
                          email = value;
                        },
                        onSubmitted: (_) {
                          submitNickName();
                        },
                        decoration: InputDecoration(
                          hintText: '  이메일 입력',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          suffixIcon: Container(
                            margin: EdgeInsets.all(8),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(100, 40),
                                primary: Color.fromARGB(255, 80, 77, 77),
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(8.0),
                                ),
                              ),
                              child: Text("중복확인"),
                              onPressed: () {}, //중복확인 function 넣을 예정
                            ),
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 20),
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
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          pw = value;
                        },
                        onSubmitted: (_) {
                          submitId();
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
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          repw = value;
                        },
                        onSubmitted: (_) {
                          submitId();
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '휴대폰 번호*',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: TextField(
                              maxLength: 3,
                              keyboardType: TextInputType.phone,
                              onChanged: (value) {
                                firstPhone = value;
                              },
                              onSubmitted: (_) {
                                submitId();
                              },
                              decoration: InputDecoration(
                                counterText: "",
                                hintText: '010',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Flexible(
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              onChanged: (value) {
                                secondPhone = value;
                              },
                              onSubmitted: (_) {
                                submitId();
                              },
                              decoration: InputDecoration(
                                hintText: '0000',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Flexible(
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              onChanged: (value) {
                                thirdPhone = value;
                              },
                              onSubmitted: (_) {
                                submitId();
                              },
                              decoration: InputDecoration(
                                hintText: '0000',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(130, 55),
                              primary: Color.fromARGB(255, 80, 77, 77),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(15.0),
                              ),
                            ),
                            child: Text("인증요청"),
                            onPressed: () {}, //중복확인 function 넣을 예정
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Checkbox(
                            value: acceptAll,
                            onChanged: (value) {
                              setState(() {
                                acceptAll = value!;
                                acceptAge = value!;
                                acceptEvent = value!;
                                acceptGift = value!;
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
                                  "라이프로그 약관 동의",
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
                            Row(
                              children: [
                                SizedBox(
                                  height: 30,
                                  width: 50,
                                  child: Transform.scale(
                                    scale: 0.6,
                                    child: Checkbox(
                                      value: acceptEvent,
                                      onChanged: (value) {
                                        setState(() {
                                          acceptEvent = value!;
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
                                  "이벤트/마케팅 수신 동의",
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
                            Row(
                              children: [
                                SizedBox(
                                  height: 30,
                                  width: 50,
                                  child: Transform.scale(
                                    scale: 0.6,
                                    child: Checkbox(
                                      value: acceptGift,
                                      onChanged: (value) {
                                        setState(() {
                                          acceptGift = value!;
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
                                  "혜택 알림 수신 동의",
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

  void submitNickName() {
    setState(() {
      name = txt;
      txt = '';
    });
  }

  void submitId() {
    setState(() {
      name = '';
    });
  }

  void submitPw() {
    setState(() {
      pw = txt;
      txt = '';
    });
  }

  void submitRepw() {
    setState(() {
      repw = txt;
      txt = '';
    });
  }

  void Finish() {
    if (name.isEmpty || email.isEmpty || pw.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('입력하지 않은 항목이 있습니다'),
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
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('회원가입이 완료되었습니다!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _onSignUp();
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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureAmplify();
  runApp(MyApp());
}

Future<void> _configureAmplify() async {
  // final auth = AmplifyAuthCognito(); // Auth 서비스 생성
  // final analytics = AmplifyAnalyticsPinpoint(); // Analytics 서비스 생성
  bool configured = false;

  try {
    await Amplify.addPlugin(AmplifyAuthCognito()); // 플러그인 추가
    await Amplify.configure(amplifyconfig); // amplifyconfig 변수 정의 필요
    configured = true;
    safePrint('Successfully configured');
  } on Exception catch (e) {
    safePrint('Error configuring Amplify: $e');
  }

  if (configured) {
    safePrint('Successfully configured Amplify 🎉');
  }
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
