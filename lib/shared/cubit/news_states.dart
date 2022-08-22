abstract class NewsStates{}
class NewsInitalState extends NewsStates{}

class NewsBottomNavigationChange extends NewsStates{}

class NewsGeTBusinessLoadingState extends NewsStates{}

class NewsGeTBusinessSuccessState extends NewsStates{}

class NewsGetBusinessErorrState extends NewsStates{
  final String erorr;

  NewsGetBusinessErorrState(this.erorr);
}
