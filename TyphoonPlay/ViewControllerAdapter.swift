//
//  ViewControllerAdapter.swift
//  Typhoon Play
//
//  Created by Walter Deane on 3/06/2016.
//  Copyright © 2016 Walter Deane. All rights reserved.
//

import Foundation
import Typhoon

@objc public protocol ViewPort: NSObjectProtocol  {
    func display(model: ViewModel)
}

@objc public class ViewControllerAdapter:NSObject {
    
    let viewPort:ViewPort
    let familyService: ServiceProtocol
    
    required public init(viewPort:ViewPort, familyService: ServiceProtocol) {
        self.viewPort = viewPort
        self.familyService = familyService
    }
    
    func viewDidLoadEvent() {
        let family = self.familyService.family().values.map({"\($0.firstName)"}).reduce("", combine: {$0 + " " + $1})
        viewPort.display(ViewModel(field: "Family List called", view: family))
    }
    
    func buttonPressedEvent() {
        viewPort.display(ViewModel(field: "Buttoned called", view:"You pushed that button very well.\n\n Good job!"))
    }
    
}

@objc public class ViewModel: NSObject {
    let textFieldContent: String
    let textViewContent: String
    
    init(field: String, view: String) {
        self.textFieldContent = field
        self.textViewContent = view
    }
    
}