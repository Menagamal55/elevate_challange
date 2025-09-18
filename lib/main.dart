import 'package:elevate_challenge/cubit/product_cubit.dart';
import 'package:elevate_challenge/cubit/product_repositery.dart';
import 'package:elevate_challenge/ui/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

void main() {
  final dio = Dio();
  final repository = ProductsRepository(dio);

  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final ProductsRepository repository;
  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ProductsCubit(repository)..fetchProducts(),
        child: const HomeScreen(),
      ),
    );
  }
}