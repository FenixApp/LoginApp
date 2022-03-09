//
//  WelcomeViewController.swift
//  TwoViewsApp
//
//  Created by Dmitriy Starozhilov on 09.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var nameUserWelcome: UILabel!
    
    var userWelcome: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameUserWelcome.text = userWelcome
    }
    
}
