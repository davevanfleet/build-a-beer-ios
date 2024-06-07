//
//  RecipeBuilderView.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/27/24.
//

import SwiftUI

enum RecipeBuilderStep {
    case grains
    case hops
    case yeast
}

struct RecipeBuilderView: View {
    @State var step = RecipeBuilderStep.grains
    var body: some View {
        NavigationStack(path: $step) {
            
        }
    }
}

#Preview {
    RecipeBuilderView()
}
