//
//  Bitterness.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/9/24.
//

import Foundation

func formatIbu (ibu: Double) -> Int {
    return Int(round(ibu))
}

func calculateEstimateBitterness (recipe: RecipeFormValues) -> Int {
    let estimatedOriginalGravity = calculateEstimatedOriginalGravity(recipe: recipe, brewhouseEfficiency: 0.80)
    let estimatedIbu = recipe.recipeHops.reduce(Double(0)) { acc, recipeHop in
        let mgPerLofAddedAlphaAcids = ((recipeHop.alphaAcidPercent / 100) * recipeHop.weightInOunces * 7490) / recipe.postBoilGallons;
        let bignessFactor = 1.65 * pow(0.000125, (estimatedOriginalGravity - 1));
        let boilTimeFactor = ((1 - exp(-0.04 * recipeHop.boilTimeMinutes))) / 4.15;
        let decimalAlphaUtilization = bignessFactor * boilTimeFactor;
        let ibu = decimalAlphaUtilization * mgPerLofAddedAlphaAcids
        return acc + ibu;
    }

    return formatIbu(ibu: estimatedIbu);
}
