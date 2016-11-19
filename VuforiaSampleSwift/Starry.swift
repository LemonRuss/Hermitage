//
//  AmericanGothic.swift
//  VuforiaSampleSwift
//
//  Created by Alex Lavrinenko on 19.11.16.
//  Copyright © 2016 Yoshihiro Kato. All rights reserved.
//

import Foundation
import RealmSwift

struct Starry {
  
  typealias SCNPoint = (x: Float, y: Float)
  
  var positions = List<Annotation>()
  
  var viewScale:Float
  
  init(viewScale: Float) {
    
    self.viewScale = viewScale
    
    
    let points: [SCNPoint] =
      [(x: -90, y: -55),
       (x: 75, y: -85),
       (x: 0, y: 42.5),
       ]
    
    let facts = ["Кипарисы как бы хотят покинуть земную твердь и присоединиться к танцу звезд и луны.",
                 "Справа на картине изображен непримечательный поселок, который раскинулся у подножья холмов в ночной тиши, он равнодушен к сиянию и бурному движению звезд.",
                 "Основной динамический элемент картины – это спиральный завиток почти в середине полотна. Он придает динамику каждому элементу композиции, стоит также отметить, что звезды и луна кажутся более подвижными, чем остальные."]
    
    for (index, point) in points.enumerated() {
      let annotation = Annotation()
      annotation.title = "Point \(index)"
      annotation.category = "Интересный факт"
      annotation.text = facts[index]
      annotation.xCoord = CGFloat(point.x / viewScale)
      annotation.yCoord = CGFloat(point.y / viewScale)
      annotation.xScale = CGFloat(6)
      annotation.yScale = CGFloat(7)
      positions.append(annotation)
    }
  }
}
