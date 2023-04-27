//
//  String+Utils.swift
//  FoapTest
//
//  Created by Alex Kostenko on 27.04.2023.
//

import Foundation

extension String {
  var asEmojiFlag: String? {
    let base : UInt32 = 127397
    var emoji = ""
    for scalar in unicodeScalars {
      guard let newScalar = UnicodeScalar(base + scalar.value) else {
        return nil
      }

      emoji.unicodeScalars.append(newScalar)
    }

    return String(emoji)
  }
}
