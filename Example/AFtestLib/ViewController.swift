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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        performNetworkingRequest()
    }
    
    func performNetworkingRequest() {
        let networkRequest = NetworkRequest(withParam: "")
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
}

