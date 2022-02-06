//
//  CodePushViewController.swift
//  ScreenTransitionExample
//
//  Created by Peter on 2022/02/06.
//

import UIKit

class CodePushViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController 뷰가 로드 되었다.")
        if let name = name {
            self.nameLabel.text = name
        }
    }
    

    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
