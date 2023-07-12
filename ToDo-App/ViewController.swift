//
//  ViewController.swift
//  ToDo-App
//
//  Created by Bahittin on 12.07.2023.
//

import UIKit

class ViewController: UIViewController {
    struct Task: Codable {
        var taskName: String
        var status: Int
        var priorty: Int
    }
    var allTasks = [Task(taskName: "default", status: 1, priorty: 3)]
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var prioritySegControl: UISegmentedControl!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let myData = UserDefaults.standard.value(forKey: "SavedTasks") as? Data {
            allTasks = try! PropertyListDecoder().decode(Array<Task>.self, from: myData)
            print(allTasks)
        }
    }
    @IBAction func saveNewTaskButton(_ sender: UIButton) {
        let newTask = Task(taskName: taskNameTextField.text!, status: 1, priorty: prioritySegControl.selectedSegmentIndex)
        allTasks.append(newTask)
        UserDefaults.standard.set(try? PropertyListEncoder().encode(allTasks),forKey: "SavedTasks")
    }
}

