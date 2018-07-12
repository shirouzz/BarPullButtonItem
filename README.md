## BarPullButtonItem
Users can press BarButtonItem by pulling TableView like RefreshControl.   
Inspired by Bear. ( http://www.bear-writer.com ) 

![demo gif](https://github.com/shirouzz/DemoImages/blob/master/BarPullButtonItemDemo.gif)

Left : PullButton  
Moving like RefreshControl.   

Right : SpringPullButton  
Covering 1/3 distance when scrolling without dragging.  
Users easier to aware to cover than PullButton.  
But, this might the eyesore.   

## Installation
### Carthage
Specify it in your Cartfile
```
github "shirouzz/BarPullButtonItem" "master"
```

## Usage
In your TableViewController or ViewController
```swift
let pullButton = PullButton(image: UIImage(named: "x")!, coverColor: UIColor.x, coverImageColor: UIColor.x)
// or SpringPullButton(same...)

override func viewDidLoad() {
    super.viewDidLoad()
    
    pullButton.addTarget(self, action: Selector, for: .touchUpInside)
    let pullItem = UIBarButtonItem(customView: pullButton)
    navigationItem.leftBarButtonItem = pullItem
}

func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    pullButton.beginDragging(y: scrollView.contentOffset.y)
}

func scrollViewDidScroll(_ scrollView: UIScrollView) {
    pullButton.didScroll(y: scrollView.contentOffset.y)
}

func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    pullButton.endDragging(y: scrollView.contentOffset.y)
}
```

### PullButton & SpringPullButton Properties
animationDuration : Press animation duration. 
```swift
var animationDuration = 0.2
```
actionBeforeAnimation:  
false is ( Button Action -> Press Animation )  
true is ( Press Animation Completion -> Button Action )
```swift
var actionAfterAnimation = false
```

initY : Content offset y to start covering.  
If you hide status bar, change value to -44.  (44 is navigationBar height.)
```swift
var initY = -(UIApplication.shared.statusBarFrame.height+44)
```

distanceToPress : Scrolling distance to press button.
```swift
var distanceToPress: CGFloat = -60
```


## License
[MIT](LICENSE)

