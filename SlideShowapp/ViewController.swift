//
//  ViewController.swift
//  SlideShowapp
//
//  Created by 吉谷拓海 on 2020/06/11.
//  Copyright © 2020 takumi.yoshiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var switchButton: UIButton!
    

    var timer: Timer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image = UIImage(named: "sample1")
        imageView.image = image

}
    
    var displayImageNo = 0
    
    // 画像の名前の配列
    let imageNameArray = ["sample1", "sample2", "sample3", "sample4", "sample5"]

    // 表示している画像の番号を元に画像を表示する
    func displayImage() {
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[displayImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
    }
    
    
    @IBAction func nextButtonTap(_ sender: Any) {
        
        if displayImageNo < imageNameArray.count - 1 {
        displayImageNo += 1
        displayImage()
    }else{
    displayImageNo = 0
    displayImage()
    }
    }
    
    
    
    
    
    
    @IBAction func backBottunTap(_ sender: Any) {
        
        
        if displayImageNo >= 1 && displayImageNo <= imageNameArray.count - 1 {
            displayImageNo -= 1
            
            displayImage()
            
        }
        else{
            displayImageNo = imageNameArray.count - 1
            displayImage()
        }
    }
    
    @IBAction func switchButtonTap(_ sender: Any) {
        

        
        if self.timer == nil{
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            nextButton.isEnabled = false
            backButton.isEnabled = false
            
            switchButton.setTitle("停止", for: .normal)
            self.view.backgroundColor = UIColor.lightGray
            switchButton.titleLabel?.font =
                UIFont.systemFont(ofSize: 25)
            
        }
        else if self.timer != nil{
            self.timer.invalidate()
            
            self.timer = nil
            nextButton.isEnabled = true
            backButton.isEnabled = true
            switchButton.setTitle("再生", for: .normal)
            
            self.view.backgroundColor = UIColor.white
            switchButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            
            
        }
    }
    @objc func updateTimer(_ timer: Timer) {
                    
            
                    if displayImageNo < imageNameArray.count - 1 {
                        displayImageNo += 1
                        displayImage()
                        print(displayImageNo)
                    
                    }else{
                    displayImageNo = 0
                    displayImage()
                        print(displayImageNo)
    }

    }
    
    @IBAction func onTapAction(_ sender: Any) {
        self.performSegue(withIdentifier: "toZoomIn", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let zoomInViewController:ZoomInViewController =
        segue.destination as! ZoomInViewController
        let name = imageNameArray[displayImageNo]
        let image = UIImage(named: name)
        
        zoomInViewController.selectedImg = image
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }

    
        }

