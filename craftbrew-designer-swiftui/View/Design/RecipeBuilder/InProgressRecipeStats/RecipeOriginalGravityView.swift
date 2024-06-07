//
//  RecipeGravityView.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/30/24.
//

import SwiftUI

struct RecipeGravityView: View {
    @Binding var recipeFormValues: RecipeFormValues
        
    var body: some View {
        let brewhouseEfficiency = 0.75
        let estimatedOriginalGravity = calculateEstimatedOriginalGravity(recipe: recipeFormValues, brewhouseEfficiency: brewhouseEfficiency)
        let estimatedFinalGravity = calculateEstimatedFinalGravity(recipe: recipeFormValues, brewhouseEfficiency: brewhouseEfficiency)
        
        HStack {
            Text("Original Gravity").font(.title3).fontWeight(.bold)
            Spacer()
            Text(String(estimatedOriginalGravity))
        }
    }
}

#Preview {
    RecipeGravityView(recipeFormValues: .constant(RecipeFormValues()))
}
