//
//  PhoneNumberViewController.swift
//  5screens
//
//  Created by Константин Сабицкий on 01.10.2020.
//  Copyright © 2020 Константин Сабицкий. All rights reserved.
//

import UIKit

class PhoneNumberViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var CloseBtn: UIButton!
    @IBOutlet weak var BcViewForStackView: UIView!
    @IBOutlet weak var PhoneNumberStackView: UIStackView!
    @IBOutlet weak var CountryCodeTF: UITextField!
    @IBOutlet weak var DropDownBtn: UIButton!
    @IBOutlet weak var PhoneNumberTF: UITextField!
    @IBOutlet weak var NextBtnBOTTOMConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWasShown(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)

        setUpStackView()
        
    }
   
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = format(with: "XXX-XX-XX", phone: newString)
        return false
    }
   
    
    private func setUpStackView() {
        PhoneNumberStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        BcViewForStackView.layer.cornerRadius = 20
        BcViewForStackView.clipsToBounds = true
        PhoneNumberStackView.clipsToBounds = true
         
    }
    
    private func setUpTextField() {
        textField(PhoneNumberTF,
                  shouldChangeCharactersIn: NSRange(location: 0, length: 9),
                  replacementString: "9")
    }
 
    private func format(with mask: String, phone: String)-> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex
        
        for char in mask where index < numbers.endIndex {
            if char == "X" {
                result.append(numbers[index])
                index = numbers.index(after: index)
            } else {
                result.append(char)
            }
        }
        return result
    }
    
    @objc func keyboardWasShown(notification: NSNotification) {
           let info = notification.userInfo!
           let keyboardFrame: CGRect = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue

           UIView.animate(withDuration: 0.1, animations: { () -> Void in
               self.NextBtnBOTTOMConstraint.constant = keyboardFrame.size.height
           })
       }
    
    
    
    @IBAction func CloseBtnTapped(_ sender: UIButton) {
        print("CLOSE VC")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func NextBtnTapped(_ sender: UIButton) {
        //implementation of saving phone number and sending a code to user 
    }
}
