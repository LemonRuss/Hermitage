//
//  PhotoCell.swift
//  VuforiaSampleSwift
//
//  Created by Artur Guseinov on 19/11/16.
//  Copyright © 2016 Yoshihiro Kato. All rights reserved.
//

import UIKit
import TableKit

class PhotoCell: UITableViewCell {
  
  @IBOutlet weak var bigImageView: UIImageView!
  @IBOutlet weak var littleImageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
}

extension PhotoCell: ConfigurableCell {
  func configure(with picture: Picture) {
    
    guard let image = UIImage(named: picture.imageName) else {
      return
    }
    
    bigImageView.image = image
    littleImageView.image = image
    
    let aspectRatio = image.size.height/image.size.width
    
    let bigConstraint = NSLayoutConstraint(item: bigImageView, attribute: .height, relatedBy: .equal, toItem: bigImageView, attribute: .width, multiplier: aspectRatio, constant: 1.0)
    bigImageView.addConstraint(bigConstraint)
    
    let littleConstraint = NSLayoutConstraint(item: littleImageView, attribute: .height, relatedBy: .equal, toItem: littleImageView, attribute: .width, multiplier: aspectRatio, constant: 1.0)
    littleImageView.addConstraint(littleConstraint)
    
    layoutIfNeeded()
    
    for annotation in picture.annotations {
      let x = annotation.xCoord + picture.xMultiplier/2
      let y = annotation.yCoord + picture.yMultiplier/2

      let X = x * littleImageView.frame.size.width/picture.xMultiplier
      let Y = y * littleImageView.frame.size.height/picture.yMultiplier
      
      let button = UIButton(type: .system)
      button.frame = CGRect(x: 0 + X, y: 0, width: 44.0, height: 44.0)
      button.center = CGPoint(x: littleImageView.frame.origin.x + X, y: littleImageView.frame.origin.y + Y)
      button.backgroundColor = UIColor.white.withAlphaComponent(0.5)
      button.layer.borderColor = UIColor.white.cgColor
      button.layer.borderWidth = 1.0
      button.layer.cornerRadius = button.frame.size.width/2
      
      addSubview(button)
      
    }
  }
}
