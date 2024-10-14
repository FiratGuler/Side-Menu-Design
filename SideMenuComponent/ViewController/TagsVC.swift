//
//  TagsVC.swift
//  SideMenuComponent
//
//  Created by Fırat Güler on 13.10.2024.
//

import UIKit

class TagsVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .purple
        
        customNavBar.titleLabel.text = "Tags"
        customNavBar.delegate = self
        
    }
}

extension TagsVC : CustomNavigationBarDelegate {
    func didTapLeftButton(from viewController: UIViewController) {
        toggleMenu(for: viewController)
    }
}
