//
//  DesignView.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/7/24.
//

import SwiftUI

struct DesignView: View {    
    var body: some View {
        NavigationView {
            DesignHomeView()
                .navigationBarTitle("Build a Beer")
            
            BuildFromStyle()
                .navigationBarTitle("Build From Style", displayMode: .inline)
        }
    }
}

struct DesignView_Previews: PreviewProvider {
    static var previews: some View {
        DesignView()
    }
}
