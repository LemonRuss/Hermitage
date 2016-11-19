//
//  AnnotationCell.swift
//  VuforiaSampleSwift
//
//  Created by Artur Guseinov on 19/11/16.
//  Copyright © 2016 Yoshihiro Kato. All rights reserved.
//

import UIKit
import TableKit

class AnnotationCell: UITableViewCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var categoryLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
}

extension AnnotationCell: ConfigurableCell {
  
  func configure(with annotation: AnnotationProtocol) {
    titleLabel.text = annotation.title
    categoryLabel.text = annotation.category
    descriptionLabel.text = annotation.text
  }
  
}
