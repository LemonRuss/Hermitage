//
//  AmericanGothic.swift
//  VuforiaSampleSwift
//
//  Created by Alex Lavrinenko on 19.11.16.
//  Copyright © 2016 Yoshihiro Kato. All rights reserved.
//

import Foundation

struct AmericanGothic {
  
  var positions = [Annotation]()
  
  init(viewScale: Float) {
//    positions.append(contentsOf: [])
  }
  let firstPoint = ObjectOfIntereset(vec: SCNVector3Make(65/viewScale, 0, 0),
                                     scale: viewScale, pointName: "point 1")
  scene.rootNode.addChildNode(firstPoint)
  
  let secondPoint = ObjectOfIntereset(vec: SCNVector3Make(-57.5 / viewScale, -35 / viewScale, 0),
                                      scale: viewScale, pointName: "point 2")
  scene.rootNode.addChildNode(secondPoint)
  
  let thirdPoint = ObjectOfIntereset(vec: SCNVector3Make(10/viewScale, -110/viewScale, 0),
                                     scale: viewScale, pointName: "point 3")
  scene.rootNode.addChildNode(thirdPoint)
  
  let fourthPoint = ObjectOfIntereset(vec: SCNVector3Make(10/viewScale, -65/viewScale, 0),
                                      scale: viewScale, pointName: "point 4")
  scene.rootNode.addChildNode(fourthPoint)
  
  let fithPoint = ObjectOfIntereset(vec: SCNVector3Make(70/viewScale, 80/viewScale, 0),
                                    scale: viewScale, pointName: "point 5")
  scene.rootNode.addChildNode(fithPoint)
  
  let sixPoint = ObjectOfIntereset(vec: SCNVector3Make(-72.5/viewScale, -75/viewScale, 0),
                                   scale: viewScale, pointName: "point 6")
  scene.rootNode.addChildNode(sixPoint)
  
  let seventhPoint = ObjectOfIntereset(vec: SCNVector3Make(-70/viewScale, -0.55, 0),
                                       scale: viewScale, pointName: "point 7")
  scene.rootNode.addChildNode(seventhPoint)
  
  let eightPoint = ObjectOfIntereset(vec: SCNVector3Make(-92.5 / viewScale, 22.5 / viewScale, 0),
                                     scale: viewScale, pointName: "point 8")
  scene.rootNode.addChildNode(eightPoint)
  
  let ninthPoint = ObjectOfIntereset(vec: SCNVector3Make(5/viewScale, 80/viewScale, 0),
                                     scale: viewScale, pointName: "point 9")
  scene.rootNode.addChildNode(ninthPoint)
  
  
  let tenthPoint = ObjectOfIntereset(vec: SCNVector3Make(-125/viewScale, -10/viewScale, 0),
                                     scale: viewScale, pointName: "point 10")
  scene.rootNode.addChildNode(tenthPoint)
  
  let eleventhPointPoint = ObjectOfIntereset(vec: SCNVector3Make(-115/viewScale, 100/viewScale, 0),
                                             scale: viewScale, pointName: "point 11")
  scene.rootNode.addChildNode(eleventhPointPoint)
  
  let twelthPointPoint = ObjectOfIntereset(vec: SCNVector3Make(120/viewScale, 35/viewScale, 0),
                                           scale: viewScale, pointName: "point 12")
  scene.rootNode.addChildNode(twelthPointPoint)
}
