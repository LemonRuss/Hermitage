//
//  PicturePreviewCell.swift
//
//
//  Created by Artur Guseinov on 19/11/16.
//
//

import UIKit
import TableKit

class PicturePreviewCell: UITableViewCell {
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}

extension PicturePreviewCell: ConfigurableCell {
  func configure(with _: Picture) {
    
  }
}
