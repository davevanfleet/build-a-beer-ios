//
//  GrainDetailView.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/27/24.
//

import SwiftUI

struct GrainDetailView: View {
    let grain: Grain
    var body: some View {
        VStack {
            HStack {
                Text("Maltster:")
                    .fontWeight(.bold)
                Spacer()
                Text(grain.maltster)
            }
            HStack {
                Text("Name:")
                    .fontWeight(.bold)
                Spacer()
                Text(grain.name)
            }
            HStack {
                Text("Color (Lovibond):")
                    .fontWeight(.bold)
                Spacer()
                Text(String(grain.lovibond))
            }
            HStack {
                Text("Suggested Maximum Usage:")
                    .fontWeight(.bold)
                Spacer()
                Text("\(grain.suggestedMaximumUsage)%")
            }
            Spacer()
           
        }
        .padding()
        .navigationTitle(grain.name)
    }
}

#Preview {
    GrainDetailView(grain: Grain(id: 1, name: "Brewers Barley Flakes", lovibond: 1.8, fineGrindDryBasisPercentage: 0.75, suggestedMaximumUsage: 25, maltster: "Briess"))
}
