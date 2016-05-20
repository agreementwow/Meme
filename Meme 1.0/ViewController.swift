//
//  ViewController.swift
//  Meme 1.0
//
//  Created by liulei on 5/19/16.
//  Copyright © 2016 liulei. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var camera: UIBarButtonItem!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var btmTextField: UITextField!
    
    //setting font style and color
    let memeTextAttributes = [
        NSStrokeColorAttributeName : UIColor.greenColor(),
        NSForegroundColorAttributeName : UIColor.blueColor(),
        NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSStrokeWidthAttributeName : 3.0
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        topTextField.text = "TOP"
        btmTextField.text = "BOTTOM"
        topTextField.textAlignment = .Center
        btmTextField.textAlignment = .Center
        self.topTextField.delegate = self
        self.btmTextField.delegate = self
        topTextField.defaultTextAttributes = memeTextAttributes
        btmTextField.defaultTextAttributes = memeTextAttributes
    }
    
    override func viewWillAppear(animated: Bool) {
        //todo: disable the camera button when it's unavaliable
        camera.enabled = UIImagePickerController.isSourceTypeAvailable(.Camera)
    }


    //pick an image from the album
    @IBAction func pickFromAlbum(sender: UIBarButtonItem) {
        
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(controller, animated: true, completion: nil)
        
    }
    
    //pick an image by camera
    @IBAction func pickFromCamera(sender: UIBarButtonItem) {
        
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = UIImagePickerControllerSourceType.Camera
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    //set the done and cancel button after picking an image
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //clear the default text when a user taps inside a textfield
    func textFieldDidBeginEditing(textField: UITextField) {
        if topTextField.text == "TOP" {
            topTextField.text = ""
        }
        else if btmTextField.text == "BOTTOM" {
            btmTextField.text = ""
        }
    }
    
    //when a user presses return, the keyboard should be dismissed
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        topTextField.resignFirstResponder()
        btmTextField.resignFirstResponder()
        return true
    }
    
    
    
}

