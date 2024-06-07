//
//  RecipeBitternessView.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/30/24.
//

import SwiftUI

struct RecipeBitternessView: View {
    @Binding var recipeFormValues: RecipeFormValues
    
    var body: some View {
        let estimatedBitterness = calculateEstimateBitterness(recipe: recipeFormValues)

        HStack {
            Text("Bitterness").font(.headline).fontWeight(.bold)
            Spacer()
            Text(String(estimatedBitterness))
        }
    }
}

#Preview {
    RecipeBitternessView(recipeFormValues: .constant(RecipeFormValues()))
}
