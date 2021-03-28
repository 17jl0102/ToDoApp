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
        
        favoriteImageSet(isfavorite: task.isFavorite, favoriteButton: favoriteButton)
    }
    
    
    @IBAction func FavoriteSelectDidTap(_ sender: UIButton) {
        var tasks = TaskManager.tasks()
        let updateTask = Task(title: tasks[index].title, date: tasks[index].date, isFavorite: !tasks[index].isFavorite)
        tasks[index] = updateTask
        TaskManager.taskUpdate(tasks: tasks)
        UserDefaults.standard.synchronize()
        
        favoriteImageSet(isfavorite: tasks[index].isFavorite, favoriteButton: favoriteButton)
    }
    
    func favoriteImageSet(isfavorite: Bool, favoriteButton: UIButton) {
        if isfavorite == false {
            let displayStatus = UIImage(systemName: "suit.heart")
            favoriteButton.setImage(displayStatus, for: .normal)
        } else {
            let displayStatus = UIImage(systemName: "suit.heart.fill")
            favoriteButton.setImage(displayStatus, for: .normal)
        }
    }
    
}

