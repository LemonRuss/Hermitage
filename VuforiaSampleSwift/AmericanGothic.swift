//
//  AmericanGothic.swift
//  VuforiaSampleSwift
//
//  Created by Alex Lavrinenko on 19.11.16.
//  Copyright © 2016 Yoshihiro Kato. All rights reserved.
//

import Foundation
import RealmSwift

struct AmericanGothic {
  
  typealias SCNPoint = (x: Float, y: Float)
  
  var positions = List<Annotation>()
  
  var viewScale:Float
  
  init(viewScale: Float) {
    
    self.viewScale = viewScale
    
    let points: [SCNPoint] =
      [(x: 65.0, y: 0),
       (x: -57.5, y: -35),
       (x: 10, y: -110),
       (x: 10, y: -65),
       (x: 70, y: 80),
       (x: -72.5, y: -75),
       (x: -70, y: -27.5),
       (x: -92.5, y: 22.5),
       (x: 5, y: 80),
       (x: -125, y: -10),
       (x: -115, y: 100),
       (x: 120, y: 35),]
    
    for (index, point) in points.enumerated() {
      let annotation = Annotation()
      annotation.title = "Point \(index)"
      annotation.category = "Интересный факт"
      annotation.text = "Описание"
      annotation.xCoord = CGFloat(point.x / viewScale)
      annotation.yCoord = CGFloat(point.y / viewScale)
      annotation.xScale = CGFloat(6)
      annotation.yScale = CGFloat(7)
      positions.append(annotation)
    }
  }
  

}
