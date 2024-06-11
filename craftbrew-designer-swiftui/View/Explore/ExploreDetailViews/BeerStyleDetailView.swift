//
//  BeerStyleDetailView.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/28/24.
//

import SwiftUI

struct BeerStyleDetailView: View {
    @Environment(AppSettingsStore.self) var appSettingsStore
    
    let beerStyle: BeerStyle
    var showImage: Bool? = true
    
    var body: some View {
        let sampleRecipe = appSettingsStore.appSettings.brewingMethod == .allGrain ? beerStyle.sampleRecipe : beerStyle.sampleExtractRecipe
        ScrollView {
            if showImage == true {
                AsyncImage(url: URL(string: beerStyle.imageUrl),
                           content: {image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                }, placeholder: {
                    ZStack {
                        Rectangle()
                            .fill(Color.gray)
                            .aspectRatio(4/3, contentMode: .fit)
                        ProgressView()
                    }
                })
            }
            
            if let unwrapped = sampleRecipe {
                NavigationLink("\(Image(systemName: "pencil")) Play with sample recipe for this style") {
                    RecipeBuilderView(recipeFormValues: unwrapped.recipeFormValues)
                }.padding()
            }
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Overall Impression:")
                        .fontWeight(.bold)
                    Text(beerStyle.overallImpression)
                }.padding(.bottom)
                
                VStack(alignment: .leading) {
                    Text("Appearance Description:")
                        .fontWeight(.bold)
                    Text(beerStyle.appearanceDescription)
                }.padding(.bottom)
                
                VStack(alignment: .leading) {
                    Text("Aroma Description:")
                        .fontWeight(.bold)
                    Text(beerStyle.aromaDescription)
                }.padding(.bottom)
                
                VStack(alignment: .leading) {
                    Text("Flavor Description:")
                        .fontWeight(.bold)
                    Text(beerStyle.flavorDescription)
                }.padding(.bottom)
                
                VStack(alignment: .leading) {
                    Text("Mouthfeel Description:")
                        .fontWeight(.bold)
                    Text(beerStyle.mouthfeelDescription)
                }.padding(.bottom)
                
                VStack(alignment: .leading) {
                    Text("Stats:")
                        .fontWeight(.bold)
                    HStack {
                        Text("Color (Lovibond):")
                        Spacer()
                        Text("\(beerStyle.srmMinimum) - \(beerStyle.srmMaximum)")
                    }
                    HStack {
                        Text("Bitterness (IBU):")
                        Spacer()
                        Text("\(beerStyle.ibuMinimum) - \(beerStyle.ibuMaximum)")
                    }
                    HStack {
                        Text("Original Gravity:")
                        Spacer()
                        Text("\(String(format: "%.3f", beerStyle.originalGravityMinimum)) - \(String(format: "%.3f", beerStyle.originalGravityMaximum))")
                    }
                    HStack {
                        Text("Final Gravity:")
                        Spacer()
                        Text("\(String(format: "%.3f", beerStyle.finalGravityMinimum)) - \(String(format: "%.3f", beerStyle.finalGravityMaximum))")
                    }
                    HStack {
                        Text("ABV:")
                        Spacer()
                        Text("\(String(format: "%g", beerStyle.abvMinimum)) - \(String(format: "%g", beerStyle.abvMaximum))")
                    }
                }.padding(.bottom)
                
                Spacer()
            }
        }
        .padding()
        .navigationTitle(beerStyle.name)
    }
}

#Preview {    BeerStyleDetailView(beerStyle: BeerStyle(id: 1, name: "Scottish Light", imageUrl: "https://beer-style-images.s3.us-east-2.amazonaws.com/scottish_light.png", overallImpression: "impression", appearanceDescription: "Deep copper to dark brown. Clear. Low to moderate, creamy off-white head.", aromaDescription: "Low to medium maltiness with caramel and toffee notes, and light toasty and sugary qualities that might be reminiscent of toasted breadcrumbs, ladyfingers, English biscuits, graham crackers, or butterscotch. Light pome fruitiness and light English hop aroma (earthy, floral, orange-citrus, spicy, etc.) allowable.", flavorDescription: "Medium toasty-bready malt with caramel and toffee overtones, finishing with a slightly roasty dryness. A wide range of caramelized sugar and toasted bread type of flavors are possible, using similar descriptors as the aroma. Clean maltiness and fermentation profile. Light esters and hop flavor allowable (similar descriptors as aroma). Sufficient bitterness to not be cloying, but with a malty balance and aftertaste.", mouthfeelDescription: "Medium-low to medium body. Low to moderate carbonation. Maybe be moderately creamy.", comments: "May not seem as bitter as specifications indicate due to higher finishing gravity and residual sweetness. Typically a draught product, but somewhat rare. Do not mis-perceive the light roasty dryness as smoke; smoke is not present in these beers.", history: "There are really only three traditional beer styles broadly available today in Scotland: the 70/- Scottish Heavy, the 80/- Scottish Export, and the Strong Scotch Ale (Wee Heavy, Style 17C). The 60/- Scottish Light is rare and often cask-only, but it does seem to be having a bit of a renaissance currently. All these styles took modern form after World War II, regardless of prior use of the same names. Currently, the 60/- is similar to a dark mild, the 70/- is similar to an ordinary bitter, and the 80/- similar to a best or strong bitter. The Scottish beers have a different balance and flavor profile, but fill a similar market position as those English beers.", ibuMinimum: 10, ibuMaximum: 20, srmMinimum: 17, srmMaximum: 25, originalGravityMinimum: 1.03, originalGravityMaximum: 1.035, finalGravityMinimum: 1.01, finalGravityMaximum: 1.013, abvMinimum: 2.5, abvMaximum: 3.3, fermentation: "top", bjcpCode: "14A", sampleRecipe: nil, sampleExtractRecipe: nil))
}
