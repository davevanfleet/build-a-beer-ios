//
//  GrainsListView.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/27/24.
//

import SwiftUI

struct GrainsListView: View {
    @Environment(ContentViewModel.self) var viewModel
    @State private var searchText = ""
    
    var body: some View {
        @Bindable var viewModel: ContentViewModel = self.viewModel
        
        List(searchResults) {grain in
            NavigationLink("\(grain.maltster) \(grain.name)") {
                GrainDetailView(grain: grain)
            }
        }
        .searchable(text: $searchText)
    }
    
    var searchResults: [Grain] {
        if searchText.isEmpty {
            return viewModel.grains
        } else {
            return viewModel.grains.filter { $0.maltster.contains(searchText) || $0.name.contains(searchText) }
        }
    }
}

#Preview {
    GrainsListView().environment(ContentViewModel())
}
