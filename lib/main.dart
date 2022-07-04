import 'package:flutter/material.dart';

import 'router.dart';

void main() => runApp(
      MaterialApp(
        title: 'SC Asg2',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        initialRoute: '/',
        onGenerateRoute: createRoute,
      ),
    );
