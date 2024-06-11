//
//  AddExtractView.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 6/8/24.
//

import SwiftUI

struct AddExtractsView: View {
    @Environment(AppSettingsStore.self) var appSettingsStore
    @Environment(ContentViewModel.self) var viewModel
    @Environment(\.dismiss) private var dismiss
    
    @Binding var recipeFormValues: RecipeFormValues
    
    var selectedRecipeMaltExtract: RecipeMaltExtract?
    
    @State private var searchText = ""
    @State private var selectedMaltExtract: MaltExtract? = nil
    @State private var weight: Double? = nil
    
    func addRecipeMaltExtract() {
        guard self.selectedMaltExtract != nil, self.weight != nil else { return }
        let newRecipeMaltExtract = RecipeMaltExtract(maltExtract: selectedMaltExtract!, weightInPounds: weight!)
        recipeFormValues.recipeMaltExtracts.append(newRecipeMaltExtract)
        dismiss()
    }
    
    func editRecipeMaltExtract() {
        guard self.selectedMaltExtract != nil, self.weight != nil else { return }
        
        if let index = recipeFormValues.recipeMaltExtracts.firstIndex(where: {$0.id == selectedRecipeMaltExtract?.id}) {
            let newRecipeMaltExtract = RecipeMaltExtract(maltExtract: selectedMaltExtract!, weightInPounds: weight!)
            recipeFormValues.recipeMaltExtracts[index] = newRecipeMaltExtract
        }
        
        dismiss()
    }
    
    var body: some View {
        if viewModel.grains.count > 0 {
            VStack {
                Form {
                    HStack {
                        Image(systemName:"magnifyingglass")
                            .foregroundColor(Color.gray)
                        TextField("Filter Extracts", text: $searchText)
                    }
                    Picker("Extract", selection: $selectedMaltExtract) {
                        ForEach(searchResults) { maltExtract in
                            Text("\(maltExtract.maltster) \(maltExtract.name)").tag(maltExtract as MaltExtract?)
                        }
                    }
                    .pickerStyle(.wheel)
                    
                    VStack {
                        HStack {
                            Text("Weight (lbs):")
                            TextField("", value: $weight, format: .number).keyboardType(.decimalPad)
                        }
                    }
                    
                    HStack {
                        Spacer()
                        Button {
                            if selectedRecipeMaltExtract == nil {
                                addRecipeMaltExtract()
                            } else {
                                editRecipeMaltExtract()
                            }
                            
                        } label: {
                            Text(selectedRecipeMaltExtract == nil ? "Add" : "Update")
                        }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).buttonStyle(.bordered).disabled(self.selectedMaltExtract == nil || self.weight == nil)
                        Spacer()
                    }
                }
                Spacer()
            }
            .onAppear {
                if let unwrapped = self.selectedRecipeMaltExtract {
                    self.selectedMaltExtract = unwrapped.maltExtract
                    self.weight = unwrapped.weightInPounds
                } else {
                    self.selectedMaltExtract = viewModel.maltExtracts[0]
                }
            }.onChange(of: self.searchResults.count) {
                if self.searchResults.count > 0 {
                    self.selectedMaltExtract = self.searchResults[0]
                }
            }.navigationTitle(selectedRecipeMaltExtract == nil ? "Add Extract" : "Edit Extract")
        }
        else {
            ProgressView()
        }
    }
    
    var searchResults: [MaltExtract] {
        if searchText.isEmpty {
            return viewModel.maltExtracts
        } else {
            return viewModel.maltExtracts.filter { $0.maltster.contains(searchText) || $0.name.contains(searchText) }
        }
    }
}

#Preview {
    AddExtractsView(recipeFormValues: .constant(RecipeFormValues())).environment(ContentViewModel())
}
