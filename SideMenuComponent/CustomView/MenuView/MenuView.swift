//
//  MenuVC.swift
//  SideMenuComponent
//
//  Created by Fırat Güler on 10.10.2024.
//

import UIKit


final class MenuView: UIView {
    
    weak var menuItemDelegate : SideMenuItemViewDelegate?
    
    private let greyColor = UIColor(red: 33/225.0, green: 33/225.0, blue: 33/225.0, alpha: 1)
    
    private let menuItemsStackView = UIStackView()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: - Functions
    
    private func setupView() {
        backgroundColor = greyColor
        setupMenuItemsStackView()
        setupSideMenu()
    }
    
    private func setupMenuItemsStackView() {
        menuItemsStackView.axis = .vertical
        menuItemsStackView.alignment = .leading
        menuItemsStackView.spacing = 10
        
        addSubview(menuItemsStackView)
        menuItemsStackView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            make.left.equalToSuperview().offset(20)
            make.width.height.equalToSuperview()
        }
    }
    
    private func setupMenuItem(selfView: SideMenuItemView, options: Constants.MenuOptions) {
        selfView.configure(option: options)
        menuItemsStackView.addArrangedSubview(selfView)
        
    }
    
    private func setupSideMenu() {
        for i in Constants.MenuOptions.allCases {
            let tempItem = SideMenuItemView()
            tempItem.delegate = self
            setupMenuItem(selfView: tempItem, options: i)
        }
    }
    
    
}

// MARK: Extensions

extension MenuView: SideMenuItemViewDelegate {
    func didSelectMenuItem(option: Constants.MenuOptions) {
        menuItemDelegate?.didSelectMenuItem(option: option)
        
    }
}
