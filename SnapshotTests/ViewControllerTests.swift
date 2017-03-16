//
//  ViewControllerTests.swift
//  Snapshot
//
//  Created by ShengHua Wu on 14/03/2017.
//  Copyright © 2017 ShengHuaWu. All rights reserved.
//

import FBSnapshotTestCase
@testable import Snapshot

class ViewControllerTests: FBSnapshotTestCase {
    // MARK: - Override Methods
    override func setUp() {
        super.setUp()
        
        recordMode = false
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Enabled Tests
    func testViewControllerEmpty() {
        let vc = ViewController()

        FBSnapshotVerifyView(vc.view)
    }
    
    func testViewControllerNormal() {
        let vc = ViewController()
        
        vc.state = .normal(["First", "Second", "Third"])
        
        FBSnapshotVerifyView(vc.view)
    }
}
