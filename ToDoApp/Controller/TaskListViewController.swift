//
//  TaskListViewController.swift
//  ToDoApp
//
//  Created by 角谷　悠平 on 2021/03/13.
//

import UIKit

class TaskListViewController: UIViewController {

    @IBOutlet weak var taskTableView: UITableView!
    var tasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTableView.delegate = self
        taskTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
<<<<<<< HEAD:ToDoApp/Controller/TaskListViewController.swift
        
        let tasksData = UserDefaults.standard.data(forKey: "TasksKey")
        guard let data = tasksData else {return}
        let unArchivedData = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Task] ?? []
        tasks = unArchivedData ?? []
=======
        tasks = UserDefaults.standard.array(forKey: "TasksKey") as? [[String: Any]] ?? []
>>>>>>> parent of f9cedbb... 途中提出:ToDoApp/TaskListViewController.swift
        taskTableView.reloadData()
    }
    
    @IBAction func taskAddDidTap(_ sender: UIButton) {
        let taskAddViewController = storyboard?.instantiateViewController(withIdentifier: "TaskAddViewController")
        present(taskAddViewController!, animated: true, completion: nil)
    }
}

extension TaskListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = taskTableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskListTableViewCell
        cell.indexPath = indexPath
        cell.setup(task: tasks[indexPath.row], indexPath: cell.indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            tasks.remove(at: indexPath.row)
<<<<<<< HEAD:ToDoApp/Controller/TaskListViewController.swift
            let tasksArchived = try! NSKeyedArchiver.archivedData(withRootObject: tasks, requiringSecureCoding: false)
            UserDefaults.standard.set(tasksArchived, forKey: "TasksKey")
=======
            UserDefaults.standard.setValue(tasks, forKey: "TasksKey")
>>>>>>> parent of f9cedbb... 途中提出:ToDoApp/TaskListViewController.swift
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    func tableView(_ tableview: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "削除"
    }
}
