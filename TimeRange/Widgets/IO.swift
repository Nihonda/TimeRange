//
//  IO.swift
//  TimeRange
//
//  Created by Nurlan on 2024/04/09.
//

import Foundation
import CoreData

class IO {
    static func write(to filename: String, content: String) -> Bool {
        // [swiftでファイルの書き込み](https://stackoverflow.com/questions/24097826/read-and-write-data-from-text-file)
        if let dir = FileManager.default.urls( for: .documentDirectory, in: .userDomainMask ).first {
            let filePath = dir.appendingPathComponent(filename)
            do {
                try content.write(to: filePath, atomically: true, encoding: .utf8)
                return true
            } catch {
                print("Failed writing to URL: \(filePath), Error: " + error.localizedDescription)
            }
        }
        return false
    }
    
    static func read(_ fileName: String) -> String? {
        // [ファイルの読み込みと保存](http://qiita.com/itoru257/items/6d31ba75cbc0f4c645f7)
        if let dir = FileManager.default.urls( for: .documentDirectory, in: .userDomainMask ).first {
            let filePath = dir.appendingPathComponent( fileName )
            do {
                let text = try String(contentsOf: filePath, encoding: .utf8)
                return text as String
            } catch { }
        }
        return nil
    }

    static func exists(_ fileName: String) -> Bool {
        // http://stackoverflow.com/a/24181948
        let dir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let url = NSURL(fileURLWithPath: dir)
        let filePath = url.appendingPathComponent(fileName)?.path
        let manager = FileManager.default
        return manager.fileExists(atPath: filePath!)
    }
}
