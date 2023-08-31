import 'dart:async';

import 'package:flame/components.dart';
import 'package:pixel_platformer/pixel_plaformer.dart';

class BackgroundTile extends SpriteComponent with HasGameRef<PixelPlatformer> {
  final String color;
  BackgroundTile({position, this.color = "Gray"}) : super(position: position);

  final double scrollSpeed = 1;

  @override
  FutureOr<void> onLoad() {
    priority = -1;
    size = Vector2.all(64.6);
    sprite = Sprite(game.images.fromCache("Background/$color.png"));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    position.y += scrollSpeed;
    double tileSize = 64;
    int scrollHeight = (game.size.y / tileSize).floor();

    if (position.y > scrollHeight * tileSize) position.y = -tileSize;
    super.update(dt);
  }
}
