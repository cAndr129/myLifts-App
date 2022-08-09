//
//  myLiftsApp.swift
//  myLifts
//
//  Created by Cory Andreasen on 7/30/22.
//

import SwiftUI

@main
struct myLiftsApp: App {
    @StateObject private var store = LiftStore()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainView(lifts: $store.lifts){
                    LiftStore.save(lifts: store.lifts) { result in
                        if case .failure(let error) = result {
                            fatalError(error.localizedDescription)
                        }
                    }
                }
            }
            .onAppear{
                LiftStore.load{ result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let lifts):
                        store.lifts = lifts
                    }
                }
            }
        }
    }
}
