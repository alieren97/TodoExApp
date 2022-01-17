//
//  RealmManager.swift
//  TodoApp
//
//  Created by Ali Eren on 16.01.2022.
//

import Foundation
import RealmSwift

class RealmManager :ObservableObject {
    private(set) var localRealm : Realm?
    @Published private(set) var tasks :[Task] = []
    
    init(){
        openRealm()
        getTasks()
    }
    
    func openRealm(){
        
        do {
            let config = Realm.Configuration(schemaVersion:1)
            Realm.Configuration.defaultConfiguration = config
            localRealm = try Realm()
        } catch  {
            print(error)
        }
    }
    
    func addTask(taskTitle:String){
        if let localRealm = localRealm {
            do {
                try localRealm.write({
                    let newTask = Task(value: ["title":taskTitle,"completed":false])
                    localRealm.add(newTask)
                    getTasks()
                    print("Added New Task")
                })
            } catch  {
                print(error)
            }
        }
    }
    func getTasks(){
        if let localRealm = localRealm {
            let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            tasks = []
            allTasks.forEach { task in
                tasks.append(task)
            }
        }
    }
    
    func updateTask(id:ObjectId,completed:Bool){
        if let localRealm = localRealm {
            do {
                let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format:"id == %@",id))
                guard !taskToUpdate.isEmpty else {return}
                
                try localRealm.write({
                    taskToUpdate[0].completed = completed
                    getTasks()
                })
            } catch  {
                print(error)
            }
        }
    }
    
    func deleteTask(id:ObjectId){
        if let localRealm = localRealm {
            do {
                let taskToDelete = localRealm.objects(Task.self).filter(NSPredicate(format:"id == %@",id))
                guard !taskToDelete.isEmpty else {return}
                
                try localRealm.write({
                    localRealm.delete(taskToDelete)
                    getTasks()
                })
            } catch  {
                print(error)
            }
        }
    }
}
