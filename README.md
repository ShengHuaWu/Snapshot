## iOS Snapshot Testing
Writing tests for the user interface of an iOS app is very cumbersome.
Many people dismiss writing those tests due to the difficulty of doing view-based tests.
Unfortunately, I was one of them until recently I encountered a problem of verifying different states of my views.
In order to actually look at the result, I needed to run the application several times after modifying my views, and that spent lots of time.
Therefore, I tried to seek a more efficient way to handle this situation and I found out a perfect solution --- [_FBSnapshotTestCase_](https://github.com/facebook/ios-snapshot-test-case).

### What It Does
A snapshot test case takes a configured UIView and renders it to an image snapshot of its contents.
It compares this snapshot to a reference image stored in my source code repository and it will also create another reference image if the two images don't match.
It makes the comparison by drawing both the view and the existing snapshot into two `CGContextRef`s and doing a memory comparison of them with the C function `memcmp()`. This makes it extremely quick.

### Installation & Setup
Following the instruction on their [GitHub page](https://github.com/facebook/ios-snapshot-test-case), I add `pod 'FBSnapshotTestCase'` into the test target of my Podfile.
In addition, the recommended way to set the reference directory is to define `FB_REFERENCE_IMAGE_DIR` in my scheme.
This should point to the directory where I want reference images to be stored.
A sample value is `$(SOURCE_ROOT)/$(PROJECT_NAME)Tests/ReferenceImages`.
![scheme-image]()
It's quite handy, right? Let's start to write some code.

### Implementation
In order to demonstrate how to take the advantage of _FBSnapshotTestCase_, I create a simple view controller with two different states: empty and normal.
On one hand, the view controller should show a text label when its state is set to empty.
On the other hand, the view controller should display a list of strings when its state is normal.
```
enum State {
        case empty
        case normal([String])
    }
```
Let's write some tests to verify them.
First of all, subclass _FBSnapshotTestCase_ instead of XCTestCase.
Then add `recordMode = true` into the `setup` method.
It will make the macro record a new screenshot rather than check the result against a reference image.
Finally, add the following two test functions in order to store the images of my view controller and run the test.
```
func testViewControllerEmpty() {
    let vc = ViewController()
    
    FBSnapshotVerifyView(vc.view)
}

func testViewControllerNormal() {
    let vc = ViewController()

    vc.state = .normal(["First", "Second", "Third"])

    FBSnapshotVerifyView(vc.view)
}
```
After finishing running, the test should fail (That's fine.) and the console output tells me the reference images are stored.
Go to the directory that I set in the scheme and there are two images of my view controller in different states.
![two-images]()
Thus, I'm able to actually look at the images to verify modifications of my view controller and this saves a lot of time in building.
The sample project is [here]().

### Conclusion
_FBSnapshotTestCase_ also lets me able to do a single test and instantly see the changes I make to the different states.
No tapping through my app to get to the right view.
It gives me a way to test view-related code and it can be used to visualize view states without jumping through hoops in the simulator or real devices.
Another advantage is that snapshot tests are fast.
Having lots of tests in an application’s test suite is no problem.
If you haven't used it yet, you should give it a try.
