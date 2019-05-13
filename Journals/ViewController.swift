//
//  ViewController.swift
//  Journals
//
//  Created by vic_liu on 2019/5/13.
//  Copyright © 2019 ios-class. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var newJaurnals: UILabel!

    @IBOutlet var addPhotoButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        newJaurnals.textColor = UIColor.gray
        newJaurnals.font = UIFont(name: "Helvetica-Light", size: 20)
        newJaurnals.textAlignment = .center
        newJaurnals.numberOfLines = 1
        newJaurnals.shadowColor = UIColor.black
        newJaurnals.shadowOffset = CGSize(width: 2, height: 2)
        // Do any additional setup after loading the view.
    }

    @IBAction func addPhoto(_ sender: UIButton) {

        if let govc = storyboard?.instantiateViewController(withIdentifier: "newphoto") {
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                let imagePickerVC = UIImagePickerController()
                // 設定相片的來源為行動裝置內的相本
                imagePickerVC.sourceType = .photoLibrary
                imagePickerVC.delegate = self

                // 開啟照片
                show(imagePickerVC, sender: self)

            }
            present( govc,animated: true, completion: {} )
        }
    }
}
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {




    
}
