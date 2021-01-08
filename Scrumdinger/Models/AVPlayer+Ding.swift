//
//  AVPlayer+Ding.swift
//  Scrumdinger
//
//  Created by David Bailey on 07/01/2021.
//

import AVFoundation
import Foundation

extension AVPlayer {
    static let sharedDingPlayer: AVPlayer = {
        guard let url = Bundle.main.url(forResource: "ding", withExtension: "wav") else { fatalError("Failed to find sound file.") }
        return AVPlayer(url: url)
    }()
}
