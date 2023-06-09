import 'package:flutter/material.dart';
import 'package:diet_app/theme/t_theme.dart';
import 'package:diet_app/model/m_model.dart';
import 'package:diet_app/view/diary/screen_diary.dart';
import 'package:diet_app/view/component/bottom_bar.dart';
import 'package:diet_app/view/v_training.dart';

class DietAppHome extends StatefulWidget {
  @override
  _DietAppHomeState createState() => _DietAppHomeState();
}

class _DietAppHomeState extends State<DietAppHome>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  List<ModelData> modelList = ModelData.modelList;

  Widget tabBody = Container(
    color: DietApp.background,
  );

  @override
  void initState() {
    modelList.forEach((ModelData tab) {
      tab.isSelected = false;
    });
    modelList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = MyDiaryScreen(animationController: animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DietApp.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          modelList: modelList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0 || index == 2) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      MyDiaryScreen(animationController: animationController);
                });
              });
            } else if (index == 1 || index == 3) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      TrainingScreen(animationController: animationController);
                });
              });
            }
          },
        ),
      ],
    );
  }
}
