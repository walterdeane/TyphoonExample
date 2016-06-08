//
//  Typhoon_PlayTests.swift
//  Typhoon PlayTests
//
//  Created by Walter Deane on 3/06/2016.
//  Copyright © 2016 Walter Deane. All rights reserved.
//

import UIKit
import XCTest
import Typhoon
@testable import TyphoonPlay

class Typhoon_PlayTests: XCTestCase {
    
    var assembly: ApplicationAssembly!
    
    override func setUp() {
        super.setUp()
        
        assembly = ApplicationAssembly().activate()
        
        

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        let patcher = TyphoonPatcher()
        patcher.patchDefinitionWithSelector(#selector(ApplicationAssembly.serviceProtocol)) {
            let service = MockService()
            return service;
        }
        
        let controller = MockViewController()
        patcher.patchDefinitionWithSelector(#selector(ApplicationAssembly.rootViewController)) {
            return controller;
        }
        
        assembly.attachDefinitionPostProcessor(patcher)
        let adapter: ViewControllerAdapter = assembly.viewControllerAdapter() as! ViewControllerAdapter
        
        adapter.viewDidLoadEvent()
        
        
        XCTAssertEqual(controller.displayCalled, true)
        
        
        
        patcher.detach()
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    @objc class MockViewController:NSObject, ViewPort {
        var displayCalled: Bool = false
        func display(model: ViewModel) {
            self.displayCalled = true
        }
    }
    
    @objc class MockService : NSObject, ServiceProtocol {
         func family() -> [String:Person] {
            return [NSUUID().UUIDString:Person(firstName: "Walter", middleName: "Lee", surname:"Deane", age: 42),
                    NSUUID().UUIDString:Person(firstName: "Karen", middleName: "Elizabeth", surname:"Deane", age: 43),
                    NSUUID().UUIDString:Person(firstName: "Siena", middleName: "Lee", surname:"Deane", age: 13),
                    NSUUID().UUIDString:Person(firstName: "Alex", middleName: "Riley", surname:"Deane", age: 15)
            ]
        }
        
         func addresses(person: Person) -> [String:Address] {
            return [AddressType.Home.string() : Address(street1:"39 Paxton St", street2: "", suburb: "Frenchs Forest", state: "NSW", postCode: "2086")]
        }
    }
    
}
