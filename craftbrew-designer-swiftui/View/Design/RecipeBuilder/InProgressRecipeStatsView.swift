//
//  InProgressRecipeStatsView.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/28/24.
//

import SwiftUI

struct InProgressRecipeStatsView: View {
    @Binding var recipeFormValues: RecipeFormValues
    
    var body: some View {
        HStack(alignment: .top) {
            RecipeColorView(recipeFormValues: $recipeFormValues)
            
            RecipeBitternessView(recipeFormValues: $recipeFormValues)
            
            RecipeGravityView(recipeFormValues: $recipeFormValues)
    
            RecipeABVView(recipeFormValues: $recipeFormValues)
        }
    }
}

#Preview {
    InProgressRecipeStatsView(recipeFormValues: .constant(RecipeFormValues()))
}
