//
//  PhoneNumberViewController.swift
//  5screens
//
//  Created by Константин Сабицкий on 01.10.2020.
//  Copyright © 2020 Константин Сабицкий. All rights reserved.
//

import UIKit

class PhoneNumberViewController: UIViewController {

    @IBOutlet weak var CloseBtn: UIButton!
    
    @IBOutlet weak var BcViewForStackView: UIView!
    
    @IBOutlet weak var PhoneNumberStackView: UIStackView!
    
    @IBOutlet weak var CountryCodeTF: UITextField!
    
    @IBOutlet weak var DropDownBtn: UIButton!
    
    @IBOutlet weak var PhoneNumberTF: UITextField!
   
    @IBOutlet weak var NextBtnBOTTOMConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpStackView()
    }
    
    private func setUpStackView() {
        PhoneNumberStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        BcViewForStackView.layer.cornerRadius = 20
        BcViewForStackView.clipsToBounds = true
        PhoneNumberStackView.clipsToBounds = true
    }
    
    private func setUpTextField() {
        
    }
 
    
    @IBAction func CloseBtnTapped(_ sender: UIButton) {
    }
    
    @IBAction func NextBtnTapped(_ sender: UIButton) {
    }
}
