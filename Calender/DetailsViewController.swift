//
//  DetailsViewController.swift
//  Calender
//
//  Created by Maho Misumi on 2018/02/24.
//  Copyright © 2018年 Maho Misumi. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet var taskTextField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    

    var saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        taskTextField.delegate = self
        taskTextField.text = saveData.object(forKey: "Task") as? String
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save(){
        
        saveData.set(taskTextField.text, forKey: "Task")
        let alert: UIAlertController = UIAlertController(title:"タイトル", message: "本文を入れます。",preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(
                title: "OK!",
                style: .default,
                handler: { action in
                    //          ボタンが押された時の動作
                   self.navigationController?.popViewController(animated: true)
            }
        )
        )
        present(alert, animated: true,completion: nil)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        taskTextField.resignFirstResponder()
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
