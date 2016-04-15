//
//  PurchaseViewController.swift
//  Space Agency
//
//  Created by Cal Stephens on 4/14/16.
//  Copyright © 2016 Cal Stephens. All rights reserved.
//

import UIKit

func displayBuyControllerForItem(item: Item, inController controller: UIViewController, atOffset offset: CGFloat, completion: ((count: Int, item: Item) -> ())?) {
    
    let buyController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("buy") as! PurchaseViewController
    buyController.loadView()
    
    buyController.displayForItem(item, inController: controller, atOffset: offset, completion: completion)
}

class PurchaseViewController : UIViewController {
    
    @IBOutlet weak var popup: UIView!
    @IBOutlet weak var popupCenter: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var lessButton: UIButton!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var scrim: UIView!
    
    var count = 1
    var item: Item = SAItems[1]
    
    //MARK: - Setup
    
    override func viewDidLoad() {
        print("um")
    }
    
    func displayForItem(item: Item, inController controller: UIViewController, atOffset offset: CGFloat, completion: ((count: Int, item: Item) -> ())?) {
        
        self.popup.hidden = false
        self.titleLabel.text = "Buy \(item.name)"
        updateLabels()
        self.view.frame = controller.view.bounds
        
        controller.view.addSubview(self.view)
        
        //animate
        popupCenter.constant = UIScreen.mainScreen().bounds.height * 0.75
        popup.transform = CGAffineTransformMakeScale(0.65, 0.65)
        self.view.layoutIfNeeded()
        self.scrim.alpha = 0.0
        
        UIView.animateWithDuration(0.3) { self.scrim.alpha = 1.0 }
        UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 0.85, initialSpringVelocity: 0.0, options: [], animations: {
                self.popupCenter.constant = offset
                self.popup.transform = CGAffineTransformIdentity
                self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    func updateLabels() {
        let price = count * item.price
        let income = count * item.income
        let text = "\(price.formatedAsMoney()) for \(income.formatedAsMoney())/day"
        costLabel.text = text
        countLabel.text = "\(count)"
    }
    
    //MARK: - Interaction
    
    @IBAction func offsetCount(sender: UIButton) {
        let offset = sender.tag
        count += offset
        lessButton.enabled = (count != 1)
        moreButton.enabled = (((count + 1) * item.price) < 1000000000) && count < 100
        updateLabels()
        
        //animate
        sender.pulseToSize(1.2, growFor: 0.1, shrinkFor: 0.3)
        countLabel.pulseToSize(1.1, growFor: 0.1, shrinkFor: 0.3)
    }
    
    
    
}
