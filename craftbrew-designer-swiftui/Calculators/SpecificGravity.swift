//
//  Structures.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/9/24.
//

import Foundation

func formatSpecificGravity (specificGravity: Double) -> Double {
    return round(specificGravity * 1000) / 1000
}

func gravityUnitsToSpecificGravity (gravityUnits: Double) -> Double {
    return formatSpecificGravity(specificGravity: gravityUnits / 1000 + 1)
}

func calculatePotentialOriginalGravity (recipe: RecipeFormValues) -> (potentialGravity: Double, gravityUnitsFromGrains: Double, gravityUnitsFromExtractsAndOtherFermentables: Double) {
    let gravityUnitsFromExtractsAndOtherFermentables = recipe.recipeMaltExtracts.reduce(Double(0)){ acc, recipeMaltExtract in
       let pointsPerPoundPerGallon = recipeMaltExtract.maltExtract.fermentabilityPercentage * 46
       let gravityUnits = pointsPerPoundPerGallon * recipeMaltExtract.weightInPounds;
       return acc + gravityUnits
    } / recipe.postBoilGallons
    
    let gravityUnitsFromGrains = recipe.recipeGrains.reduce(Double(0)){ acc, recipeGrain in
       let pointsPerPoundPerGallon = recipeGrain.grain.fineGrindDryBasisPercentage * 46
       let gravityUnits = pointsPerPoundPerGallon * recipeGrain.weightInPounds;
       return acc + gravityUnits
    } / recipe.postBoilGallons
    
    return (potentialGravity: gravityUnitsToSpecificGravity(gravityUnits: gravityUnitsFromExtractsAndOtherFermentables + gravityUnitsFromGrains), gravityUnitsFromGrains: gravityUnitsFromGrains, gravityUnitsFromExtractsAndOtherFermentables: gravityUnitsFromExtractsAndOtherFermentables)
}

func calculateEstimatedOriginalGravity (recipe: RecipeFormValues, brewhouseEfficiency: Double) -> Double {
    let potentialOriginalGravityData = (calculatePotentialOriginalGravity(recipe: recipe));
    let estimatedGravityUnitsFromGrains = potentialOriginalGravityData.gravityUnitsFromGrains * brewhouseEfficiency;
    return gravityUnitsToSpecificGravity(gravityUnits: estimatedGravityUnitsFromGrains + potentialOriginalGravityData.gravityUnitsFromExtractsAndOtherFermentables)
}

func calculateEstimatedFinalGravity (recipe: RecipeFormValues, brewhouseEfficiency: Double) -> Double {
    let estimatedOriginalGravity = calculateEstimatedOriginalGravity(recipe: recipe, brewhouseEfficiency: brewhouseEfficiency);
    guard recipe.yeast != nil else {
        return estimatedOriginalGravity
    }
    let estimatedFinalGravity = estimatedOriginalGravity - (estimatedOriginalGravity - 1) * recipe.yeast!.attenuation
    return formatSpecificGravity(specificGravity: estimatedFinalGravity);
}
