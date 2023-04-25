//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 久保田 梨央 on 2023/04/19.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    var imageIndex:Int = 0
    var timer: Timer!
    let images = [UIImage(named: "1.jpeg")!, UIImage(named: "2.jpeg")!, UIImage(named: "3.jpeg")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func forwardButtonTap(_ sender: Any) {
        if imageIndex == 2 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        imageView.image = images[imageIndex]
    }
    
    @IBAction func backButoonTap(_ sender: Any) {
        if imageIndex == 0 {
            imageIndex = 2
        } else {
            imageIndex -= 1
        }
        imageView.image = images[imageIndex]
    }
    
    @IBAction func startStopButtonTap(_ sender: Any) {
        if self.timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            startStopButton.setTitle("停止", for: .normal)
            forwardButton.isEnabled = false
            backButton.isEnabled = false
            
        } else {
            timer.invalidate()
            timer = nil
            startStopButton.setTitle("再生", for: .normal)
            forwardButton.isEnabled = true
            backButton.isEnabled = true
        }
    }
    
    @objc func changeImage() {
        if imageIndex == 2 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        imageView.image = images[imageIndex]
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewControlller:ResultViewController = segue.destination as! ResultViewController
       
        if self.timer != nil {
            timer.invalidate()
            timer = nil
            startStopButton.setTitle("再生", for: .normal)
            forwardButton.isEnabled = true
            backButton.isEnabled = true
        }
        
        resultViewControlller.tappedImage = imageView.image!
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
    }
    
    
   
    
    
}

