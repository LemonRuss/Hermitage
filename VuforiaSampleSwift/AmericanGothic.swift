//
//  AmericanGothic.swift
//  VuforiaSampleSwift
//
//  Created by Alex Lavrinenko on 19.11.16.
//  Copyright © 2016 Yoshihiro Kato. All rights reserved.
//

import Foundation

struct AmericanGothic {
  
  typealias SCNPoint = (x: Float, y: Float)
  
  var positions = [Annotation]()
  
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
      let annotation = Annotation(title: "Point \(index)", category: "Интересный факт",
                                  description: "Описание",
                                  xCoord: point.x / viewScale, yCoord: point.y / viewScale)
      positions.append(annotation)
    }
  }
  

}
