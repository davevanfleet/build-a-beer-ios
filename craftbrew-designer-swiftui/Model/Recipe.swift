//
//  Recipe.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/9/24.
//

import Foundation

struct Recipe: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let postBoilGallons: Double
    var recipeMaltExtracts: [RecipeMaltExtract]?
    let recipeGrains: [RecipeGrain]
    let recipeHops: [RecipeHop]
    let yeast: Yeast
    
    var recipeFormValues: RecipeFormValues {
        RecipeFormValues(postBoilGallons: self.postBoilGallons, recipeMaltExtracts: self.recipeMaltExtracts ?? [], recipeGrains: self.recipeGrains, recipeHops: self.recipeHops, yeast: self.yeast)
    }
}

struct RecipeGrain: Decodable, Identifiable {
    var id = UUID()
    var grain: Grain
    var weightInPounds: Double
}

struct RecipeMaltExtract: Decodable, Identifiable {
    var id = UUID()
    var maltExtract: MaltExtract
    var weightInPounds: Double
}

struct RecipeHop: Decodable, Identifiable {
    var id = UUID()
    let hop: Hop
    var weightInOunces: Double
    let alphaAcidPercent: Double
    let boilTimeMinutes: Double
}
