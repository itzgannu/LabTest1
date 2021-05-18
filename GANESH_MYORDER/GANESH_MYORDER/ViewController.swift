//
//  ViewController.swift
//  GANESH_MYORDER
//
//  Created by admin on 5/17/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var NoOfCoffeeTextField: UITextField!
    
    @IBOutlet weak var CoffeeTypeTextField: UITextField!
    
    @IBOutlet weak var CoffeeSizeTextField: UITextField!
    
    private let dbHelper = MyOrderDBHelper.getInstance()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    private func addTaskToList(type: String, quantity: String, size: String){
        self.dbHelper.insertTask(coffee_type: type, quantity: quantity, size: size)
    }
    
    @IBAction func SaveOrderDetailsButton(_ sender: UIButton) {
        if(NoOfCoffeeTextField.text == "" || CoffeeTypeTextField.text == "" || CoffeeSizeTextField.text == ""){
            //alert message
            let alert = UIAlertController(title: "Empty Field/(s)", message: "Fields are empty. Kindly enter in all fields", preferredStyle: .alert)
             
            alert.addAction(UIAlertAction(title: "OKAY", style: .default, handler: nil))
             
            self.present(alert, animated: true)
            
        }else{
            
            //save to coredata
            addTaskToList(type: CoffeeTypeTextField.text!, quantity: NoOfCoffeeTextField.text!, size: CoffeeSizeTextField.text!)
            
            let alert = UIAlertController(title: "SUCCESS", message: "Saved details in database successfully", preferredStyle: .alert)
             
            alert.addAction(UIAlertAction(title: "OKAY", style: .default, handler: nil))
             
            self.present(alert, animated: true)        }
    }
}

