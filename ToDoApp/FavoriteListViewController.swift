//
//  FavoriteListViewController.swift
//  ToDoApp
//
//  Created by 角谷　悠平 on 2021/03/13.
//

import UIKit

class FavoriteListViewController: UIViewController {

    @IBOutlet weak var FavoriteTableView: UITableView!
    var favoriteTasks: [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FavoriteTableView.delegate = self
        FavoriteTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let tasks = UserDefaults.standard.array(forKey: "TasksKey") as? [[String: Any]] ?? []
        favoriteTasks = favoriteFilter(FilterList: tasks)
        FavoriteTableView.reloadData()
    }
    
    func favoriteFilter(FilterList: [[String: Any]]) -> [[String: Any]] {
        var favoriteTasks: [[String: Any]] = []
        for favorite in FilterList {
            let favoriteStatus = favorite["isFavorite"] as! Bool
            if favoriteStatus == true {
                favoriteTasks.append(favorite)
            }
        }
        return favoriteTasks
    }
}

extension FavoriteListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FavoriteTableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as! FavoriteListTableViewCell
        cell.titleLabel.text = favoriteTasks[indexPath.row]["title"] as? String ?? ""
        cell.dateLabel.text = favoriteTasks[indexPath.row]["date"] as? String ?? ""
        
        return cell
    }
}
