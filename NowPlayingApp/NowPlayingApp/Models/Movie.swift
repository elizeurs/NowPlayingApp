//
//  Movie.swift
//  NowPlayingApp
//
//  Created by Elizeu RS on 12/06/21.
//

import Foundation

struct MovieResponse: Codable {
  var results: [Movie]
  
}

struct Movie: Codable, Identifiable {
  var id: Int?
  var title: String?
  var overview: String?
  var poster_path: String?
  var vote_average: Double?
  var release_date: String?
  var posterPath: String {
    if let path = poster_path {
      return "http://image.tmdb.org/t/p/original/\(path)"
    } else {
      return ""
    }
  }
  
  var rating: Int {
    get {
      let ratingAsDouble = Double(vote_average ?? 0.0)
      return Int(ceil(ratingAsDouble))
    }
  }
}
