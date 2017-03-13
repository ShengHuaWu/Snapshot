//
//  SnapshotTests.swift
//  SnapshotTests
//
//  Created by ShengHua Wu on 13/03/2017.
//  Copyright © 2017 ShengHuaWu. All rights reserved.
//

import FBSnapshotTestCase
@testable import Snapshot

class SnapshotTests: FBSnapshotTestCase {
    // MARK: - Override Methods
    override func setUp() {
        super.setUp()
        
        recordMode = false
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Enabled Tests
    func testViewController() {
        let vc = ViewController()
        
        vc.view.backgroundColor = UIColor.brown
        
        FBSnapshotVerifyView(vc.view)
    }
}
