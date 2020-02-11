//
//  MainTests.swift
//  MoariTests
//
//  Created by YooBin Jo on 2020/02/11.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import XCTest
@testable import Moari

class MainTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMakeMain() {
        self.measure {
            let vc = MainVC.viewRouter.makeMainVC()
            XCTAssertNotNil(vc)
        }
    }
    
    func testMainVCActorIsNil() {
        self.measure {
            let vc = MainVC.viewRouter.makeMainVC()
            XCTAssertNotNil(vc.actor)
        }
    }
    
    func testMainActorDataManagerIsNil() {
        let actor = MainVC.viewRouter.makeMainVC().actor
        XCTAssertNotNil(actor?.dataManager)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

