import 'dart:convert';

import 'package:flutter/material.dart';

import 'crypto_list.dart';
import 'data/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> cryptos = [];

  @override
  void initState() {
    cryptos = jsonDecode(cryptoExchanges);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Look'),
        leading: const Icon(Icons.menu),
      ),
      body: CryptoList(cryptos: cryptos),
    );
  }
}
