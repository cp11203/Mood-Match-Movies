//
//  MovieViewModel.swift
//  MovieRecommender
//
//  Created by chaitanya prasad on 31/10/24.
//

import SwiftUI

/**
 The view model for managing movie data in the MoodMatch Movies app.
 - Handles fetching movies based on mood selection.
 - Manages the state of starred movies, allowing users to favorite specific movies.
 - Conforms to `ObservableObject` to allow views to automatically update when data changes.
 */
class MovieViewModel: ObservableObject {
    
    /// An array of `Movie` objects representing the current list of movies for the selected mood.
    @Published var movies: [Movie] = []
    
    /// A dictionary that tracks the starred state of movies by their IDs.
    /// - Key: The movie ID.
    /// - Value: A boolean indicating whether the movie is starred (`true`) or not (`false`).
    @Published var starredMovies: [Int: Bool] = [:]
    
    /// Instance of `MovieService` used for fetching movies from the API.
    private var movieService = MovieService()
    
    /**
     Loads movies for a specific mood by calling `MovieService`.
     
     - Parameter mood: The mood selected by the user, mapped to a specific genre.
     - Discussion:
     This function calls `fetchMovies` from `MovieService` and updates the `movies` array with the fetched results.
     */
    func loadMovies(forMood mood: String) {
        movieService.fetchMovies(forMood: mood) { [weak self] movies in
            DispatchQueue.main.async {
                self?.movies = movies
            }
        }
    }
    
    /**
     Toggles the starred state of a specific movie.
     
     - Parameter movie: The `Movie` object to be toggled.
     - Discussion:
     If the movie is already starred, this function unstars it. If it is not starred, this function adds it to the starred list.
     */
    func toggleStar(for movie: Movie) {
        if let isStarred = starredMovies[movie.id] {
            starredMovies[movie.id] = !isStarred
        } else {
            starredMovies[movie.id] = true
        }
    }
    
    /**
     Checks if a specific movie is starred.
     
     - Parameter movie: The `Movie` object to check.
     - Returns: A boolean indicating if the movie is starred (`true`) or not (`false`).
     */
    func isStarred(_ movie: Movie) -> Bool {
        return starredMovies[movie.id] ?? false
    }
}
