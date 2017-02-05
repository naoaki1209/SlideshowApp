//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 増澤尚翠 on 2017/02/05.
//  Copyright © 2017年 vulcan999. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    let imageNameArray = [
        "001.JPG",
        "002.JPG",
        "006.JPG",
        ]
    
    var timer_sec: Int = 0

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // timer_secから名前を取り出し
        let name = imageNameArray[timer_sec]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        self.imageView.image = image

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
