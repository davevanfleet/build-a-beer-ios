//
//  AddYeastView.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/27/24.
//

import SwiftUI

struct AddYeastView: View {
    @Environment(ContentViewModel.self) var viewModel
    @Environment(\.dismiss) private var dismiss
    
    @Binding var recipeFormValues: RecipeFormValues
    
    var edit = false
    
    @State private var searchText = ""
    @State private var selectedYeast: Yeast? = nil
    
    func addRecipeYeast() {
        guard self.selectedYeast != nil else { return }
        recipeFormValues.yeast = selectedYeast
        dismiss()
    }
    
    var body: some View {
        if viewModel.yeasts.count > 0 {
            Form {
                HStack {
                    Image(systemName:"magnifyingglass")
                        .foregroundColor(Color.gray)
                    TextField("Filter Yeasts", text: $searchText)
                }
                Picker("Yeast", selection: $selectedYeast) {
                    ForEach(searchResults) { yeast in
                        Text(yeast.name).tag(yeast as Yeast?)
                    }
                }
                .pickerStyle(.wheel)
                
                HStack {
                    Spacer()
                    Button{
                        addRecipeYeast()
                    } label: {
                        Text(edit ? "Update" : "Add")
                    }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).buttonStyle(.bordered).disabled(self.selectedYeast == nil)
                    Spacer()
                }
            }
            .onAppear {
                if edit {
                    self.selectedYeast = recipeFormValues.yeast
                } else {
                    self.selectedYeast = viewModel.yeasts[0]
                }
            }.onChange(of: self.searchResults.count) {
                if self.searchResults.count > 0 {
                    self.selectedYeast = self.searchResults[0]
                }
            }.navigationTitle(edit ? "Edit Yeast" : "Add Yeast")
        } else {
            ProgressView()
        }
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
    AddYeastView(recipeFormValues: .constant(RecipeFormValues())).environment(ContentViewModel())
}
