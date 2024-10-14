//
//  UIViewController.swift
//  SideMenuComponent
//
//  Created by Fırat Güler on 11.10.2024.
//

import UIKit

extension UIViewController {
    
    func addTapGestureToCallFunction(targetVC: UIViewController, action: Selector) {
         let tapGesture = UITapGestureRecognizer(target: self, action: action)
         view.addGestureRecognizer(tapGesture)
     }
}

