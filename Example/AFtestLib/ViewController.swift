//
//  ViewController.swift
//  AFtestLib
//
//  Created by Alexandru Dranca on 04/16/2019.
//  Copyright (c) 2019 Alexandru Dranca. All rights reserved.
//

import UIKit
import AFTestLib

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        performNetworkingRequest()
    }
    
    func performNetworkingRequest() {
        let networkRequest = NetworkRequest(withParam: "")
        print("Starting network Request \n ------------- ")
        networkRequest.test()
        networkRequest.performRequest { (response) in
            print(response)
        }
    }
}

