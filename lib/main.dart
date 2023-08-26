import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:pixel_platformer/pixel_plaformer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();

  PixelPlatformer game = PixelPlatformer();
  runApp(GameWidget(game: kDebugMode ? PixelPlatformer() : game));
}