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
            Text("Typical Usages").font(.title2)
            HStack {
                Text("Bittering")
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: hop.forBittering ? "checkmark.circle" : "x.circle")
                    .foregroundColor(hop.forBittering ? Color.green : Color.red)
            }
            HStack {
                Text("Flavoring")
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: hop.forFlavor ? "checkmark.circle" : "x.circle")
                    .foregroundColor(hop.forFlavor ? Color.green : Color.red)
            }
            HStack {
                Text("Aroma")
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: hop.forAroma ? "checkmark.circle" : "x.circle")
                    .foregroundColor(hop.forAroma ? Color.green : Color.red)
            }
            HStack {
                Text("Dry")
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: hop.forDryHopping ? "checkmark.circle" : "x.circle")
                    .foregroundColor(hop.forDryHopping ? Color.green : Color.red)
                    
            }
            
            Text("Typical Alpha Acid").font(.title2)
            Text("\(String(format: "%g", hop.minimumTypicalAlphaAcid))% - \(String(format: "%g", hop.maximumTypicalAlphaAcid))%")
            Spacer()
           
        }
        .padding()
        .navigationTitle(hop.name)
    }
}

#Preview {
    HopDetailView(hop: Hop(id: 1, name: "Yakima Magnum", forAroma: false, forBittering: true, forDryHopping: false, forFlavor: false, minimumTypicalAlphaAcid: 14.0, maximumTypicalAlphaAcid: 15.0))
}
