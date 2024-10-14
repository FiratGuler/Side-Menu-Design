//
//  BaseViewController.swift
//  SideMenuComponent
//
//  Created by Fırat Güler on 11.10.2024.
//

import UIKit
import Hero

class BaseViewController: UIViewController {
    
    let customNavBar = CustomNavBar()
    var menuView = MenuView()
    var menuState: Constants.MenuState = .closed
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        addTapGestureToCallFunction(targetVC: self, action: #selector(toggleMenuViewTapped))
    }
    
    // MARK: - Func
  
    private func setupUI() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        setupCustomNavBar()
        setupMenuView()
        //addTapGestureToCloseMenu()
    }
    
    private func setupCustomNavBar() {
        view.backgroundColor = .systemBackground
        view.addSubview(customNavBar)
        customNavBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.height.equalTo(44)
        }
    }
    
    private func setupMenuView() {
        menuView.menuItemDelegate = self
        view.addSubview(menuView)
        menuView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(-view.frame.width * 0.5)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
        }
    }
    
    private func animateMenu(isOpening: Bool,completion: @escaping () -> Void) {
        let screenWidth: CGFloat = view.frame.width * 0.5
        
        UIView.animate(withDuration: 0.3, animations: {
            self.menuView.snp.updateConstraints { make in
                if isOpening {
                    make.left.equalToSuperview().offset(0)
                } else {
                    make.left.equalToSuperview().offset(-screenWidth)
                }
            }
            self.view.layoutIfNeeded()
        }) { _ in completion() }
        
    }
    
    func toggleMenu(for viewController: UIViewController) {
        
        switch menuState {
        case .opened:
            animateMenu(isOpening: false) {
                self.menuState = .closed
            }
        case .closed:
            animateMenu(isOpening: true) {
                self.menuState = .opened
                self.view.bringSubviewToFront(self.menuView)
            }
        }
    }
    
    // MARK: - Selectors

    @objc func toggleMenuViewTapped() {
        if menuState == .opened {
            toggleMenu(for: self)
        }
    }
}

// MARK: - Extensions

extension BaseViewController: SideMenuItemViewDelegate {
    func didSelectMenuItem(option: Constants.MenuOptions) {
        let viewControllerToPresent: UIViewController
        
        switch option {
        case .map:
            viewControllerToPresent = HomeVC()
        case .achievement:
            viewControllerToPresent = AchievementVC()
        case .tags:
            viewControllerToPresent = TagsVC()
        case .settings:
            viewControllerToPresent = SettingsVC()
        }
        
        viewControllerToPresent.hero.isEnabled = true
        viewControllerToPresent.hero.modalAnimationType = .selectBy(presenting: .zoom, dismissing: .zoomOut)
        self.hero.replaceViewController(with: viewControllerToPresent)
    }
}

