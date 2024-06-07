//
//  Fixtures.swift
//  craftbrew-designer-swiftuiTests
//
//  Created by David Van Fleet on 5/9/24.
//

import Foundation
@testable import craftbrew_designer_swiftui

func buildMockRecipe () -> RecipeFormValues {
    let pilsnerMalt = Grain(id: 1, name: "2-row Pilsner Malt", lovibond: 1.5, fineGrindDryBasisPercentage: 0.81, suggestedMaximumUsage: 80, maltster: "Briess")
    let pilsnerMaltIngredient = RecipeGrain(grain: pilsnerMalt, weightInPounds: 8)
    
    let crystalMalt = Grain(id: 1, name: "US 80 Crystal Malt", lovibond: 80, fineGrindDryBasisPercentage: 0.75, suggestedMaximumUsage: 80, maltster: "Briess")
    let crystalMaltIngredient = RecipeGrain(grain: crystalMalt, weightInPounds: 0.5)
    
    let munichMalt = Grain(id: 1, name: "German 10 Dark Munich Malt", lovibond: 8.0, fineGrindDryBasisPercentage: 0.83, suggestedMaximumUsage: 80, maltster: "Briess")
    let munichMaltIngredient = RecipeGrain(grain: munichMalt, weightInPounds: 0.375)
    
    let victoryMalt = Grain(id: 1, name: "US Victory Malt", lovibond: 28, fineGrindDryBasisPercentage: 0.75, suggestedMaximumUsage: 80, maltster: "Briess")
    let victoryMaltIngredient = RecipeGrain(grain: victoryMalt, weightInPounds: 0.25)
    
    let biscuitMalt = Grain(id: 1, name: "Belgian Biscuit Malt", lovibond: 18, fineGrindDryBasisPercentage: 0.70, suggestedMaximumUsage: 80, maltster: "Briess")
    let biscuitMaltIngredient = RecipeGrain(grain: biscuitMalt, weightInPounds: 0.1875)
    
    let recipeGrains = [pilsnerMaltIngredient, crystalMaltIngredient, munichMaltIngredient, victoryMaltIngredient, biscuitMaltIngredient]
    
    let magnum = Hop(id: 1, name: "Yakima Magnum", forAroma: true, forBittering: true, forDryHopping: true, forFlavor: true, minimumTypicalAlphaAcid: 14.0, maximumTypicalAlphaAcid: 15.0)
    let magnumIngedient = RecipeHop(hop: magnum, weightInOunces: 0.33, alphaAcidPercent: 15, boilTimeMinutes: 60)
    
    let hallertau = Hop(id: 2, name: "German Hallertau Hersbrucker", forAroma: true, forBittering: true, forDryHopping: true, forFlavor: true, minimumTypicalAlphaAcid: 3.5, maximumTypicalAlphaAcid: 5.5)
    let hallertauIngedient = RecipeHop(hop: hallertau, weightInOunces: 0.5, alphaAcidPercent: 4.0, boilTimeMinutes: 15)
    
    let willamette = Hop(id: 3, name: "Willamette", forAroma: true, forBittering: true, forDryHopping: true, forFlavor: true, minimumTypicalAlphaAcid: 3.5, maximumTypicalAlphaAcid: 6.0)
    let willametteIngedient = RecipeHop(hop: willamette, weightInOunces: 0.5, alphaAcidPercent: 5.0, boilTimeMinutes: 5)
    
    let recipeHops = [magnumIngedient, hallertauIngedient, willametteIngedient]
    
    let yeast = Yeast(id: 1, name: "Wyeast 1762 Belgian Abbey II", minimumTemperature: 65, maximumTemperature: 75, fermentation: "top", attenuation: 0.75)
    
    let recipe = RecipeFormValues(name: "Fat Tire Amber Ale", postBoilGallons: 5, recipeGrains: recipeGrains, recipeHops: recipeHops, yeast: yeast)
    
    return recipe
}

