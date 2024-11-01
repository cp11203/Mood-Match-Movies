//
//  ContentView.swift
//  prasad
//  Mac IOS: Sonoma 14.6.1
//  Created by chaitanya prasad on 1/11/24.
//

import SwiftUI

/**
 The main view of the MoodMatch Movies app. Displays a selection of movies based on the user's chosen mood.
 - Allows users to select a mood and view recommendations.
 - Includes a navigation stack for navigating to detailed movie views.
 - Uses a gradient background and custom styling for a themed look.
 */
struct ContentView: View {
    
    /// ViewModel to manage the list of movies and mood selection.
    @StateObject private var viewModel = MovieViewModel()
    
    /// The currently selected mood, defaulting to "Adventure".
    @State private var selectedMood: String = "Adventure"
    
    /// Boolean to control the display of the InfoView sheet.
    @State private var showingInfoSheet = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background gradient for the entire view.
                LinearGradient(gradient: Gradient(colors: [.darkpurple, .mediumpurple, .black]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 14) {
                    // Main title of the app with gradient styling and shadow effect.
                    Text("MoodMatch Movies")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.yellow, .orange],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .shadow(radius: 10)
                        .padding(.top, 40)
                    
                    // Subtitle for mood selection with reduced padding.
                    Text("Choose Your Mood")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    
                    /**
                     Picker allowing the user to select a mood.
                     - Options: Adventure, Romance, Thriller, Comedy.
                     - Segmented style for easy selection.
                     */
                    Picker("Select Mood", selection: $selectedMood) {
                        Text("Adventure").font(.title2).fontWeight(.bold).tag("Adventure")
                        Text("Romance").font(.title2).fontWeight(.bold).tag("Romance")
                        Text("Thriller").font(.title2).fontWeight(.bold).tag("Thriller")
                        Text("Comedy").font(.title2).fontWeight(.bold).tag("Comedy")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    .background(Color.white.opacity(0.2).cornerRadius(10))
                    .padding(.horizontal)
                    
                    /**
                     Button to load movie recommendations based on the selected mood.
                     - Triggers the `loadMovies` function in the `MovieViewModel`.
                     */
                    Button(action: {
                        viewModel.loadMovies(forMood: selectedMood)
                    }) {
                        Text("Get Recommendations")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.orange)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    .padding(.bottom, 20)
                    
                    // Scrollable list of movie recommendations.
                    ScrollView {
                        LazyVStack(spacing: 20) {
                            ForEach(viewModel.movies) { movie in
                                /**
                                 Navigation link for each movie, leading to `MovieDetailView`.
                                 - Displays a `MovieCard` for each movie.
                                 */
                                NavigationLink(destination: MovieDetailView(movie: movie)) {
                                    MovieCard(movie: movie, viewModel: viewModel)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .toolbar {
                /**
                 Toolbar with an info button to toggle the display of the InfoView sheet.
                 - Tapping the button shows the InfoView with more details about the app.
                 */
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingInfoSheet.toggle()
                        print("Info button tapped: \(showingInfoSheet)") // Debugging print statement
                    }) {
                        Image(systemName: "info.circle")
                            .foregroundColor(.white)
                    }
                }
            }
            .sheet(isPresented: $showingInfoSheet) {
                // Sheet presentation of InfoView with direct dismissal binding.
                InfoView(isPresented: $showingInfoSheet)
            }
            .navigationTitle("")
            .foregroundColor(.white)
        }
    }
}
