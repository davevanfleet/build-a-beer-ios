//
//  Recipe.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/9/24.
//

import Foundation

struct Recipe {
    let id: Int
    let name: String
    let description: String
    let postBoilGallons: Float
    let recipeGrains: [RecipeGrain]
    let recipeHops: [RecipeHop]
    let yeast: Yeast
}

struct RecipeGrain {
    let grain: Grain
    let weightInPounds: Float
}

struct RecipeHop {
    let hop: Hop
    let weightInOunces: Float
    let alphaAcidPercent: Float
    let boilTimeMinutes: Float
}
