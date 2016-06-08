//
//  ApplicationAssembly.swift
//  Typhoon Play
//
//  Created by Walter Deane on 3/06/2016.
//  Copyright © 2016 Walter Deane. All rights reserved.
//

import Foundation
import Typhoon

@objc public class ApplicationAssembly: TyphoonAssembly {

    /*
     * This is the definition for our AppDelegate. Typhoon will inject the specified properties
     * at application startup.
     */
    public dynamic func appDelegate() -> AnyObject {
        return TyphoonDefinition.withClass(AppDelegate.self) {
            (definition) in
        }
    }
    
    public dynamic func rootViewController() -> AnyObject {
        return TyphoonDefinition.withClass(ViewController.self) {
            (definition) in
                definition.injectProperty("adapter", with:self.viewControllerAdapter())
                definition.scope = TyphoonScope.Singleton
        }
    }
    
    public dynamic func serviceProtocol() -> AnyObject {
        return TyphoonDefinition.withClass(FakeService.self)
        
    }
    
    public dynamic func viewControllerAdapter() -> AnyObject {
        return TyphoonDefinition.withClass(ViewControllerAdapter.self) {
            (definition) in
            definition.useInitializer("initWithViewPort:familyService:") {
                (initializer) in
                initializer.injectParameterWith(self.rootViewController())
                initializer.injectParameterWith(self.serviceProtocol())
            }
        }
    }
}
