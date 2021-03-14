//
//  TaskListTableViewCell.swift
//  ToDoApp
//
//  Created by 角谷　悠平 on 2021/03/13.
//

import UIKit

class TaskListTableViewCell: UITableViewCell {
    //var tasks = UserDefaults.standard.array(forKey: "TasksKey") as? [[String: Any]] ?? []
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    var indexPath = IndexPath()
    
    func setup(task: [String: Any], indexPath: IndexPath) {
        titleLabel.text = tasks[indexPath.row]["title"] as? String ?? ""
        dateLabel.text = tasks[indexPath.row]["date"] as? String ?? ""
        
        let favoriteStatus = tasks[indexPath.row]["isFavorite"] as! Bool
        if favoriteStatus == false {
            let displayStatus = UIImage(systemName: "suit.heart")
            favoriteButton.setImage(displayStatus, for: .normal)
        } else {
            let displayStatus = UIImage(systemName: "suit.heart.fill")
            favoriteButton.setImage(displayStatus, for: .normal)
        }
    }
    
    @IBAction func FavoriteSelectDidTap(_ sender: UIButton) {
        var task = tasks[indexPath.row]
        var favoriteStatus = task["isFavorite"] as! Bool
        favoriteStatus.toggle()
        task["isFavorite"] = favoriteStatus
        tasks[indexPath.row] = task
        //UserDefaults.standard.set(tasks, forKey: "TasksKey")
        if favoriteStatus == false {
            let displayStatus = UIImage(systemName: "suit.heart")
            favoriteButton.setImage(displayStatus, for: .normal)
        } else {
            let displayStatus = UIImage(systemName: "suit.heart.fill")
            favoriteButton.setImage(displayStatus, for: .normal)
        }
    }
}

