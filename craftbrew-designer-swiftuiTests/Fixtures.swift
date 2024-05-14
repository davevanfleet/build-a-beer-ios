//
//  Fixtures.swift
//  craftbrew-designer-swiftuiTests
//
//  Created by David Van Fleet on 5/9/24.
//

import Foundation
@testable import craftbrew_designer_swiftui

func buildMockRecipe () -> Recipe {
    let pilsnerMalt = Grain(id: 1, name: "2-row Pilsner Malt", lovibond: 1.5, fineGrindDryBasisPercentage: 0.81)
    let pilsnerMaltIngredient = RecipeGrain(grain: pilsnerMalt, weightInPounds: 8)
    
    let crystalMalt = Grain(id: 1, name: "US 80 Crystal Malt", lovibond: 80, fineGrindDryBasisPercentage: 0.75)
    let crystalMaltIngredient = RecipeGrain(grain: crystalMalt, weightInPounds: 0.5)
    
    let munichMalt = Grain(id: 1, name: "German 10 Dark Munich Malt", lovibond: 8.0, fineGrindDryBasisPercentage: 0.83)
    let munichMaltIngredient = RecipeGrain(grain: munichMalt, weightInPounds: 0.375)
    
    let victoryMalt = Grain(id: 1, name: "US Victory Malt", lovibond: 28, fineGrindDryBasisPercentage: 0.75)
    let victoryMaltIngredient = RecipeGrain(grain: victoryMalt, weightInPounds: 0.25)
    
    let biscuitMalt = Grain(id: 1, name: "Belgian Biscuit Malt", lovibond: 18, fineGrindDryBasisPercentage: 0.70)
    let biscuitMaltIngredient = RecipeGrain(grain: biscuitMalt, weightInPounds: 0.1875)
    
    let recipeGrains = [pilsnerMaltIngredient, crystalMaltIngredient, munichMaltIngredient, victoryMaltIngredient, biscuitMaltIngredient]
    
    let magnum = Hop(id: 1, name: "Yakima Magnum")
    let magnumIngedient = RecipeHop(hop: magnum, weightInOunces: 0.33, alphaAcidPercent: 15, boilTimeMinutes: 60)
    
    let hallertau = Hop(id: 2, name: "German Hallertau Hersbrucker")
    let hallertauIngedient = RecipeHop(hop: hallertau, weightInOunces: 0.5, alphaAcidPercent: 4.0, boilTimeMinutes: 15)
    
    let willamette = Hop(id: 3, name: "Willamette")
    let willametteIngedient = RecipeHop(hop: willamette, weightInOunces: 0.5, alphaAcidPercent: 5.0, boilTimeMinutes: 5)
    
    let recipeHops = [magnumIngedient, hallertauIngedient, willametteIngedient]
    
    let yeast = Yeast(id: 1, name: "Wyeast 1762 Belgian Abbey II", minimumTemperature: 65, maximumTemperature: 75, fermentation: 1, attenuation: 0.75)
    
    let recipe = Recipe(id: 1, name: "Fat Tire Amber Ale", description: "Tasty Belgian style pale ale", postBoilGallons: 5, recipeGrains: recipeGrains, recipeHops: recipeHops, yeast: yeast)
    
    return recipe
}
