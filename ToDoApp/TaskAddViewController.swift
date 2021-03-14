//
//  ViewController.swift
//  ToDoApp
//
//  Created by 角谷　悠平 on 2021/03/13.
//

import UIKit

class TaskAddViewController: UIViewController {
    var datePicker: UIDatePicker = UIDatePicker()
    
    @IBOutlet weak var titleAddText: UITextField!
    
    @IBOutlet weak var dateAddText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
    }
    
    func createDatePicker() {
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.timeZone = NSTimeZone.local
        datePicker.locale = Locale.current
        dateAddText.inputView = datePicker
        datePicker.preferredDatePickerStyle = .wheels
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(title: "完了", style: .plain, target: self, action: #selector(doneDidTap))
        toolbar.setItems([spacelItem, doneItem], animated: true)
        
        dateAddText.inputView = datePicker
        dateAddText.inputAccessoryView = toolbar
    }
    
    @objc func doneDidTap() {
        dateAddText.resignFirstResponder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateAddText.text = dateFormatter.string(from: Date())
    }
    
    func alert(alertTitle: String, alertMessage: String) {
        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true)
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        guard let title = titleAddText.text,
              let date = dateAddText.text,
              !title.isEmpty,
              !date.isEmpty
        else{
            alert(alertTitle: "エラー", alertMessage: "適切な値を入力してください")
            return
        }
        
        let task: [String: Any] = ["title": title, "date": date, "isFavorite": false]
        //var savedTasks = UserDefaults.standard.array(forKey: "TasksKey") as? [[String: Any]] ?? []
        savedTasks.append(task)
        //UserDefaults.standard.set(savedTasks, forKey: "TasksKey")
        dismiss(animated: true, completion: nil)
    }
    
    
    
}

