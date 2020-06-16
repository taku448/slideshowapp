//
//  ZoomInViewController.swift
//  SlideShowapp
//
//  Created by 吉谷拓海 on 2020/06/12.
//  Copyright © 2020 takumi.yoshiya. All rights reserved.
//

import UIKit

class ZoomInViewController: UIViewController {
    
    var selectedImg: UIImage!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageView.image = selectedImg
    }
    
    @IBAction func backBtn(_ sender: Any) {

        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
