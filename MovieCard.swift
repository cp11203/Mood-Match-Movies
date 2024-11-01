//
//  MovieCard.swift
//  MovieRecommender
//
//  Created by chaitanya prasad on 31/10/24.
//

import SwiftUI

/**
 A view that displays a card-style layout for each movie.
 - Shows the movie poster, title, genres, and overview.
 - Includes a star button to favorite or unfavorite the movie.
 */
struct MovieCard: View {
    
    /// The `Movie` object containing details for the card.
    let movie: Movie
    
    /// An observed instance of `MovieViewModel` to track starred movies.
    @ObservedObject var viewModel: MovieViewModel

    var body: some View {
        ZStack {
            // Background for the card with rounded corners and shadow.
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white.opacity(0.1))
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                )
                .shadow(radius: 5)
            
            HStack {
                /**
                 Displays the movie's poster image.
                 - Uses `AsyncImage` to load the image from the URL.
                 - Adds a `ProgressView` as a placeholder while loading.
                 */
                if let posterURL = URL(string: movie.posterURL) {
                    AsyncImage(url: posterURL) { image in
                        image.resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 120)
                            .cornerRadius(8)
                    } placeholder: {
                        ProgressView()
                    }
                }
                
                // Movie Details Section
                VStack(alignment: .leading, spacing: 6) {
                    /**
                     Movie title displayed in a single line.
                     - Uses a headline font style for emphasis.
                     - Limits to one line to fit within the card layout.
                     */
                    Text(movie.title)
                        .font(.headline)
                        .foregroundColor(.white)
                        .lineLimit(1)
                    
                    /**
                     Displayed genre names for the movie.
                     - Joins genre names with commas.
                     - Uses orange color to distinguish from other text.
                     */
                    Text(genreNames(from: movie.genreIds).joined(separator: ", "))
                        .font(.subheadline)
                        .foregroundColor(.orange)
                        .lineLimit(1)
                    
                    /**
                     Overview text for the movie.
                     - Shows up to three lines, truncating if longer.
                     */
                    Text(movie.overview)
                        .font(.body)
                        .foregroundColor(.white)
                        .lineLimit(3)
                        .truncationMode(.tail)
                }
                .padding(.leading, 8)

                Spacer()
                
                /**
                 Star button to mark the movie as a favorite.
                 - Toggles the starred state using the `MovieViewModel`.
                 - Displays a filled star if the movie is favorited.
                 */
                Button(action: {
                    viewModel.toggleStar(for: movie)
                }) {
                    Image(systemName: viewModel.isStarred(movie) ? "star.fill" : "star")
                        .foregroundColor(viewModel.isStarred(movie) ? .yellow : .white)
                        .font(.system(size: 24))
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.trailing, 10)
            }
            .padding(10)
        }
        .frame(height: 130)
    }
}
