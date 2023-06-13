//
//  CreateAccountViewController.swift
//  Login Firebase
//
//  Created by DA M1 MAC 89 on 2023/06/06.
//

import UIKit
 import Firebase

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func CreateButtonClicked(_ sender: UIButton) {
        guard let email = EmailTextField.text, !email.isEmpty else {
            showAlert(message: "Please enter your email.")
            return
        }
        
        guard let password = PasswordTextField.text, !password.isEmpty else {
            showAlert(message: "Please enter your password.")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] _, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                self?.showAlert(message: "Account creation failed.")
            } else {
                // Account created successfully
                DispatchQueue.main.async {
                    self?.showAlert(message: "Account successfully created.") {
//                        self.shouldPerformSegue(withIdentifier: "goTonext", sender: self)
                    }
                }
            }
        }
    }

    func showAlert(message: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: "Status", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }




