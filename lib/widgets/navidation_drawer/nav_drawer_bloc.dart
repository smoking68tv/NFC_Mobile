import 'package:bloc/bloc.dart';
import 'blocs.dart';

class NavDrawerBloc extends Bloc<NavDrawerEvent, NavDrawerState> {
  NavDrawerBloc(NavDrawerState initialState) : super(initialState);

  // NavDrawerBloc(NavDrawerState initialState) : super(initialState);

// You can also have an optional constructor here that takes 
  // a repository that you can use later to make network requests
// this is the initial state the user will see when 
  // the bloc is first created
  @override
  NavDrawerState get initialState => NavDrawerState(NavItem.page_one);
  @override
  Stream<NavDrawerState> mapEventToState(NavDrawerEvent event) async* {
    // this is where the events are handled, if you want to call a method
    // you can yield* instead of the yield, but make sure your
    // method signature returns Stream<NavDrawerState> and is async*
    if (event is NavigateTo) {
      // only route to a new location if the new location is different
      if (event.destination != state.selectedItem) {
        yield NavDrawerState(event.destination);
      }
    }
  }
}