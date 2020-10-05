//
//  CodeVerificationViewController.swift
//  5screens
//
//  Created by Константин Сабицкий on 01.10.2020.
//  Copyright © 2020 Константин Сабицкий. All rights reserved.
//

import UIKit

class CodeVerificationViewController: UIViewController {

    @IBOutlet weak var BackBtn: UIButton!
    @IBOutlet weak var CodeStackView: UIStackView!
    @IBOutlet var Code: [UITextField]!
    
    @IBOutlet weak var ResentBtn: UIButton!
    @IBOutlet weak var MinutesLabel: UILabel!
    @IBOutlet weak var ResendCodeBOTTOMConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCodeStackView()
        
    }
    
    private func setUpCodeStackView() {
        CodeStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        for item in Code {
            item.layer.cornerRadius = 20
            item.clipsToBounds = true
            
        }
        Code.last?.addTarget(self, action: #selector(CodeVerificationViewController.textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        performSegue(withIdentifier: "showPersonInfo", sender: self)
       
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPersonInfo" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "PersonInfoViewController") as! PersonInfoViewController
            
            self.present(vc, animated: true, completion: nil)
           // self.navigationController?.present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func BackBtnTapped(_ sender: UIButton) {
    }
    
    @IBAction func ResentBtnTapped(_ sender: UIButton) {
    }
    
}

extension CodeVerificationViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        print("did end")
//        if Code.last?.hasText == true {
//            performSegue(withIdentifier: "showPersonInfo", sender: self)
//        }
    }
    
    
}
