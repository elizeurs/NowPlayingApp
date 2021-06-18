//
//  Rating.swift
//  NowPlayingApp
//
//  Created by Elizeu RS on 13/06/21.
//

import SwiftUI

struct Rating: View {
    
    @ObservedObject private var movieManager = MovieDownloadManager()
    @Binding var rating: Int?
  
    var movie: Movie
    
    private func starType(index: Int) -> String {
        
        if let rating = self.rating {
            return index <= rating ? "star.fill" : "star"
        } else {
            return "star"
        }
        
    }
    
    var body: some View {
        HStack {
            ForEach(1...10, id: \.self) { index in
                Image(systemName: self.starType(index: index))
                    .foregroundColor(Color.orange)
                    .onTapGesture {
                        self.rating = index
                }
            }
        }
    }
}

struct Rating_Previews: PreviewProvider {
    static var previews: some View {
      Rating(rating: .constant(3), movie: Movie())
    }
}
