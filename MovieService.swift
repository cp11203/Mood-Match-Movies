//
//  MovieService.swift
//  MovieRecommender
//
//  Created by chaitanya prasad on 31/10/24.
//

import Foundation

/**
 A service class responsible for fetching movies from The Movie Database (TMDb) API.
 - Fetches movies based on a specific mood, mapping each mood to a genre ID.
 - Decodes the fetched data into an array of `Movie` objects.
 */
class MovieService {
    
    /// The API key for accessing TMDb API.
    private let apiKey = "621d13352462bdcc3fab53c994914a2b"
    
    /// The base URL for TMDb movie discovery endpoint.
    private let baseURL = "https://api.themoviedb.org/3/discover/movie"
    
    /**
     Fetches a list of movies from TMDb based on the specified mood.
     
     - Parameters:
        - mood: The mood selected by the user, mapped to a specific genre.
        - completion: A closure that returns an array of `Movie` objects upon successful fetch or an empty array if an error occurs.
     
     - Discussion:
     This function builds a URL with query parameters, performs a network request, and decodes the JSON response into `Movie` objects.
     */
    func fetchMovies(forMood mood: String, completion: @escaping ([Movie]) -> Void) {
        // Set up URL components with base URL
        guard var urlComponents = URLComponents(string: baseURL) else { return }
        
        // Define query parameters
        urlComponents.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "sort_by", value: "popularity.desc"),
            URLQueryItem(name: "with_genres", value: genreID(for: mood))
        ]
        
        // Ensure a valid URL is created
        guard let url = urlComponents.url else { return }
        
        // Execute the data task
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Handle potential errors
            if let error = error {
                print("Error fetching data: \(error)")
                DispatchQueue.main.async {
                    completion([])
                }
                return
            }
            
            // Ensure data was received
            guard let data = data else {
                print("No data received")
                DispatchQueue.main.async {
                    completion([])
                }
                return
            }
            
            // Decode the JSON data into `MovieResponse`
            do {
                let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(movieResponse.results)
                }
            } catch {
                print("Error decoding data: \(error)")
                DispatchQueue.main.async {
                    completion([])
                }
            }
        }.resume() // Starts the network request
    }
    
    /**
     Maps a mood to a corresponding genre ID for the TMDb API.
     
     - Parameter mood: A string representing the user's selected mood.
     - Returns: A string representing the genre ID associated with the mood.
     
     - Discussion:
     This function ensures that each mood is associated with a predefined genre ID in the API.
     */
    private func genreID(for mood: String) -> String {
        switch mood.lowercased() {
        case "adventure": return "12"
        case "romance": return "10749"
        case "thriller": return "53"
        case "comedy": return "35"
        default: return "12" // Default genre ID if mood is unrecognized
        }
    }
}
