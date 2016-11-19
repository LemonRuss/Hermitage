//
//  AmericanGothic.swift
//  VuforiaSampleSwift
//
//  Created by Alex Lavrinenko on 19.11.16.
//  Copyright © 2016 Yoshihiro Kato. All rights reserved.
//

import Foundation
import RealmSwift

struct AmericanGothic {
  
  typealias SCNPoint = (x: Float, y: Float)
  
  var positions = List<Annotation>()
  
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
    
    let facts = ["Вуд писал его со своего дантиста Байрона Маккиби, вовсе не мрачного человека. Врачу тогда было 62 года. «Мне нравится ваше лицо, — как-то сказал ему Вуд. — Оно все как бы состоит из длинных прямых линий». Маккиби согласился позировать при условии, что его не будут узнавать на этом портрете. Вуд не сдержал обещание и сделал персонажа очень похожим на модель, по словам художника, не намеренно.",
                 "На картине изображены отец и дочь, на этом особенно настаивала модель, сестра художника Нэн Вуд Грэхем, хотя многие журналисты принимали персонажей за супругов. Яркая и жизнелюбивая Нэн позировала для образа угрюмой старой девы, но все равно огорчилась, что выглядит на картине намного старше своих 30 лет.",
                 "На карандашном эскизе в качестве символа сельскохозяйственных работ мужчина держал грабли, но Вуд хотел, чтобы орудие в руке персонажа ассоциировалось не с садоводством, а с уборкой сена в старые времена (что возмутило некоторых технически продвинутых фермеров). К тому же вертикальные линии зубцов соотносятся с другими вертикалями картины.",
                 "Отстрочка на джинсовом комбинезоне мужчины и полосы на рубашке, как и рамы окон и террасы, и растение на заднем плане, и крыша сарая копируют очертания вил. Вуд любил включать в композицию картин повторяющиеся геометрические мотивы.",
                 "Доктор Байрон Маккиби, послуживший моделью, носил очки с линзами восьмиугольной формы, а круглые были у отца художника. Вуд хранил их в память о нем, а когда вернулся из Мюнхена, заказал себе такие же. Детские воспоминания о провинциальной Америке конца XIX века были связаны для Вуда прежде всего с родителями и их вещами.",
                 "Типичный элемент одежды фермерских жен из родной Вуду Анамосы, такие носила и мать художника. Кайму устаревшего фасона Нэн по просьбе Вуда нашила на передник, в котором позировала. «Эта тесьма вышла из моды, — вспоминала Нэн, — и в магазинах ее не было. Я спорола ее со старых маминых платьев...»",
                 "Стилизация под античную камею. Вуд купил это украшение для матери в Европе, поскольку девушка на ней, как считал художник, похожа на Нэн. Подобные камеи были популярным украшением в Викторианскую эпоху.",
                 "В письме от 1941 года Вуд заметил о своей героине: «Я позволил одной пряди выбиться, чтобы показать, несмотря ни на что, человечность персонажа».",
                 "Дом в стиле плотницкой готики. Здание, с которого Вуд его писал, построили в Элдоне, штат Айова, в 1881–1882 годах местные плотники Бьюзи и Гералд.",
                 "Любимые на Среднем Западе домашние растения олицетворяют женскую домовитость.",
                 "Консервативные обитатели американской провинции, наследники пуритан-первопоселенцев, в большинстве своем были примерными прихожанами. Родители самого художника познакомились в пресвитерианской церкви: Хэтти Уивер в свободное от работы время была там органисткой, а Мервилл Вуд возглавлял воскресную школу.",
                 "Этого строения не было рядом со зданием из Элдона, но его присутствие позади героя указывает на род занятий, так же как растения в горшках за плечом женщины. Красный амбар был нарисован на кухонном шкафу, сделанном отцом Вуда, — единственном предмете мебели, который мать забрала с фермы, когда семья съезжала оттуда. Для Вуда этот шкаф всегда был символом дома."]
    
    var titles = ["Мужчина",
                  "Женщина",
                  "Вилы",
                  "«Трезубец»",
                  "Очки",
                  "Передник",
                  "Брошь «Персефона»",
                  "Локон",
                  "Дом",
                  "Бегония и щучий хвост",
                  "Шпиль церкви",
                  "Красный амбар"]
    
    for (index, point) in points.enumerated() {
      let annotation = Annotation()
      annotation.index = index
      annotation.title = titles[index]
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
