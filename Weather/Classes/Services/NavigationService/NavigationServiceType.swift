//
//  NavigationServiceType.swift
//  Weather
//
//  Created by Zhaizhanov Yernar on 13.12.2024
//  
//

import Foundation

protocol NavigationServiceType: ObservableObject, Identifiable {
    var items:[Views] { get set }
    var modalView: Views? { get set }
    var alert: CustomAlert? { get set }
    func pushView(_ view: Views)
}
