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

        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePickerVC = UIImagePickerController()
            // 設定相片的來源為行動裝置內的相本
            imagePickerVC.sourceType = .photoLibrary
            imagePickerVC.delegate = self
            // 開啟照片
            show(imagePickerVC, sender: self)
        }
    }
}
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        // MARK: 取得拍下來的照片
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        let fileName = String(format: "savephoto%03ld.png", 1)
        print("selectedImage & fileName = \(selectedImage) + \(fileName)")
        ImagePhotoPicker.ImagePhotoHandler.saveImageDocumentDirectory(filename: fileName, selectedImage: selectedImage)
        dismiss(animated: true, completion: nil)
        if let govc = storyboard?.instantiateViewController(withIdentifier: "newphoto") as? PhotoViewController {
            present(govc, animated: true, completion: {})
        }
    }
}
