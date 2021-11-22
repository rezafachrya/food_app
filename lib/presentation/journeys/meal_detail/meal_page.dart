import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food/common/constants/constants.dart';
import 'package:food/data/database/database_manager.dart';
import 'package:food/di/get_it.dart';
import 'package:food/domain/entities/entities.dart';
import 'package:food/presentation/cubits/favorite/favorite_cubit.dart';
import 'package:food/presentation/cubits/meal_detail/meal_detail_cubit.dart';
import 'package:food/presentation/themes/themes.dart';

part 'meal_screen.dart';
part 'big_poster.dart';
part 'meal_detail_app_bar.dart';
