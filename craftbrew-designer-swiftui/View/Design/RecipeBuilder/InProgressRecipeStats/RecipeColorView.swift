//
//  RecipeColorView.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/30/24.
//

import SwiftUI

struct RecipeColorView: View {
    @Binding var recipeFormValues: RecipeFormValues
    
    func srmToColor(srm: Int) -> Color {
        if srm > 40 {
            return Color(red: 36/254, green: 12/254, blue: 13/254)
        }
        
        switch srm {
        case 0:
            return Color(.white)
        case 1:
            return Color(red: 248/254, green: 244/254, blue: 180/254)
        case 2:
            return Color(red: 250/254, green: 224/254, blue: 107/254)
        case 3:
            return Color(red: 245/254, green: 205/254, blue: 81/254)
        case 4:
            return Color(red: 243/254, green: 191/254, blue: 55/254)
        case 5:
            return Color(red: 238/254, green: 173/254, blue: 31/254)
        case 6:
            return Color(red: 229/254, green: 156/254, blue: 25/254)
        case 7:
            return Color(red: 224/254, green: 143/254, blue: 21/254)
        case 8:
            return Color(red: 214/254, green: 129/254, blue: 24/254)
        case 9:
            return Color(red: 209/254, green: 116/254, blue: 28/254)
        case 10:
            return Color(red: 189/254, green: 90/254, blue: 27/254)
        case 11:
            return Color(red: 196/254, green: 98/254, blue: 127/254)
        case 12:
            return Color(red: 205/254, green: 111/254, blue: 27/254)
        case 13:
            return Color(red: 192/254, green: 88/254, blue: 37/254)
        case 14:
            return Color(red: 174/254, green: 69/254, blue: 25/254)
        case 15:
            return Color(red: 175/254, green: 72/254, blue: 25/254)
        case 16:
            return Color(red: 174/254, green: 69/254, blue: 25/254)
        case 17:
            return Color(red: 168/254, green: 59/254, blue: 24/254)
        case 18:
            return Color(red: 164/254, green: 59/254, blue: 24/254)
        case 19:
            return Color(red: 158/254, green: 53/254, blue: 22/254)
        case 20:
            return Color(red: 152/254, green: 49/254, blue: 21/254)
        case 21:
            return Color(red: 147/254, green: 42/254, blue: 21/254)
        case 22:
            return Color(red: 144/254, green: 37/254, blue: 23/254)
        case 23:
            return Color(red: 136/254, green: 32/254, blue: 15/254)
        case 24:
            return Color(red: 131/254, green: 33/254, blue: 22/254)
        case 25:
            return Color(red: 126/254, green: 33/254, blue: 19/254)
        case 26:
            return Color(red: 119/254, green: 32/254, blue: 17/254)
        case 27:
            return Color(red: 117/254, green: 24/254, blue: 17/254)
        case 28:
            return Color(red: 113/254, green: 25/254, blue: 14/254)
        case 29:
            return Color(red: 106/254, green: 22/254, blue: 14/254)
        case 30:
            return Color(red: 103/254, green: 18/254, blue: 12/254)
        case 31:
            return Color(red: 101/254, green: 16/254, blue: 14/254)
        case 32:
            return Color(red: 96/254, green: 14/254, blue: 12/254)
        case 33:
            return Color(red: 93/254, green: 12/254, blue: 13/254)
        case 34:
            return Color(red: 88/254, green: 9/254, blue: 12/254)
        case 35:
            return Color(red: 84/254, green: 8/254, blue: 14/254)
        case 36:
            return Color(red: 75/254, green: 10/254, blue: 12/254)
        case 37:
            return Color(red: 73/254, green: 15/254, blue: 15/254)
        case 38:
            return Color(red: 64/254, green: 13/254, blue: 16/254)
        case 39:
            return Color(red: 60/254, green: 12/254, blue: 16/254)
        case 40:
            return Color(red: 36/254, green: 12/254, blue: 13/254)
        default:
            return Color(red: 36/254, green: 12/254, blue: 13/254)
        }
        
    }
    
    var body: some View {
        let estimatedColor = calculateEstimatedColor(recipe: recipeFormValues)

        HStack {
            Text("Color").font(.headline).fontWeight(.bold)
            Spacer()
            Circle().strokeBorder(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/).fill(srmToColor(srm: estimatedColor)).frame(width: 25, height: 25)
        }
    }
}

#Preview {
    RecipeColorView(recipeFormValues: .constant(RecipeFormValues()))
}
