//
//  extensionAVAudio.swift
//  FlashCard
//
//  Created by AgribankCard on 2/9/17.
//  Copyright © 2017 Trương Thắng. All rights reserved.
//

import UIKit
import AVFoundation

// MARK: - AVAudioRecorderDelegate
extension CaptureTableViewController: AVAudioRecorderDelegate {
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
    }
}
