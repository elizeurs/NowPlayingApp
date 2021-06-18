//
//  MovieDetailCell.swift
//  NowPlayingApp
//
//  Created by Elizeu RS on 13/06/21.
//

import SwiftUI
import KingfisherSwiftUI

struct MovieDetailCell: View {
  
  @ObservedObject private var movieManager = MovieDownloadManager()
  
  var movie: Movie
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(spacing: 20) {
//        Image("movie-poster")
        KFImage(URL(string: movie.posterPath))
          .resizable()
          .scaledToFill()
          .cornerRadius(15)
          .shadow(color: Color(#colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
          .padding()
        
        Text(movie.title ?? "")
          .font(.title)
          .fontWeight(.semibold)
        
        Text("Relese Date: ").fontWeight(.semibold) + Text(movie.release_date ?? "")
        
        Text(movie.overview ?? "")
        
//        HStack {
//          ForEach(0 ..< 7) { item in
//            Image(systemName: "star.fill").foregroundColor(.orange)
//          }
//          Text("/ 10")
//        }
        
        HStack {
          Rating(rating: .constant(movie.rating), movie: movie)
          Text("\(movie.rating)/10")
        }
      }
    }.padding(.horizontal)
    .edgesIgnoringSafeArea(.bottom)
  }
}
struct MovieDetailCell_Previews: PreviewProvider {
    static var previews: some View {
      MovieDetailCell(movie: Movie())
    }
}

