//
//  PersonInfoViewController.swift
//  5screens
//
//  Created by Константин Сабицкий on 02.10.2020.
//  Copyright © 2020 Константин Сабицкий. All rights reserved.
//

import UIKit

class PersonInfoViewController: UIViewController {
    
    @IBOutlet weak var BackBtn: UIButton!
    
    @IBOutlet weak var NameTF: UITextField!
    @IBOutlet weak var NameBcView: UIView!
    
    @IBOutlet weak var BirthdayBcView: UIView!
    @IBOutlet weak var BirthdayStackView: UIStackView!
    
    @IBOutlet weak var DateTF: UITextField!
    
    @IBOutlet weak var ShowDateBtn: UIButton!
    
    @IBOutlet weak var NextBtnBOTTOMConstraint: NSLayoutConstraint!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTextFields()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func keyboardWasShown(notification: NSNotification) {
        let info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue

        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.NextBtnBOTTOMConstraint.constant = keyboardFrame.size.height  - 25
        })
    }
    
    private func setUpTextFields() {
        NameTF.heightAnchor.constraint(equalToConstant: 50).isActive = true
        NameBcView.layer.cornerRadius = 15
        NameBcView.clipsToBounds = true
        NameTF.clipsToBounds = true
        
        
        BirthdayStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        BirthdayBcView.layer.cornerRadius = 15
        BirthdayBcView.clipsToBounds = true
        BirthdayStackView.clipsToBounds = true
    }
    
    @IBAction func BackBtnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func ShowDateBtnTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func NextBtnTapped(_ sender: UIButton) {
    }
    
}
