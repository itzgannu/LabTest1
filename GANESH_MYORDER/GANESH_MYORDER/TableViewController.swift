//
//  TableViewController.swift
//  GANESH_MYORDER
//
//  Created by admin on 5/17/21.
//

import UIKit

class TableViewController: UITableViewController {
    private let dbHelper = MyOrderDBHelper.getInstance()
    private var taskList : [MyOrder] = [MyOrder]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchAllTodos()
        
        self.tableView.rowHeight = 200
        
        self.setUpLongPressGesture()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    private func displayCustomAlert(indexPath: IndexPath?, title: String, message: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if (indexPath != nil){
            alert.addTextField{(textField: UITextField) in
                textField.text = self.taskList[indexPath!.row].coffee_type
            }
            
            alert.addTextField{(textField: UITextField) in
                textField.text = self.taskList[indexPath!.row].quantity
            }
            
            alert.addTextField{(textField: UITextField) in
                textField.text = self.taskList[indexPath!.row].size
            }
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in
            if let typeText = alert.textFields?[0].text, let sizeText = alert.textFields?[1].text, let quantityText = alert.textFields?[2].text{
                
                if (indexPath != nil){
                    //update the task in existing list
                    self.updateTaskInList(indexPath: indexPath!, type: typeText, size: sizeText, quantity: quantityText)
                }
            }
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func updateTaskInList(indexPath: IndexPath, type: String, size: String, quantity: String){
        self.taskList[indexPath.row].coffee_type = type
        self.taskList[indexPath.row].size = size
        self.taskList[indexPath.row].quantity = quantity
        
        
        self.dbHelper.updateTask(updatedTask: self.taskList[indexPath.row])
        self.fetchAllTodos()
    }
    private func setUpLongPressGesture(){
        let longPressGesture: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        
        longPressGesture.minimumPressDuration = 1.0 //1 second
        
        self.tableView.addGestureRecognizer(longPressGesture)
    }
    
    @objc
    private func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer){
        if gestureRecognizer.state == .ended{
            let touchPoint = gestureRecognizer.location(in: self.tableView)
            
            if let indexPath = self.tableView.indexPathForRow(at: touchPoint){
                
                self.displayCustomAlert(indexPath: indexPath, title: "Edit Order", message: "Please provide the updated order details")
            }
        }
    }
    private func fetchAllTodos(){
        if (self.dbHelper.getAllTasks() != nil){
            self.taskList = self.dbHelper.getAllTasks()!
            self.tableView.reloadData()
        }else{
            print(#function, "No data received from database")
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.taskList.count
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        //delete the task
        if (editingStyle == UITableViewCell.EditingStyle.delete && indexPath.row < self.taskList.count){
            //ask for the user confirmation
            self.deleteTaskFromList(indexPath: indexPath)
        }
    }
    private func deleteTaskFromList(indexPath: IndexPath){
        self.dbHelper.deleteTask(taskID: self.taskList[indexPath.row].id!)
        self.fetchAllTodos()
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell_order_details", for: indexPath) as! TableViewCell
        
        if indexPath.row < taskList.count{
            
            let currentTodo = self.taskList[indexPath.row]
            
            cell.CoffeeSizeLbl.text = "Coffee Size - \(String(describing: currentTodo.size!))"
            cell.CoffeeTypeLbl.text = "Coffee Type - \(String(describing: currentTodo.coffee_type!))"
            cell.NoOfCoffeeLbl.text = "No Of Coffee - \(String(describing: currentTodo.quantity!))"
            cell.OrderDate.text = "Order created on - \(currentTodo.date!)"
        }
        
        return cell

    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
