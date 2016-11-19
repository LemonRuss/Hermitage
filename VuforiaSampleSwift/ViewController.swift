//
//  ViewController.swift
//  VuforiaSample
//
//  Created by Yoshihiro Kato on 2016/07/02.
//  Copyright © 2016年 Yoshihiro Kato. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
  
  let vuforiaLicenseKey = "AXcBHiT/////AAAAGZurqBGag0UWguJCHn80xtNYwoLJhChJy+SlEsgOvROS5+CoBuMxNPhRcbHxg/uTGIUQGCZfrGcA6OHSXS54QAZudtxFo895ncMTX3X40QsjnH6Q8z/U84yWJqvFJFRmzGBRR6rBfXQBvuj4y5694ovzdNyRtFmxI8d0OaVrlVuk0gKxWtYym5i0vtGKtbQjSmeeEDM4Wcp5LvZatOLftQZ4nsnvPquz8azrJ5ljFxSm6V9oTmXOm4kYiBSw2ZxhdmmuaMTiSUEBlLIiVrzxfDGBkmASpJBJ15qeXKGI2y+qzlnqeU+71GMUHtOV74+HXGMqDtaISnXXnYYsWOa/0vl1e32Khbsn8mAhXdmN2u+z"
  let vuforiaDataSetFile = "Pitcur.xml"
  
  var vuforiaManager: VuforiaManager? = nil
  
  let boxMaterial = SCNMaterial()
  
  fileprivate var lastSceneName: String? = nil {
    didSet {
      
    }
  }
  
  fileprivate var lastPicture: Picture?
  
  
  var button: UIButton?
  
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationController()
    setupBackButton()
    //    prepare()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    prepare()
  }
  
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    pause()
    do {
      try vuforiaManager?.stop()
      lastSceneName = ""
      removeButton()
    }catch let error {
      print("\(error)")
    }
  }
}

