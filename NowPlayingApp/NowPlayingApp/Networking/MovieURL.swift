//
//  MovieURL.swift
//  NowPlayingApp
//
//  Created by Elizeu RS on 12/06/21.
//

import Foundation

enum MovieURL: String {
  case nowPlaying = "now_playing"
  
  public var urlString: String {
    "\(MovieDownloadManager.baseURL)\(self.rawValue)?api_key=\(API.key)&language=en-US&page=1"
  }
}
