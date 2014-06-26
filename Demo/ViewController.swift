//
//  ViewController.swift
//  Demo
//
//  Created by Hunter Whittle on 6/25/14.
//  Copyright (c) 2014 Hunter Whittle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activityButton: HGWActivityButton = HGWActivityButton()
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        activityButton = HGWActivityButton(frame: CGRect(x: 110, y: 120, width: 100, height: 100))
        activityButton.backgroundColor = UIColor.blueColor()
        activityButton.setTitle("Process", forState: UIControlState.Normal)
        activityButton.activityTitle = "Processing"
        activityButton.rotatorColor = UIColor.blackColor()
        activityButton.rotatorSize = 10.0
        activityButton.rotatorSpeed = 8.0
        view.addSubview(activityButton)
    }

    override func touchesEnded(touches: NSSet!, withEvent event: UIEvent!)  {
        activityButton.stopActivity()
    }


}

