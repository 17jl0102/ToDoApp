//
//  TaskListViewController.swift
//  ToDoApp
//
//  Created by 角谷　悠平 on 2021/03/13.
//

import UIKit

class TaskListViewController: UIViewController {

    @IBOutlet weak var taskTableView: UITableView!
    var tasks: [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTableView.delegate = self
        taskTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        //tasks = UserDefaults.standard.array(forKey: "TasksKey") as? [[String: Any]] ?? []
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
            //UserDefaults.standard.setValue(tasks, forKey: "TasksKey")
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    func tableView(_ tableview: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "削除"
    }
}
