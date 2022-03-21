//
//  AddAlarmViewController.swift
//  12_Drink
//
//  Created by Peter on 2022/03/21.
//


import UIKit

class AddAlarmViewController: UIViewController {
    var pickedDate: ((_ date: Date) -> Void)?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        pickedDate?(datePicker.date)
        
        
        self.dismiss(animated: true)
    }
    
    
}
