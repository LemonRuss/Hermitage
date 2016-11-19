//
//  ObjectOfInterest.swift
//  VuforiaSampleSwift
//
//  Created by Alex Lavrinenko on 19.11.16.
//  Copyright © 2016 Yoshihiro Kato. All rights reserved.
//

import Foundation

class ObjectOfIntereset: SCNNode {
  
  var circleMaterial: SCNMaterial! {
    let circleMaterial = SCNMaterial()
    circleMaterial.diffuse.contents = UIColor.white
    circleMaterial.transparency = 0.5
    return circleMaterial
  }
  
  var borderMaterial: SCNMaterial! {
    let borderMaterial = SCNMaterial()
    borderMaterial.diffuse.contents = UIColor.white
    return borderMaterial
  }
  
  var zoneMaterial: SCNMaterial {
    let zoneMaterial = SCNMaterial()
    zoneMaterial.diffuse.contents = UIColor.clear
    return zoneMaterial
  }
  
  var circleBorder = SCNNode()
  
  var circle = SCNNode()
  
  init(vec: SCNVector3, scale: Float, pointName: String) {
    super.init()
    
    self.name = pointName
    self.geometry = SCNCylinder(radius: CGFloat(Float(75) / scale), height: 0.1)
    self.geometry?.firstMaterial = zoneMaterial
    self.position = vec
    self.rotation = SCNVector4Make(50/scale, 0, 0, 90)
    
    circleBorder.name = pointName
    circleBorder.geometry = SCNTorus(ringRadius:  CGFloat(Float(10.0) / scale),
                                     pipeRadius:  CGFloat(Float(0.1) / scale))
    circleBorder.geometry?.firstMaterial = borderMaterial
    circleBorder.position = SCNVector3Make(0, 0, 0)
    circleBorder.rotation = SCNVector4Make(50/scale, 0, 0, 90)
    self.addChildNode(circleBorder)
    
    circle.name = pointName
    circle.geometry = SCNCylinder(radius: CGFloat(Float(10.0) / scale),
                                  height: 2 * CGFloat(Float(0.1) / scale))
    circle.geometry?.firstMaterial = circleMaterial
    circle.position = SCNVector3Make(0, 0, 0)
    circle.rotation = SCNVector4Make(50/scale, 0, 0, 90)
    self.addChildNode(circle)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
