//
//  CompsoseViewController.swift
//  Tavisgram
//
//  Created by Tavis Thompson on 6/27/17.
//  Copyright © 2017 Tavis Thompson. All rights reserved.
//

import UIKit
import Parse

class CompsoseViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var editedImageView: UIImageView!
    
    @IBOutlet weak var captionTextField: UITextField!
    var imageToAdd = UIImage?.self
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func whenLibraryButtonClicked(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(vc, animated: true, completion: nil)

    }
    
    @IBAction func cameraButton(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.camera
        
        self.present(vc, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image captured by the UIImagePickerController
//        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        self.editedImageView.image = editedImage
        
        // Do something with the images (based on your use case)
        
        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onclick(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    
    @IBAction func whenPostButtonisClicked(_ sender: Any) {
        
        Post.postUserImage(image: self.editedImageView.image, withCaption: self.captionTextField.text) { (sucess: Bool, error: Error?) in
            if sucess{
                print("sucessfully saved")
            }else {
                print(error?.localizedDescription ?? "Malfuction")
            }
        }
        
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    /*

*/
}
