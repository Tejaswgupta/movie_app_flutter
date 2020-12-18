const IMAGE_BASE_URL = 'https://image.tmdb.org/t/p/w500';
const MOVIE_BASE_URL = 'https://api.themoviedb.org/3/movie/';
const SERIE_BASE_URL = 'https://api.themoviedb.org/3/tv/';
const API_KEY = '?api_key=ab319f50a3792c49e23a3336df9f0d80';
const TRENDING_MOVIE = 'https://api.themoviedb.org/3/trending/movie/day';
const SEARCH_MOVIE = 'https://api.themoviedb.org/3/search/movie';
const GENRE_SEARCH =
    'https://api.themoviedb.org/3/discover/movie?api_key=ab319f50a3792c49e23a3336df9f0d80&language=en-US&sort_by=popularity.desc&with_genres=';
const QUERY = '&query=';

const POPULAR_MOVIE = 'https://api.themoviedb.org/3/movie/popular';
const PAGE = '&page=';
const TOP_RATED = 'https://api.themoviedb.org/3/movie/top_rated';
const PERSON_TV_PARTICIPATIONS =
    'https://api.themoviedb.org/3/person/83002/tv_credits';
const PERSON_ENDPOINT = 'https://api.themoviedb.org/3/person/';
const LANGUAGE = '&language=en-US';

const GENRES = [
  {'id': 28, 'name': 'Action'},
  {'id': 12, 'name': 'Adventure'},
  {'id': 16, 'name': 'Animation'},
  {'id': 35, 'name': 'Comedy'},
  {'id': 80, 'name': 'Crime'},
  {'id': 99, 'name': 'Documentary'},
  {'id': 18, 'name': 'Drama'},
  {'id': 10751, 'name': 'Family'},
  {'id': 14, 'name': 'Fantasy'},
  {'id': 36, 'name': 'History'},
  {'id': 27, 'name': 'Horror'},
  {'id': 10402, 'name': 'Music'},
  {'id': 9648, 'name': 'Mystery'},
  {'id': 10749, 'name': 'Romance'},
  {'id': 878, 'name': 'Science Fiction'},
  {'id': 10770, 'name': 'TV Movie'},
  {'id': 53, 'name': 'Thriller'},
  {'id': 10752, 'name': 'War'},
  {'id': 37, 'name': 'Western'}
];
