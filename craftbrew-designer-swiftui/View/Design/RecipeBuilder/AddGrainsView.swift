//
//  AddGrainsView.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/27/24.
//

import SwiftUI

struct AddGrainsView: View {
    @Environment(AppSettingsStore.self) var appSettingsStore
    @Environment(ContentViewModel.self) var viewModel
    @Environment(\.dismiss) private var dismiss
    
    @Binding var recipeFormValues: RecipeFormValues
    
    var selectedRecipeGrain: RecipeGrain?
    
    @State private var searchText = ""
    @State private var selectedGrain: Grain? = nil
    @State private var weight: Double? = nil
    
    func addRecipeGrain() {
        guard self.selectedGrain != nil, self.weight != nil else { return }
        let newRecipeGrain = RecipeGrain(grain: selectedGrain!, weightInPounds: weight!)
        recipeFormValues.recipeGrains.append(newRecipeGrain)
        dismiss()
    }
    
    func editRecipeGrain() {
        guard self.selectedGrain != nil, self.weight != nil else { return }
        
        if let index = recipeFormValues.recipeGrains.firstIndex(where: {$0.id == selectedRecipeGrain?.id}) {
            let newRecipeGrain = RecipeGrain(grain: selectedGrain!, weightInPounds: weight!)
            recipeFormValues.recipeGrains[index] = newRecipeGrain
        }
        
        dismiss()
    }
    
    var body: some View {
        let batchSize = Double(appSettingsStore.appSettings.batchSize)
        if viewModel.grains.count > 0 {
            VStack {
                Form {
                    HStack {
                        Image(systemName:"magnifyingglass")
                            .foregroundColor(Color.gray)
                        TextField("Filter Grains", text: $searchText)
                    }
                    Picker("Grain", selection: $selectedGrain) {
                        ForEach(searchResults) { grain in
                            Text("\(grain.maltster) \(grain.name)").tag(grain as Grain?)
                        }
                    }
                    .pickerStyle(.wheel)
                    
                    VStack {
                        HStack {
                            Text("Weight (lbs):")
                            TextField("", value: $weight, format: .number).keyboardType(.decimalPad)
                        }
                        if selectedGrain != nil {
                            Text("Recommended max - \(String(format: "%g", 2.0 * batchSize * Double(selectedGrain!.suggestedMaximumUsage) / 100.0))")
                                .font(.caption)
                                .foregroundColor(Color.gray)
                                
                        }
                    }
                    
                    HStack {
                        Spacer()
                        Button {
                            if selectedRecipeGrain == nil {
                                addRecipeGrain()
                            } else {
                                editRecipeGrain()
                            }
                            
                        } label: {
                            Text(selectedRecipeGrain == nil ? "Add" : "Update")
                        }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).buttonStyle(.bordered).disabled(self.selectedGrain == nil || self.weight == nil)
                        Spacer()
                    }
                }
                Spacer()
            }
            .onAppear {
                if let unwrapped = self.selectedRecipeGrain {
                    self.selectedGrain = unwrapped.grain
                    self.weight = unwrapped.weightInPounds
                } else {
                    self.selectedGrain = viewModel.grains[0]
                }
            }.onChange(of: self.searchResults.count) {
                if self.searchResults.count > 0 {
                    self.selectedGrain = self.searchResults[0]
                }
            }.navigationTitle(selectedRecipeGrain == nil ? "Add Grain" : "Edit Grain")
        }
        else {
            ProgressView()
        }
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
    AddGrainsView(recipeFormValues: .constant(RecipeFormValues())).environment(ContentViewModel())
}