func buildMockExtractRecipe () -> RecipeFormValues {
    let alexanderPaleLME = MaltExtract(id: UUID(), name: "Pale LME", lovibond: 2.2, fermentabilityPercentage: 1.0, suggestedMaximumUsage: 100, maltster: "Alexander")
    let alexanderPaleLMEIngredient = RecipeMaltExtract(maltExtract: alexanderPaleLME, weightInPounds: 4.0)
    
    let muntonsLightDME = MaltExtract(id: UUID(), name: "Extra Light DME", lovibond: 2.2, fermentabilityPercentage: 0.80, suggestedMaximumUsage: 100, maltster: "Muntons")
    let muntonsLightDMEIngredient = RecipeMaltExtract(maltExtract: muntonsLightDME, weightInPounds: 2.5)
    
    let recipeExtracts = [alexanderPaleLMEIngredient, muntonsLightDMEIngredient]
    
    let crystalMalt = Grain(id: 1, name: "US 80 Crystal Malt", lovibond: 80, fineGrindDryBasisPercentage: 0.75, suggestedMaximumUsage: 80, maltster: "Briess")
    let crystalMaltIngredient = RecipeGrain(grain: crystalMalt, weightInPounds: 0.5)
    
    let munichMalt = Grain(id: 1, name: "German 10 Dark Munich Malt", lovibond: 8.0, fineGrindDryBasisPercentage: 0.83, suggestedMaximumUsage: 80, maltster: "Briess")
    let munichMaltIngredient = RecipeGrain(grain: munichMalt, weightInPounds: 0.375)
    
    let victoryMalt = Grain(id: 1, name: "US Victory Malt", lovibond: 28, fineGrindDryBasisPercentage: 0.75, suggestedMaximumUsage: 80, maltster: "Briess")
    let victoryMaltIngredient = RecipeGrain(grain: victoryMalt, weightInPounds: 0.25)
    
    let biscuitMalt = Grain(id: 1, name: "Belgian Biscuit Malt", lovibond: 18, fineGrindDryBasisPercentage: 0.70, suggestedMaximumUsage: 80, maltster: "Briess")
    let biscuitMaltIngredient = RecipeGrain(grain: biscuitMalt, weightInPounds: 0.1875)
    
    let recipeGrains = [crystalMaltIngredient, munichMaltIngredient, victoryMaltIngredient, biscuitMaltIngredient]
    
    let magnum = Hop(id: 1, name: "Yakima Magnum", forAroma: true, forBittering: true, forDryHopping: true, forFlavor: true, minimumTypicalAlphaAcid: 14.0, maximumTypicalAlphaAcid: 15.0)
    let magnumIngedient = RecipeHop(hop: magnum, weightInOunces: 0.33, alphaAcidPercent: 15, boilTimeMinutes: 60)
    
    let hallertau = Hop(id: 2, name: "German Hallertau Hersbrucker", forAroma: true, forBittering: true, forDryHopping: true, forFlavor: true, minimumTypicalAlphaAcid: 3.5, maximumTypicalAlphaAcid: 5.5)
    let hallertauIngedient = RecipeHop(hop: hallertau, weightInOunces: 0.5, alphaAcidPercent: 4.0, boilTimeMinutes: 15)
    
    let willamette = Hop(id: 3, name: "Willamette", forAroma: true, forBittering: true, forDryHopping: true, forFlavor: true, minimumTypicalAlphaAcid: 3.5, maximumTypicalAlphaAcid: 6.0)
    let willametteIngedient = RecipeHop(hop: willamette, weightInOunces: 0.5, alphaAcidPercent: 5.0, boilTimeMinutes: 5)
    
    let recipeHops = [magnumIngedient, hallertauIngedient, willametteIngedient]
    
    let yeast = Yeast(id: 1, name: "Wyeast 1762 Belgian Abbey II", minimumTemperature: 65, maximumTemperature: 75, fermentation: "top", attenuation: 0.75)
    
    let recipe = RecipeFormValues(name: "Fat Tire Amber Ale", postBoilGallons: 5, recipeMaltExtracts: recipeExtracts, recipeGrains: recipeGrains, recipeHops: recipeHops, yeast: yeast)
    
    return recipe
}

