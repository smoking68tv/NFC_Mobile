// this is the state the user is expected to see
import 'package:flutter/cupertino.dart';
import 'package:new_nfc/screens/auth/loginView.dart';

class NavDrawerState {
  final NavItem selectedItem;
  const NavDrawerState(this.selectedItem);
}
// helpful navigation pages, you can change 
// them to support your pages
// Widget page_six = LoginPage();

enum NavItem {
  tasks,
  rounds,
  page_three,
  page_four,
  page_five,
  exit,
}