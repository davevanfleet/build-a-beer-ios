//
//  RecipeABVView.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/30/24.
//

import SwiftUI

struct RecipeABVView: View {
    @Binding var recipeFormValues: RecipeFormValues
    
    var body: some View {
        let estimatedAbv = calculateAbv(recipe: recipeFormValues)

        HStack {
            Text("ABV").font(.title3).fontWeight(.bold)
            Spacer()
            Text(String(estimatedAbv))
        }
    }
}

#Preview {
    RecipeABVView(recipeFormValues: .constant(RecipeFormValues()))
}
