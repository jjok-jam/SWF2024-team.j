import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:logger/logger.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:barcode_widget/barcode_widget.dart';

var logger = Logger(
    printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 100,
        colors: true,
        printEmojis: true,
        printTime: true));

void main() {
  runApp(const MainHome());
}

class MainHome extends StatelessWidget {
  const MainHome({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainHomePage(),
    );
  }
}

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  MainHomePageState createState() => MainHomePageState();
}

class MainHomePageState extends State<MainHomePage> {
  @override
  void initState() {
    super.initState();
    logger.i('MainHomePageState.initState');
  }

  @override
  void dispose() {
    logger.i('MainHomePageState.dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    String desc1 = '유전체 데이터를 통해 다양한 암(예: 유방암, 대장암, 전립선암 등)의 발병 가능성을 예측합니다.'
        '암 관련 유전자의 변이를 확인하여, 개인 맞춤형 건강 관리와 조기 진단';
    String desc2 = '유전자 변이가 심장 질환에 미치는 영향을 분석하여, 심근경색, 관상동맥 질환 등의 발병 위험을 예측합니다.'
        '유전적 위험도를 확인하고, 심장 건강을 위한 맞춤형 예방 조치';

    return Scaffold(
      backgroundColor: const Color(0xFFEDF0F7),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 30.0, bottom: 30.0, left: 10, right: 10),
          child: Column(
            children: <Widget>[
              Container(
                width: screenWidth * 0.98,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  gradient: const LinearGradient(colors: [Color(0xFF536DFE), Color(0xFF6A3DE8)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const CircleAvatar(radius: 30, backgroundImage: AssetImage('assets/img/img_19.jpeg')),
                            const SizedBox(width: 20),
                            Expanded(
                              child: ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                children: const <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            '내 유전자 지갑',
                                            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
                                          ),
                                          SizedBox(width: 10),
                                        ],
                                      ),
                                      Icon(Icons.chevron_right, color: Color(0xFF536DFE)),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Icon(Icons.credit_card, color: Colors.white, size: 15),
                                          SizedBox(width: 10),
                                          Text(
                                            '유전체신분증',
                                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 30),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Icon(Icons.info, color: Colors.white, size: 15),
                                          SizedBox(width: 10),
                                          Text(
                                            '알림:',
                                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            '3건',
                                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                    Container(
                      height: 1.0,
                      color: Colors.grey[300], // Divider color
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              BarcodeWidget(
                                barcode: Barcode.code128(),
                                data: '60aa9cb45de7e247581f41aaa9c295e05e69112f2e89f7537855b434d586bb64',
                                width: screenWidth * 0.85,
                                height: 70,
                                color: Colors.white,
                                drawText: true,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 100,
                            padding: const EdgeInsets.only(top: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.0),
                              boxShadow: const [
                                BoxShadow(color: Color(0xFFFFFFFF), blurRadius: 20),
                                BoxShadow(color: Color.fromARGB(255, 238, 220, 251)),
                                BoxShadow(color: Color(0xFFF1E4FB), spreadRadius: -5, blurRadius: 10)
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  margin: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12.0)),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Color(0xFFF1E4FB),
                                        child: Icon(Boxicons.bx_hdd, color: Color(0xFF9B57CA)),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '유전데이터',
                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF9B57CA)),
                                      ),
                                    ],
                                  ),
                                ),
                                const Text(
                                  '210 GB',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF676767)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            height: 100,
                            padding: const EdgeInsets.only(top: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.0),
                              boxShadow: const [
                                BoxShadow(color: Color(0xFFFFFFFF), blurRadius: 20),
                                BoxShadow(color: Color.fromARGB(255, 202, 236, 236)),
                                BoxShadow(color: Color(0xFFD6EEEE), spreadRadius: -5, blurRadius: 10)
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  margin: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12.0)),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Color(0xFFD6EEEE),
                                        child: Icon(Boxicons.bx_bar_chart, color: Color(0xFF3D81B7)),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '정보 이용',
                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF3D81B7)),
                                      ),
                                    ],
                                  ),
                                ),
                                const Text(
                                  '총 3 회',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF676767)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            height: 100,
                            padding: const EdgeInsets.only(top: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.0),
                              boxShadow: const [
                                BoxShadow(color: Color(0xFFFFFFFF), blurRadius: 20),
                                BoxShadow(color: Color.fromARGB(255, 247, 226, 208)),
                                BoxShadow(color: Color(0xFFF6E6D9), spreadRadius: -5, blurRadius: 10)
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  margin: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12.0)),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Color(0xFFF6E6D9),
                                        child: Icon(Boxicons.bxs_virus, color: Color(0xFFDF7136)),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '위험 점수',
                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFFDF7136)),
                                      ),
                                    ],
                                  ),
                                ),
                                const Text(
                                  '상위 10%',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF676767)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: screenWidth * 0.98,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  gradient: const LinearGradient(colors: [Color(0xFF536DFE), Color(0xFF6A3DE8)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const SizedBox(width: 20),
                            Expanded(
                              child: ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                children: const <Widget>[
                                  Text(
                                    '주요 질병 유전체 분석',
                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    '개인 유전체 데이터를 기반으로 암, 심혈관 질환 등\n유전적 질병 위험도를 빠르고 정확하게 분석',
                                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Boxicons.bx_chevron_right_circle, color: Colors.white, size: 32),
                          ],
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: screenWidth * 0.98,
                height: 260,
                padding: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  gradient: const LinearGradient(colors: [Color(0xFF536DFE), Color(0xFF6A3DE8)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  image: const DecorationImage(
                    image: AssetImage('assets/img/t_img_1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const SizedBox(width: 20),
                          Expanded(
                            child: ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: const <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(Boxicons.bx_dna, color: Colors.white, size: 15),
                                    Text(
                                      'XenoBlock',
                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  '국내 첫 오픈',
                                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '개인 유전체 맞춤 분석 서비스',
                                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '블록체인 기반 개인 유전체 데이터, 내가 직접 관리하고 모바일로 간편하게 분석 요청!\n'
                                  '맞춤형 의료 혁신을 지금 경험하세요.',
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      color: const Color(0xFF536DFE), // 배경색 설정
                      child: const SizedBox(
                        height: 25,
                        width: 5,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text('주요 질병 유전체 분석',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  ]
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(left: 10.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '유전체 분석을 통해 여러분의 건강을 더 깊이 이해하고 예방할 수 있습니다.'
                        '심장 질환, 암, 당뇨병 등 주요 질병에 대한 유전자 기반 분석을 통해 유전적 위험도를 확인하고, 맞춤형 예방 조치를 취할 수 있습니다.',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal)),
                    )
                  ]
                ),
              ),
              const SizedBox(height: 15),
              CarouselSlider(
                options: CarouselOptions(
                  height: 280,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.2,
                  scrollDirection: Axis.horizontal,
                ),
                items: [1, 2].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Container(
                                height: 130,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade300, // 테두리 색상 설정
                                    width: 1.0, // 테두리 두께 설정
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16.0),
                                    topRight: Radius.circular(16.0),
                                  ),
                                  image: const DecorationImage(
                                    image: AssetImage('assets/img/t_img_6.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    i == 1 ? '주요 5대 암 검사' : '심혈관 질환 검사',
                                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.values[8], color: Colors.white),
                                  ),
                                )
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  left: BorderSide(color: Colors.grey.shade300, width: 1.0),
                                  right: BorderSide(color: Colors.grey.shade300, width: 1.0),
                                  bottom: BorderSide(color: Colors.grey.shade300, width: 1.0),
                                ),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(16.0),
                                  bottomRight: Radius.circular(16.0),
                                ),
                                boxShadow: const [BoxShadow(color: Colors.grey, spreadRadius: -5, blurRadius: 20)],
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              i == 1 ? desc1 : desc2,
                                              style: TextStyle( fontSize: 13, fontWeight: FontWeight.normal, color: Colors.grey[900]),
                                              softWrap: true
                                            ),
                                          ),
                                        ],
                                      )
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      );
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(const Color(0xFF536DFE), Boxicons.bx_home, 'My Gene'),
        _buildButtonColumn(const Color(0xFF536DFE), Boxicons.bx_id_card, '유전체신분증'),
        _buildButtonColumn(const Color(0xFF536DFE), Boxicons.bx_dna, '나의 유전 데이터'),
        _buildButtonColumn(const Color(0xFF536DFE), Boxicons.bxs_virus, '주요 질병 유전체'),
      ],
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: color, size: 44.0),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400, color: color),
          ),
        ),
      ],
    );
  }
}