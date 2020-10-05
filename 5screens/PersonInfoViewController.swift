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
    
    @IBOutlet weak var BirthdayStackView: UIStackView!
    
    @IBOutlet weak var DateTF: UITextField!
    
    @IBOutlet weak var ShowDateBtn: UIButton!
    
    @IBOutlet weak var NextBtnBOTTOMConstraint: NSLayoutConstraint!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    @IBAction func ShowDateBtnTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func NextBtnTapped(_ sender: UIButton) {
    }
    
}
