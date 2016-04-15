//
//  ViewController.swift
//  Space Agency
//
//  Created by Cal on 4/13/16.
//  Copyright © 2016 Cal Stephens. All rights reserved.
//

import UIKit

//MARK: Game Variables
var SABalance = 100
var SAIncome = 0

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var incomeTimer: NSTimer!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var incomeLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var controllerToRetain: UIViewController!
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func viewDidLoad() {
        
        //schedule the income timer
        self.incomeTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(self.incomeTick(_:)), userInfo: nil, repeats: true)
        
        NSRunLoop.currentRunLoop().addTimer(self.incomeTimer, forMode: NSRunLoopCommonModes)
    }

    func incomeTick(timer: NSTimer) {
        SABalance += SAIncome
        updateLabels()
    }
    
    //MARK: - Animations
    
    func updateLabels() {
        //update income and balance
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
        
        //update collection view
        for cell in collectionView.visibleCells() where cell is ItemCell {
            (cell as! ItemCell).updateLabels()
        }
    }

    //MARK: - User Interaction
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let index = indexPath.item
        let item = SAItems[index]
        let view = collectionView.cellForItemAtIndexPath(indexPath)!
        
        //animate
        if item.price > SABalance {
            shakeView(view)
            return
        }
        
        view.pulseToSize(0.975, growFor: 0.3, shrinkFor: 0.3)
        
        //show modal popup & handle completion logic
        controllerToRetain = displayBuyControllerForItem(item, inController: self, atOffset: 0, completion: { count, item in
            
            self.controllerToRetain = nil
            
            let cost = count * item.price
            if SABalance < cost { return } //TODO: throw some error
            SABalance -= cost
            
            let newIncome = count * item.income
            SAIncome += newIncome
            item.count += count
            
            //update and animate
            collectionView.reloadData()
            self.updateLabels()
            
            delay(0.1) {
                if count == 0 { return }
                
                collectionView.visibleCells().filter {
                    ($0 as? ItemCell)?.item.name == item.name
                }.first?.pulseToSize(1.05, growFor: 0.25, shrinkFor: 0.35)
                
            }
            
            //if this was the first purchase
            if item.count == count && count != 0{
                //display flavor text
                delay(0.75) {
                    self.controllerToRetain = displayTextControllerForText(item.description, title: "Bought \(item.name)", buttonText: "Continue", inController: self, completion: {
                            self.controllerToRetain = nil
                    })
                }
            }
            
        })
        
    }
    
    //MARK: - Collection View delegate
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let lastOwned = SAItems.filter({ $0.count > 0 }).last {
            return min(SAItems.indexOf{ $0.name == lastOwned.name }! + 3, SAItems.count)
        }
        return 3 //show 3 at minimum
        
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
    @IBOutlet weak var scrim: UIView!
    var item: Item!
    
    func decorateForItem(item: Item) {
        self.item = item
        image.image = UIImage(named: item.name)
        updateLabels()
        
        self.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.layer.borderWidth = 0.5
    }
    
    func updateLabels() {
        let canAfford = item.price <= SABalance
        scrim.alpha = canAfford || item.count > 0 ? 0.0 : 0.65
        
        nameLabel.text = item.name
        
        subtitleLabel.text = "\(item.price.formatedAsMoney()) for \(item.income.formatedAsMoney())/day"
        countLabel.text = "x \(item.count)"
    }
    
}

