//
//  RecipeBuilderView.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/27/24.
//

import SwiftUI

struct RecipeFormValues {
    var name: String = ""
    var postBoilGallons: Double = 5.0
    var recipeMaltExtracts: [RecipeMaltExtract] = []
    var recipeGrains: [RecipeGrain] = []
    var recipeHops: [RecipeHop] = []
    var yeast: Yeast? = nil
    
    var isValidRecipe: Bool {
        self.yeast != nil && self.recipeGrains.count > 0 && self.recipeHops.count > 0
    }
}

struct RecipeBuilderView: View {
    @Environment(ContentViewModel.self) var viewModel
    @Environment(AppSettingsStore.self) var appSettingsStore
    
    @State var recipeFormValues = RecipeFormValues()
    
    @State private var showSettingsSheet = false
    
    func removeRecipeMaltExtract(id: UUID) {
        self.recipeFormValues.recipeMaltExtracts = self.recipeFormValues.recipeMaltExtracts.filter { $0.id != id}
    }
    
    func removeRecipeGrain(id: UUID) {
        self.recipeFormValues.recipeGrains = self.recipeFormValues.recipeGrains.filter { $0.id != id}
    }
    
    func removeRecipeHop(id: UUID) {
        self.recipeFormValues.recipeHops = self.recipeFormValues.recipeHops.filter { $0.id != id}
    }
    
    func removeRecipeYeast() {
        self.recipeFormValues.yeast = nil
    }
    
    func editRecipeGrain(_ oldRecipeGrainID: UUID, _ toNewRecipeGrain: RecipeGrain) {
        if let index = recipeFormValues.recipeGrains.firstIndex(where: {$0.id == oldRecipeGrainID}) {
            recipeFormValues.recipeGrains[index] = toNewRecipeGrain
        }
    }
    
    func format(brewingMethod: BrewingMethod) -> String {
        switch brewingMethod {
        case .allGrain:
            return "all grain"
        case .extract:
            return "extract"
        }
    }
    
    var body: some View {
        let brewingMethod = appSettingsStore.appSettings.brewingMethod
        Form {
            Text("New \(format(brewingMethod: appSettingsStore.appSettings.brewingMethod)) recipe for a \(String(format: "%g", recipeFormValues.postBoilGallons)) gallon batch").onAppear{
                recipeFormValues.postBoilGallons = appSettingsStore.appSettings.batchSize
            }
            Button("Change Brewing Preferences") {
                self.showSettingsSheet = true
            }
            if recipeFormValues.isValidRecipe && matchingStyles.count > 0 {
                VStack(alignment: .leading) {
                    Text("Possible Style Matches")
                        .font(.headline).fontWeight(.bold)
                    List {
                        ForEach(matchingStyles) { beerStyle in
                            Text(beerStyle.name)
                        }
                    }
                }
            }
            
            if brewingMethod == .extract {
                Section {
                    NavigationLink("Add Extract") {
                        AddExtractsView(recipeFormValues: $recipeFormValues)
                    }.tint(.accentColor)
                    List{
                        ForEach(recipeFormValues.recipeMaltExtracts.sorted {$0.weightInPounds > $1.weightInPounds}) { recipeMaltExtract in
                            NavigationLink(destination: AddExtractsView(recipeFormValues: $recipeFormValues, selectedRecipeMaltExtract: recipeMaltExtract)) {
                                VStack(alignment: .leading) {
                                    Text("\(recipeMaltExtract.maltExtract.maltster) \(recipeMaltExtract.maltExtract.name)")
                                    Text("\(String(format: "%g", recipeMaltExtract.weightInPounds)) lbs")
                                }
                            }.swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    removeRecipeMaltExtract(id: recipeMaltExtract.id)
                                } label: {
                                    Label("Remove", systemImage: "trash.fill")
                                }
                            }
                        }
                    }
                } header: {
                    Text("Extracts")
                }
            }
            
