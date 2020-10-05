//
//  UploadImageViewController.swift
//  5screens
//
//  Created by Константин Сабицкий on 05.10.2020.
//  Copyright © 2020 Константин Сабицкий. All rights reserved.
//

import UIKit

class UploadImageViewController: UIViewController {
    
    @IBOutlet weak var BackBtn: UIButton!
    @IBOutlet weak var UserPhotoImageView: UIImageView!
    
    @IBOutlet weak var BtnOnUserPhoto: UIButton!
    @IBOutlet weak var SkipBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUserPhotoImageView()
    }
    
    private func setUpUserPhotoImageView() {
        UserPhotoImageView.image = UIImage(named: "iconForIV")
    }
    
    @IBAction func DoneBtnTapped(_ sender: UIButton) {
       }

    @IBAction func SkipBtnTapped(_ sender: UIButton) {
    }
    
    @IBAction func UserPhotoTapped(_ sender: UIButton) {
    }
}
