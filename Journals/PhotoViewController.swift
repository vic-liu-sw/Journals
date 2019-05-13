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

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
