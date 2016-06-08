//
//  Typhoon_PlayTests.swift
//  Typhoon PlayTests
//
//  Created by Walter Deane on 3/06/2016.
//  Copyright © 2016 Walter Deane. All rights reserved.
//

import UIKit
import XCTest
@testable import TyphoonPlay

class Typhoon_PlayTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        let controller = ViewModel(field:"",value:"")
        let assembly = ApplicationAssembly().activate()
        
        
        //ApplicationAssembly* assembly = (ApplicationAssembly*)
//        [TyphoonBlockComponentFactory factoryWithAssembly:[ApplicationAssembly assembly]];
//        _loyaltyCardDao = [assembly loyaltyCardDao];
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
