//
//  SettingsView.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/9/24.
//

import SwiftUI
import AuthenticationServices

struct SettingsView: View {
    @Environment(AppSettingsStore.self) var appSettingsStore
    @Environment(\.scenePhase) private var scenePhase
    var viewModel = SettingsViewModel()
    
    var body: some View {
        @Bindable var appSettingsStore = self.appSettingsStore
        Form {
//            Section {
//                if viewModel.isLoggedIn {
//                    Text("Logged in!")
//                    Text(viewModel.currentUserId)
//                } else {
//                    if viewModel.credentialState == .notFound {
//                        SignInWithAppleButton(.signIn) { request in
//                            request.requestedScopes = [.fullName, .email]
//                        } onCompletion: { result in
//                            switch result {
//                            case .success(let authorization):
//                                viewModel.handleSuccessfulLogin(with: authorization)
//                            case .failure(let error):
//                                viewModel.handleLoginError(with: error)
//                            }
//                        }
//                    } else {
//                        Text("Some other credential state")
//                    }
//                   
//                }
//            } header: {
//                Text("Account Info")
//            }
            
            Section {
                Picker("Brewing Method", selection: $appSettingsStore.appSettings.brewingMethod) {
                    Text("All Grain").tag(BrewingMethod.allGrain)
                    Text("Extract").tag(BrewingMethod.extract)
                }
                Picker("Batch Size", selection: $appSettingsStore.appSettings.batchSize) {
                    Text("5 Gallons").tag(5.0)
                    Text("10 gallons").tag(10.0)
                }
//                VStack {
//                    HStack {
//                        Text("Brewhouse Efficiency")
//                        TextField("Estimated Brewhouse Efficiency", value: $appSettingsStore.appSettings.brewhouseEfficiency, format: .number).padding().keyboardType(.decimalPad).multilineTextAlignment(.trailing)
//                    }
//                    Text("This is a measure of the amount of extract recovered in the wort compared to the amount of extract available in the malt. For most homebrewers, this is around 0.75.")
//                        .font(.caption)
//                        .foregroundColor(Color.gray)
//                }
            } header: {
                Text("Brewing Preferences")
            }
            
            Section {
                HStack {
                    Text("App Version")
                    Spacer()
                    Text(Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String? ?? "x.x")
                }
                
            } header: {
                Text("App Info")
            }
            
            
        }.onChange(of: scenePhase) { _oldPhase, newPhase in
            Task {
                if newPhase == .inactive {
                    do {
                        try await $appSettingsStore.wrappedValue.save(appSettings: $appSettingsStore.wrappedValue.appSettings)
                    } catch {
                        print("unable to save")
                    }
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environment(AppSettingsStore())
    }
}
