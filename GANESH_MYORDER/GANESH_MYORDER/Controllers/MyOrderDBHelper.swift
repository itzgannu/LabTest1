//
//  MyOrderDBHelper.swift
//  GANESH_MYORDER
//
//  Created by admin on 5/17/21.
//

import Foundation
import CoreData
import UIKit

class MyOrderDBHelper{
    
    //singleton instance (pattern)
    private static var shared : MyOrderDBHelper?
    
    static func getInstance() -> MyOrderDBHelper {
        if shared != nil{
            return shared!
        }else{
            shared = MyOrderDBHelper(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
            return shared!
        }
    }
    
    private let moc : NSManagedObjectContext
    private let ENTITY_NAME = "MyOrder"
    
    private init(context: NSManagedObjectContext){
        self.moc = context
    }
    
    func insertTask(coffee_type: String, quantity: String, size: String){
        do{
            
            let taskToBeInserted = NSEntityDescription.insertNewObject(forEntityName: ENTITY_NAME, into: self.moc) as! MyOrder
            
            taskToBeInserted.coffee_type = coffee_type
            taskToBeInserted.quantity = quantity
            taskToBeInserted.id = UUID()
            taskToBeInserted.size = size
            taskToBeInserted.date = Date()
            
            if self.moc.hasChanges{
                try self.moc.save()
                print(#function, "Data is saved successfully")
            }
            
        }catch let error as NSError{
            print(#function, "Could not save the data \(error)")
        }
    }
    
    private func searchTask(taskID : UUID) -> MyOrder?{
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: ENTITY_NAME)
        let predicateID = NSPredicate(format: "id == %@", taskID as CVarArg)
        fetchRequest.predicate = predicateID
        
        do{
            
            let result = try self.moc.fetch(fetchRequest)
            if result.count > 0{
                return result.first as? MyOrder
            }
            
        }catch let error as NSError{
            print(#function, "Unable to search for task \(error)")
        }
        
        return nil
        
    }
    
    func updateTask(updatedTask: MyOrder){
        let searchResult = self.searchTask(taskID: updatedTask.id! as UUID)
        
        if (searchResult != nil){
            //matching task found
            
            do{
                
                let taskToUpdate = searchResult!
                
                taskToUpdate.coffee_type = updatedTask.coffee_type
                taskToUpdate.quantity = updatedTask.quantity
                taskToUpdate.size = updatedTask.size
                
                try self.moc.save()
                print(#function, "Task Updated Successfully")
                
            }catch let error as NSError{
                print(#function, "Unable to update task \(error)")
            }
            
        }else{
            print(#function, "No matching task found")
        }
    }
    
    func deleteTask(taskID : UUID){
        let searchResult = self.searchTask(taskID: taskID)
        
        if (searchResult != nil){
            //matching object found
            do{
                
                self.moc.delete(searchResult!)
                try self.moc.save()
                
//                let delegate = UIApplication.shared.delegate as! AppDelegate
//                delegate.saveContext()
                
                print(#function, "Task deleted successfully")
                
                
            }catch let error as NSError{
                print(#function, "Couldn't delete task \(error)")
            }
        }else{
            print(#function, "No matching record found")
        }
    }
    
    func getAllTasks() -> [MyOrder]? {
        let fetchRequest = NSFetchRequest<MyOrder>(entityName: ENTITY_NAME)
        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "date", ascending: false)]
        
        do{
            let result = try self.moc.fetch(fetchRequest)
            print(#function, "Fetched data : \(result as [MyOrder])")
            
            return result as [MyOrder]
            
        }catch let error as NSError{
            print(#function, "Could not fetch data from Database \(error)")
        }
        
        return nil
    }
    
}
