//
//  Picture.swift
//  VuforiaSampleSwift
//
//  Created by Artur Guseinov on 19/11/16.
//  Copyright © 2016 Yoshihiro Kato. All rights reserved.
//

import UIKit
import RealmSwift

class Picture: Object, AnnotationProtocol {
  
  dynamic var id = ""
  dynamic var imageName = ""
  dynamic var title = ""
  dynamic var category = ""
  dynamic var text = ""
  dynamic var xMultiplier: CGFloat = 0
  dynamic var yMultiplier: CGFloat =  0
  var annotations = List<Annotation>()

}
