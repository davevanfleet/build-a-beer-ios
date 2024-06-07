//
//  DesignView.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/7/24.
//

import SwiftUI

struct DesignView: View {
    @State var shouldPresentSheet = false
    @State var selectedView = "main"
    
    var body: some View {
        VStack {
            Heading(text: "Build a Beer")
            
                ZStack(alignment: .bottom) {
                    Image("cream_ale")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(Color.white)
                            .opacity(0.8)
                            .frame(maxHeight: 80)
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Your beer style of the day")
                                    .font(.caption)
                                Text("Cream Ale")
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
                                    Text("Beer Style Description")
                                }
                        }
                    }
                    
                }
                HStack {
                    Button(action: {
                        print("button 1 pressed")
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
                        
                    Button(action: {
                        selectedView = "fromStyle"
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
                    
                    Button(action: {
                        print("button 3 pressed")
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
                Spacer()
            }
    }
}

struct DesignView_Previews: PreviewProvider {
    static var previews: some View {
        DesignView()
    }
}
