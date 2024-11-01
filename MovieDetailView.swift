//
//  MovieDetailView.swift
//  MovieRecommender
//
//  Created by chaitanya prasad on 31/10/24.
//

import SwiftUI

/**
 A detailed view displaying information about a selected movie.
 - Shows the movie's poster, title, and overview in a scrollable layout.
 - Uses a full-screen background and supports scrolling for longer content.
 */
struct MovieDetailView: View {
    
    /// The `Movie` object containing details to display in the view.
    let movie: Movie

    var body: some View {
        ZStack {
            // Full-screen background color for the view.
            Color.lightGrey.ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .center, spacing: 20) {
                    /**
                     Displays the movie's poster image.
                     - Uses `AsyncImage` to load the image from the movie's `posterURL`.
                     - Shows a `ProgressView` while loading.
                     - Styled with a corner radius and shadow for aesthetic effect.
                     */
                    if let posterURL = URL(string: movie.posterURL) {
                        AsyncImage(url: posterURL) { image in
                            image.resizable()
                                .scaledToFit()
                                .frame(maxWidth: 300, maxHeight: 300)
                                .cornerRadius(15)
                                .shadow(radius: 10)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    
                    /**
                     Displays the movie's title.
                     - Uses a large title font with bold weight for emphasis.
                     - Black text color for readability on light background.
                     - Center-aligned text with horizontal padding.
                     */
                    Text(movie.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    /**
                     Shows the movie's overview or description.
                     - Uses body font with black color for readability.
                     - Left-aligned with horizontal padding for consistent layout.
                     */
                    Text(movie.overview)
                        .font(.body)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                }
                .padding()
            }
        }
        .navigationTitle("Details")
    }
}
