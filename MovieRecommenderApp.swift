//
//  MovieRecommenderApp.swift
//  MovieRecommender
//
//  Created by chaitanya prasad on 31/10/24.
//

import SwiftUI

/**
 The main entry point for the MovieRecommender app.
 - Sets up the app's main scene and launches the `ContentView`.
 - Conforms to the `App` protocol, which defines the structure and behavior of the app.
 */
@main
struct MovieRecommenderApp: App {
    
    /// The main scene of the app, containing the root view `ContentView`.
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
