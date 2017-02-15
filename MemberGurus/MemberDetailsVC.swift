//
//  MemberDetailsVC.swift
//  MemberGurus
//
//  Created by Nam on 2/14/17.
//  Copyright © 2017 Nam. All rights reserved.
//

import UIKit
import CoreData

class MemberDetailsVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
//    @IBOutlet weak var platformPicker: UIPickerView!
//    @IBOutlet weak var platformField: CustomTextField!
//    @IBOutlet weak var nameField: CustomTextField!
//    @IBOutlet weak var ageField: CustomTextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var platformTextField: UITextField!
    @IBOutlet weak var platformPicker: UIPickerView!
    

    var platforms = [Platform]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let topItem = self.navigationController?.navigationBar.topItem{
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        platformPicker.delegate = self
        platformPicker.dataSource = self
        
//        let platform1 = Platform(context: context)
//        platform1.platform = "iOS"
//        
//        let platform2 = Platform(context: context)
//        platform2.platform = "Android"
//
//        let platform3 = Platform(context: context)
//        platform3.platform = "Ruby on Rails"
//        
//        
//        ad.saveContext()
        
        getPlatform()

        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let platform = platforms[row]
        return platform.platform
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return platforms.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //update when selected
    }
    
    func getPlatform(){
        let fetchRequest: NSFetchRequest<Platform> = Platform.fetchRequest()
        
        do{
            self.platforms = try context.fetch(fetchRequest)
            self.platformPicker.reloadAllComponents()
        } catch {
            //handle the error
        }
    }

    @IBAction func savePressed(_ sender: UIButton) {
        let member = Member(context: context)
        
        if let name = nameTextField.text{
            member.name = name
        }
        
        if let age = ageTextField.text{
            member.age = Int16((age as NSString).intValue)
        }
        
        //member.toPlatform = platforms[platformPicker.selectedRow(inComponent: 0)]
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
    }

    

}
