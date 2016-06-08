//
//  ViewController.swift
//  Typhoon Play
//
//  Created by Walter Deane on 3/06/2016.
//  Copyright © 2016 Walter Deane. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ViewPort {

    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var outputView: UITextView!
    var adapter: ViewControllerAdapter!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        adapter.viewDidLoadEvent()
    }

    
    @IBAction func buttonPressed(sender: AnyObject) {
        adapter.buttonPressedEvent()
    }
    func display(view: ViewModel) {
        self.outputLabel.text = view.textFieldContent
        self.outputView.text = view.textViewContent
    }

}

