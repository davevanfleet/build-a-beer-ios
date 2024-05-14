//
//  Structures.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/9/24.
//

import Foundation

func formatSpecificGravity (specificGravity: Float) -> Float {
    return round(specificGravity * 1000) / 1000
}

func gravityUnitsToSpecificGravity (gravityUnits: Float) -> Float {
    return formatSpecificGravity(specificGravity: gravityUnits / 1000 + 1)
}

func calculatePotentialOriginalGravity (recipe: Recipe) -> Float {
    let gravityUnits = recipe.recipeGrains.reduce(Float(0)){ acc, recipeGrain in
       let pointsPerPoundPerGallon = recipeGrain.grain.fineGrindDryBasisPercentage * 46
       let gravityUnits = pointsPerPoundPerGallon * recipeGrain.weightInPounds;
       return acc + gravityUnits
    } / recipe.postBoilGallons
    
    return gravityUnitsToSpecificGravity(gravityUnits: gravityUnits)
}

func calculateEstimatedOriginalGravity (recipe: Recipe, brewhouseEfficiency: Float) -> Float {
    let potentialOriginalGravity = calculatePotentialOriginalGravity(recipe: recipe);
    let potentialGravityUnits = (potentialOriginalGravity - 1) * 1000
    let estimatedGravityUnits = potentialGravityUnits * brewhouseEfficiency;
    return gravityUnitsToSpecificGravity(gravityUnits: estimatedGravityUnits)
}

func calculateEstimatedFinalGravity (recipe: Recipe, brewhouseEfficiency: Float) -> Float {
    let estimatedOriginalGravity = calculateEstimatedOriginalGravity(recipe: recipe, brewhouseEfficiency: brewhouseEfficiency);
    let estimatedFinalGravity = estimatedOriginalGravity - (estimatedOriginalGravity - 1) * recipe.yeast.attenuation
    return formatSpecificGravity(specificGravity: estimatedFinalGravity);
}
