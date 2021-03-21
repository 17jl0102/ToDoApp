//
//  TaskListTableViewCell.swift
//  ToDoApp
//
//  Created by 角谷　悠平 on 2021/03/13.
//

import UIKit

class TaskListTableViewCell: UITableViewCell {
    //    var tasks: [Task] = []
    //    let tasksData = UserDefaults.standard.data(forKey: "TasksKey")
    //    guard let data = tasksData else {return}
    //    let unArchivedData = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Task] ?? []
    //    tasks = unArchivedData ?? []
    //
    var index: Int = 0
    var task: Task!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    func setup(task: Task, indexPath: IndexPath) {
        titleLabel.text = task.title
        dateLabel.text = task.date
        
        let favoriteStatus = task.isFavorite
        if favoriteStatus == false {
            let displayStatus = UIImage(systemName: "suit.heart")
            favoriteButton.setImage(displayStatus, for: .normal)
        } else {
            let displayStatus = UIImage(systemName: "suit.heart.fill")
            favoriteButton.setImage(displayStatus, for: .normal)
        }
        
        self.index = indexPath.row
        self.task = task
    }
    
    @IBAction func FavoriteSelectDidTap(_ sender: UIButton) {
        let tasksData = UserDefaults.standard.data(forKey: "TasksKey")
        guard let data = tasksData else {return}
        let unArchivedData = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Task] ?? []
        var tasks = unArchivedData ?? []
      
        var updateTask = Task(title: task.title, date: task.date, isFavorite: !task.isFavorite)
        tasks[index] = updateTask
        if updateTask.isFavorite == false {
            let displayStatus = UIImage(systemName: "suit.heart")
            favoriteButton.setImage(displayStatus, for: .normal)
        } else {
            let displayStatus = UIImage(systemName: "suit.heart.fill")
            favoriteButton.setImage(displayStatus, for: .normal)
        }
        let tasksArchived = try! NSKeyedArchiver.archivedData(withRootObject: tasks, requiringSecureCoding: false)
        UserDefaults.standard.set(tasksArchived, forKey: "TasksKey")
        UserDefaults.standard.synchronize()
    }
}

