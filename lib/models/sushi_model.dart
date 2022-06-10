import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Sushi extends Equatable {
  final String id;
  final String name;
  final Image image;

  const Sushi({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, image];

  static List<Sushi> sushii = [
    Sushi(
      id: '0',
      name: 'Sushi Roll',
      image: Image.asset('assets/sushi_roll.png'),
    ),
    Sushi(
      id: '1',
      name: 'Sushi Ebi',
      image: Image.asset('assets/sushi_ebi.png'),
    ),
  ];
}
