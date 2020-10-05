import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_nfc/configs/ui.dart';
import 'package:new_nfc/widgets/navidation_drawer/blocs.dart';

class NavDrawerWidget extends StatelessWidget {
  final String accountName;
  final String accountEmail;

  final List<_NavigationItem> _listItems = [
    _NavigationItem(true, null, null, null),
    _NavigationItem(false, NavItem.tasks, "Оперативные задания", Icons.looks_one),
    _NavigationItem(false, NavItem.page_two, "Second Page", Icons.looks_two),
    _NavigationItem(false, NavItem.page_three, "Third Page", Icons.looks_3),
    _NavigationItem(false, NavItem.page_four, "Fourth Page", Icons.looks_4),
    _NavigationItem(false, NavItem.page_five, "Fifth Page", Icons.looks_5),
    _NavigationItem(false, NavItem.exit, "Выход", Icons.looks_6),
  ];

  NavDrawerWidget(this.accountName, this.accountEmail);
  @override
  Widget build(BuildContext context) => Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: Container(
        color: BACKGROUND_COLOR_START,
        child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: _listItems.length,
            itemBuilder: (BuildContext context, int index) =>
                BlocBuilder<NavDrawerBloc, NavDrawerState>(
                  builder: (BuildContext context, NavDrawerState state) =>
                      _buildItem(_listItems[index], state),
                )),
      ));

  Widget _buildItem(_NavigationItem data, NavDrawerState state) => data.header
      // if the item is a header return the header widget
      ? _makeHeaderItem()
      // otherwise build and return the default list item
      : _makeListItem(data, state);

  Widget _makeHeaderItem() => UserAccountsDrawerHeader(
        accountName: Text(accountName, style: TextStyle(color: Colors.white)),
        accountEmail: Text(accountEmail, style: TextStyle(color: Colors.white)),
        decoration: BoxDecoration(color: BACKGROUND_COLOR_START),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.amber,
          child: Icon(
            Icons.person,
            size: 54,
          ),
        ),
      );
  Widget _makeListItem(_NavigationItem data, NavDrawerState state) => Card(
        color: data.item == state.selectedItem
            ? DRAWER_ITEM_COLOR
            : BACKGROUND_COLOR_START,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero)),
        // So we see the selected highlight
        borderOnForeground: false,
        elevation: 0,
        margin: EdgeInsets.fromLTRB(0, 1, 0, 1),
        child: Builder(
          builder: (BuildContext context) => ListTile(
            title: Text(
              data.title,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            leading: Icon(
              data.icon,
              // if it's selected change the color
              color: Colors.white
            ),
            onTap: () => _handleItemClick(context, data.item),
          ),
        ),
      );
  void _handleItemClick(BuildContext context, NavItem item) {
    BlocProvider.of<NavDrawerBloc>(context).add(NavigateTo(item));
    Navigator.pop(context);
  }
}

// helper class used to represent navigation list items
class _NavigationItem {
  final bool header;
  final NavItem item;
  final String title;
  final IconData icon;
  _NavigationItem(this.header, this.item, this.title, this.icon);
}
