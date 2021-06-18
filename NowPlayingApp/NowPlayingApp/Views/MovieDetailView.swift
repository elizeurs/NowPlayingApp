//
//  MovieDetailView.swift
//  NowPlayingApp
//
//  Created by Elizeu RS on 13/06/21.
//

import SwiftUI

struct MovieDetailView: View {
  
  var movie: Movie
  
  var body: some View {
    
    MovieDetailCell(movie: movie)
    
      .navigationTitle(movie.title ?? "")
        .navigationBarTitleDisplayMode(.inline)
    
      }
    }

struct MovieDetailView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      MovieDetailView(movie: Movie())
    }
  }
}


