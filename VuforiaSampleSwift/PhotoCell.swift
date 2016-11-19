//
//  PhotoCell.swift
//  VuforiaSampleSwift
//
//  Created by Artur Guseinov on 19/11/16.
//

import UIKit
import TableKit
import RealmSwift

class PhotoCell: UITableViewCell {
  
  struct Actions {
    static let AnnotationPressed = "AnnotationPressed"
  }
  @IBOutlet weak var bigImageView: UIImageView!
  @IBOutlet weak var littleImageView: UIImageView!
  
  var annotations = List<Annotation>()
  var buttons = [UIButton]()
  
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
    
    annotations = picture.annotations
    
    littleImageView.isUserInteractionEnabled = true
    
    buttons.removeAll()
    
    for (index, annotation) in picture.annotations.enumerated() {
      let x = annotation.bacis().x
      let y = annotation.bacis().y

      let X = x * littleImageView.frame.size.width
        //* 2.8
      let Y = (1 - y) * littleImageView.frame.size.height
        //* 2.8
      
      print("X: \(X)")
      print("Y: \(Y)")
      
      let button = UIButton(type: .system)
      button.frame = CGRect(x: 0, y: 0, width: 44.0, height: 44.0)
      button.center = CGPoint(x:  X,
                              y:  Y)
      button.backgroundColor = UIColor.white.withAlphaComponent(0.5)
      button.layer.borderColor = UIColor.white.cgColor
      button.layer.borderWidth = 1.0
      button.layer.cornerRadius = button.frame.size.width/2
      button.tag = index
      button.addTarget(self, action: #selector(annotationPressed(sender:)), for: .touchUpInside)
      button.addTarget(self, action: #selector(annotationHighlighted(sender:)), for: .touchDown)
      button.isUserInteractionEnabled = true
      
      littleImageView.addSubview(button)
      buttons.append(button)
    }
  }
  
  func annotationPressed(sender:  UIButton) {
    sender.alpha = 1.0
    TableCellAction(key: Actions.AnnotationPressed, sender: self, userInfo: ["index": sender.tag]).invoke()
    print(sender.tag)
  }
  
  func annotationHighlighted(sender: UIButton) {
    sender.alpha = 0.4
  }
}
