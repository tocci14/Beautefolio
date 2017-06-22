//  SettingMenuViewController_1.swift
//  Beautefolio


import UIKit
import Firebase
import PagingMenuController

private let unselectedRow = -1

class SettingMenuViewController_1: UIViewController,UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    var menuList: [String] = []
    var editRow: Int = unselectedRow

    @IBOutlet weak var editMenuField: UITextField!
    @IBOutlet weak var settingMenuTableView: UITableView!
    @IBAction func tapSubmitButton(_ sender: UIButton) {
        applyMenu()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if indexPath.row >= menuList.count {
            return cell
        }
        
        cell.textLabel?.text = menuList[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        if indexPath.row >= menuList.count {
            return
        }
        editRow = indexPath.row
        editMenuField.text = menuList[editRow]
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        applyMenu()
        return true
    }
    
    func applyMenu() {
        if editMenuField.text == nil {
            return
        }
        
        if editRow == unselectedRow {
            menuList.append(editMenuField.text!)
        } else {
            menuList[editRow] = editMenuField.text!
        }
        editMenuField.text = ""
        editRow = unselectedRow
        settingMenuTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingMenuTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        editMenuField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
