//
//  AppSettingsStore.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/30/24.
//

import SwiftUI

@Observable
class AppSettingsStore {
    var appSettings: AppSettings = AppSettings()
    
    init(){
        Task {
            try? await self.load()
        }
    }
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("buildABeerAppSettings.data")
    }
    
    func load() async throws {
        let task = Task<AppSettings, Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return AppSettings()
            }
            let appSettings = try JSONDecoder().decode(AppSettings.self, from: data)
            return appSettings
        }
        let appSettings = try await task.value
        self.appSettings = appSettings
    }
    
    func save(appSettings: AppSettings) async throws {
            let task = Task {
                let data = try JSONEncoder().encode(appSettings)
                let outfile = try Self.fileURL()
                try data.write(to: outfile)
            }
            _ = try await task.value
        }

}
