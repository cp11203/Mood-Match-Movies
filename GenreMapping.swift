//
//  GenreMapping.swift
//  MovieRecommender
//
//  Created by chaitanya prasad on 31/10/24.
//

import Foundation

/// A dictionary that maps genre IDs to their corresponding genre names.
/// - Key: The unique ID representing each genre.
/// - Value: The name of the genre as a `String`.
let genreMapping: [Int: String] = [
    12: "Adventure",
    35: "Comedy",
    53: "Thriller",
    10749: "Romance",
    // Additional genres can be added here as needed
]
/**
 Retrieves genre names based on an array of genre IDs.
 
 - Parameter genreIds: An array of integers representing genre IDs.
 - Returns: An array of genre names as strings, corresponding to the provided genre IDs.
 - Discussion: This function maps each genre ID to its genre name by using the `genreMapping` dictionary. If a genre ID is not found in the mapping, it is ignored.
 */
 func genreNames(from genreIds: [Int]) -> [String] {
    return genreIds.compactMap { genreMapping[$0] }
 }
