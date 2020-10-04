import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_nfc/widgets/navidation_drawer/blocs.dart';
import 'package:new_nfc/widgets/navidation_drawer/nav_drawer.dart';

class MainContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider<NavDrawerBloc>(
        create: (BuildContext context) => NavDrawerBloc(NavDrawerState(NavItem.page_one)),
        child: BlocBuilder<NavDrawerBloc, NavDrawerState>(
          builder: (BuildContext context, NavDrawerState state) => Scaffold(
              drawer: NavDrawerWidget("Joe Shmoe", "shmoe@joesemail.com"),
              appBar: AppBar(
                title: Text("_state.selectedItem"),
              )),
          // body: _bodyForState(state),
          // floatingActionButton: _getFabForItem(state.selectedItem)),
        ),
      );
}
