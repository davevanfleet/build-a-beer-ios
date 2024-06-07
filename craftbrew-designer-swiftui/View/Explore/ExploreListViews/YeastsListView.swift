//
//  YeastsListView.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/27/24.
//

import SwiftUI

struct YeastsListView: View {
    @Environment(ContentViewModel.self) var viewModel
    @State private var searchText = ""
    
    var body: some View {
        @Bindable var viewModel: ContentViewModel = self.viewModel

        List(searchResults) {yeast in
            NavigationLink(yeast.name) {
                YeastDetailView(yeast: yeast)
            }
        }
        .searchable(text: $searchText)
    }
    
    var searchResults: [Yeast] {
        if searchText.isEmpty {
            return viewModel.yeasts
        } else {
            return viewModel.yeasts.filter { $0.name.contains(searchText) }
        }
    }
}

#Preview {
    YeastsListView().environment(ContentViewModel())
}
