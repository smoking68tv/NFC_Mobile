import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_nfc/configs/ui.dart';
import 'package:new_nfc/screens/auth/loginView.dart';
import 'package:new_nfc/screens/tasks/taskListView.dart';
import 'package:new_nfc/widgets/appBar/appBar.dart';
import 'package:new_nfc/widgets/navidation_drawer/blocs.dart';
import 'package:new_nfc/widgets/navidation_drawer/nav_drawer.dart';

class MainContainerWidget extends StatefulWidget {
  @override
  _MainContainerState createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainerWidget> {
  NavDrawerBloc _bloc;
  Widget _content;
  @override
  void initState() {
    super.initState();
    _bloc = NavDrawerBloc(NavDrawerState(NavItem.tasks));
    _content = _getContentForState(_bloc.state);
  }

  @override
  Widget build(BuildContext context) => BlocProvider<NavDrawerBloc>(
      create: (BuildContext context) => _bloc,
      child: BlocListener<NavDrawerBloc, NavDrawerState>(
        listener: (BuildContext context, NavDrawerState state) {
          setState(() {
            _content = _getContentForState(state);
          });
        },
        child: BlocBuilder<NavDrawerBloc, NavDrawerState>(
          builder: (BuildContext context, NavDrawerState state) => Scaffold(
              endDrawer: NavDrawerWidget("Joe Shmoe", "shmoe@joesemail.com"),
              appBar: AppBarWidget().setAppBar(
                context,
                title: _getTextForItem(state.selectedItem),
              ),
              body: Center(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        BACKGROUND_COLOR_START,
                        BACKGROUND_COLOR_END
                      ])),
                  child: AnimatedSwitcher(
                    switchInCurve: Curves.easeInExpo,
                    switchOutCurve: Curves.easeOutExpo,
                    duration: Duration(milliseconds: 300),
                    child: _content,
                  ),
                ),
              )),

          // _bodyForState(state),
          // floatingActionButton: _getFabForItem(state.selectedItem)),
        ),
      ));

  String _getTextForItem(NavItem selectedItem) {
    return selectedItem.index.toString();
  }

  Widget _getContentForState(NavDrawerState state) {
    if (state.selectedItem.index == 5) {
      return LoginPage();
    }

     if (state.selectedItem.index == 0) {
      return TaskListPage();
    }
  }
}
