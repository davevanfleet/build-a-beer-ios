//
//  ExploreView.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/9/24.
//

import SwiftUI

enum ExploreCategory {
    case grains
    case hops
    case yeasts
    case beerStyle
}

struct ExploreView: View {
    @State var category = ExploreCategory.grains
    var body: some View {
        NavigationStack {
            VStack {
//                if category == .grains {
//                    GrainsListView()
//                } else if category == .hops {
//                    HopsListView()
//                } else if category == .yeasts  {
//                    YeastsListView()
//                }
                switch category {
                case .grains:
                    GrainsListView()
                case .hops:
                    HopsListView()
                case .yeasts:
                    YeastsListView()
                case .beerStyle:
                    BeerStyleListView()
                }
            }
            .toolbar {
                HStack {
                    Picker("Ingredient Type", selection: $category) {
                        Text("Grains").tag(ExploreCategory.grains)
                        Text("Hops").tag(ExploreCategory.hops)
                        Text("Yeasts").tag(ExploreCategory.yeasts)
                        Text("Style").tag(ExploreCategory.beerStyle)
                    }
                    .pickerStyle(.segmented)
                    .frame(idealWidth: UIScreen.main.bounds.width * 0.9)
                }
            }
        }
        
        

    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
