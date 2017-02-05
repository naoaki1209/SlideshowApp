//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 増澤尚翠 on 2017/02/05.
//  Copyright © 2017年 vulcan999. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var timer: Timer!
    // タイマー用の時間のための変数
    var timer_sec: Int = 0
    
    let imageNameArray = [
        "001.JPG",
        "002.JPG",
        "006.JPG",
        ]


    @IBAction func unwind(segue: UIStoryboardSegue) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // selector: #selector(updatetimer) で指定された関数
    // timeInterval: 2, repeats: true で指定された通り、2秒毎に呼び出され続ける
    func updateTimer(timer: Timer) {
        self.timer_sec += 1
        
        // 範囲より上を指している場合、最初の画像を表示
        if timer_sec > 2 {
            timer_sec = 0
        }
        
        // timer_secから名前を取り出し
        let name = imageNameArray[timer_sec]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        self.imageView.image = image
    }
    
    @IBAction func startTimer(_ sender: UIButton) {

        // タイマーの作成、始動
        if self.timer == nil {
        self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        //Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
            //ボタンのタイトル変更.
            sender.setTitle("停止", for: .normal)
            self.nextImage.isEnabled = false
            self.prevImage.isEnabled = false
            
        } else{
            //timerを破棄する
            self.timer.invalidate()
            self.timer = nil
            //ボタンのタイトル変更.
            sender.setTitle("再生", for: .normal)
            self.nextImage.isEnabled = true
            self.prevImage.isEnabled = true
            }
        
    }
    
    @IBOutlet weak var nextImage: UIButton!
    @IBAction func nextImage(_ sender: UIButton) {
        if self.timer == nil {
            timer_sec += 1
            // 範囲より上を指している場合、最初の画像を表示
            if timer_sec > 2 {
                timer_sec = 0
            }
            
            // timer_secから名前を取り出し
            let name = imageNameArray[timer_sec]
            
            // 画像を読み込み
            let image = UIImage(named: name)
            
            // Image Viewに読み込んだ画像をセット
            self.imageView.image = image
        } //else{
            //sender.isEnabled = false
        //}
    }
    
    @IBOutlet weak var prevImage: UIButton!
    @IBAction func prevImage(_ sender: UIButton) {
        if self.timer == nil {
            timer_sec -= 1
            // 範囲より上を指している場合、最初の画像を表示
            if timer_sec < 0 {
                timer_sec = 2
            }
            
            // timer_secから名前を取り出し
            let name = imageNameArray[timer_sec]
            
            // 画像を読み込み
            let image = UIImage(named: name)
            
            // Image Viewに読み込んだ画像をセット
            self.imageView.image = image
        } //else{
            //sender.isEnabled = false
        //}

    }
    @IBAction func onTapImage(_ sender: Any) {
        performSegue(withIdentifier: "result", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
        resultViewController.timer_sec = timer_sec
    }
    
    //@IBAction func unwind(segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
    //}

}

