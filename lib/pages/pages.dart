
  const Map<PageRoutes, String> pages = {
    PageRoutes.home: '/',
    PageRoutes.questions: '/questions',
    PageRoutes.results: '/results'
  };
  enum PageRoutes {
    home,
    questions,
    results,
  }

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