            Section {
                NavigationLink("Add Grain") {
                    AddGrainsView(recipeFormValues: $recipeFormValues)
                }.tint(.accentColor)
                List{
                    ForEach(recipeFormValues.recipeGrains.sorted {$0.weightInPounds > $1.weightInPounds}) { recipeGrain in
                        NavigationLink(destination: AddGrainsView(recipeFormValues: $recipeFormValues, selectedRecipeGrain: recipeGrain)) {
                            VStack(alignment: .leading) {
                                Text("\(recipeGrain.grain.maltster) \(recipeGrain.grain.name)")
                                Text("\(String(format: "%g", recipeGrain.weightInPounds)) lbs")
                            }
                        }.swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                removeRecipeGrain(id: recipeGrain.id)
                            } label: {
                                Label("Remove", systemImage: "trash.fill")
                            }
                        }
                    }
                    RecipeColorView(recipeFormValues: $recipeFormValues)
                    RecipeOriginalGravityView(recipeFormValues: $recipeFormValues)
                }
            } header: {
                Text(brewingMethod == .extract ? "Specialty Grains" : "Grains")
            }
            
                          
          Section {
              NavigationLink("Add Hop") {
                  AddHopsView(recipeFormValues: $recipeFormValues)
              }.tint(.accentColor)
              List {
                  ForEach(recipeFormValues.recipeHops.sorted {$0.boilTimeMinutes > $1.boilTimeMinutes}) { recipeHop in
                      NavigationLink(destination: AddHopsView(recipeFormValues: $recipeFormValues, selectedRecipeHop: recipeHop)) {
                          VStack(alignment: .leading) {
                              Text("\(recipeHop.hop.name) (\(String(format: "%g", recipeHop.alphaAcidPercent))%)")
                              Text("\(String(format: "%g", recipeHop.weightInOunces)) oz for \(String(format: "%g", recipeHop.boilTimeMinutes)) minutes")
                          }
                      }
                      .swipeActions(edge: .trailing) {
                          Button(role: .destructive) {
                              removeRecipeHop(id: recipeHop.id)
                          } label: {
                              Label("Remove", systemImage: "trash.fill")
                          }
                      }
                  }
                  RecipeBitternessView(recipeFormValues: $recipeFormValues)
              }
          } header: {
              Text("Hops")
          }
            
            
            Section {
                if recipeFormValues.yeast == nil {
                    NavigationLink("Add Yeast") {
                        AddYeastView(recipeFormValues: $recipeFormValues)
                    }.tint(.accentColor)
                }
                List {
                    if recipeFormValues.yeast != nil {
                        NavigationLink(destination: AddYeastView(recipeFormValues: $recipeFormValues, edit: true)) {
                            Text(recipeFormValues.yeast!.name)
                        }.swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                removeRecipeYeast()
                            } label: {
                                Label("Remove", systemImage: "trash.fill")
                            }
                        }
                    }
                    RecipeFinalGravityView(recipeFormValues: $recipeFormValues)
                }
            } header: {
                Text("Yeast")
            }
            
        }
        .navigationTitle("New Recipe")
        .sheet(isPresented: $showSettingsSheet) {
            SettingsView()
        }
        .onChange(of: appSettingsStore.appSettings.batchSize) {
            let adjustmentRatio = appSettingsStore.appSettings.batchSize / self.recipeFormValues.postBoilGallons
            
            self.recipeFormValues.recipeMaltExtracts = self.recipeFormValues.recipeMaltExtracts.map { recipeMaltExtract in
                return RecipeMaltExtract(maltExtract: recipeMaltExtract.maltExtract, weightInPounds: recipeMaltExtract.weightInPounds * adjustmentRatio)
            }
            
            self.recipeFormValues.recipeGrains = self.recipeFormValues.recipeGrains.map { recipeGrain in
                return RecipeGrain(grain: recipeGrain.grain, weightInPounds: recipeGrain.weightInPounds * adjustmentRatio)
            }
            
            self.recipeFormValues.recipeHops = self.recipeFormValues.recipeHops.map { recipeHop in
                return RecipeHop(hop: recipeHop.hop, weightInOunces: recipeHop.weightInOunces * adjustmentRatio, alphaAcidPercent: recipeHop.alphaAcidPercent, boilTimeMinutes: recipeHop.boilTimeMinutes)
            }
            
            self.recipeFormValues.postBoilGallons = appSettingsStore.appSettings.batchSize
        }
        .onChange(of: appSettingsStore.appSettings.brewingMethod) {
            if appSettingsStore.appSettings.brewingMethod == .allGrain {
                self.recipeFormValues.recipeMaltExtracts = []
            }
        }
    }
    
    enum StyleMatchParam {
        case abv
        case bitterness
        case srm
        case finalGravity
        case originalGravity
        case fermentationType
    }
    
    func isWithinBounds(of: StyleMatchParam, forStyle: BeerStyle) -> Bool {
        let estimatedColor = calculateEstimatedColor(recipe: recipeFormValues)
        let estimatedOriginalGravity = calculateEstimatedOriginalGravity(recipe: recipeFormValues, brewhouseEfficiency: appSettingsStore.appSettings.brewhouseEfficiency)
        let estimatedFinalGravity = calculateEstimatedFinalGravity(recipe: recipeFormValues, brewhouseEfficiency: appSettingsStore.appSettings.brewhouseEfficiency)
        let estimatedBitterness = calculateEstimateBitterness(recipe: recipeFormValues)
        let estimatedAbv = calculateAbv(recipe: recipeFormValues, brewhouseEfficiency: appSettingsStore.appSettings.brewhouseEfficiency)
        
        switch of {
        case .abv:
            return (forStyle.abvMinimum <= estimatedAbv && forStyle.abvMaximum >= estimatedAbv)
        case .bitterness:
            return (forStyle.ibuMinimum <= estimatedBitterness && forStyle.ibuMaximum >= estimatedBitterness)
        case .srm:
            return (forStyle.srmMinimum <= estimatedColor && forStyle.srmMaximum >= estimatedColor)
        case .finalGravity:
            return (forStyle.finalGravityMinimum <= estimatedFinalGravity && forStyle.finalGravityMaximum >= estimatedFinalGravity)
        case .originalGravity:
            return (forStyle.originalGravityMinimum <= estimatedOriginalGravity && forStyle.originalGravityMaximum >= estimatedOriginalGravity)
        case .fermentationType:
            return (forStyle.fermentation == "any" || forStyle.fermentation == recipeFormValues.yeast?.fermentation)
        }
    }
    
    var matchingStyles: [BeerStyle] {
        if !recipeFormValues.isValidRecipe {
            return []
        }
        
        return viewModel.beerStyles.filter { isWithinBounds(of: .abv, forStyle: $0) && isWithinBounds(of: .bitterness, forStyle: $0) && isWithinBounds(of: .srm, forStyle: $0) && isWithinBounds(of: .finalGravity, forStyle: $0) && isWithinBounds(of: .originalGravity, forStyle: $0) && isWithinBounds(of: .fermentationType, forStyle: $0) }
    }
}

#Preview {
    RecipeBuilderView().environment(ContentViewModel()).environment(AppSettingsStore())
}

#Preview {
    RecipeBuilderView(recipeFormValues: RecipeFormValues(recipeHops: [RecipeHop(hop: Hop(id: 1, name: "some hop", forAroma: false, forBittering: true, forDryHopping: false, forFlavor: false, minimumTypicalAlphaAcid: 4.2, maximumTypicalAlphaAcid: 5.2), weightInOunces: 0.5, alphaAcidPercent: 4.7, boilTimeMinutes: 60)])).environment(ContentViewModel()).environment(AppSettingsStore())
}
