//
//  BeerStyleListView.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/28/24.
//

import SwiftUI

struct BeerStyleListView: View {
    @Environment(ContentViewModel.self) var viewModel
    @State private var searchText = ""
    
    var body: some View {
        @Bindable var viewModel: ContentViewModel = self.viewModel
        
        List(searchResults) {beerStyle in
            NavigationLink(beerStyle.name) {
                BeerStyleDetailView(beerStyle: beerStyle)
            }
        }
        .searchable(text: $searchText)
    }
    
    var searchResults: [BeerStyle] {
        if searchText.isEmpty {
            return viewModel.beerStyles
        } else {
            return viewModel.beerStyles.filter { $0.bjcpCode.lowercased().contains(searchText.lowercased()) || $0.name.lowercased().contains(searchText.lowercased()) || $0.overallImpression.lowercased().contains(searchText.lowercased()) || $0.aromaDescription.lowercased().contains(searchText.lowercased()) || $0.appearanceDescription.lowercased().contains(searchText.lowercased()) || $0.flavorDescription.lowercased().contains(searchText.lowercased()) || $0.mouthfeelDescription.lowercased().contains(searchText.lowercased()) || $0.comments.lowercased().contains(searchText.lowercased()) || $0.history.lowercased().contains(searchText.lowercased()) }
        }
    }
}

#Preview {
    BeerStyleListView().environment(ContentViewModel())
}
