//
//  ViewController.swift
//  AFtestLib
//
//  Created by Alexandru Dranca on 04/16/2019.
//  Copyright (c) 2019 Alexandru Dranca. All rights reserved.
//

import UIKit
import AFtestLib

class ViewController: UIViewController {

    var ble: BluetoothLowEnergy!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        performNetworkingRequest()
//        performWriteToSandbox(text: "Random text")
        testBLE()
        
    }
    
    func performNetworkingRequest() {
        let networkRequest = NetworkRequest()
        print("Starting network Request \n ------------- ")
        networkRequest.performRequest(success: { (posts) in
            var response = ""
            for post in posts {
                response += "\(post.id) - "
            }
            print(response)
        }) { (errorMessage) in
            print(errorMessage)
        }
    }
    
    func performWriteToSandbox(text: String) {
        let sandbox = Sandbox()
        do {
            try sandbox.write(text: text)
            print("Successfully wrote \(text) to disk.")
        } catch {
            print("Error while writing to disk \(error)")
        }
        
    }
    
    func testBLE() {
        ble = BluetoothLowEnergy()
        
    }
}

