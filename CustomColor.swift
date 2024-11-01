//  CustomColor.swift
//  MovieRecommender
//
//  Created by chaitanya prasad on 31/10/24.
//

import Foundation
import SwiftUI

/**
 This extension adds custom color definitions for use throughout the app.
 Each color corresponds to an entry in the Asset Catalog and can be used
 for consistent styling across multiple views.
 */
extension Color {
    
    /// A dark blue color used for depth effects in backgrounds.
    static let lightpurple = Color("light purple")
    
    /// A light blue color for highlights and light layers.
    static let mediumpurple = Color("medium purple")
    
    /// A medium blue color used in gradients or surface layers.
    static let darkpurple = Color("dark purple")
    static let lightgrey = Color("light grey")
    
    /// A custom UI color for additional styling, such as TextField backgrounds.
    static let uicustom = Color("UI") 
}
