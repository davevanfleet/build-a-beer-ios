//
//  ContentView.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/7/24.
//

import SwiftUI

struct ContentView: View {
  
    var body: some View {
        TabView() {
            DesignView()
                .tabItem {
                    Label("Design", systemImage: "hammer")
                }
//            RecipesView()
//                .tabItem {
//                    Label("Recipes", systemImage: "book")
//                }
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
        .environment(ContentViewModel())
        .environment(AppSettingsStore())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
