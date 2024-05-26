//
//  DesignView.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/7/24.
//

import SwiftUI

struct DesignHomeView: View {
    @ObservedObject var ViewModel = DesignHomeViewModel()
    
    @State var shouldPresentSheet = false
    @State var selection: String? = nil
    
    var body: some View {
        var _ = print("style of the week", ViewModel.beerStyleOfTheWeek?.name)
        VStack {            
            ZStack(alignment: .bottom) {
                AsyncImage(url: URL(string: "https://beer-style-images.s3.us-east-2.amazonaws.com/american_light_lager.png"),
                           content: {image in
                        image.resizable()
                        .aspectRatio(contentMode: .fit)
                }, placeholder: {
                    Rectangle()
                })
                        
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(Color.white)
                            .opacity(0.8)
                            .frame(maxHeight: 80)
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Your beer style of the day")
                                    .font(.caption)
                                Text(ViewModel.beerStyleOfTheWeek?.name ?? "")
                            }
                            .padding()
                            
                            Spacer()
                            
                            Button(action: {
                                shouldPresentSheet.toggle()
                            }) {
                                Image(systemName: "info.circle")
                            }
                                .padding()
                                .sheet(isPresented: $shouldPresentSheet) {
                                    print("Sheet dismissed!")
                                } content: {
                                    VStack {
                                        Text(ViewModel.beerStyleOfTheWeek?.name ?? "").font(.title).padding([.leading, .top, .trailing])
                                        Text("Beer Style of the Week").font(.title2).padding(.bottom)
                                        Text(ViewModel.beerStyleOfTheWeek?.overallImpression ?? "").padding(.bottom)
                                        
                                        NavigationLink(destination: BuildFromStyle()){
                                            Button(action: {
                                                self.selection = "FromStyle"
                                                self.shouldPresentSheet = false
                                            }){
                                                Text("Build this beer")
                                            }
                                        }
                                        Spacer()
                                    }
                                }
                        }
                    }
                    
                }
                
                HStack {
                    NavigationLink(destination: BuildFromStyle(), tag: "FromScratch", selection: $selection){
                        Button(action: {
                            self.selection = "FromScratch"
                        }){
                            VStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 34)
                                        .fill(Color(UIColor.systemFill))
                                        .frame(width: 67, height: 67)
                                        .padding()
                                    Image(systemName: "magnifyingglass")
                                }
                               
                                Text("From Scratch")
                                    .font(.caption)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                   
                        
                    NavigationLink(destination: BuildFromStyle(), tag: "FromStyle", selection: $selection) {
                        Button(action: {
                            self.selection = "FromStyle"
                        }) {
                            VStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 34)
                                        .fill(Color.accentColor)
                                        .frame(width: 67, height: 67)
                                        .padding()
                                    Image(systemName: "square.and.arrow.down")
                                        .tint(Color.white)
                                        .imageScale(.large)
                                }
                               
                                Text("From Style")
                                    .font(.caption)
                                    .foregroundColor(Color("AccentColor"))
                            }
                        }
                    }
                    
                    NavigationLink(destination: BuildFromRecipe(), tag: "FromRecipe", selection: $selection) {
                        Button(action: {
                            self.selection = "FromRecipe"
                        }){
                            VStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 34)
                                        .fill(Color(UIColor.systemFill))
                                        .frame(width: 67, height: 67)
                                        .padding()
                                    Image(systemName: "book")
                                }
                               
                                Text("From Recipe")
                                    .font(.caption)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
            }.onAppear {
                ViewModel.fetchBeerStyles()
            }
                Spacer()
            }
        
}

struct DesignHomeView_Previews: PreviewProvider {
    static var previews: some View {
        DesignHomeView()
    }
}
