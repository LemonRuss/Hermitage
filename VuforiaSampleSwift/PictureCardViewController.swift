//
//  PictureCardViewController.swift
//  VuforiaSampleSwift
//
//  Created by Artur Guseinov on 19/11/16.
//  Copyright © 2016 Yoshihiro Kato. All rights reserved.
//

import UIKit
import TableKit
import RealmSwift

class PictureCardViewController: UIViewController {
  
  var picture: Picture?
  
  @IBOutlet weak var tableView: UITableView! {
    didSet {
      tableDirector = TableDirector(tableView: tableView)
      tableView.tableFooterView = UIView()
    }
  }
  var tableDirector: TableDirector!
  
  var selectedAnnotation: Annotation?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
//    let annotation = Annotation()
//    annotation.title = "Title"
//    annotation.category = "Categoty"
//    annotation.text = "Text"
//    annotation.xCoord = -1.8
//    annotation.yCoord = 1.4
//    
//    let picture = Picture()
//    picture.id = "1"
//    picture.imageName = "01"
//    picture.category = "Picture category"
//    picture.title = "Picture title"
//    picture.text = "Picture text"
//    picture.xMultiplier = 6.0
//    picture.yMultiplier = 7.0
//    picture.annotations.append(annotation)
    
    if let picture = picture {
      show(picture: picture)
    }
  }

  func show(picture: Picture) {
    var rows = [Row]()
    rows.append(TableRow<PhotoCell>(item: picture))
    
    if let selectedAnnotation = selectedAnnotation {
      rows.append(TableRow<AnnotationCell>(item: selectedAnnotation))
    } else {
      rows.append(TableRow<AnnotationCell>(item: picture))
    }
    
    tableDirector.append(section: TableSection(rows: rows)).reload()
  }
  
}
