//
//  Movie.swift
//  MovieRecommender
//
//  Created by chaitanya prasad on 31/10/24.
//

import Foundation

/**
 A struct representing the top-level response from the movie API.
 - Contains an array of `Movie` objects under the `results` key.
 */
struct MovieResponse: Codable {
    /// The array of movies returned by the API.
    let results: [Movie]
}

/**
 A struct representing a movie object in the app.
 - Conforms to `Identifiable` and `Codable` protocols for easy list handling and JSON parsing.
 */
struct Movie: Identifiable, Codable {
    
    /// The unique identifier of the movie.
    let id: Int
    
    /// The title of the movie.
    let title: String
    
    /// Array of genre IDs associated with the movie.
    let genreIds: [Int]
    
    /// A brief overview or description of the movie.
    let overview: String
    
    /// The relative path to the movie's poster image.
    let posterPath: String?
    
    /// Computed property to return the full URL for the movie poster.
    /// - Returns: A string with the full URL to access the movie poster image.
    var posterURL: String {
        return "https://image.tmdb.org/t/p/w500" + (posterPath ?? "")
    }
    
    /**
     Coding keys for mapping JSON keys to the struct properties.
     - Maps `genre_ids` to `genreIds`.
     - Maps `poster_path` to `posterPath`.
     */
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case genreIds = "genre_ids"  // Correct key for decoding
        case overview
        case posterPath = "poster_path"
    }
}
