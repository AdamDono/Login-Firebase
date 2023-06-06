//
//  login ViewController.swift
//  Login Firebase
//
//  Created by DA M1 MAC 89 on 2023/06/06.
//

import UIKit
import Firebase

class login_ViewController: UIViewController {

    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func LoginClicked(_ sender: UIButton) {
        guard let email = EmailTextField.text, !email.isEmpty else {
            showAlert(message: "Please enter your email.")
            return
        }
        
        guard let password = PasswordTextField.text, !password.isEmpty else {
            showAlert(message: "Please enter your password.")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { firebaseResult, error in
            if let e = error {
                print("Error: \(e.localizedDescription)")
            } else {
                // Go to homescreen
                self.shouldPerformSegue(withIdentifier: "goTonext", sender: self)
            }
        }
    }

    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the  new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
