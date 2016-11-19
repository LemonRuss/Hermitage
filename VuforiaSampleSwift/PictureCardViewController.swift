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
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    if let picture = picture {
      show(picture: picture)
    }
  }

  @IBAction func exitPressed(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func addToCollectionPressed(_ sender: UIButton) {
    guard let picture = picture else {
      return
    }
    
    let realm = try! Realm()
    try! realm.write {
      realm.add(picture,update: true)
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
