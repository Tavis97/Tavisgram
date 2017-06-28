//
//  LoginViewController.swift
//  Tavisgram
//
//  Created by Tavis Thompson on 6/27/17.
//  Copyright © 2017 Tavis Thompson. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }
    
    @IBAction func WhenSignInClicked(_ sender: Any) {
        
        PFUser.logInWithUsername(inBackground: usernameTextField.text!, password: passwordTextField.text!){ (user: PFUser?, error: Error?) in
            if user != nil{
                
                print ("Sign In successful")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            
            }
        }

        
    }
   
   
    @IBAction func whenSignUpclicked(_ sender: Any) {
        
        let newUser = PFUser()
        
        newUser.username = usernameTextField.text
        newUser.password = passwordTextField.text
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if  success{
                print("Yay, New User is created ")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                
                
            }else{
            print(error?.localizedDescription ?? " Malfucntion")
                
        }
    
        }
    }
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
