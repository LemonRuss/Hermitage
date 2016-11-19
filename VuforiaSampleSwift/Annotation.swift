//
//  Annotatios.swift
//  VuforiaSampleSwift
//
//  Created by Artur Guseinov on 19/11/16.
//  Copyright © 2016 Yoshihiro Kato. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

class Annotation: Object, AnnotationProtocol {
  
  dynamic var title = ""
  dynamic var category = ""
  dynamic var text = ""
  dynamic var xCoord: CGFloat = 0
  dynamic var yCoord: CGFloat = 0
  
  func vector() -> SCNVector3 {
    return SCNVector3Make(Float(xCoord),
                          Float(yCoord), 0)
  }

}
