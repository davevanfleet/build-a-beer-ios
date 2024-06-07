//
//  HopsListView.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/27/24.
//

import SwiftUI

struct HopsListView: View {
    @Environment(ContentViewModel.self) var viewModel
    @State private var searchText = ""
    
    var body: some View {
        @Bindable var viewModel: ContentViewModel = self.viewModel

        List(searchResults) {hop in
            NavigationLink(hop.name) {
                HopDetailView(hop: hop)
            }
        }
        .searchable(text: $searchText)
    }
    
    var searchResults: [Hop] {
        if searchText.isEmpty {
            return viewModel.hops
        } else {
            return viewModel.hops.filter { $0.name.contains(searchText) }
        }
    }
}

#Preview {
    HopsListView().environment(ContentViewModel())
}
