//
//  ViewController.swift
//  5screens
//
//  Created by Константин Сабицкий on 28.09.2020.
//  Copyright © 2020 Константин Сабицкий. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var SmileImageBtn: UIButton!
    @IBOutlet weak var LetsGoBtn: UIButton!
    @IBOutlet weak var TermsPolicyLabel: UILabel!
    
    @IBOutlet weak var CircleBtn: UIButton!
    
    @IBOutlet weak var SafariBtn: UIButton!
    
    @IBOutlet weak var HomeBtn: UIButton!
    
    
    let rangeOfFirstLink = NSRange(location: 32, length: 5)
    let rangeOfSecondLink = NSRange(location: 42, length: 14)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTermsAndPolicyLabel()
        // Do any additional setup after loading the view.
    }

    private func createTermsAndPolicyLabel() {
        let string = NSAttributedString(string: "By signing up, you agree to our Terms and Privacy Policy", attributes: nil)
        let attributedString = NSMutableAttributedString(attributedString: string)
        
       
        attributedString.setAttributes([NSAttributedString.Key.font : UIFont(name:"SFCompactRounded-Bold" , size: 15.0)], range: rangeOfFirstLink)
        attributedString.setAttributes([NSAttributedString.Key.font : UIFont(name:"SFCompactRounded-Bold" , size: 15.0)], range: rangeOfSecondLink)
        TermsPolicyLabel.numberOfLines = 2
        TermsPolicyLabel.attributedText = attributedString
        TermsPolicyLabel.isUserInteractionEnabled = true
        TermsPolicyLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapLabel(gesture:))))
        
    }
    
    
    @objc func tapLabel(gesture: UITapGestureRecognizer) {
        if gesture.didTapAtrributedTextInLabel(label: TermsPolicyLabel, inRange: rangeOfFirstLink) {
            print("Tapped targetRange1")
        }
        else if gesture.didTapAtrributedTextInLabel(label: TermsPolicyLabel, inRange: rangeOfSecondLink) {
            print("Tapped targetRange2")
        }
    }
    
   
    

    @IBAction func letsGoBtnTapped(_ sender: UIButton) {
      
//        performSegue(withIdentifier: "letsgo", sender: nil)
        
    }
    
    
    
    
}


extension UITapGestureRecognizer {
    func didTapAtrributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: label.attributedText!)
        
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize
        
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let textContainerOffset = CGPoint(
            x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
            y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y
        )
        let locationOfTouchInTextContainer = CGPoint(
            x: locationOfTouchInLabel.x - textContainerOffset.x,
            y: locationOfTouchInLabel.y - textContainerOffset.y
        )
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)

        return NSLocationInRange(indexOfCharacter, targetRange)
        
    }
}
