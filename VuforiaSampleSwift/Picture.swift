//
//  Picture.swift
//  VuforiaSampleSwift
//
//  Created by Artur Guseinov on 19/11/16.
//  Copyright © 2016 Yoshihiro Kato. All rights reserved.
//

import UIKit

struct Picture: AnnotationProtocol {
  
  var id: String
  var imageName: String
  var title: String
  var category: String
  var description: String
  var xMultiplier: CGFloat
  var yMultiplier: CGFloat
  var annotations: [Annotation]
  
  init(id: String, imageName: String, category: String, title: String, description: String, xMultiplier: CGFloat, yMultiplier: CGFloat, annotations: [Annotation]) {
    self.id = id
    self.imageName = imageName
    self.category = category
    self.title = title
    self.description = description
    self.xMultiplier = xMultiplier
    self.yMultiplier = yMultiplier
    self.annotations = annotations
  }

}
