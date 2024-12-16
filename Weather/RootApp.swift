//
//  RootApp.swift
//  Weather
//
//  Created by Zhaizhanov Yernar on 13.12.2024
//  
//

import SwiftUI

@main
struct RootApp: App {
    
    @StateObject private var appViewBuilder: ApplicationViewBuilder
    @StateObject private var navigationService: NavigationService
    
    private let container: DependencyContainer = {
        let factory = AssemblyFactory()
        let container = DependencyContainer(assemblyFactory: factory)
                
        // Services
        container.apply(NavigationAssembly.self)
        //container.apply(CacheServiceType.self)
        // Modules
        container.apply(MainAssembly.self)

        return container
    }()

    init() {
        let navService = container.resolve(NavigationAssembly.self).build() as! NavigationService
        _navigationService = StateObject(wrappedValue: navService)
        
        let viewBuilder = ApplicationViewBuilder(container: container)
        _appViewBuilder = StateObject(wrappedValue: viewBuilder)
    }
    
    var body: some Scene {
        WindowGroup {
            RootView(navigationService: navigationService,
                     appViewBuilder: appViewBuilder)
        }
    }
}
