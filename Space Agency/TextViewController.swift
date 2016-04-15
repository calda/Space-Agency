//
//  PurchaseViewController.swift
//  Space Agency
//
//  Created by Cal Stephens on 4/14/16.
//  Copyright © 2016 Cal Stephens. All rights reserved.
//

import UIKit

func displayTextControllerForText(text: String, title: String, buttonText: String, inController controller: UIViewController, completion: (() -> ())?) -> UIViewController {
    
    let textController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("text") as! TextViewController
    textController.loadView()
    
    textController.displayForText(text, title: title, buttonText: buttonText, inController: controller, completion: completion)
    return textController
}

class TextViewController : UIViewController {
    
    @IBOutlet weak var popup: UIView!
    @IBOutlet weak var popupCenter: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var scrim: UIView!

    var completion: (() -> ())?
    
    //MARK: - Setup
    
    func displayForText(text: String, title: String, buttonText: String, inController controller: UIViewController, completion: (() -> ())?) {
        
        self.popup.hidden = false
        self.textLabel.text = text
        self.titleLabel.text = title
        self.dismissButton.setTitle(buttonText, forState: .Normal)
        
        self.view.frame = controller.view.bounds
        self.completion = completion
        
        controller.view.addSubview(self.view)
        
        //animate
        popupCenter.constant = UIScreen.mainScreen().bounds.height * 0.75
        popup.transform = CGAffineTransformMakeScale(0.65, 0.65)
        self.view.layoutIfNeeded()
        self.scrim.alpha = 0.0
        
        UIView.animateWithDuration(0.3) { self.scrim.alpha = 1.0 }
        UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 0.85, initialSpringVelocity: 0.0, options: [], animations: {
            self.popupCenter.constant = 0
            self.popup.transform = CGAffineTransformIdentity
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    //MARK: - Interaction
    
    @IBAction func dismissModal(sender: UIButton) {
        completion?()
        
        UIView.animateWithDuration(0.5) { self.scrim.alpha = 0.0 }
        UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 0.85, initialSpringVelocity: 0.0, options: [], animations: {
            self.popupCenter.constant = UIScreen.mainScreen().bounds.height * 0.75
            self.popup.transform = CGAffineTransformMakeScale(0.65, 0.65)
            self.view.layoutIfNeeded()
            }, completion: { _ in
                self.view.removeFromSuperview()
        })
        
    }
    
    
}
