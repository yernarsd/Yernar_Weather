//
//  NavigationAssembly.swift
//  Weather
//
//  Created by Zhaizhanov Yernar on 13.12.2024
//  
//

import Foundation

final class NavigationAssembly: Assembly {
    
    //Only one navigation should use in app
    static let navigation: any NavigationServiceType = NavigationService()
    
    func build() -> any NavigationServiceType {
        return NavigationAssembly.navigation
    }
}
