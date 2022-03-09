//
//  ViewController.swift
//  TwoViewsApp
//
//  Created by Dmitriy Starozhilov on 08.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var userName: UITextField!
    @IBOutlet var userPassword: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userWelcome = userName.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
    }
    
    @IBAction func actionButtonLogin() {
        if userName.text == "Admin" && userPassword.text == "root" {
            userPassword.text = ""
        } else {
            showAlert(title: "Invalid login or password", message: "Please, enter correct login and password")
            userPassword.text = ""
        }
    }
    
    @IBAction func actionButtonForgotUser() {
        showAlert(title: "Oops!", message: "Your name is Admin 😉")
    }
    
    @IBAction func actionButtonForgotPassword() {
        showAlert(title: "Oops!", message: "Your password is root 😉")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let welcomeVC = segue.source as? WelcomeViewController else { return }
        userName.text = ""
        userPassword.text = ""
    }
    
}

// MARK: - Private Methods
extension ViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

