//
//  RecipeGravityView.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/30/24.
//

import SwiftUI

struct RecipeOriginalGravityView: View {
    @Environment(AppSettingsStore.self) var appSettingsStore
    
    @Binding var recipeFormValues: RecipeFormValues
        
    var body: some View {
        let estimatedOriginalGravity = calculateEstimatedOriginalGravity(recipe: recipeFormValues, brewhouseEfficiency: appSettingsStore.appSettings.brewhouseEfficiency)
        
        HStack {
            Text("Original Gravity").font(.headline).fontWeight(.bold)
            Spacer()
            Text(String(format: "%.3f", estimatedOriginalGravity))
        }
    }
}

#Preview {
    RecipeOriginalGravityView(recipeFormValues: .constant(RecipeFormValues()))
}
