//
//  Heading.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/9/24.
//

import SwiftUI

struct Heading: View {
    let text: String
    
    var body: some View {
        HStack {
            Text(text)
                .font(.title)
                .multilineTextAlignment(.leading)
                .padding()
            Spacer()
        }
    }
}

struct Heading_Previews: PreviewProvider {
    static var previews: some View {
        Heading(text: "Hello, World")
    }
}
