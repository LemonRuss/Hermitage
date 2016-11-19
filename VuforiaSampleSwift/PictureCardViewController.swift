//
//  PictureCardViewController.swift
//  VuforiaSampleSwift
//
//  Created by Artur Guseinov on 19/11/16.
//  Copyright © 2016 Yoshihiro Kato. All rights reserved.
//

import UIKit
import TableKit

class PictureCardViewController: UIViewController {
  
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
    
    let annotation = Annotation(title: "Часть", category: "Интересный факт", description: "Этого здесь не должно быть", xCoord: -1.8, yCoord: 1.4)
    let picture = Picture(id: "1", imageName: "01", category: "Категория", title: "Название картины", description: "Описание", xMultiplier: 6.0, yMultiplier: 7.0, annotations: [annotation])
    show(picture: picture)
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
