//
//  FileManager.swift
//  TimeRange
//
//  Created by Nurlan on 2024/04/09.
//

import Foundation

class File {
    static var shared = File()
    
    func exists(_ fileName: String) -> Bool {
        return IO.exists(fileName)
    }
    
    func read(_ fileName: String) -> String? {
        return IO.read(fileName)
    }
    
    func write(_ fileName: String, content: String) -> Bool {
        return IO.write(to: fileName, content: content)
    }
}
