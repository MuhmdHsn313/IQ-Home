class ApiReference {
  /// Include the base url of api.
  static const Url = 'https://cfi-covid19.herokuapp.com/api/';

  /// Fetch news data.
  static home(int index, int fetch) => Url + 'notification/$index/$fetch';

  /// Fetch tips data.
  static tips(int index, int fetch) => Url + 'tip/$fetch/$index';

  /// Fetch tips data.
  static tipById(int id) => Url + 'tip/$id';

  /// Fetch sources data.
  static const sources = Url + 'source';

  /// Fetch sources with news data.
  static const sourcesWithNews = Url + 'source/with/notifications';

  /// Fetch contact data.
  static const contact = Url + 'contact';

  /// Fetch contact data.
  static const qna = Url + 'qna';
}
