//
//  Color.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/9/24.
//

import Foundation

func calculateEstimatedColor (recipe: RecipeFormValues) -> Int {
    let estimatedSrmFromExtracts = recipe.recipeMaltExtracts.reduce(Double(0)){ acc, recipeMaltExtract in
        let srmContribution = recipeMaltExtract.maltExtract.lovibond * (recipeMaltExtract.weightInPounds / recipe.postBoilGallons)
        return acc + srmContribution
    }
    
    let estimatedSrmFromGrains = recipe.recipeGrains.reduce(Double(0)){ acc, recipeGrain in
        let srmContribution = recipeGrain.grain.lovibond * (recipeGrain.weightInPounds / recipe.postBoilGallons)
        return acc + srmContribution
    }
    
    return Int(round(estimatedSrmFromGrains))
}
