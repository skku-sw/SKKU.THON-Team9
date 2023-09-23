import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:internet_file/internet_file.dart';
import 'package:pdfx/pdfx.dart';

class ThirdPage extends StatelessWidget {
  final String data;

  ThirdPage(this.data);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(data: data),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String data;

  MyHomePage({required this.data});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> data = [];
  var url = Uri.parse('http://43.202.67.55:5000/user/find_medical_history');
  // 모든 항목의 목록 (예제용)
  List<String> allItems = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Grapes',
    'Lemon',
    'Mango',
    'Orange',
    'Peach',
    'Pear',
  ];

  // 검색 결과를 저장할 리스트
  List<String> filteredItems = [];
  late PdfController pdfController;

  @override
  void initState() {
    super.initState();
    // 초기에는 전체 항목을 검색 결과로 설정
    filteredItems = allItems;
    getfromServer();
    pdfController = PdfController(
      document: PdfDocument.openData(InternetFile.get(
          'https://upload.wikimedia.org/wikipedia/commons/8/85/I-20-sample.pdf')),
      initialPage: 1,
    );
  }

  // 검색어에 따라 리스트를 필터링하는 함수
  void filterList(String query) {
    setState(() {
      filteredItems = allItems
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void getfromServer() async {
    try {
      String jsonData = jsonEncode({
        'Bearer_Token': 'Bearer' + widget.data,
      });

      var response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${widget.data}',
        },
      );

      if (response.statusCode == 200) {
        // Successful login
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

        // Parse the JSON response
        data = json.decode(response.body);

        print('${data.length}');
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

  @override
  Widget build(BuildContext context) {
    filterList('');
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 50,
            width: 380,
            child: TextField(
              onChanged: (value) {
                filterList(value);
              },
              decoration: InputDecoration(
                hintText: 'Pdf 검색',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                prefixIcon: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: _openDrawer,
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(20),
              crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
              childAspectRatio: 1 / 1.5, //item 의 가로 1, 세로 2 의 비율
              mainAxisSpacing: 10, //수평 Padding
              crossAxisSpacing: 10, //수직 Padding
              children: List.generate(data.length, (index) {
                //item 의 반목문 항목 형성
                return Container(
                  height: 300,
                  color: Color.fromARGB(255, 240, 242, 255),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 200, //height of button
                          width: 300, //width of button
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: const Color.fromARGB(255, 255, 255,
                                    255), //background color of button
                                side: BorderSide(
                                    width: 3,
                                    color: Color.fromARGB(255, 58, 81,
                                        141)), //border width and color
                                elevation: 3, //elevation of button
                                padding: EdgeInsets.all(
                                    20) //content padding inside button
                                ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
                                  builder: (BuildContext context) {
                                    pdfController = PdfController(
                                      document: PdfDocument.openData(
                                          InternetFile.get(
                                              data[index]['filename'])),
                                      initialPage: 1,
                                    );
                                    return PdfView(
                                      builders: PdfViewBuilders<
                                          DefaultBuilderOptions>(
                                        options: const DefaultBuilderOptions(),
                                        documentLoaderBuilder: (_) =>
                                            const Center(
                                                child:
                                                    CircularProgressIndicator()),
                                        pageLoaderBuilder: (_) => const Center(
                                            child: CircularProgressIndicator()),
                                      ),
                                      controller: pdfController,
                                    );
                                  });
                            },
                            child: Image.asset(
                              'assets/pdf.png',
                              height: 50,
                              width: 50,
                              fit: BoxFit.fill,
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          '날짜 : ${data[index]['hospitalization_dates'].substring(0, 16)}'),
                      Text('담당의 : ${data[index]['doctor_name']}'),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("John Doe"),
              accountEmail: Text("johndoe@example.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "JD",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // 메뉴 항목을 선택할 때 수행할 동작 추가
                Navigator.pop(context); // 메뉴 닫기
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // 메뉴 항목을 선택할 때 수행할 동작 추가
                Navigator.pop(context); // 메뉴 닫기
              },
            ),
          ],
        ),
      ),
    );
  }
}
