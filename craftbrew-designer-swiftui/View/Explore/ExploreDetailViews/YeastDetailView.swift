//
//  YeastDetailView.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/27/24.
//

import SwiftUI

struct YeastDetailView: View {
    let yeast: Yeast
    var body: some View {
        VStack {
            HStack {
                Text("Fermentation Type")
                    .fontWeight(.bold)
                Spacer()
                Text(String(yeast.fermentation))
            }
            HStack {
                Text("Temperature Range:")
                    .fontWeight(.bold)
                Spacer()
                Text("\(yeast.minimumTemperature) - \(yeast.maximumTemperature)")
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
    YeastDetailView(yeast: Yeast(id: 1, name: "Wyeast 1762 Belgian Abbey II", minimumTemperature: 65, maximumTemperature: 75, fermentation: 1, attenuation: 0.75))
}
