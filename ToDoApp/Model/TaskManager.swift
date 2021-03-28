//
//  TaskManager.swift
//  ToDoApp
//
//  Created by 角谷　悠平 on 2021/03/21.
//

import Foundation

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
        taskUpdate(tasks: tasks)
        UserDefaults.standard.synchronize()
    }
    
    static func taskUpdate(tasks: [Task]) {
        let tasksArchived = try! NSKeyedArchiver.archivedData(withRootObject: tasks, requiringSecureCoding: false)
        UserDefaults.standard.set(tasksArchived, forKey: "TasksKey")
    }
}
