//
//  FavoriteListViewController.swift
//  ToDoApp
//
//  Created by 角谷　悠平 on 2021/03/13.
//

import UIKit

class FavoriteListViewController: UIViewController {
    
    @IBOutlet weak var FavoriteTableView: UITableView!
    var favoriteTasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FavoriteTableView.delegate = self
        FavoriteTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let tasks = TaskManager.tasks()
        favoriteTasks = favoriteFilter(FilterList: tasks)
        FavoriteTableView.reloadData()
    }
    
    func favoriteFilter(FilterList: [Task]) -> [Task] {
        var favoriteTasks: [Task] = []
        for favorite in FilterList {
            let favoriteStatus = favorite.isFavorite
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
        cell.titleLabel.text = favoriteTasks[indexPath.row].title
        cell.dateLabel.text = favoriteTasks[indexPath.row].date
        
        return cell
    }
}
