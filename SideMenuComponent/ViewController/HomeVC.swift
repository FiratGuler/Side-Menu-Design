//
//  HomeVC.swift
//  SideMenuComponent
//
//  Created by Fırat Güler on 10.10.2024.
//

import UIKit


class HomeVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .brown
        customNavBar.titleLabel.text = "Home"
        customNavBar.delegate = self

        
    }
   
}

extension HomeVC : CustomNavigationBarDelegate {
    func didTapLeftButton(from viewController: UIViewController) {
        toggleMenu(for: viewController)
    }
}
