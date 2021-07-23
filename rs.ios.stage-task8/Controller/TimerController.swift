//
//  TimerController.swift
//  rs.ios.stage-task8
//
//  Created by Admin on 18.07.2021.
//

import UIKit

public class TimerController: UIViewController {
    @IBOutlet var timeLabel: UILabel!
    @objc public weak var delegate: TimerControllerDelegate!
    @objc public var value: Float = 0.0 {
        willSet{
            if value != newValue{
                timeLabel.text = String.localizedStringWithFormat("%.02f s", newValue)
                if value != slider.value{
                    slider.value = newValue
                }
            }

            
        }
    }
    @IBOutlet var slider: UISlider!
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.masksToBounds = false
        view.clipsToBounds = false
        view.layer.cornerRadius = 40

        view.layer.shadowRadius = 8.0
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        value = sender.value
        
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        delegate?.timerController(self, willDismissWithValue: value)
    }
    
}

@objc public protocol TimerControllerDelegate {
    func timerController(_ controller: TimerController, willDismissWithValue value: Float)
}
