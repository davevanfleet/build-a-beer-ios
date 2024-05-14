//
//  Color.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/9/24.
//

import Foundation

func calculateEstimatedColor (recipe: Recipe) -> Int {
    let estimatedSrm = recipe.recipeGrains.reduce(Float(0)){ acc, recipeGrain in
        let srmContribution = recipeGrain.grain.lovibond * (recipeGrain.weightInPounds / recipe.postBoilGallons)
        return acc + srmContribution
    }
    return Int(round(estimatedSrm))
}
