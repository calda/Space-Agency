//
//  ViewController.swift
//  Space Agency
//
//  Created by Cal on 4/13/16.
//  Copyright © 2016 Cal Stephens. All rights reserved.
//

import UIKit

//MARK: Game Variables
var SABalance = 0
var SAIncome = 0

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var incomeTimer: NSTimer!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var incomeLabel: UILabel!
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func viewDidLoad() {
        
        //schedule the income timer
        self.incomeTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(self.incomeTick(_:)), userInfo: nil, repeats: true)
        
        NSRunLoop.currentRunLoop().addTimer(self.incomeTimer, forMode: NSRunLoopCommonModes)
    }
    
    override func viewDidAppear(animated: Bool) {
        displayBuyControllerForItem(SAItems[4], inController: self, atOffset: 0, completion: nil)
    }

    func incomeTick(timer: NSTimer) {
        SABalance += SAIncome
        updateLabels()
    }
    
    //MARK: - Animations
    
    func updateLabels() {
        let balanceString = SABalance.formatedAsMoney()
        let incomeString = "\(SAIncome.formatedAsMoney()) per day"
        
        func animateChange(label: UILabel, to: String) {
            label.text = to
            label.pulseToSize(1.2, growFor: 0.15, shrinkFor: 0.5)
            
            UIView.animateWithDuration(0.5, delay: 0.2, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: [], animations: {
                    label.transform = CGAffineTransformIdentity
            }, completion: nil)
        }
        
        if balanceLabel.text != balanceString {
            animateChange(balanceLabel, to: balanceString)
        }
        
        if incomeLabel.text != incomeString {
            animateChange(incomeLabel, to: incomeString)
        }
    }

    //MARK: - Collection View delegate
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SAItems.count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("item", forIndexPath: indexPath) as! ItemCell
        cell.decorateForItem(SAItems[indexPath.item])
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let width = (UIScreen.mainScreen().bounds.width / 2) - 15
        return CGSizeMake(width, width)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 10, 10, 10)
    }
    
}

class ItemCell : UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    func decorateForItem(item: Item) {
        
        nameLabel.text = item.name
        image.image = UIImage(named: item.name)
        subtitleLabel.text = "\(item.price.formatedAsMoney()) for \(item.income.formatedAsMoney())/day"
        countLabel.text = "x \(item.count)"
        
        self.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.layer.borderWidth = 0.5
    }
    
}

extension Int {
    
    func formatedAsMoney() -> String {
        let numberString = "\(self)" as NSString
        var moneyString = ""
        
        var index = 0
        while index != numberString.length {
            
            //prepend character
            let range = NSMakeRange(numberString.length - index - 1, 1)
            let char = numberString.substringWithRange(range)
            moneyString = "\(char)\(moneyString)"
            
            index += 1;
            //prepend comma if necessary
            if index % 3 == 0 && index != numberString.length {
                moneyString = ",\(moneyString)"
            }
            
        }
        
        return "$\(moneyString)"
    }
}

extension UIView {
    
    func pulseToSize(size: CGFloat, growFor grow: NSTimeInterval, shrinkFor shrink: NSTimeInterval) {
        
        //animate
        UIView.animateWithDuration(grow, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: [.AllowUserInteraction], animations: {
                self.transform = CGAffineTransformMakeScale(1.2, 1.2)
        }, completion: nil)
        
        UIView.animateWithDuration(shrink, delay: grow, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: [.AllowUserInteraction], animations: {
                self.transform = CGAffineTransformIdentity
        }, completion: nil)
        
    }
    
}

