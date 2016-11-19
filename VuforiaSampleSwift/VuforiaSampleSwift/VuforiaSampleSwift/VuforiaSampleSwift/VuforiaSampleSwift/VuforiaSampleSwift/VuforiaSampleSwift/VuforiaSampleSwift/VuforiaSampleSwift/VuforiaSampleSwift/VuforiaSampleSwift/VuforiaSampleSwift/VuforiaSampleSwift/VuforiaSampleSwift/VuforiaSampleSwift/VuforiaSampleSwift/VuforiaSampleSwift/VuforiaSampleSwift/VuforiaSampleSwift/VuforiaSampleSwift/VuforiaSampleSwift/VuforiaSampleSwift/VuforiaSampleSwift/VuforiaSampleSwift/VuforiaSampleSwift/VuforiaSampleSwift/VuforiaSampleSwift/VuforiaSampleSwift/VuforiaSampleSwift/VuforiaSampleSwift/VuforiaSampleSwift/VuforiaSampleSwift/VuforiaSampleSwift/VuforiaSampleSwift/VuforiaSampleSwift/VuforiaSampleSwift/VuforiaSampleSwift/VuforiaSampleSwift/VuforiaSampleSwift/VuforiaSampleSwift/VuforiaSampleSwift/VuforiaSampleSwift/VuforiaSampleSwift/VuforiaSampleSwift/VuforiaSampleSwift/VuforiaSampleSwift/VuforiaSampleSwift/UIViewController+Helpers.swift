//
//  UIViewController+Helpers.swift
//  VuforiaSampleSwift
//
//  Created by Artur Guseinov on 19/11/16.
//  Copyright © 2016 Yoshihiro Kato. All rights reserved.
//

import UIKit

extension UIViewController {
  
  func setupNavigationController() {
    if let navVC = navigationController {
      navVC.navigationBar.setBackgroundImage(UIImage(), for: .default)
      navVC.navigationBar.shadowImage = UIImage()
      navVC.navigationBar.isTranslucent = true
      navVC.view.backgroundColor = .clear
    }
  }
  
  func setupBackButton() {
    navigationItem.backBarButtonItem = UIBarButtonItem(image: UIImage(named: "BackArrow"), style: .plain, target: self, action: #selector(navBarBackButtonPressed))
    navigationItem.leftBarButtonItem?.tintColor = UIColor.white
  }
  
  func navBarBackButtonPressed() {
    let _ = navigationController?.popViewController(animated: true)
  }
}
