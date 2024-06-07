//
//  AddHopsView.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/27/24.
//

import SwiftUI

struct AddHopsView: View {
    @Environment(ContentViewModel.self) var viewModel
    @Environment(\.dismiss) private var dismiss
    
    @Binding var recipeFormValues: RecipeFormValues
    
    var selectedRecipeHop: RecipeHop?
    
    @State private var searchText = ""
    @State private var selectedHop: Hop? = nil
    @State private var weight: Double? = nil
    @State private var boilTime: Double = 60.0
    
    func addRecipeHop() {
        guard self.selectedHop != nil, self.weight != nil else { return }
        let newRecipeHop = RecipeHop(hop: selectedHop!, weightInOunces: weight!, alphaAcidPercent: selectedHop!.averageAlphaAcid, boilTimeMinutes: boilTime)
        recipeFormValues.recipeHops.append(newRecipeHop)
        dismiss()
    }
    
    func editRecipeHop() {
        guard self.selectedHop != nil, self.weight != nil else { return }
        
        if let index = recipeFormValues.recipeHops.firstIndex(where: {$0.id == selectedRecipeHop?.id}) {
            let newRecipeHop = RecipeHop(hop: selectedHop!, weightInOunces: weight!, alphaAcidPercent: selectedHop!.averageAlphaAcid, boilTimeMinutes: boilTime)
            recipeFormValues.recipeHops[index] = newRecipeHop
        }
        
        dismiss()
    }
    
    var body: some View {
        if viewModel.hops.count > 0 {
            Form {
                HStack {
                    Image(systemName:"magnifyingglass")
                        .foregroundColor(Color.gray)
                    TextField("Filter Hops", text: $searchText)
                }
                Picker("Hop", selection: $selectedHop) {
                    ForEach(searchResults) { hop in
                        Text(hop.name).tag(hop as Hop?)
                    }
                }
                .pickerStyle(.wheel)
                
                if selectedHop != nil {
                    HStack {
                        Text("Weight (oz):")
                        TextField("", value: $weight, format: .number).keyboardType(.decimalPad)
                    }
                    
                    Picker("Boil Time (min):", selection: $boilTime) {
                        Text("60 (bittering) \(selectedHop!.forBittering ? "😎" : "🤔")").tag(60.0)
                        Text("15 (flavor) \(selectedHop!.forFlavor ? "😎" : "🤔")").tag(15.0)
                        Text("5 (aroma) \(selectedHop!.forAroma ? "😎" : "🤔")").tag(5.0)
                        Text("0 (dry hop) \(selectedHop!.forDryHopping ? "😎" : "🤔")").tag(0.0)
                    }
                    
                    
                    HStack {
                        Spacer()
                        Button {
                            if self.selectedRecipeHop == nil {
                                addRecipeHop()
                            } else {
                                editRecipeHop()
                            }
                        } label: {
                            Text(self.selectedRecipeHop == nil ? "Add" : "Update")
                        }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).buttonStyle(.bordered).disabled(self.selectedHop == nil || self.weight == nil || self.boilTime == nil)
                        Spacer()
                    }
                }
            }
            .onAppear {
                if let unwrapped = self.selectedRecipeHop {
                    self.selectedHop = unwrapped.hop
                    self.weight = unwrapped.weightInOunces
                    self.boilTime = unwrapped.boilTimeMinutes
                } else {
                    self.selectedHop = viewModel.hops[0]
                }
            }.onChange(of: self.searchResults.count) {
                if self.searchResults.count > 0 {
                    self.selectedHop = self.searchResults[0]
                }
            }.navigationTitle(self.selectedRecipeHop == nil ? "Add Hop" : "Edit Hop")
        }
        else {
            ProgressView()
        }
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
    AddHopsView(recipeFormValues: .constant(RecipeFormValues())).environment(ContentViewModel())
}
