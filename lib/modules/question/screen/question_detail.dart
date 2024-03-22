import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/question/controller/answer_controller.dart';
import 'package:sos_mobile/modules/question/controller/comment_controller.dart';
import 'package:sos_mobile/modules/question/controller/question_detail_controller.dart';
import 'package:sos_mobile/modules/question/screen/anwser_screen.dart';
import 'package:sos_mobile/modules/question/screen/comment_screen.dart';
import '../widgets/card.dart';
import '../widgets/more_question_option.dart';

class QuestionDetail extends StatefulWidget {
  final String id;

  const QuestionDetail({
    super.key,
    required this.id,
  });

  @override
  State<QuestionDetail> createState() => _QuestionDetailState();
}

class _QuestionDetailState extends State<QuestionDetail>
    with SingleTickerProviderStateMixin {
  final controller = Get.put(QuestionDetailController());
  TabController? tabController;
  GlobalKey kkk = GlobalKey();
  final anwsercontorller = Get.put(AnwserController());
  final commentController = Get.put(CommentController());
  double hei = 0.0;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        hei = kkk.currentContext!.size!.height;
      });
    });
    tabController = TabController(length: 2, vsync: this);
    if (tabController != null) {
      tabController!.addListener(() {
        controller.tabIndex.value = tabController!.index;
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            if (hei == 0)
              Container(
                key: kkk,
                child: CardQuestion(
                  ontapMore: () {},
                  ontapProfile: () {},
                  avarta:
                      "https://imageio.forbes.com/specials-images/imageserve/65d8c344c4a366da0564117e/Avatar--The-Last-Airbender--Gordon-Cormier-as-Aang-in-episode-101-of-Avatar--The-Last/0x0.jpg?format=jpg&crop=2639,1760,x4,y0,safe&width=960",
                  description: "khmerjslkjlksdjsdjlkdsjsakkkflklklkfdsa",
                  image: "",
                  // "https://st2.depositphotos.com/2673929/6809/i/450/depositphotos_68092891-stock-illustration-advanced-calculus.jpg",
                  name: "vannak",
                  time: "1 kkk",
                  title: "dsdsfdsfdsfdsfdfsfdsdsf",
                ),
              ),
            if (hei != 0)
              Expanded(
                child: NestedScrollView(
                  controller: controller.scrollController.value,
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        titleSpacing: 0,
                        automaticallyImplyLeading: false,
                        scrolledUnderElevation: 0,
                        flexibleSpace: FlexibleSpaceBar(
                          collapseMode: CollapseMode.pin,
                          background: CardQuestion(
                            ontapMore: () {
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: ((context) {
                                    return MoreQuesionOption(
                                      questionId: widget.id,
                                      image: "adsfdsa",
                                    );
                                  }));
                            },
                            ontapProfile: () {},
                            avarta:
                                "data:image/jpeg;base64,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",
                            description:
                                "khmerjslkjlksdjsdjlkdsjsakkkflklklkfdsa",
                            // image:
                            //     "https://st2.depositphotos.com/2673929/6809/i/450/depositphotos_68092891-stock-illustration-advanced-calculus.jpg",
                            image: "",

                            name: "vannak",
                            time: "1 kkk",
                            title: "dsdsfdsfdsfdsfdfsfdsdsf",
                          ),
                        ),
                        toolbarHeight: hei - 43,
                        pinned: true,
                        floating: true,
                        expandedHeight: hei,
                        bottom: PreferredSize(
                          preferredSize: const Size.fromHeight(43),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                              bottom: BorderSide(
                                  width: 0.5,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            )),
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.ontapInput(context, widget.id);
                                  },
                                  child: const Icon(Icons.chat),
                                ),
                                TabBar(
                                  controller: tabController,
                                  labelPadding: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                  ),
                                  isScrollable: false,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  indicatorColor: AppColor.secondnaryColor,
                                  padding: EdgeInsets.zero,
                                  indicatorPadding: EdgeInsets.zero,
                                  tabAlignment: TabAlignment.center,
                                  tabs: const [
                                    SizedBox(
                                      width: 50,
                                      height: 40,
                                      child: Center(
                                        child: Text("ចម្លើយ"),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                      height: 40,
                                      child: Center(
                                        child: Text("មតិ"),
                                      ),
                                    ),
                                  ],
                                ),
                                const Icon(Icons.keyboard_command_key),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
                  body: Container(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 10,
                    ),
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        AnwserScreen(
                          id: widget.id,
                        ),
                        CommentScreen(
                          id: widget.id,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
