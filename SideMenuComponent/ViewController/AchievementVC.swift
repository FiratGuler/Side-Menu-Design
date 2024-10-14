//
//  AchievementVC.swift
//  SideMenuComponent
//
//  Created by Fırat Güler on 10.10.2024.
//

import UIKit
import SnapKit
 
class AchievementVC: BaseViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
        customNavBar.titleLabel.text = "Achievement"
        customNavBar.delegate = self
        
    }

}

extension AchievementVC : CustomNavigationBarDelegate {
    func didTapLeftButton(from viewController: UIViewController) {
        toggleMenu(for: viewController)
    }
}
