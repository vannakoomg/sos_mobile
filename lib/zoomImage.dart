import 'package:flutter/material.dart';
import 'package:sos_mobile/utils/widgets/custom_cache_image_cricle.dart';

class ZoomImageCCL extends StatefulWidget {
  const ZoomImageCCL({super.key});

  @override
  State<ZoomImageCCL> createState() => _ZoomImageCCLState();
}

@override
class _ZoomImageCCLState extends State<ZoomImageCCL>
    with SingleTickerProviderStateMixin {
  double minscale = 1;
  double maxscale = 4;
  TransformationController controller = TransformationController();
  AnimationController? animationController;
  Animation<Matrix4>? animation;
  OverlayEntry? empty;

  @override
  void initState() {
    controller = TransformationController();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(() {
        controller.value = animation!.value;
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          removeOverlay(context);
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Zoom image")),
      body: Center(
        child: buildimage(),
      ),
    );
  }

  void resetZoom() {
    animation = Matrix4Tween(begin: controller.value, end: Matrix4.identity())
        .animate(CurvedAnimation(
            parent: animationController!, curve: Curves.easeIn));
    animationController!.forward(from: 0);
  }

  Widget buildimage() {
    return Builder(builder: (context) {
      return GestureDetector(
        onDoubleTap: () {
          resetZoom();
        },
        child: InteractiveViewer(
          transformationController: controller,
          onInteractionStart: ((details) {
            // if (details.pointerCount > 2) {
            showOverLay(context);
            // }
          }),
          minScale: minscale,
          maxScale: maxscale,
          clipBehavior: Clip.none,
          child: SizedBox(
            height: 300,
            width: double.infinity,
            child: CustomCachedImageCircle(
              borderRadius: BorderRadius.circular(0),
              image:
                  "https://images.pexels.com/photos/35967/mini-cooper-auto-model-vehicle.jpg?cs=srgb&dl=pexels-pixabay-35967.jpg&fm=jpg",
            ),
          ),
        ),
      );
    });
  }

  void showOverLay(BuildContext context) {
    final renderBox = context.findRenderObject()! as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final size = MediaQuery.of(context).size;
    empty = OverlayEntry(builder: (context) {
      return Positioned(
        left: offset.dx,
        top: offset.dy,
        width: size.width,
        child: buildimage(),
      );
    });
    final overlay = Overlay.of(context);
    overlay.insert(empty!);
  }

  void removeOverlay(BuildContext context) {
    if (empty != null) {
      empty!.remove();
      empty = null;
    }
  }
}
