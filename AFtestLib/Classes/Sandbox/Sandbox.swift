//
//  Sandbox.swift
//  AFtestLib
//
//  Created by Alexandru Dranca on 16/04/2019.
//

import Foundation

public class Sandbox {
    public init() {}
    
    let file = "file.txt"
    
    public func write(text: String) throws {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(file)
            try text.write(to: fileURL, atomically: false, encoding: .utf8)
        }
    }
}
