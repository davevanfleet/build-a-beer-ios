//
//  ExploreViewModel.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/27/24.
//

import Foundation

@Observable
class AllIngredientsViewModel {
    var grains: [Grain] = []
    var hops: [Hop] = []
    var yeasts: [Yeast] = []
    var isLoading = false
    
    init() {
        self.fetchGrains()
        self.fetchHops()
        self.fetchYeasts()
    }
    
    func fetchGrains() {
        self.isLoading = true
        guard let url = URL(string: "https://buildabeer.app/api/Grains") else { return }
        
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
        guard let url = URL(string: "https://buildabeer.app/api/Hops") else { return }
        
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
        guard let url = URL(string: "https://buildabeer.app/api/Yeasts") else { return }
        
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
}
