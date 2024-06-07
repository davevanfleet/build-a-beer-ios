//
//  Abv.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/9/24.
//

import Foundation

func calculateAbv (recipe: RecipeFormValues, brewhouseEfficiency: Double) -> Double {
    let estimatedOriginalGravity = calculateEstimatedOriginalGravity(recipe: recipe, brewhouseEfficiency: brewhouseEfficiency);
    let estimatedFinalGravity = calculateEstimatedFinalGravity(recipe: recipe, brewhouseEfficiency: brewhouseEfficiency);
    let abv = (estimatedOriginalGravity - estimatedFinalGravity) * 131.25
    return round(abv * 10) / 10
}
