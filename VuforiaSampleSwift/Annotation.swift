//
//  Annotatios.swift
//  VuforiaSampleSwift
//
//  Created by Artur Guseinov on 19/11/16.
//  Copyright © 2016 Yoshihiro Kato. All rights reserved.
//

import UIKit

struct Annotation: AnnotationProtocol {
  
  var title: String
  var category: String
  var description: String
  var xCoord: CGFloat
  var yCoord: CGFloat
  
  init(title: String, category: String, description: String, xCoord: CGFloat, yCoord: CGFloat) {
    self.title = title
    self.category = category
    self.description = description
    self.xCoord = xCoord
    self.yCoord = yCoord
  }

}
