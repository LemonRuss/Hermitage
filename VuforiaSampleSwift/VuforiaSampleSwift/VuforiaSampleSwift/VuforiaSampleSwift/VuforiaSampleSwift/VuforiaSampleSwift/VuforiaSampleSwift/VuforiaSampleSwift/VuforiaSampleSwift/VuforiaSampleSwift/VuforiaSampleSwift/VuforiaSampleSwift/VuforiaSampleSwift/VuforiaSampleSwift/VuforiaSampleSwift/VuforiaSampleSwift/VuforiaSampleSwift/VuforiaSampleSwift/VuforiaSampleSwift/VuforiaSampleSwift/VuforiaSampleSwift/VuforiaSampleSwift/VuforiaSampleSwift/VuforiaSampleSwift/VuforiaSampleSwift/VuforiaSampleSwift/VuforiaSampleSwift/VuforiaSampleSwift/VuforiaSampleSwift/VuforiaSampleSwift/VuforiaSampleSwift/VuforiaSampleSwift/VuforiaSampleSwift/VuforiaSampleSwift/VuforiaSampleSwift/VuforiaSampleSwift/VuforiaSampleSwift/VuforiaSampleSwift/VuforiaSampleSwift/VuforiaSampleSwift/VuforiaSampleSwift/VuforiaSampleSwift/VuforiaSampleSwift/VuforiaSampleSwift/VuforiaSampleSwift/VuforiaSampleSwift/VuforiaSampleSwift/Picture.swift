//
//  Picture.swift
//  VuforiaSampleSwift
//
//  Created by Artur Guseinov on 19/11/16.
//  Copyright © 2016 Yoshihiro Kato. All rights reserved.
//

import UIKit

struct Picture {
  
  var id: String
  var imageName: String
  var category: String
  var name: String
  var description: String
  var annotations: [Annotation]
  
  init(id: String, imageName: String, category: String, name: String, description: String, annotations: [Annotation]) {
    self.id = id
    self.imageName = imageName
    self.category = category
    self.name = name
    self.description = description
    self.annotations = annotations
  }

}
