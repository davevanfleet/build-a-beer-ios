//
//  HopDetailView.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/27/24.
//

import SwiftUI

struct HopDetailView: View {
    let hop: Hop
    var body: some View {
        VStack {
            HStack {
                Text("Bittering Hop:")
                    .fontWeight(.bold)
                Spacer()
                Text(String(hop.forBittering))
            }
            HStack {
                Text("Flavoring Hop:")
                    .fontWeight(.bold)
                Spacer()
                Text(String(hop.forFlavor))
            }
            HStack {
                Text("Aroma Hop:")
                    .fontWeight(.bold)
                Spacer()
                Text(String(hop.forAroma))
            }
            HStack {
                Text("Dry Hop:")
                    .fontWeight(.bold)
                Spacer()
                Text(String(hop.forDryHopping))
            }
            Spacer()
           
        }
        .padding()
        .navigationTitle(hop.name)
    }
}

#Preview {
    HopDetailView(hop: Hop(id: 1, name: "Yakima Magnum", forAroma: false, forBittering: true, forDryHopping: false, forFlavor: false))
}
