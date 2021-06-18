//
//  MovieCell.swift
//  NowPlayingApp
//
//  Created by Elizeu RS on 12/06/21.
//

import SwiftUI
import KingfisherSwiftUI

struct MovieCell: View {
  var movie: Movie
  
    var body: some View {
      HStack(spacing: 20) {
//        Image("movie-poster")
        KFImage(URL(string: movie.posterPath))
          .resizable()
          .frame(width: 100, height: 160)
          .scaledToFill()
          .cornerRadius(15)
          .shadow(color: Color(#colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
        
        VStack(alignment: .leading, spacing: 15) {
//          Text("Godzilla vs Kong")
          Text(movie.title ?? "")
            .font(.headline)
            .foregroundColor(.black)
          
          Text(movie.release_date ?? "")
            .foregroundColor(.gray)
        }
        
        Spacer()
        
      }.padding()
    }
}

struct MovieCell_Previews: PreviewProvider {
    static var previews: some View {
      MovieCell(movie: Movie())
    }
}
