//
//  LoginViewController.swift
//  TwoViewsApp
//
//  Created by Dmitriy Starozhilov on 08.03.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var textFieldName: UITextField!
    @IBOutlet var textFieldPassword: UITextField!
    
    private let user = User.getUserData()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        viewControllers.forEach {
            if let welcomeVC = $0 as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = $0 as? UINavigationController {
                guard let userInfoVC = navigationVC.topViewController as? UserInfoViewController else { return }
                userInfoVC.user = user
            }
        }
    }
    
    @IBAction func buttonLoginPressed() {
        guard textFieldName.text == user.login, textFieldPassword.text == user.password else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: textFieldPassword
            )
            return
        }
        performSegue(withIdentifier: "openWelcomeVC", sender: nil)
    }
    @IBAction func showAuthorizationData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops!", message: "Your name is \(user.login)")
        : showAlert(title: "Oops!", message: "Your password is \(user.password)")
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        textFieldName.text = ""
        textFieldPassword.text = ""
    }
    
}

// MARK: - Alert Controller
extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Keyboard
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFieldName {
            textFieldPassword.becomeFirstResponder()
        } else {
            buttonLoginPressed()
        }
        return true
    }
}
