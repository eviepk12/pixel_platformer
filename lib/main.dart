import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:pixel_platformer/pixel_plaformer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setLandscape();

  PixelPlatformer game = PixelPlatformer();
  runApp(GameWidget(game: kDebugMode ? PixelPlatformer() : game));
}
// test