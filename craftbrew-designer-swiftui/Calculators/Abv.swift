//
//  Abv.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/9/24.
//

import Foundation

func calculateAbv (recipe: Recipe) -> Float {
    let estimatedOriginalGravity = calculateEstimatedOriginalGravity(recipe: recipe, brewhouseEfficiency: 0.80);
    let estimatedFinalGravity = calculateEstimatedFinalGravity(recipe: recipe, brewhouseEfficiency: 0.80);
    let abv = (estimatedOriginalGravity - estimatedFinalGravity) * 131.25
    return round(abv * 10) / 10
}
