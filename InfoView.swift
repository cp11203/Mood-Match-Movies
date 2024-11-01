//
//  InfoView.swift
//  MovieRecommender
//
//  Created by chaitanya prasad on 31/10/24.
//

import SwiftUI

/**
 A view that provides information about how to use the MoodMatch Movies app.
 - Displays app details and instructions for starring favorite movies.
 - Includes a close button to dismiss the view.
 */
struct InfoView: View {
    
    /// A binding variable to control the visibility of the InfoView, allowing it to be dismissed when set to `false`.
    @Binding var isPresented: Bool

    var body: some View {
        ZStack {
            // Solid black background color for the entire view.
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 20) {
                /**
                 Main title of the InfoView, introducing the app's purpose.
                 - Styled with a bold, orange font to match the app's theme.
                 */
                Text("About MoodMatch Movies")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
                    .padding(.top, 20)
                
                /**
                 Information section providing instructions for app usage.
                 - Includes a divider and details on starring movies.
                 - Text alignment and padding ensure readability and consistent layout.
                 */
                VStack(alignment: .leading, spacing: 16) {
                    Text("MoodMatch Movies provides personalized movie recommendations based on your mood. Select a mood on the main page, and the app will suggest movies that align with it.")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    
                    Divider()
                        .background(Color.gray)
                    
                    Text("⭐ Starring Movies")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.orange)
                        .padding(.top, 10)
                    
                    Text("You can star movies by tapping the star icon on each card. Once a movie is starred, it will remain saved as a favorite even if you change genres. Tap the star icon again to unstar the movie.")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                .padding(.horizontal, 16)
                .frame(maxHeight: 350) // Limits the height of the content area
                
                Spacer()
                
                /**
                 Close button to dismiss the InfoView.
                 - Action: Sets `isPresented` to `false`, closing the view.
                 - Styling: Uses an orange background with black text to match the app's theme.
                 */
                Button(action: {
                    isPresented = false
                }) {
                    Text("Close")
                        .fontWeight(.semibold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                }
                .padding(.bottom, 20)
            }
        }
    }
}
