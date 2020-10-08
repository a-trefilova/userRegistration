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
    @IBOutlet weak var circleWidth: NSLayoutConstraint!
    @IBOutlet weak var circleHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var SafariBtn: UIButton!
    @IBOutlet weak var safariWidth: NSLayoutConstraint!
    @IBOutlet weak var safariHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var HomeBtn: UIButton!
    @IBOutlet weak var homeWidth: NSLayoutConstraint!
    @IBOutlet weak var homeHeight: NSLayoutConstraint!
    
    
    let rangeOfFirstLink = NSRange(location: 32, length: 5)
    let rangeOfSecondLink = NSRange(location: 42, length: 14)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTermsAndPolicyLabel()
        setUpBottomBtns()
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
    
    private func setUpBottomBtns() {
        
        CircleBtn.setImage(UIImage(systemName: "largecircle.fill.circle"), for: .normal)
        CircleBtn.contentVerticalAlignment = .fill
        CircleBtn.contentHorizontalAlignment = .fill
        CircleBtn.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        CircleBtn.transform = CGAffineTransform(rotationAngle: -23.7)
        
        
        SafariBtn.setImage(UIImage(systemName: "safari.fill"), for: .normal)
        SafariBtn.contentVerticalAlignment = .fill
        SafariBtn.contentHorizontalAlignment = .fill
        SafariBtn.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        HomeBtn.setImage(UIImage(systemName: "house.fill"), for: .normal)
        HomeBtn.contentVerticalAlignment = .fill
        HomeBtn.contentHorizontalAlignment = .fill
        HomeBtn.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        HomeBtn.transform = CGAffineTransform(rotationAngle: 69.3)
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
        let frame = CGRect(x: LetsGoBtn.frame.origin.x,
                           y: LetsGoBtn.frame.origin.y,
                           width: LetsGoBtn.frame.size.width - 10,
                           height: LetsGoBtn.frame.size.height - 10)
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction, .curveEaseOut], animations: {
            
            self.LetsGoBtn.frame = frame
        }, completion: nil)
        
    }
    
    
    @IBAction func FirstBtnTapped(_ sender: UIButton) {
       
        
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction, .curveEaseInOut, .transitionCurlUp], animations: {

            self.circleWidth.constant = self.circleWidth.constant + 10
            self.circleHeight.constant = self.circleHeight.constant + 10
            self.CircleBtn.backgroundColor = #colorLiteral(red: 0.1605423391, green: 0.7206415534, blue: 0.9993768334, alpha: 1)
        }) { (finished) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.circleWidth.constant = self.circleWidth.constant - 10
                self.circleHeight.constant = self.circleHeight.constant - 10
                self.CircleBtn.backgroundColor = #colorLiteral(red: 0.4226793051, green: 0.5271993279, blue: 0.8051483035, alpha: 1)
            }
            
        }

    }
    @IBAction func SecondBtnTapped(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction, .curveEaseInOut, .transitionCurlUp], animations: {

            self.safariWidth.constant = self.safariWidth.constant + 10
            self.safariHeight.constant = self.safariHeight.constant + 10
            self.SafariBtn.backgroundColor = #colorLiteral(red: 0.1605423391, green: 0.7206415534, blue: 0.9993768334, alpha: 1)
        }) { finished in
             DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.safariWidth.constant = self.safariWidth.constant - 10
            self.safariHeight.constant = self.safariHeight.constant - 10
            self.SafariBtn.backgroundColor = #colorLiteral(red: 0.4226793051, green: 0.5271993279, blue: 0.8051483035, alpha: 1)
            }
        }
    }
    
    @IBAction func ThirdBtnTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction, .curveEaseInOut, .transitionCurlUp], animations: {

            self.homeWidth.constant = self.homeWidth.constant + 10
            self.homeHeight.constant = self.homeHeight.constant + 10
            self.HomeBtn.backgroundColor = #colorLiteral(red: 0.1605423391, green: 0.7206415534, blue: 0.9993768334, alpha: 1)
        }) { (finished) in
             DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.homeWidth.constant = self.homeWidth.constant - 10
            self.homeHeight.constant = self.homeHeight.constant - 10
            self.HomeBtn.backgroundColor = #colorLiteral(red: 0.4226793051, green: 0.5271993279, blue: 0.8051483035, alpha: 1)
            }
        }
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
