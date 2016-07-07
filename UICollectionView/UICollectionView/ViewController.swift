//
//  ViewController.swift
//  UICollectionView
//
//  Created by Simon Orlovsky on 7/6/16.
//  Copyright © 2016 Simon Orlovsky. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var headers = ["Yellow Blocks", "Blue Blocks"]
    var items = [[String]]()
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var sectionOneItems = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    var sectionTwoItems = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        items.append(sectionOneItems)
        items.append(sectionTwoItems)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "header", forIndexPath: indexPath) as! CollectionReusableView
            headerView.label.text = headers[indexPath.section]
            return headerView
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    // tell the collection view how many cells to make
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items[section].count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return self.items.count
    }
    
    
    // change background color when user touches cell
    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        cell?.backgroundColor = UIColor.redColor()
    }
    
    // change background color back when user releases touch
    func collectionView(collectionView: UICollectionView, didUnhighlightItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        if indexPath.section == 0 {
            cell?.backgroundColor = UIColor.yellowColor()
        }
        else {
            cell?.backgroundColor = UIColor.lightGrayColor()
        }
        
    }
    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.myLabel.text = self.items[indexPath.section][indexPath.item]
        if indexPath.section == 0 {
            cell.backgroundColor = UIColor.yellowColor()
        }
        else {
            cell.backgroundColor = UIColor.lightGrayColor()
        }
        
        cell.layer.borderColor = UIColor.grayColor().CGColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        
        return cell
    }
    
    
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item+1)!")
    }


}

