//
//  TaskCustom.swift
//  ToDoApp
//
//  Created by 角谷　悠平 on 2021/03/13.
//

import Foundation

class Task: NSObject, NSCoding {
    
    let title: String
    let date: String
    let isFavorite: Bool
    
    init(title: String, date:String, isFavorite: Bool) {
        self.title = title
        self.date = date
        self.isFavorite = isFavorite
    }
    
    func  encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "title")
        aCoder.encode(date, forKey: "date")
        aCoder.encode(isFavorite, forKey: "isFavorite")
    }

    required init?(coder aDecoder: NSCoder) {
        title = aDecoder.decodeObject(forKey: "title") as! String
        date = aDecoder.decodeObject(forKey: "date") as! String
        isFavorite = aDecoder.decodeBool(forKey: "isFavorite")
    }
    
    
//    static var saveTasks : [Task] = [Task(title: "task1", date: "2021/3/14", isFavorite: false),
//                                     Task(title: "task1", date: "2021/3/14", isFavorite: false),
//                                     Task(title: "task1", date: "2021/3/14", isFavorite: false),
//                                     Task(title: "task1", date: "2021/3/14", isFavorite: false),
//                                     Task(title: "task1", date: "2021/3/14", isFavorite: false)]
}
