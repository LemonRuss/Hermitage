//
//  AmericanGothic.swift
//  VuforiaSampleSwift
//
//  Created by Alex Lavrinenko on 19.11.16.
//  Copyright © 2016 Yoshihiro Kato. All rights reserved.
//

import Foundation
import RealmSwift

struct Hristos {
  
  typealias SCNPoint = (x: Float, y: Float)
  
  var positions = List<Annotation>()
  
  var viewScale:Float
  
  init(viewScale: Float) {
    
    self.viewScale = viewScale
    
    
    let points: [SCNPoint] =
      [(x: -25, y: -30),
       (x: -80, y: -25),
       ]
    
    let facts = ["Этот образ является воплощением идеально прекрасной женщины. При этом он не является бесстрастным. Однако все чувства, переживаемые изображённой на картине женщиной, глубоко спрятаны художником, чтобы не нарушать ясную гармоничность её облика. Они слегка проявляются лишь в выражении затаённой грусти и в скользящей таинственной полуулыбке.",
                 "Изображенный младенец выглядит грустным и не по возрасту серьёзным. Златокудрый малыш рассеянно смотрит на, придерживая правой рукой грудь матери. В его левой руке изображена птичка-щегол – символ христианской души. ",
                 ]
    
    for (index, point) in points.enumerated() {
      let annotation = Annotation()
      annotation.index = index
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
