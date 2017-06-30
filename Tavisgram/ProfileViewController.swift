//
//  ProfileViewController.swift
//  Tavisgram
//
//  Created by Tavis Thompson on 6/28/17.
//  Copyright © 2017 Tavis Thompson. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {


    @IBOutlet weak var profilepicImageView: PFImageView!
    override func viewDidAppear(_ animated: Bool) {
//        
//        let username = PFUser.current()
//        if let userImagefile = username!["portrait"] as? PFFile {
//            print(userImagefile)
//            self.profilepicImageView.file = userImagefile
//            self.profilepicImageView.loadInBackground()
//        } else {
//            print("no profile file found")
//        }

    }
    override func viewDidLoad() {
        
        
        
        let username = PFUser.current()
        if let userImagefile = username!["portrait"] as? PFFile {
            print(userImagefile)
            self.profilepicImageView.file = userImagefile
            self.profilepicImageView.loadInBackground()
        } else {
            print("no profile file found")
        }
        
         //Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func WhenLogoutButtonIsClicked(_ sender: Any) {
        PFUser.logOutInBackground { (error: Error?) in
            NotificationCenter.default.post(name: NSNotification.Name("logoutNotification"), object: nil)
        }
    }
    
    @IBAction func whenProfilePicClicked(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {
            action in
            picker.sourceType = .camera
            self.present(picker, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {
            action in
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
//        let vc = UIImagePickerController()
//        vc.delegate = self
//        vc.allowsEditing = true
//        vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
//        self.present(vc, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image captured by the UIImagePickerController
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
//        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        self.profilepicImageView.image = originalImage
        if let user = PFUser.current(){
        user["portrait"] = Post.getPFFileFromImage(image: originalImage)
            user.saveInBackground(block: { (success:Bool, error:Error?) in
                if success{
                    print("profile picture is saved")
                }else{
                    print(error?.localizedDescription)
                }
        })
        }
        // Do something with the images (based on your use case)
        
        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
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