private extension ViewController {
  func prepare() {
    vuforiaManager = VuforiaManager(licenseKey: vuforiaLicenseKey, dataSetFile: vuforiaDataSetFile)
    if let manager = vuforiaManager {
      manager.delegate = self
      manager.eaglView.sceneSource = self
      manager.eaglView.delegate = self
      manager.eaglView.setupRenderer()
      self.view = manager.eaglView
    }
    
    let notificationCenter = NotificationCenter.default
    notificationCenter.addObserver(self, selector: #selector(didRecieveWillResignActiveNotification),
                                   name: NSNotification.Name.UIApplicationWillResignActive, object: nil)
    
    notificationCenter.addObserver(self, selector: #selector(didRecieveDidBecomeActiveNotification),
                                   name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
    
    vuforiaManager?.prepare(with: .portrait)
    
    

  }
  
  func putButton() {
    let height = UIScreen.main.bounds.height
    let width = UIScreen.main.bounds.width
    

    button = UIButton(frame: CGRect(x: 0, y: height - 100, width: width, height: 50))
    

    button?.setTitle("Подробнее", for: .normal)
    
    button?.backgroundColor = UIColor(red: 162.0/255.0, green: 38.0/255.0,
                                     blue: 76.0/255.0, alpha: 1)
    
    button?.addTarget(self, action: #selector(openPicture), for: .touchUpInside)
    
    guard let button = button else {
      return
    }
    view.addSubview(button)
  }
  
  @objc func openPicture() {
    lastSceneName = ""
    pause()
    let vc = UIStoryboard(name: "Main", bundle: nil)
      .instantiateViewController(withIdentifier: "PictureCardViewController") as! PictureCardViewController
    vc.picture = lastPicture
    present(vc, animated: true, completion: nil)
  }
  
  func removeButton() {
    guard let button = button else {
      return
    }
    button.removeFromSuperview()
  }
  
  func pause() {
    do {
      try vuforiaManager?.pause()
    }catch let error {
      print("\(error)")
    }
  }
  
  func resume() {
    do {
      try vuforiaManager?.resume()
    }catch let error {
      print("\(error)")
    }
  }
}

extension ViewController {
  func didRecieveWillResignActiveNotification(_ notification: Notification) {
    pause()
  }
  
  func didRecieveDidBecomeActiveNotification(_ notification: Notification) {
    resume()
  }
}

extension ViewController: VuforiaManagerDelegate {
  func vuforiaManagerDidFinishPreparing(_ manager: VuforiaManager!) {
    print("did finish preparing\n")
    
    do {
      try vuforiaManager?.start()
      vuforiaManager?.setContinuousAutofocusEnabled(true)
    }catch let error {
      print("\(error)")
    }
  }
  
  func vuforiaManager(_ manager: VuforiaManager!, didFailToPreparingWithError error: Error!) {
    print("did faid to preparing \(error)\n")
  }
  
  func vuforiaManager(_ manager: VuforiaManager!, didUpdateWith state: VuforiaState!) {
    for index in 0 ..< state.numberOfTrackableResults {
      let result = state.trackableResult(at: index)
      let trackerableName = result?.trackable.name
      putButton()
      if trackerableName == "Starry" {
        if lastSceneName != "Starry" {
          manager.eaglView.setNeedsChangeSceneWithUserInfo(["scene" : "Starry"])
          lastSceneName = "Starry"
        }
      }
      if trackerableName == "Gothic" {
        if lastSceneName != "Gothic" {
          manager.eaglView.setNeedsChangeSceneWithUserInfo(["scene" : "Gothic"])
          lastSceneName = "Gothic"
        }
      }
      if trackerableName == "Madonna" {
        if lastSceneName != "Madonna" {
          manager.eaglView.setNeedsChangeSceneWithUserInfo(["scene" : "Madonna"])
          lastSceneName = "Madonna"
        }
      }
      if trackerableName == "Hristos" {
        if lastSceneName != "Hristos" {
          manager.eaglView.setNeedsChangeSceneWithUserInfo(["scene" : "Hristos"])
          lastSceneName = "Hristos"
        }
      }
      if trackerableName == "Hovhannes" {
        if lastSceneName != "Hovhannes" {
          manager.eaglView.setNeedsChangeSceneWithUserInfo(["scene" : "Hovhannes"])
          lastSceneName = "Hovhannes"
        }
      }
    }
  }
}

extension ViewController: VuforiaEAGLViewSceneSource, VuforiaEAGLViewDelegate {
  
  func scene(for view: VuforiaEAGLView!, userInfo: [String : Any]?) -> SCNScene! {
    guard let userInfo = userInfo else {
      print("default scene")
      return SCNScene()
    }
    guard let info = userInfo["scene"] as? String else {
      return SCNScene()
    }
    switch info {
    case "Gothic":
      print("AmericanGothic scene")
      return createAmericanGothic(with: view)
    case "Starry":
      print("Starry scene")
      return createStarry(with: view)
    case "Madonna":
      print("Madonna scene")
      return createMaddona(with: view)
    case "Hristos":
      print("Hristos scene")
      return createHristos(with: view)
    default:
      return SCNScene()
    }
  }
  
  fileprivate func createAmericanGothic(with view: VuforiaEAGLView) -> SCNScene {
    
    let viewScale = Float(view.objectScale)
    
    let americanGothic = AmericanGothic(viewScale: viewScale)
    
    lastPicture = Picture()
    lastPicture!.id = "0"
    lastPicture!.imageName = "00"
    lastPicture!.category = ""
    lastPicture!.title = ""
    lastPicture!.text = ""
    lastPicture!.xMultiplier = 6
    lastPicture!.yMultiplier = 7
    lastPicture!.annotations = americanGothic.positions
    
    let scene = SCNScene()
    boxMaterial.diffuse.contents = UIColor.white
    boxMaterial.diffuse.borderColor = UIColor.white
    boxMaterial.transparency = 0.5
    
    
    let planeNode = SCNNode()
    planeNode.name = "plane"
    planeNode.geometry = SCNPlane(width: 300.0/view.objectScale, height: 365/view.objectScale)
    planeNode.position = SCNVector3Make(0, 0, -1)
    let planeMaterial = SCNMaterial()
    planeMaterial.diffuse.contents = UIColor.clear
    planeNode.geometry?.firstMaterial = planeMaterial
    scene.rootNode.addChildNode(planeNode)
    
    
    for position in americanGothic.positions {
      let point = ObjectOfIntereset(vec: position.vector(),
                                    scale: viewScale, pointName: String(position.index))
      scene.rootNode.addChildNode(point)
    }
    return scene
  }
  
  fileprivate func createStarry(with view: VuforiaEAGLView) -> SCNScene {
    
    let viewScale = Float(view.objectScale)
    
    let americanGothic = Starry(viewScale: viewScale)
    
    lastPicture = Picture()
    lastPicture!.id = "1"
    lastPicture!.imageName = "01"
    lastPicture!.category = "Винсент Ван Гог"
    lastPicture!.title = "Звёздная ночь"
    lastPicture!.text = "В 1889 году тогда малоизвестный художник по имени Винсент, а по фамилии Ван Гог, однажды во время пребывания в больнице городка под названием Сен-Реми взяв холст размером 73 на 92 сантиметра, написал одну из своих самых потрясающих, удивительных картин под названием «Звездная Ночь». Написанная в жанре пейзажа маслом и относимая по стилю к постимпрессионизму, сегодня она продолжает вдохновлять людей творчества и не только на подвиги в живописи, литературе и жизни. Нормальное восприятие «Звездной Ночи» возможно лишь на большом расстоянии: такова специфическая, но завораживающая техника, характерная только для Ван Гога."
    lastPicture!.xMultiplier = 6
    lastPicture!.yMultiplier = 7
    lastPicture!.annotations = americanGothic.positions
    
    let scene = SCNScene()
    boxMaterial.diffuse.contents = UIColor.white
    boxMaterial.diffuse.borderColor = UIColor.white
    boxMaterial.transparency = 0.5
    
    
    let planeNode = SCNNode()
    planeNode.name = "plane"
    planeNode.geometry = SCNPlane(width: 300.0/view.objectScale, height: 235/view.objectScale)
    planeNode.position = SCNVector3Make(0, 0, -1)
    let planeMaterial = SCNMaterial()
    planeMaterial.diffuse.contents = UIColor.clear
    planeMaterial.transparency = 0.4
    planeNode.geometry?.firstMaterial = planeMaterial
    scene.rootNode.addChildNode(planeNode)
    
    
    for position in americanGothic.positions {
      let point = ObjectOfIntereset(vec: position.vector(),
                                    scale: viewScale, pointName: String(position.index))
      scene.rootNode.addChildNode(point)
    }
    return scene
  }
  
  fileprivate func createMaddona(with view: VuforiaEAGLView) -> SCNScene {
    
    let viewScale = Float(view.objectScale)
    
    let madonna = Madonna(viewScale: viewScale)
    
    lastPicture = Picture()
    lastPicture!.id = "2"
    lastPicture!.imageName = "02"
    lastPicture!.category = "Леонардо да Винчи"
    lastPicture!.title = "Мадо́нна Ли́тта"
    lastPicture!.text = "На картине изображена женщина, держащая на руках младенца, которого она кормит грудью. Фон картины — стена с двумя арочными окнами, свет из которых падает на зрителя и делает стену более тёмной. В окнах просматривается пейзаж в голубых тонах. Сама же фигура Мадонны словно озарена светом, идущим откуда-то спереди. Женщина смотрит на ребёнка нежно и задумчиво. Лицо Мадонны изображено в профиль, на губах нет улыбки, лишь в уголках притаился некий её образ. Младенец рассеянно смотрит на зрителя, придерживая правой рукой грудь матери. В левой руке ребёнок держит щегла. Яркая образность произведенияраскрывается в мелких деталях, которые много рассказывают нам о матери и ребёнке. Мы видим ребёнка и мать в драматический момент отлучения от груди. На женщине красная сорочка с широкой горловиной. В ней сделаны специальные разрезы, через которые удобно, не снимая платье, кормить младенца грудью. Оба разреза были аккуратно зашиты (то есть было принято решение отлучить ребёнка от груди). Но правый разрез был торопливо разорван — верхние стежки и обрывок нити отчетливо виден. Мать по настоянию ребёнка изменила своё решение и отложила этот нелёгкий момент."
    lastPicture!.xMultiplier = 6
    lastPicture!.yMultiplier = 7
    lastPicture!.annotations = madonna.positions
    
    let scene = SCNScene()
    boxMaterial.diffuse.contents = UIColor.white
    boxMaterial.diffuse.borderColor = UIColor.white
    boxMaterial.transparency = 0.5
    
    
    let planeNode = SCNNode()
    planeNode.name = "plane"
    planeNode.geometry = SCNPlane(width: 300.0/view.objectScale, height: 380/view.objectScale)
    planeNode.position = SCNVector3Make(0, 0, -1)
    let planeMaterial = SCNMaterial()
    planeMaterial.diffuse.contents = UIColor.clear
    planeNode.geometry?.firstMaterial = planeMaterial
    scene.rootNode.addChildNode(planeNode)
    
    
    for position in madonna.positions {
      let point = ObjectOfIntereset(vec: position.vector(),
                                    scale: viewScale, pointName: String(position.index))
      scene.rootNode.addChildNode(point)
    }
    return scene
  }
  
  fileprivate func createHristos(with view: VuforiaEAGLView) -> SCNScene {
    
    let viewScale = Float(view.objectScale)
    
        let hristos = Hristos(viewScale: viewScale)
    
    lastPicture = Picture()
    lastPicture!.id = "3"
    lastPicture!.imageName = "03"
    lastPicture!.category = "Александр Андреевич Иванов"
    lastPicture!.title = "Явление Христа народу"
    lastPicture!.text = "Замысел большого полотна, изображающего явление народу Мессии, долгое время увлекал Иванова. В 1834 году он написал «Явление воскресшего Христа Марии Магдалине». Через три года, в 1837 году, художник приступил к созданию картины «Явление Христа народу». Иванов писал картину в Италии. Он работал над ней в течение 20 лет (1837—1857), и о ней знали все, кто интересовался живописью. Для этой картины Александр Иванов исполнил свыше 600 этюдов с натуры. Павел Третьяков приобрёл эскизы, поскольку саму картину приобрёл император Александр II. В мае 1858 года Иванов решился отправить картину в Санкт-Петербург и явиться туда вместе с ней. Средства на перевозку картины пожертвовала Великая княгиня Елена Павловна. Демонстрация полотна, эскизов и этюдов к ней была организована в одном из залов Академии Художеств, выставка произвела сильное впечатление на общественность.Александр Иванов скончался 3 (15) июня 1858 года. Через несколько часов после его смерти «Явление Христа народу» купил император Александр II за 15 тысяч рублей. Император принёс полотно в дар Румянцевскому музею, который вскоре переехал из Санкт-Петербурга в Москву (в дом Пашкова). Для картины был построен специальный павильон. При расформировании музея в 1925 году работа была передана в Государственную Третьяковскую галерею. Там, однако, не оказалось зала для размещения такого полотна. Встал вопрос о помещении для полотна. В проект здания на Крымском Валу был, в частности, заложен зал для картины Иванова. Но всё же было решено пристроить зал к основному зданию в Лаврушинском переулке. В 1932 году полотно заняло то место, где находится и сейчас."
    lastPicture!.xMultiplier = 6
    lastPicture!.yMultiplier = 7
    lastPicture!.annotations = hristos.positions
    
    let scene = SCNScene()
    boxMaterial.diffuse.contents = UIColor.white
    boxMaterial.diffuse.borderColor = UIColor.white
    boxMaterial.transparency = 0.5
    
    
    let planeNode = SCNNode()
    planeNode.name = "plane"
    planeNode.geometry = SCNPlane(width: 300.0/view.objectScale, height: 210/view.objectScale)
    planeNode.position = SCNVector3Make(0, 0, -1)
    let planeMaterial = SCNMaterial()
    planeMaterial.diffuse.contents = UIColor.clear
    planeNode.geometry?.firstMaterial = planeMaterial
    scene.rootNode.addChildNode(planeNode)
    
    
    for position in hristos.positions {
      let point = ObjectOfIntereset(vec: position.vector(),
                                    scale: viewScale, pointName: String(position.index))
      scene.rootNode.addChildNode(point)
    }
    return scene
  }
  
  
  fileprivate func createDefaultScene(with view: VuforiaEAGLView) -> SCNScene {
    let scene = SCNScene()
    
    boxMaterial.diffuse.contents = UIColor.lightGray
    
    
    let planeNode = SCNNode()
    planeNode.name = "plane"
    planeNode.geometry = SCNPlane(width: 247.0/view.objectScale, height: 173.0/view.objectScale)
    planeNode.position = SCNVector3Make(0, 0, -1)
    let planeMaterial = SCNMaterial()
    planeMaterial.diffuse.contents = UIColor.green
    planeMaterial.transparency = 0.6
    planeNode.geometry?.firstMaterial = planeMaterial
    scene.rootNode.addChildNode(planeNode)
    
    let boxNode = SCNNode()
    boxNode.name = "box"
    boxNode.geometry = SCNBox(width: 1, height: 1, length: 1, chamferRadius:0.0)
    boxNode.geometry?.firstMaterial = boxMaterial
    boxNode.position = SCNVector3Make(0, 0, 0)
    
    scene.rootNode.addChildNode(boxNode)
    
    return scene
  }
  
  func vuforiaEAGLView(_ view: VuforiaEAGLView!, didTouchDownNode node: SCNNode!) {
    print("touch down \(node.name)\n")
    if let zoneNode = node as? ObjectOfIntereset {
      lastSceneName = ""
      pause()
      let vc = UIStoryboard(name: "Main", bundle: nil)
        .instantiateViewController(withIdentifier: "PictureCardViewController") as! PictureCardViewController
      vc.picture = lastPicture
      vc.selectedAnnotation = lastPicture!.annotations[Int(node.name!)!]
      present(vc, animated: true, completion: nil)
    } else {
      if let zoneNode = node.parent as? ObjectOfIntereset {
        lastSceneName = ""
        pause()
        let vc = UIStoryboard(name: "Main", bundle: nil)
          .instantiateViewController(withIdentifier: "PictureCardViewController") as! PictureCardViewController
        vc.picture = lastPicture
        vc.selectedAnnotation = lastPicture!.annotations[Int(node.name!)!]
        present(vc, animated: true, completion: nil)
      }
    }
  }
  
  func vuforiaEAGLView(_ view: VuforiaEAGLView!, didTouchUp node: SCNNode!) {
    print("touch up \(node.name)\n")
    boxMaterial.transparency = 0.5
  }
  
  func vuforiaEAGLView(_ view: VuforiaEAGLView!, didTouchCancel node: SCNNode!) {
    print("touch cancel \(node.name)\n")
    boxMaterial.transparency = 0.5
  }
}

