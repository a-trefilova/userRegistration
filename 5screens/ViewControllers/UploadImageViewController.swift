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
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var BtnOnUserPhoto: UIButton!
    @IBOutlet weak var SkipBtn: UIButton!
    @IBOutlet weak var topConstraintOfBtn: NSLayoutConstraint!
    @IBOutlet weak var trailingConstraintOfBtn: NSLayoutConstraint!
    @IBOutlet weak var leadingConstaintOfBtn: NSLayoutConstraint!
    @IBOutlet weak var bottomSonstraintOfBtn: NSLayoutConstraint!
    
    private var imageHasBeenUploaded: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUserPhotoImageView()
        doneButton.setTitle("Add Photo", for: .normal)
       // setUpUploadingBtn()
    }
    
    private func setUpUserPhotoImageView() {
        UserPhotoImageView.image = UIImage(named: "iconForIV")
    }
    
    private func setUpUploadingBtn() {
        if imageHasBeenUploaded {
            doneButton.setTitle("Done", for: .normal)
            topConstraintOfBtn.isActive = false
            trailingConstraintOfBtn.isActive = false
            leadingConstaintOfBtn.isActive = false
            bottomSonstraintOfBtn.isActive = false
            
            BtnOnUserPhoto.heightAnchor.constraint(equalToConstant: 30).isActive = true
            BtnOnUserPhoto.widthAnchor.constraint(equalToConstant: 60).isActive = true
            BtnOnUserPhoto.bottomAnchor.constraint(equalTo: UserPhotoImageView.bottomAnchor, constant: -10).isActive = true
            BtnOnUserPhoto.centerXAnchor.constraint(equalTo: UserPhotoImageView.centerXAnchor, constant: 0).isActive = true
            
            BtnOnUserPhoto.frame = CGRect(x: UserPhotoImageView.bounds.maxX / 2, y: UserPhotoImageView.bounds.maxY - 10, width: 100, height: 20)
            
            BtnOnUserPhoto.setTitle("Edit", for: .normal)
            BtnOnUserPhoto.titleLabel?.textAlignment = .center
            BtnOnUserPhoto.titleLabel?.font = UIFont(name: "SFCompactRounded-Semibold", size: 17)
            BtnOnUserPhoto.titleLabel?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            BtnOnUserPhoto.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            BtnOnUserPhoto.clipsToBounds = true
            BtnOnUserPhoto.layer.cornerRadius = 15
        } else {
            
            BtnOnUserPhoto.titleLabel?.text = ""
            BtnOnUserPhoto.backgroundColor = .clear
        }
    }
   
    @IBAction func BackBtnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func DoneBtnTapped(_ sender: UIButton) {
        if imageHasBeenUploaded {
            //there could be implementation of saving image 
            self.navigationController?.popToRootViewController(animated: true)
        } else {
            let cameraIcon = UIImage(systemName: "camera")
            let photoIcon = UIImage(systemName: "folder")
            let actionSheet = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
            let camera = UIAlertAction(title: "Camera",
                                        style: .default) {_ in
                self.chooseImagePicker(source: .camera)
            }
            
            camera.setValue(cameraIcon, forKey: "image")
            camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")

            let photo = UIAlertAction(title: "Photo",
                                      style: .default) {_ in
                self.chooseImagePicker(source: .photoLibrary)
            }

            photo.setValue(photoIcon, forKey: "image")
            photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let cancel = UIAlertAction(title: "Cancel",
                                       style: .cancel)

            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)

            present(actionSheet, animated: true)
        }
    }

    @IBAction func SkipBtnTapped(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
}

extension UploadImageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        UserPhotoImageView.image = info[.editedImage] as? UIImage
        UserPhotoImageView.contentMode = .scaleAspectFill
        UserPhotoImageView.clipsToBounds = true
        UserPhotoImageView.layer.cornerRadius = 95
        
        imageHasBeenUploaded = true
        setUpUploadingBtn()
        self.view.setNeedsDisplay()
        dismiss(animated: true, completion: nil)
        
    }
}
