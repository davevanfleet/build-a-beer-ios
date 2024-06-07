//
//  DesignView.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/7/24.
//

import SwiftUI

struct DesignHomeView: View {
    @Environment(ContentViewModel.self) var viewModel
    @State var selection: String? = nil
    
    var body: some View {
        @Bindable var viewModel: ContentViewModel = self.viewModel
        
        if viewModel.isLoading {
            VStack {
                EmptyView()
            }
        }
        else {
            VStack {
                if viewModel.beerStyleOfTheDay != nil {
                    BeerOfTheWeekHeroView(beerStyleOfTheDay: viewModel.beerStyleOfTheDay!)
                } else {
                    EmptyView()
                }
                
                
                HStack {
                    NavigationLink {
                        BuildFromStyle()
                    } label: {
                        VStack {
                            ZStack {
                                Circle()
                                    .fill(Color.accentColor)
                                    .frame(width: 67, height: 67)
                                    .padding()
                                Image(systemName: "pencil.and.outline")
                                    .tint(Color.white)
                                    .imageScale(.large)
                            }
                            
                            Text("Recipe Playground")
                                .font(.caption)
                                .foregroundColor(Color("AccentColor"))
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

struct DesignHomeView_Previews: PreviewProvider {
    static var previews: some View {
        DesignHomeView().environment(ContentViewModel()).environment(AppSettingsStore())
    }
}

struct BeerOfTheWeekHeroView: View {
    var beerStyleOfTheDay: BeerStyle

    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: URL(string: beerStyleOfTheDay.imageUrl),
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
            
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.white)
                    .opacity(0.8)
                    .frame(maxHeight: 80)
                HStack {
                    VStack(alignment: .leading) {
                        Text("Your beer style of the day")
                            .font(.caption)
                            .foregroundColor(Color.black)
                        Text(beerStyleOfTheDay.name)
                            .foregroundColor(Color.black)
                    }
                    .padding()
                    
                    Spacer()
                    
                    
                    NavigationLink("\(Image(systemName: "info.circle"))") {
                        BeerStyleDetailView(beerStyle: beerStyleOfTheDay)
                    }
                    .padding()
                }
            }
            
        }
    }
}
