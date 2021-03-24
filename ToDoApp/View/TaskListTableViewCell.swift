//
//  TaskListTableViewCell.swift
//  ToDoApp
//
//  Created by 角谷　悠平 on 2021/03/13.
//

import UIKit

class TaskListTableViewCell: UITableViewCell {
    
    var index: Int = 0
    var task: Task!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    func setup(task: Task, indexPath: IndexPath) {
        self.index = indexPath.row
        self.task = task
        titleLabel.text = task.title
        dateLabel.text = task.date
        
        favoriteReverse(isfavorite: task.isFavorite)
    }
    
    func favoriteReverse(isfavorite: Bool) {
        if isfavorite == false {
            let displayStatus = UIImage(systemName: "suit.heart")
            self.favoriteButton.setImage(displayStatus, for: .normal)
        } else {
            let displayStatus = UIImage(systemName: "suit.heart.fill")
            self.favoriteButton.setImage(displayStatus, for: .normal)
        }
    }
    
    @IBAction func FavoriteSelectDidTap(_ sender: UIButton) {
        var tasks = TaskManager.tasks()
        let updateTask = Task(title: tasks[index].title, date: tasks[index].date, isFavorite: !tasks[index].isFavorite)
        tasks[index] = updateTask
        let tasksArchived = try! NSKeyedArchiver.archivedData(withRootObject: tasks, requiringSecureCoding: false)
        UserDefaults.standard.set(tasksArchived, forKey: "TasksKey")
        UserDefaults.standard.synchronize()
        
        favoriteReverse(isfavorite: tasks[index].isFavorite)
    }
}

