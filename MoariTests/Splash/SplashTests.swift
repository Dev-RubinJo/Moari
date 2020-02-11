//
//  SplashTests.swift
//  MoariTests
//
//  Created by YooBin Jo on 2020/02/11.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import XCTest
@testable import Moari

class SplashTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMakeSplash() {
        let vc = SplashVC.viewRouter.makeSplashVC()
        XCTAssertNotNil(vc)
    }
    
    func testSplashVCActorIsNil() {
        self.measure {
            let vc = SplashVC.viewRouter.makeSplashVC()
            XCTAssertNotNil(vc.actor!)
        }
    }
    
    func testSplashActorDataMangerIsNil() {
        self.measure {
            let vc = SplashVC.viewRouter.makeSplashVC()
            XCTAssertNotNil(vc.actor?.dataManager!)
        }
    }
    
    // 밤에만 True
    func testIsDarkMode() {
        self.measure {
            let vc = SplashVC.viewRouter.makeSplashVC()
            XCTAssertTrue(vc.isDarkMode)
        }
    }
    
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
