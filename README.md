HGWActivityButton
=================

A UIButton subclass with a custom, built-in activity indicator

Written in Swift.
## Usage

```Swift
var activityButton = HGWActivityButton(frame: CGRectMake(115, 80, 90, 90))
activityButton.backgroundColor = UIColor.orangeColor()
activityButton.setTitle("Load", forState: UIControlState.Normal)
activityButton.activityTitle = "Loading"
activityButton.rotatorColor = UIColor.darkGrayColor()
activityButton.rotatorSize = 8.0
activityButton.rotatorSpeed = 10.0
self.view.addSubview(activityButton)
```

## License

HGWActivityButton is available under the MIT license. See the LICENSE file for more info.
