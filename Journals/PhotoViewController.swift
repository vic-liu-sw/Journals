//
//  PhotoViewController.swift
//  Journals
//
//  Created by vic_liu on 2019/5/13.
//  Copyright © 2019 ios-class. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet var photoImage: UIImageView!

    @IBOutlet var titleLabel: UILabel!

    @IBOutlet var inputText: UITextField!

    @IBOutlet var cancelButton: UIButton!

    @IBOutlet var checkButton: UIButton!

    @IBOutlet var newPhoto: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        let orgFileName = String(format: "savephoto%03ld.png", 1)
        ImagePhotoPicker.ImagePhotoHandler.getImage(filename: orgFileName, orgimage: photoImage)
        let imagePAth = (self.getDirectoryPath() as NSString).appendingPathComponent(orgFileName)
        print("PhotoViewimagePAth1 = \(imagePAth)")
        photoImage.image = UIImage(contentsOfFile: imagePAth)

        // Do any additional setup after loading the view.
    }

    @IBAction func saveCheckButton(_ sender: UIButton) {
        let newFileName = String(format: "savephoto%03ld.png", 2)
//        ImagePhotoPicker.ImagePhotoHandler.saveImageDocumentDirectory(filename: newFileName, selectedImage: selectedImage)

    }
    
    @IBAction func returnVCButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func newPhotoButton(_ sender: UIButton) {
        let newFileName = String(format: "savephoto%03ld.png", 2)
        ImagePhotoPicker.ImagePhotoHandler.getImage(filename: newFileName, orgimage: photoImage)
        let imagePAth = (self.getDirectoryPath() as NSString).appendingPathComponent(newFileName)
        print("PhotoViewimagePAth1 = \(imagePAth)")
        photoImage.image = UIImage(contentsOfFile: imagePAth)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    // MARK: PhotoViewController_Get Document Directory Path
    func getDirectoryPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }

}
