//
//  CollectionViewController.swift
//  VuforiaSampleSwift
//
//  Created by Artur Guseinov on 19/11/16.
//  Copyright © 2016 Yoshihiro Kato. All rights reserved.
//

import UIKit
import RealmSwift

class CollectionViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  var pictures = [Picture]()
  
  override func viewDidLoad() {
    super.awakeFromNib()
    title = "МОЯ КОЛЛЕКЦИЯ"
    setupNavigationController()
    setupBackButton()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    let realm = try! Realm()
    let objects = realm.objects(Picture.self).filter("isCollection == true")
    pictures = Array(objects)
    collectionView.reloadData()
  }
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return pictures.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PictureCell", for: indexPath as IndexPath) as! PictureCell
    cell.imageView.image = UIImage(named: pictures[indexPath.row].imageName)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let vc = UIStoryboard(name: "Main", bundle: nil)
      .instantiateViewController(withIdentifier: "PictureCardViewController") as! PictureCardViewController
    vc.picture = pictures[indexPath.row]
    present(vc, animated: true, completion: nil)

  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.size.width/2, height: collectionView.frame.size.width/2)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
}
