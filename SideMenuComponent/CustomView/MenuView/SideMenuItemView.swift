//
//  SideMenuView.swift
//  SideMenuComponent
//
//  Created by Fırat Güler on 10.10.2024.
//

import UIKit
import SnapKit

protocol SideMenuItemViewDelegate : AnyObject {
    func didSelectMenuItem(option : Constants.MenuOptions)
}

final class SideMenuItemView: UIView {
    
    weak var delegate : SideMenuItemViewDelegate?

    private let menuNameLabel = UILabel()
    private let menuIconLabel = UIImageView()
    
    private var viewSize : CGSize {CGSize(width: 120 , height: 25)}
    private var menuOption: Constants.MenuOptions?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupTapGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    func configure(option: Constants.MenuOptions) {
        self.menuOption = option
        menuNameLabel.text = option.rawValue
        menuIconLabel.image = UIImage(systemName: option.imageName)
    }
    
    private func setupUI() {
        
        self.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 120 , height: 50))
        }
        
        // Icon
        menuIconLabel.tintColor = .white
        addSubview(menuIconLabel)
        menuIconLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview()
            make.width.height.equalTo(20)
        }
        
        // Name
        menuNameLabel.textColor = .white
        addSubview(menuNameLabel)
        menuNameLabel.snp.makeConstraints { make in
            make.top.right.equalToSuperview()
            make.left.equalTo(menuIconLabel.snp.right).offset(10)
        }
        
    }

    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(menuItemTapped))
        self.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - Selector
    @objc private func menuItemTapped() {
        if let menuOption = menuOption {
            delegate?.didSelectMenuItem(option: menuOption)
        }
    }
    
    
    
}
