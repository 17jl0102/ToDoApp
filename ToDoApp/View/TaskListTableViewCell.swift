//
//  TaskListTableViewCell.swift
//  ToDoApp
//
//  Created by 角谷　悠平 on 2021/03/13.
//

import UIKit

class TaskListTableViewCell: UITableViewCell {
<<<<<<< HEAD:ToDoApp/View/TaskListTableViewCell.swift
    var tasks: [Task] = []
    let tasksData = UserDefaults.standard.data(forKey: "TasksKey")
    guard let data = tasksData else {return}
    let unArchivedData = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Task] ?? []
    tasks = unArchivedData ?? []
 
=======
    var tasks = UserDefaults.standard.array(forKey: "TasksKey") as? [[String: Any]] ?? []
    
>>>>>>> parent of f9cedbb... 途中提出:ToDoApp/TaskListTableViewCell.swift
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    var indexPath = IndexPath()
    
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
        self.tasks = task
    }
    
    @IBAction func FavoriteSelectDidTap(_ sender: UIButton) {
        var favoriteStatus = task.isFavorite
        favoriteStatus.toggle()
<<<<<<< HEAD:ToDoApp/View/TaskListTableViewCell.swift
        Task(title: task.title, date: task.date, isFavorite: favoriteStatus)
=======
        task["isFavorite"] = favoriteStatus
        tasks[indexPath.row] = task
        UserDefaults.standard.set(tasks, forKey: "TasksKey")
>>>>>>> parent of f9cedbb... 途中提出:ToDoApp/TaskListTableViewCell.swift
        if favoriteStatus == false {
            let displayStatus = UIImage(systemName: "suit.heart")
            favoriteButton.setImage(displayStatus, for: .normal)
        } else {
            let displayStatus = UIImage(systemName: "suit.heart.fill")
            favoriteButton.setImage(displayStatus, for: .normal)
        }
    }
}

