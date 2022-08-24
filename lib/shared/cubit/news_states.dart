abstract class NewsStates{}
class NewsInitalState extends NewsStates{}

class NewsBottomNavigationChange extends NewsStates{}

class NewsGeTBusinessLoadingState extends NewsStates{}

class NewsGeTBusinessSuccessState extends NewsStates{}

class NewsGetBusinessErorrState extends NewsStates{
  final String erorr;

  NewsGetBusinessErorrState(this.erorr);
}

class NewsGeTSportsLoadingState extends NewsStates{}

class NewsGeTSportsSuccessState extends NewsStates{}

class NewsGetSportsErorrState extends NewsStates{
  final String erorr;

  NewsGetSportsErorrState(this.erorr);
}

class NewsGeTScienceLoadingState extends NewsStates{}

class NewsGeTScienceSuccessState extends NewsStates{}

class NewsGetScienceErorrState extends NewsStates{
  final String erorr;

  NewsGetScienceErorrState(this.erorr);
}

class NewsGeTChangeModeState extends NewsStates{}


class NewsGeTSearchLoadingState extends NewsStates{}

class NewsGeTSearchSuccessState extends NewsStates{}

class NewsGetSearchErorrState extends NewsStates{
  final String erorr;

  NewsGetSearchErorrState(this.erorr);
}
