//
//  TaskManager.swift
//  ToDoApp
//
//  Created by 角谷　悠平 on 2021/03/21.
//

import Foundation
import UIKit

var index: Int = 0

struct TaskManager {
    
    static func tasks() -> [Task] {
        let  tasksData = UserDefaults.standard.data(forKey: "TasksKey")
        return (try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(tasksData ?? Data()) as? [Task] ?? []) ?? []
    }
    
    static func addTask(task: Task) {
        let tasksData = UserDefaults.standard.data(forKey: "TasksKey")
        let unArchivedData = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(tasksData ?? Data()) as? [Task] ?? []
        var tasks = unArchivedData ?? []
        tasks.append(task)
        let tasksArchived = try! NSKeyedArchiver.archivedData(withRootObject: tasks, requiringSecureCoding: false)
        UserDefaults.standard.set(tasksArchived, forKey: "TasksKey")
        UserDefaults.standard.synchronize()
    }
    
    static  func favoriteImageSet(isfavorite: Bool, favoriteButton: UIButton) {
        if isfavorite == false {
            let displayStatus = UIImage(systemName: "suit.heart")
            favoriteButton.setImage(displayStatus, for: .normal)
        } else {
            let displayStatus = UIImage(systemName: "suit.heart.fill")
            favoriteButton.setImage(displayStatus, for: .normal)
        }
    }
    
    static func taskDelete(editingStyle: UITableViewCell.EditingStyle, indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            tasks().remove(at: index)
            let tasksArchived = try! NSKeyedArchiver.archivedData(withRootObject: tasks, requiringSecureCoding: false)
            UserDefaults.standard.set(tasksArchived, forKey: "TasksKey")
            tableView.deleteRows(at: [index], with: UITableView.RowAnimation.automatic)
        }
        
    }

}
