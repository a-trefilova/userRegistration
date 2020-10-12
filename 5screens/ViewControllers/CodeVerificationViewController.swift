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
    
    private var timer:  Timer?
    private var timerMinutes: Int = 1
    private var timerSeconds = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCodeStackView()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(decreaseSeconds), userInfo: nil, repeats: true)
    }
    
    private func setUpCodeStackView() {
        
        CodeStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        var itemTag = 0
        for item in Code {
            item.delegate = self
            item.tag = itemTag
            itemTag += 1
            
            item.textContentType = .oneTimeCode
            item.layer.cornerRadius = 20
            item.clipsToBounds = true
            
        }
        
        Code.first?.addTarget(self, action: #selector(CodeVerificationViewController.textFieldDidChange), for: .editingChanged)
    }
    
    @objc func decreaseSeconds() {
        ResentBtn.isUserInteractionEnabled = false
        guard !(timerMinutes == 0 && timerSeconds == 1) else {
            timer?.invalidate()
            timer = nil
            ResentBtn.isUserInteractionEnabled = true
            return
        }
        timerSeconds -= 1
        if timerSeconds < 10 {
            MinutesLabel.text? = String(timerMinutes) + ":0" + String(timerSeconds)
        } else {
            MinutesLabel.text? = String(timerMinutes) + ":" + String(timerSeconds)
        }
        
        if timerSeconds == 0 {
            timerMinutes -= 1
            timerSeconds = 60
        }
        
    }
    
    @objc func keyboardWasShown(notification: NSNotification) {
        let info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue

        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.ResendCodeBOTTOMConstraint.constant = keyboardFrame.size.height
        })
    }
    
    
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PersonInfoViewController") as! PersonInfoViewController
        self.navigationController?.pushViewController(vc, animated: true)
       
    }
    
    
    @IBAction func BackBtnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func ResentBtnTapped(_ sender: UIButton) {
        timerMinutes = 1
        timerSeconds = 60
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(decreaseSeconds), userInfo: nil, repeats: true)
    }
    
}

extension CodeVerificationViewController: UITextFieldDelegate {

    //DOESNT WORK
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
            if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
               nextField.becomeFirstResponder()
            } else {
               // Not found, so remove keyboard.
               textField.resignFirstResponder()
            }
            // Do not add a line break
            return false

    }
    
    
}
