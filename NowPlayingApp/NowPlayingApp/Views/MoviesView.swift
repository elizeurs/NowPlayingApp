//
//  MoviesView.swift
//  NowPlayingApp
//
//  Created by Elizeu RS on 12/06/21.
//

import SwiftUI

struct MoviesView: View {
  
  @State private var searchTerm = ""
  
  @ObservedObject var movieManager = MovieDownloadManager()
  
    var body: some View {
      NavigationView {
        VStack {
          
          HStack {
            Image(systemName: "magnifyingglass")
              .imageScale(.medium)
            
            TextField("Search...", text: $searchTerm)
              .textFieldStyle(RoundedBorderTextFieldStyle())
          }.padding()
          
          ScrollView(.vertical, showsIndicators: false) {
            ForEach(movieManager.movies.filter{ (searchTerm.isEmpty ? true : $0.title?.lowercased().localizedStandardContains(searchTerm.lowercased()) ?? true)
            }) { movie in
              NavigationLink(
                destination: MovieDetailView(movie: movie),
                label: {
                  MovieCell(movie: movie)
                })
            }
          }
        }.onAppear {
          movieManager.getNowPlaying()
        }
//        .padding()
        .navigationBarTitle("Now Playing")
        .ignoresSafeArea(edges: .bottom)
      }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
