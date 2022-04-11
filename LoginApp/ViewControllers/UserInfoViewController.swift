//
//  UserInfoViewController.swift
//  LoginApp
//
//  Created by Dmitriy Starozhilov on 10.04.2022.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    var user: User!

    @IBOutlet var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = user.person.fullName
        infoLabel.text = user.person.info
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageVC = segue.destination as? ImageViewController else { return }
        imageVC.user = user
    }

}
