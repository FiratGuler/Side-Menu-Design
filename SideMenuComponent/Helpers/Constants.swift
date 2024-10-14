//
//  Constraint.swift
//  SideMenuComponent
//
//  Created by Fırat Güler on 10.10.2024.
//

import Foundation

enum Constants {
    
    enum MenuState {
        case opened
        case closed
    }
    
    enum MenuOptions : String , CaseIterable {
        case map = "Harita"
        case achievement = "Başarılar"
        case tags = "Etiketlerim"
        case settings = "Ayarlar"
        
        var imageName : String {
            switch self {
            case .map:
                return "map.fill"
            case .achievement:
                return "trophy.fill"
            case .tags:
                return "tag.fill"
            case .settings:
                return "gear"
            }
        }
    }
}
