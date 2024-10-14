//
//  File.swift
//  SideMenuComponent
//
//  Created by Fırat Güler on 11.10.2024.
//

import UIKit

protocol CustomNavigationBarDelegate: AnyObject {
    func didTapLeftButton(from viewController: UIViewController)
}

final class CustomNavBar: UIView {
    
    weak var delegate: CustomNavigationBarDelegate?    
    private let menuButton = UIButton()
    var titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupNavBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Func
    
    private func setupNavBar() {
        self.backgroundColor = .white
        
        // Title Label
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.textColor = .black
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        // Menu Button
        menuButton.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
        menuButton.tintColor = .black
        
        addSubview(menuButton)
        menuButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(28)
        }
        menuButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        
    }
    
    private func getParentViewController() -> UIViewController? {
        var responder: UIResponder? = self
        
        while responder != nil {
            responder = responder?.next
            if let viewController = responder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    // MARK: - Selector
    
    @objc private func leftButtonTapped() {
        guard let delegate = delegate else { return }
        delegate.didTapLeftButton(from: getParentViewController() ?? UIViewController())
    }
}
