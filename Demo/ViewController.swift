
//
//  ViewController.swift
//  Demo
//
//  Created by Hunter Whittle on 6/25/14.
//  Copyright (c) 2014 Hunter Whittle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activityButton: HGWActivityButton
    var activityButton2: HGWActivityButton
    var activityButton3: HGWActivityButton
    
    required init(coder aDecoder: NSCoder) {
        self.activityButton = HGWActivityButton(frame: CGRectZero)
        self.activityButton2 = HGWActivityButton(frame: CGRectZero)
        self.activityButton3 = HGWActivityButton(frame: CGRectZero)
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let middleMain: CGFloat = self.view.bounds.size.width / 2
        var middleButton: CGFloat = 100.0 / 2
        
        activityButton = HGWActivityButton(frame: CGRect(x: middleMain - middleButton, y: 60, width: 100, height: 100))
        activityButton.backgroundColor = UIColor.blueColor()
        activityButton.titleLabel.text = "Process"
        activityButton.activityTitle = "Processing"
        activityButton.rotatorColor = UIColor.blackColor()
        activityButton.rotatorSize = 12.0
        activityButton.rotatorSpeed = 8.0
        view.addSubview(activityButton)
        
        middleButton = 76.0 / 2
        
        activityButton2 = HGWActivityButton(frame: CGRect(x: middleMain - middleButton, y: 227, width: 76, height: 76))
        activityButton2.backgroundColor = UIColor.orangeColor()
        activityButton2.titleLabel.text = "Load"
        activityButton2.activityTitle = "Loading"
        activityButton2.rotatorColor = UIColor.darkGrayColor()
        activityButton2.rotatorSize = 12.0
        activityButton2.rotatorSpeed = 8.0
        activityButton2.rotatorPadding = 15.0
        view.addSubview(activityButton2)
        
        middleButton = 150.0 / 2
        
        activityButton3 = HGWActivityButton(frame: CGRect(x: middleMain - middleButton, y: 375, width: 150, height: 150))
        activityButton3.backgroundColor = UIColor(white: 0.85, alpha: 1.0)
        activityButton3.titleLabel.text = "Download";
        activityButton3.activityTitle = "Downloading"
        activityButton3.rotatorColor = UIColor.blueColor()
        activityButton3.rotatorSize = 16.0
        activityButton3.rotatorSpeed = 8.0
        activityButton3.rotatorPadding = -7.0
        view.addSubview(activityButton3)
    }

    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent)  {
        activityButton.stopActivity()
        activityButton2.stopActivity()
        activityButton3.stopActivity()
    }
}
