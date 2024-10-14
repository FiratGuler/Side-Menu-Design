//
//  SettingsVC.swift
//  SideMenuComponent
//
//  Created by Fırat Güler on 11.10.2024.
//

import UIKit

class SettingsVC: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPurple
        customNavBar.titleLabel.text = "Settings"
        customNavBar.delegate = self
    }
    
}

extension SettingsVC : CustomNavigationBarDelegate {
    func didTapLeftButton(from viewController: UIViewController) {
        toggleMenu(for: viewController)
    }
    
}

