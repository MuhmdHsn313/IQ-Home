class ApiReference {

  static const channel_url = 'https://cfi-covid19.herokuapp.com';

  /// Include the base url of api.
  static const Url = 'https://cfi-covid19.herokuapp.com/api/';

  static const statics_url = 'https://iraqgovernmentcovid19.herokuapp.com/';

  static const global_url = 'https://api.covid19api.com/summary';

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

  /// Fetch media
  static media(int index, int fetch) => Url + 'media/$index/$fetch';

  /// Fetch concepts
  static const concept = Url + 'consept';

  /// Fetch Iraq covid-19 statistics
  static const localStatistics = Url + 'statistics/local';

  /// Fetch Iraq covid-19 total statistics
  static const localTotalStatistics = Url + 'statistics/total';

  /// Fetch Iraq covid-19 chart statistics
  static const localChart = Url + 'statistics/total/line';

  /// Fetch Iraq covid-19 this chart statistics
  static thisChart(int id) => Url + 'statistics/total/line/$id';
}
