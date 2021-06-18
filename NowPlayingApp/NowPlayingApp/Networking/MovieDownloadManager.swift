//
//  MovieDownloadManager.swift
//  NowPlayingApp
//
//  Created by Elizeu RS on 12/06/21.
//

import Foundation

final class MovieDownloadManager: ObservableObject {
  @Published var movies = [Movie]()
  
  static var baseURL = "https://api.themoviedb.org/3/movie/"
  
  func getNowPlaying() {
    getMovies(movieUrl: .nowPlaying)
  }
  
  private func getMovies(movieUrl: MovieURL) {
    NetworkManager<MovieResponse>.fetch(from: movieUrl.urlString) { (result) in
      switch result {
      case .success(let movieResponse):
        self.movies = movieResponse.results
      case .failure(let err):
        print(err)
      }
    }
  }
}
