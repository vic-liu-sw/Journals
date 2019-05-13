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

        inputText.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func saveCheckButton(_ sender: UIButton) {
      //  let newFileName = String(format: "savephoto%03ld.png", 2)
        let point = CGPoint.init(x: 100, y: 200)
        guard let inputText = inputText.text else {fatalError("inputText error") }
        guard let inPhotoImage = photoImage.image else {fatalError(" inPhotoImage error ") }
        let resultPhoto = textToImage(drawText: inputText, inImage: inPhotoImage, atPoint: point)
        photoImage.image = resultPhoto
      //  ImagePhotoPicker.ImagePhotoHandler.saveImageDocumentDirectory(filename: newFileName, selectedImage: resultPhoto)

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

    func textToImage(drawText text: String, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
        let textColor = UIColor.red
        let textFont = UIFont(name: "Helvetica Bold", size: 30)!

        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)

        let textFontAttributes = [
            NSAttributedString.Key.font: textFont,
            NSAttributedString.Key.foregroundColor: textColor,
            ] as [NSAttributedString.Key : Any]
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))

        let rect = CGRect(origin: point, size: image.size)
        text.draw(in: rect, withAttributes: textFontAttributes)

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }


}

extension PhotoViewController: UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {
        //結束輸入
        if let inputContent = inputText.text,
            inputContent.count > 0 {
           inputText.text = inputContent
        } else {
            let alertController = UIAlertController(title: "Warning",
                                                    message: "Please Enter Name！",
                                                    preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK",
                                         style: .default,
                                         handler: { (action) in
                                            // 補充 -->
                                            self.inputText.becomeFirstResponder()  //可讓你編輯
            })

            inputText.resignFirstResponder()  //無法做編輯
            alertController.addAction(okAction)
            present(alertController,
                    animated: true,
                    completion: {
                        print("Show Alert Message")
            })
        }
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        //開始輸入
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 結束編輯 把鍵盤隱藏起來
        self.view.endEditing(true)
        return true
    }
}
