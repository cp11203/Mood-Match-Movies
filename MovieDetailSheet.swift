//
//  MovieDetailSheet.swift
//  MovieRecommender
//
//  Created by chaitanya prasad on 31/10/24.
//

import SwiftUI

/**
 A view displaying detailed information about a selected movie in a sheet format.
 - Shows the movie's poster, title, and overview.
 - Includes a button to dismiss the sheet.
 */
struct MovieDetailSheet: View {
    
    /// The `Movie` object containing details to be displayed in the sheet.
    let movie: Movie
    
    /// Environment variable to control the presentation mode, allowing the sheet to be dismissed.
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 20) {
            /**
             Displays the movie's poster image.
             - Uses `AsyncImage` to load the image from a URL.
             - Shows a `ProgressView` while the image is loading.
             - Applies a corner radius and shadow for styling.
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
             Displays the title of the movie.
             - Uses a bold title font with primary color for visibility.
             - Center-aligned text with horizontal padding.
             */
            Text(movie.title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            /**
             Shows a detailed overview of the movie.
             - Uses a standard body font with secondary color.
             - Left-aligned for readability in longer descriptions.
             - Horizontal padding added for consistent layout.
             */
            Text(movie.overview)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
                .padding()
            
            /**
             Close button to dismiss the sheet.
             - Sets `presentationMode` to dismiss the view.
             - Styled with a red background and white text for prominence.
             */
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Close")
                    .fontWeight(.semibold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
        }
        .padding()
    }
}
