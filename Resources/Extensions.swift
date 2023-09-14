//
//  Extensions.swift
//  OceanFlix
//
//  Created by Hariharan Thiagarajan on 13/09/23.
//

import Foundation

extension String {
    func capitaliseFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
