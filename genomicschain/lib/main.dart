import 'package:flutter/material.dart';
import 'package:genomicschain/screens/login.dart';

void main() {
  runApp(const GenomicsChain());
}

class GenomicsChain extends StatelessWidget {
  const GenomicsChain({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Genomics Chain',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system, // 시스템 설정에 따라 테마 자동 변경
      home: const GenomicsChainPage(),
    );
  }
}

class GenomicsChainPage extends StatefulWidget {
  const GenomicsChainPage({super.key});

  @override
  State<GenomicsChainPage> createState() => GenomicsChainPageState();
}

class GenomicsChainPageState extends State<GenomicsChainPage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
