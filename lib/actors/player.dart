import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:pixel_platformer/pixel_plaformer.dart';

enum PlayerStates { idle, running }

class Player extends SpriteAnimationGroupComponent
    with HasGameRef<PixelPlatformer> {
  String character;
  Player({required this.character, position}) : super(position: position);

  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation runningAnimation;
  final double stepTime = 0.05;

  @override
  FutureOr<void> onLoad() {
    _loadAllAnimation();
    return super.onLoad();
  }

  void _loadAllAnimation() {
    // loads animation
    idleAnimation = _spriteAnimation("Idle", 11);
    runningAnimation = _spriteAnimation("Run", 12);

    // List all animations as states
    animations = {
      PlayerStates.idle: idleAnimation,
      PlayerStates.running: runningAnimation,
    };
    // Sets the current animation
    current = PlayerStates.idle;
  }

  SpriteAnimation _spriteAnimation(String state, int amount) {
    return SpriteAnimation.fromFrameData(
        game.images.fromCache("Main Characters/$character/$state (32x32).png"),
        SpriteAnimationData.sequenced(
            amount: amount, stepTime: stepTime, textureSize: Vector2.all(32)));
  }
}
