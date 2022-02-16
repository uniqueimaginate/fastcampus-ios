//
//  MainViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by Peter on 2022/02/16.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?
            .interactivePopGestureRecognizer?
            .isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }

    @IBAction func logoutButtonTapped(_ sender: Any) {
        self.navigationController?
            .popViewController(animated: true)
        
    }
    
}
