
/// The different routes of the application in a map for easy access
  const Map<PageRoutes, String> pages = {
    PageRoutes.home: '/',
    PageRoutes.questions: '/questions',
    PageRoutes.results: '/results'
  };

  /// The different routes of the application
  enum PageRoutes {
    home,
    questions,
    results,
  }

  /// Extension on the PageRoutes enum to get the path of the route to be used in Navigator methods
  extension PageRoutesExtension on PageRoutes {
    String get path {
      switch (this) {
        case PageRoutes.home:
          return pages[PageRoutes.home]!;
        case PageRoutes.questions:
          return pages[PageRoutes.questions]!;
        case PageRoutes.results:
          return pages[PageRoutes.results]!;
        default:
          return '/';
      }
    }
  }