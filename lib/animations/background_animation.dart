import 'dart:math' as math;

import 'package:flutter/material.dart';

class Bubbles extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BubblesState();
  }
}

class _BubblesState extends State<Bubbles> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Bubble> bubbles;
  final int numberOfBubbles = 100;
  // final Random _random = Random();
  final Color color =
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  // Color.fromARGB(
  //       //or with fromRGBO with fourth arg as _random.nextDouble(),
  //       _random.nextInt(256),
  //       _random.nextInt(256),
  //       _random.nextInt(256),
  //       _random.nextInt(256),
  //     );
  //  Colors.amber;
  // final double maxBubbleSize = 100000;

  @override
  void initState() {
    super.initState();

    // Initialize bubbles
    bubbles = [];
    var i = numberOfBubbles;
    while (i > 0) {
      //     Color colour;
      // double direction;
      // double speed;
      // double radius;
      // double x;
      // double y;
      bubbles.add(Bubble(
          Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
              .withOpacity(1.0),
          math.Random().nextDouble() * 360,
          1,
          math.Random().nextDouble() * 10,
          1,
          1));
      i--;
    }

    // Init animation controller
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _controller.addListener(() {
      updateBubblePosition();
    });
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BubblePainter(bubbles: bubbles),
        size: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height),
      ),
    );
  }

  void updateBubblePosition() {
    bubbles.forEach((it) => it.updatePosition());
    setState(() {});
  }
}

class BubblePainter extends CustomPainter {
  List<Bubble> bubbles;

  BubblePainter({required this.bubbles});

  @override
  void paint(Canvas canvas, Size canvasSize) {
    bubbles.forEach((bubs) => bubs.draw(canvas, canvasSize));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Bubble {
  Color colour;
  double direction;
  double speed;
  double radius;
  double x;
  double y;

  Bubble(
    this.colour,
    this.direction,
    this.speed,
    this.radius,
    this.x,
    this.y,
  ) {
    colour = colour.withOpacity(math.Random().nextDouble());
    // direction = math.Random().nextDouble() * 360;
    speed = 1;
    // ignore: unnecessary_this
    this.radius = math.Random().nextDouble() * 20;
  }

  // ignore: always_declare_return_types
  draw(Canvas canvas, Size canvasSize) {
    // ignore: omit_local_variable_types
    Paint paint = Paint()
      ..color = colour
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    assignRandomPositionIfUninitialized(canvasSize);

    randomlyChangeDirectionIfEdgeReached(canvasSize);

    canvas.drawCircle(Offset(x, y), radius, paint);
  }

  void assignRandomPositionIfUninitialized(Size canvasSize) {
    if (x == null) {
      this.x = math.Random().nextDouble() * canvasSize.width;
    }

    if (y == null) {
      this.y = math.Random().nextDouble() * canvasSize.height;
    }
  }

  updatePosition() {
    var a = 180 - (direction + 90);
    direction > 0 && direction < 180
        ? x += speed * math.sin(direction) / math.sin(speed)
        : x -= speed * math.sin(direction) / math.sin(speed);
    direction > 90 && direction < 270
        ? y += speed * math.sin(a) / math.sin(speed)
        : y -= speed * math.sin(a) / math.sin(speed);
  }

  randomlyChangeDirectionIfEdgeReached(Size canvasSize) {
    if (x > canvasSize.width || x < 0 || y > canvasSize.height || y < 0) {
      direction = math.Random().nextDouble() * 360;
    }
  }
}
