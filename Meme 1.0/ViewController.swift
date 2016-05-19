//
//  ViewController.swift
//  Meme 1.0
//
//  Created by liulei on 5/19/16.
//  Copyright © 2016 liulei. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var camera: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
}

