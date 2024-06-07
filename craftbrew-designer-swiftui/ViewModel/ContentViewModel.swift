//
//  ExploreViewModel.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/27/24.
//

import Foundation

@Observable
class ContentViewModel {
    var grains: [Grain] = []
    var hops: [Hop] = []
    var yeasts: [Yeast] = []
    var beerStyles: [BeerStyle] = []
    var beerStyleOfTheDay: BeerStyle? = nil
    var isLoading = false
    
    init() {
        self.fetchGrains()
        self.fetchHops()
        self.fetchYeasts()
        self.fetchBeerStyles()
    }
    
    func fetchGrains() {
        self.isLoading = true
        guard let url = URL(string: "https://buildabeer.app/api/Grains?sort=%5B%22name%22%2C%22ASC%22%5D") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                self.isLoading = false
                return
            }
            
            let grains = try? JSONDecoder().decode([Grain].self, from: data)
            
            DispatchQueue.main.async {
                self.grains = grains ?? []
                self.isLoading = false
            }
        }.resume()
    }
    
    func fetchHops() {
        self.isLoading = true
        guard let url = URL(string: "https://buildabeer.app/api/Hops?sort=%5B%22name%22%2C%22ASC%22%5D") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                self.isLoading = false
                return
            }
            
            let hops = try? JSONDecoder().decode([Hop].self, from: data)
            
            DispatchQueue.main.async {
                self.hops = hops ?? []
                self.isLoading = false
            }
        }.resume()
    }
    
    func fetchYeasts() {
        self.isLoading = true
        guard let url = URL(string: "https://buildabeer.app/api/Yeasts?sort=%5B%22name%22%2C%22ASC%22%5D") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                self.isLoading = false
                return
            }
            
            let yeasts = try? JSONDecoder().decode([Yeast].self, from: data)
            
            DispatchQueue.main.async {
                self.yeasts = yeasts ?? []
                self.isLoading = false
            }
        }.resume()
    }
    
    func determineStyleOfTheDay(beerStyles: [BeerStyle]) -> BeerStyle {
        let sortedStyles = beerStyles.sorted(by: {$0.bjcpCode < $1.bjcpCode})
        
        let calendar = Calendar.current
        let dayOfYear = calendar.ordinality(of: .day, in: .year, for: Date()) ?? 1
        
        return sortedStyles[dayOfYear % sortedStyles.count]
    }
    
    func fetchBeerStyles() {
        self.isLoading = true
        guard let url = URL(string: "https://buildabeer.app/api/BeerStyles?sort=%5B%22name%22%2C%22ASC%22%5D") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                self.isLoading = false
                return
            }
            
            let beerStyles = try? JSONDecoder().decode([BeerStyle].self, from: data)
            
            let beerStyleOfTheDay = self.determineStyleOfTheDay(beerStyles: beerStyles!)
            
            DispatchQueue.main.async {
                self.beerStyles = beerStyles ?? []
                self.beerStyleOfTheDay = beerStyleOfTheDay
                self.isLoading = false
            }
        }.resume()
    }
}
