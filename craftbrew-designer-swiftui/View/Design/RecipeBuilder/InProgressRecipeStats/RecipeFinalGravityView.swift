//
//  RecipeABVView.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/30/24.
//

import SwiftUI

struct RecipeFinalGravityView: View {
    @Environment(AppSettingsStore.self) var appSettingsStore
    
    @Binding var recipeFormValues: RecipeFormValues
        
    var body: some View {
        let estimatedFinalGravity = calculateEstimatedFinalGravity(recipe: recipeFormValues, brewhouseEfficiency: appSettingsStore.appSettings.brewhouseEfficiency)
        let estimatedAbv = calculateAbv(recipe: recipeFormValues, brewhouseEfficiency: appSettingsStore.appSettings.brewhouseEfficiency)
        
        HStack {
            Text("Final Gravity").font(.headline).fontWeight(.bold)
            Spacer()
            Text("\(String(format: "%.3f", estimatedFinalGravity)) (\(String(format: "%.1f", estimatedAbv)) ABV)")
        }
    }
}

#Preview {
    RecipeFinalGravityView(recipeFormValues: .constant(RecipeFormValues()))
}
