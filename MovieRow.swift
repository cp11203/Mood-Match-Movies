//
//  MovieRow.swift
//  MovieRecommender
//
//  Created by chaitanya prasad on 31/10/24.
//

import SwiftUI

/**
 A view that displays a single row representing a movie.
 - Shows a placeholder movie icon, the movie's title, and a brief overview.
 - Designed for use in lists of movies.
 */
struct MovieRow: View {
    
    /// The `Movie` object containing details for this row.
    let movie: Movie
    
    var body: some View {
        HStack {
            /**
             Placeholder icon for the movie poster.
             - Uses SF Symbol "film" icon as a stand-in image.
             - Sized to 50x50 points and styled with a blue color.
             */
            Image(systemName: "film")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.blue)
            
            // Movie information section
            VStack(alignment: .leading) {
                /**
                 Displays the movie's title.
                 - Uses a headline font style for emphasis.
                 */
                Text(movie.title)
                    .font(.headline)
                
                /**
                 Shows a brief overview of the movie.
                 - Styled with a subheadline font and secondary color.
                 - Limited to a single line for compact display.
                 */
                Text(movie.overview)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
        }
        .padding()
    }
}
