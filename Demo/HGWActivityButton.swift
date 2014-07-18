//  The MIT License (MIT)
//
//  Copyright (c) 2014 Hunter Whittle
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit
import QuartzCore

class HGWActivityButton: UIButton {
    
    var activityViewArray = NSMutableArray(capacity: 0)
    var rotatorColor = UIColor.darkGrayColor()
    var rotatorSize: CGFloat = 8.0
    var rotatorSpeed: CGFloat = 10.0
    var rotatorPadding: CGFloat = 0.0
    var defaultTitle: NSString = ""
    var activityTitle: NSString = ""
    
    init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUp()
    }
    
    init(coder aDecoder: NSCoder!)  {
        super.init(coder: aDecoder)
        
        self.setUp()
    }
    
    func setUp() {
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.width)
        self.layer.cornerRadius = self.frame.size.width / 2
        self.addTarget(self, action: Selector("onTouchUpInside"), forControlEvents: UIControlEvents.TouchUpInside)
        self.addTarget(self, action: Selector("onTouchDown"), forControlEvents: UIControlEvents.TouchDown)
    }
    
    func onTouchUpInside() {
        
        if(self.activityViewArray.count < 1) {
            self.startActivity()
        }
        
        self.userInteractionEnabled = false;
        self.titleLabel.alpha = 1.0
    }
    
    func onTouchDown() {
        
        self.titleLabel.alpha = 0.25;
    }
    
    func startActivity() {
        var i: Int
        for i=1; i<=Int(self.rotatorSpeed * 1.5); ++i {
            var activityView = UIView(frame: CGRectMake(0.0, 0.0, rotatorSize, rotatorSize))
            activityView.layer.cornerRadius = activityView.frame.size.height / 2
            activityView.backgroundColor = self.rotatorColor
            activityView.alpha = 1.0 / (CGFloat(i) + 0.05)
            
            self.activityViewArray.addObject(activityView)
        }
        
        for view: AnyObject in self.activityViewArray {
            if let activityView = view as? UIView {
                
                var pathAnimation = CAKeyframeAnimation(keyPath: "position")
                pathAnimation.calculationMode = kCAAnimationLinear
                pathAnimation.fillMode = kCAFillModeForwards
                pathAnimation.removedOnCompletion = false
                pathAnimation.repeatCount = HUGE
                pathAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
                pathAnimation.duration = CFTimeInterval(300.0) / CFTimeInterval(self.rotatorSpeed)
                
                let curvedPath = CGPathCreateMutable()
                
                self.addSubview(activityView)
                let index = self.activityViewArray.indexOfObject(activityView)
                
                let padding = self.frame.size.width / 2;
                let startAngle: CGFloat = 270.0 - (CGFloat(index) * 4)
                CGPathAddArc(curvedPath, nil, self.bounds.origin.x+padding, self.bounds.origin.y+padding, padding + self.rotatorPadding, self.degreesToRadians(startAngle), 360, false)
                pathAnimation.path = curvedPath 
                
                activityView.layer.addAnimation(pathAnimation, forKey: "myCircleAnimation")
            }
        }
        
        if self.titleLabel.text {
            self.defaultTitle = self.titleLabel.text;
        }
        self.activityTitle = self.activityTitle.isEqualToString("") ? self.defaultTitle : self.activityTitle
        self.setTitle(self.activityTitle, forState: UIControlState.Normal)
    }
    
    func stopActivity() {
        
        for view: AnyObject in self.activityViewArray {
            if let activityView = view as? UIView {
                activityView.layer.removeAllAnimations()
                activityView.removeFromSuperview()
            }
        }
        
        if(!self.defaultTitle.isEqualToString("")) {
            self.setTitle(self.defaultTitle, forState: UIControlState.Normal)
        }
        
        self.activityViewArray.removeAllObjects();
        self.userInteractionEnabled = true;
    }
    
    func degreesToRadians(degrees: CGFloat) -> CGFloat {
        
        let result = ((degrees) / 180.0 * CGFloat(M_PI))
        return result
    }
}
