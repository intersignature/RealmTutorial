//
//  MainTableViewController.swift
//  RealmSwiftTutorial
//
//  Created by User23 on 2/3/2563 BE.
//  Copyright © 2563 Sirichai. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class MainTableViewController: UITableViewController {
    
//    var modelList = TaskListModel()
    
    var modelList = List<TaskModel>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        guard let allTasks = RealmDatabase.shareInstance.get(type: TaskModel.self) else { return }
        
        for task in allTasks {
            modelList.append(task)
        }
        
        tableView.reloadData()
    }
    
    @objc func add() {
        let alertController = UIAlertController.init(title: "New Task", message: "Enter Task name", preferredStyle: .alert)
        var alertTf: UITextField!
        alertController.addTextField { (tf) in
            alertTf = tf
            tf.placeholder = "Task name"
        }
        alertController.addAction(.init(title: "Add", style: .default, handler: { (_) in
            guard let text = alertTf.text, !text.isEmpty else { return }
            
            let model = TaskModel(value: ["text": text, "id": String((Int(self.modelList.max()?.id ?? "0") ?? 0)+1)])
            
            if RealmDatabase.shareInstance.save(object: model) {
                
                self.modelList.append(model)
                self.tableView.reloadData()
            }
            
        }))
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK : Delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editAction = UITableViewRowAction.init(style: .normal, title: "edit") { (_, indexPath) in
            let alertController = UIAlertController.init(title: "Edit Task", message: "Enter New Task name", preferredStyle: .alert)
            var alertTf: UITextField!
            alertController.addTextField { (tf) in
                alertTf = tf
                tf.placeholder = self.modelList[indexPath.row].text
            }
            alertController.addAction(.init(title: "Edit", style: .default, handler: { (_) in
                guard let text = alertTf.text, !text.isEmpty else { return }
                
                let model = self.modelList[indexPath.row]
                
                do {
                    try RealmDatabase.shareInstance.realm.write {
                        model.text = text
                    }
                } catch {
                    print(error.localizedDescription)
                }
                
                self.tableView.reloadData()
            }))
            
            alertController.addAction(.init(title: "Cancel", style: .destructive, handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        let deleteAction  = UITableViewRowAction.init(style: .destructive, title: "delete") { (_, indexPath) in
            let alertController = UIAlertController.init(title: "Delete Task", message: "Delete Task", preferredStyle: .alert)
            alertController.addAction(.init(title: "Delete", style: .default, handler: { (_) in
                
                let model = self.modelList[indexPath.row]
                
                if RealmDatabase.shareInstance.delete(object: model) {
                    self.modelList.remove(at: indexPath.row)
                    self.tableView.reloadData()
                }
            }))
            
            alertController.addAction(.init(title: "Cancel", style: .destructive, handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        return [deleteAction, editAction]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = modelList[indexPath.row]
        let alertController = UIAlertController.init(title: "id: \(model.id)", message: nil, preferredStyle: .alert)
        alertController.addAction(.init(title: "Close", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    
    // MARK : Datasource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return .init(frame: .zero) }
        let item = modelList[indexPath.row]
        cell.textLabel?.text = item.text
        cell.textLabel?.alpha = item.completed ? 0.5 : 1
        return cell
    }
}
