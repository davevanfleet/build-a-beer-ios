//
//  YeastDetailView.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/27/24.
//

import SwiftUI

struct YeastDetailView: View {
    let yeast: Yeast
    
    let fermentationMapping = [
        "top": "Top (Ale)",
        "bottom": "Bottom (Lager)"
    ]
    var body: some View {
        VStack {
            HStack {
                Text("Fermentation Type")
                    .fontWeight(.bold)
                Spacer()
                Text(fermentationMapping[yeast.fermentation] ?? "")
            }
            HStack {
                Text("Temperature Range:")
                    .fontWeight(.bold)
                Spacer()
                Text("\(yeast.minimumTemperature)°F - \(yeast.maximumTemperature)°F")
            }
            HStack {
                Text("Attenuation:")
                    .fontWeight(.bold)
                Spacer()
                Text("\(Int(yeast.attenuation * 100))%")
            }
            Spacer()
           
        }
        .padding()
        .navigationTitle(yeast.name)
    }
}

#Preview {
    YeastDetailView(yeast: Yeast(id: 1, name: "Wyeast 1762 Belgian Abbey II", minimumTemperature: 65, maximumTemperature: 75, fermentation: "top", attenuation: 0.75))
}
