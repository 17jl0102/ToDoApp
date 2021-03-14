//
//  TaskCustom.swift
//  ToDoApp
//
//  Created by 角谷　悠平 on 2021/03/13.
//

import Foundation

class Task: NSObject, NSCoding{
    
    let title: String
    let date: String
    let isFavorite: Bool
    
    init(title: String, date:String, isFavorite: Bool) {
        self.title = title
        self.date = date
        self.isFavorite = isFavorite
    }
    
    init(task: [String: Any]){
        self.title = task["title"] as! String
        self.date = task["date"] as! String
        self.isFavorite = task["isFavorite"] as! Bool
    }
    
    func  encode(with Coder: NSCoder) {
        Coder.encode(title, forKey: "title")
        Coder.encode(date, forKey: "date")
        Coder.encode(isFavorite, forKey: "isFavorite")
    }
    
    required init?(coder Decoder: NSCoder) {
        title = Decoder.decodeObject(forKey: "title") as! String
        date = Decoder.decodeObject(forKey: "date") as! String
        isFavorite = Decoder.decodeObject(forKey: "isFavorite") as! Bool
    }
}
