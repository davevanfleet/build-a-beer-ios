//
//  MainDesignViewModel.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/9/24.
//

import Foundation

class DesignHomeViewModel: ObservableObject {
    @Published var beerStyles: [BeerStyle] = []
    @Published var beerStyleOfTheWeek: BeerStyle? = nil

    func determineStyleOfTheWeek(beerStyles: [BeerStyle]) -> BeerStyle {
        let sortedStyles = beerStyles.sorted(by: {$0.bjcpCode < $1.bjcpCode})
        
        let calendar = Calendar.current
        let weekOfYear = calendar.component(.weekOfYear, from: Date(timeIntervalSinceNow: 0))
        
        return sortedStyles[weekOfYear % sortedStyles.count]
    }
    
    func fetchBeerStyles() {
        guard let url = URL(string: "https://buildabeer.app/api/BeerStyles") else { return }
        print("in the fetch function")
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            let beerStyles = try? JSONDecoder().decode([BeerStyle].self, from: data)
            
            let beerStyleOfTheWeek = self.determineStyleOfTheWeek(beerStyles: beerStyles!)
            
            DispatchQueue.main.async {
                self.beerStyles = beerStyles ?? []
                self.beerStyleOfTheWeek = beerStyleOfTheWeek
            }
        }.resume()
    }
}
