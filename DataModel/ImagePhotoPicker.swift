//
//  ImagePhotoPicker.swift
//  Viseeo stop
//
//  Created by vic_liu on 2018/10/31.
//  Copyright © 2018 Viseeo. All rights reserved.
//

import UIKit

class ImagePhotoPicker: NSObject {

     static let ImagePhotoHandler = ImagePhotoPicker()
    //MARK:Save Image At Document Directory
    func saveImageDocumentDirectory(filename:String, selectedImage:UIImage) {

        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(filename)
        print("file-paths  = \(paths))")
        let imageData = selectedImage.pngData()
        if fileManager.createFile(atPath: paths as String, contents: imageData, attributes: nil) {
            print("檔案建立成功")
        } else {
            print("檔案建立失敗")
        }
    }
    //MARK:Get Image from Document Directory
    func getMenuImage(filename:String, orgimage:UIImageView){
        let fileManager = FileManager.default
        let imagePAth = (self.getDirectoryPath() as NSString).appendingPathComponent(filename)
        print("menuimagePAth = \(imagePAth)")
        if fileManager.fileExists(atPath: imagePAth){
            let image = UIImage(contentsOfFile: imagePAth)
            orgimage.image = image
            print("image檔案存在 = \(String(describing: image))")
        }else{
            print("No Image")
        }
    }
    //MARK:Get Image from Document Directory
    func getImage(filename:String, orgimage:UIImageView){
        let fileManager = FileManager.default
        let imagePAth = (self.getDirectoryPath() as NSString).appendingPathComponent(filename)
        print("imagePAth = \(imagePAth)")
        if fileManager.fileExists(atPath: imagePAth){
            let image = UIImage(contentsOfFile: imagePAth)
            orgimage.image = image
            print("image檔案存在 = \(String(describing: image))")
        }else{
            print("No Image")
        }
    }
    //MARK:Get Document Directory Path
    func getDirectoryPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    //MARK:CreateDirectory
    func createDirectory(){
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("customDirectory")
        if !fileManager.fileExists(atPath: paths){
            try! fileManager.createDirectory(atPath: paths, withIntermediateDirectories: true, attributes: nil)
        }else{
            print("Already dictionary created.")
        }
    }
    //MARK:Delete Directory
    func deleteDirectory(){
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("customDirectory")
        if fileManager.fileExists(atPath: paths){
            try! fileManager.removeItem(atPath: paths)
        }else{
            print("Something wronge.")
        }
    }
}
