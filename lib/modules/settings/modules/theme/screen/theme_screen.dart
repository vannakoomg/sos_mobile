import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/settings/controllers/setting_controller.dart';
import 'package:sos_mobile/modules/settings/modules/theme/controller/theme_controller.dart';
import 'package:sos_mobile/utils/widgets/custom_appbar.dart';
import 'package:sos_mobile/utils/widgets/custom_question_card.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  final controller = Get.put(ThemeController());
  final settingController = Get.put(SettingController());
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () {
      controller.mode.value = settingController.setting.value.mode!;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "Theme"),
        body: Obx((() => SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "DISPLAY STYLE",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.tertiary),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.transparent),
                    child: Column(
                      children: [
                        controller.isSmall.value
                            ? CsutomQuestionCard(
                                isSmall: true,
                                istall: false,
                                title: "ហេតុអ្វីបានជាទុំស្រលាញ់ទាវ ?",
                                tags: const [
                                  "dfa2341241344334534534534sfd",
                                  "dfa2341241344334534534534sfd",
                                ],
                                answerCount: "12",
                                ontapQuestion: () {},
                                isCorrect: false,
                                time: '2h ago',
                                descrition:
                                    "fsaasdfdslkfdajf;lkjasdlkfj;lasjfd;ksadf;lksadf;sajf;lsajdf;lkajds;lfjdsa;lkfja;ldsjf;ldsajf;ladsjf;lsadf;lsad;lfjsd;lfjladsjfladsjfljadslfj;ldsajf;ldsajfladsflksafd;ladsjflsajdf",
                                image:
                                    'https://hips.hearstapps.com/hmg-prod/images/index-avatar3-1672251913.jpg?crop=0.502xw:1.00xh;0.210xw,0&resize=1200:*',
                                commentCount: '10',
                                likeCount: '300',
                              )
                            : CsutomQuestionCard(
                                isSmall: false,
                                istall: false,
                                title: "ហេតុអ្វីបានជាទុំស្រលាញ់ទាវ ?",
                                tags: const [
                                  "dfa2341241344334534534534sfd",
                                  "dfa2341241344334534534534sfd",
                                ],
                                answerCount: "12",
                                ontapQuestion: () {},
                                isCorrect: false,
                                time: '2h ago',
                                descrition:
                                    "fsaasdfsadfsadfsadlfnksajhf;sadf;adsnf;lsad;sad;ladsfdskadslkfdaj;slfdksa;lkfdsajlkfdsaa;lkdsjdlfjkdsajf;lkjasdlkfj;lasjfd;ksadf;lksadf;sajf;lsajdf;lkajds;lfjdsa;lkfja;ldsjf;ldsajf;ladsjf;lsadf;lsad;lfjsd;lfjladsjfladsjfljadslfj;ldsajf;ldsajfladsflksafd;ladsjflsajdf",
                                image:
                                    'https://hips.hearstapps.com/hmg-prod/images/index-avatar3-1672251913.jpg?crop=0.502xw:1.00xh;0.210xw,0&resize=1200:*',
                                commentCount: '10',
                                likeCount: '300',
                              ),
                        const Gap(5),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  controller.isSmall.value = false;
                                });
                              },
                              child: Container(
                                height: 80,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary)),
                                child: Center(
                                  child: Text(
                                    "ធំ",
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ),
                              ),
                            ),
                            const Gap(10),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  controller.isSmall.value = true;
                                });
                              },
                              child: Container(
                                height: 80,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary)),
                                child: Center(
                                  child: Text(
                                    "តូច",
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 0.3,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.changeTheme();
                    },
                    child: Container(
                      color: Colors.transparent,
                      margin: const EdgeInsets.only(right: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "ពេលវេលា",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary),
                            ),
                          ),
                          SizedBox(
                              height: 40,
                              child: settingController.setting.value.mode == "1"
                                  ? const Icon(Icons.sunny)
                                  : const Icon(Icons.nightlight_round_sharp)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ))));
  }
}
