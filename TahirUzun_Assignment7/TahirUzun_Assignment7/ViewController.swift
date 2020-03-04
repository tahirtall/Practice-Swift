//
//  ViewController.swift
//  TahirUzun_Assignment4
//
//  Created by Tahir Uzun on 2/16/20.
//  Copyright © 2020 Tahir Uzun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // "Current Channel" controls
    var typedNumbers:Int = 0
    var channelUp:Int = 2
    var channelDown:Int = 1
    var newChannel:Int = 13
    var lastChannelNum:Int = 0
    // "TV Power" controls
    var powerOn:Bool = true
    var powerOff:Bool = false
    // Volume Controls
    var currentVolume:Int=50
    
    
    // Object references.
    @IBOutlet weak var channelLabel: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var powerSwitchObj: UISwitch!
    @IBOutlet weak var TVControlView: UIView!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var favoriteChannel: UISegmentedControl!
    @IBOutlet weak var screenView: UIView!
    
    
    @IBAction func numbers(_ sender: UIButton) {
        channelLabel.text = channelLabel.text! + String(sender.tag - 3);
        typedNumbers = Int(channelLabel.text!)!
        
        // Channel selection is limited to 1-99
        if (Int(channelLabel.text!)! > 99) {
            channelLabel.text = "99"
        }
        if (Int(channelLabel.text!)! < 1) {
            channelLabel.text = "1"
        }
    }
    
    @IBAction func channelButtons(_ sender: UIButton) {
        // Clear label screen for new channel input.
        if sender.tag == newChannel {
            channelLabel.text = ""
        }
        // Go up in Channel list
        if sender.tag == channelUp {
            typedNumbers = Int(channelLabel.text!)! + 1
            channelLabel.text = String(typedNumbers)
            // Channel number won't go above 99 when pressed Ch+
            if (typedNumbers > 99) {
                typedNumbers = 99
                channelLabel.text = String(typedNumbers)
            }
        }
        // Go down in Channel list
        if sender.tag == channelDown {
            typedNumbers = Int(channelLabel.text!)! - 1
            channelLabel.text = String(typedNumbers)
            // Channel number won't go below 1 when pressed Ch-
            if (typedNumbers < 1) {
                typedNumbers = 1
                channelLabel.text = String(typedNumbers)
            }
        }
    }
    
    @IBAction func powerSwitch(_ sender: UISwitch) {
        // Conditions for when TV is on.
        if (powerSwitchObj.isOn == true) {
            powerLabel.text = "ON"
            channelLabel.text = "10"
            volumeLabel.text = "50"
            volumeSlider.value = 50
            favoriteChannel.selectedSegmentIndex = 0
            screenView.backgroundColor = UIColor.green
            TVControlView.isHidden = false
        }
        // Conditions for when TV is off.
        if (powerSwitchObj.isOn == false) {
            powerLabel.text = "OFF"
            channelLabel.text = ""
            volumeLabel.text = ""
            TVControlView.isHidden = true
            screenView.backgroundColor = UIColor.systemOrange
        }
    }
    // Volume Controls
    @IBAction func volumeControl(_ sender: UISlider) {
        currentVolume = Int(volumeSlider.value)
        volumeLabel.text = String(currentVolume)
    }
    
    @IBAction func myFavChannel(_ sender: UISegmentedControl) {
        if (favoriteChannel.selectedSegmentIndex == 0) {
            channelLabel.text = "10"
        }
        if (favoriteChannel.selectedSegmentIndex == 1) {
            channelLabel.text = "27"
        }
        if (favoriteChannel.selectedSegmentIndex == 2) {
            channelLabel.text = "19"
        }
        if (favoriteChannel.selectedSegmentIndex == 3) {
            channelLabel.text = "8"
        }
        
    }
    
    // ------------------------------------------------------------------
    // All the code below this mark is for DVR mark.
    // ------------------------------------------------------------------
    
    // DVR Tag Controls
    var dvrPowerOnOff:Int = 20
    var dvrState:Int = 21
    var dvrPlayButton:Int = 22
    var dvrStopButtonTag:Int = 23
    var dvrRecordButtonTag:Int = 24
    var dvrPauseButtonTag:Int = 25
    var dvrRewindButtonTag:Int = 26
    var dvrForwardButtonTag:Int = 27
    
    @IBOutlet weak var dvrPowerSwitch: UISwitch!
    @IBOutlet weak var dvrPowerLabel: UILabel!
    @IBOutlet weak var dvrStateLabel: UILabel!
    @IBOutlet weak var dvrPlayView: UIView!
    @IBOutlet weak var dvrRecordView: UIView!
    
    // Pay, Stop, Pause Outlets
    @IBOutlet weak var dvrPauseButton: UIButton!
    @IBOutlet weak var dvrStopButton: UIButton!
    @IBOutlet weak var dvrPlayButtonOutlet: UIButton!
    
    // Fast Rewind, Fast Forward, Record Outlets
    @IBOutlet weak var dvrRewindOutlet: UIButton!
    @IBOutlet weak var dvrForwardOutlet: UIButton!
    @IBOutlet weak var dvrRecordOutlet: UIButton!
    
    
    @IBAction func dvrPower(_ sender: UISwitch)
    {
        if dvrPowerSwitch.isOn == true
        {
            dvrPowerLabel.text = "On"
            dvrStateLabel.text = "Stopped"
            dvrPlayView.isHidden = false
            dvrRecordView.isHidden = false
        }
        if dvrPowerSwitch.isOn == false
        {
            dvrPowerLabel.text = "Off"
            dvrStateLabel.text = "Stopped"
            dvrPlayView.isHidden = true
            dvrRecordView.isHidden = true
            
            dvrPauseButton.isEnabled = false
            dvrStopButton.isEnabled = true
            dvrPlayButtonOutlet.isEnabled = true
            dvrRewindOutlet.isEnabled = false
            dvrForwardOutlet.isEnabled = false
            dvrRecordOutlet.isEnabled = true
        }
    }
    
    // Play Button on press.
    @IBAction func dvrPlayButton(_ sender: UIButton)
    {
        dvrStateLabel.text = "Playing"
        dvrPauseButton.isEnabled = true
        dvrForwardOutlet.isEnabled = true
        dvrRewindOutlet.isEnabled = true
        dvrStopButton.isEnabled = true
        dvrPlayButtonOutlet.isEnabled = true
        dvrRecordOutlet.isEnabled = true
    }
    
    // Stop button on press.
    @IBAction func dvrStopButton(_ sender: UIButton)
    {
        if dvrStateLabel.text != "Recording"
        {
            dvrStateLabel.text = "Stopped"
            dvrPauseButton.isEnabled = false
            dvrForwardOutlet.isEnabled = false
            dvrRewindOutlet.isEnabled = false
        }
        
        if dvrStateLabel.text == "Recording"
        {
            dvrStateLabel.text = "Stopped"
            dvrPlayButtonOutlet.isEnabled = true
            dvrPauseButton.isEnabled = false
            dvrForwardOutlet.isEnabled = false
            dvrRewindOutlet.isEnabled = false
        }
        
    }
    
    // Record button on press.
    @IBAction func dvrRecordButton(_ sender: UIButton)
    {
        if dvrStateLabel.text == "Stopped"
        {
            dvrStateLabel.text = "Recording"
            dvrPlayButtonOutlet.isEnabled = false
            dvrPauseButton.isEnabled = false
            dvrForwardOutlet.isEnabled = false
            dvrRewindOutlet.isEnabled = false
        }
        else {
            let alert3 = UIAlertController(title: "Invalid Press", message: "Recording is only allowed during 'Stopped' state.", preferredStyle: .actionSheet)
            alert3.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            alert3.addAction(UIAlertAction(title: "Force Apply", style: .default, handler: {(action) -> Void in
                self.dvrStateLabel.text = "Recording"
                self.dvrStopButton.isEnabled = true
                self.dvrPlayButtonOutlet.isEnabled = false
                self.dvrPauseButton.isEnabled = false
                self.dvrForwardOutlet.isEnabled = false
                self.dvrRewindOutlet.isEnabled = false
                self.dvrRecordOutlet.isEnabled = true
                
                let alertController = UIAlertController(title:"Success", message: "Recording has successfully started", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title:"Cancel", style: .cancel, handler: nil))
                self.present(alertController, animated: true, completion: nil)
                
            }))
            self.present(alert3, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func dvrFastRewind(_ sender: UIButton)
    {
        dvrStateLabel.text = "Fast Rewinding"
    }
    
    @IBAction func dvrFastForward(_ sender: UIButton)
    {
        dvrStateLabel.text = "Fast Forwarding"
    }
    
    @IBAction func dvrPausedButton(_ sender: UIButton)
    {
        dvrStateLabel.text = "Paused"
    }
    
    // ------------------------------------------------------------------
    // All the code below this mark is for Configuration
    // ------------------------------------------------------------------
    
    @IBOutlet weak var labelTextField: UITextField!
    @IBOutlet weak var configSegment: UISegmentedControl!
    @IBOutlet weak var tvSegment: UISegmentedControl!
    @IBOutlet weak var saveButoon: UIButton!
    @IBOutlet weak var tvCurrChannelTextField: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var configChannelLabel: UILabel!
    
    @IBAction func configStepper(_ sender: UIStepper)
    {
        configChannelLabel.text = ""
        configChannelLabel.text = String(Int(sender.value))
    }
    
    
    @IBAction func config(_ sender: AnyObject)
    {
        if sender.tag == 5
        {
            if labelTextField.text!.count > 0 && labelTextField.text!.count < 4
            {
                if configSegment.selectedSegmentIndex == 0
                {
                    tvSegment.setTitle(labelTextField.text, forSegmentAt: 0)
                }
                if configSegment.selectedSegmentIndex == 1
                {
                    tvSegment.setTitle(labelTextField.text, forSegmentAt: 1)
                }
                if configSegment.selectedSegmentIndex == 2
                {
                    tvSegment.setTitle(labelTextField.text, forSegmentAt: 2)
                }
                if configSegment.selectedSegmentIndex == 3
                {
                    tvSegment.setTitle(labelTextField.text, forSegmentAt: 3)
                }
            }
            if labelTextField.text!.count == 0 || labelTextField.text!.count > 4
            {
                let alert = UIAlertController(title: "Reminder", message: "Your label can't be empty or larger than 3 characters", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
            tvCurrChannelTextField.text = configChannelLabel.text
        }
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

