//
//  TaskListViewController.swift
//  ToDo-App
//
//  Created by Bahittin on 12.07.2023.
//

import UIKit

class TaskListViewController: UITableViewController {
     
    var allTasks = [TodoModel(taskName: "default", status: 1, priorty: 3)]
    
    @IBOutlet var TaskListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TaskListTableView.delegate = self
        TaskListTableView.dataSource = self
        
        if let myData = UserDefaults.standard.value(forKey: "SavedTasks") as? Data {
            allTasks = try! PropertyListDecoder().decode(Array<TodoModel>.self, from: myData)
            print(allTasks)
        }
    }
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return allTasks.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = allTasks[indexPath.row].taskName
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        if let myData = UserDefaults.standard.value(forKey: "SavedTasks") as? Data {
            allTasks = try! PropertyListDecoder().decode(Array<TodoModel>.self, from: myData)
            print(allTasks)
        }
        self.TaskListTableView.reloadData()
    }
}
