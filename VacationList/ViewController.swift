//
//  ViewController.swift
//  VacationList
//
//  Created by Liulu on 14/10/23.
//  Copyright (c) 2014年 Liulu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var labeltitle: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var pagecontrol: UIPageControl!
    @IBOutlet weak var textviewcontent: UITextView!
    
    var backgroundMusic:AVAudioPlayer?
    var pagetilte = ["欢迎使用","想好了就去做","介绍下自己"]
    var pageimage = ["001","002","003"]
    var pagecontent = ["欢迎使用Swift语言编写的简单的节目显示程序，有任何疑问和建议，请联系刘璐，邮箱：363608715@qq.com","有句广告词说的好，Just Do it!","亲爱的朋友们，请允许我简单的介绍一下自己。"]
    override func viewDidLoad() {
        super.viewDidLoad()
        PlayMusic()

    }
    
    override func viewDidLayoutSubviews() {
        pagecontrol.addTarget(self, action: "pageChanged:", forControlEvents: UIControlEvents.ValueChanged)
        
    }
    
    func pageChanged(sender:UIPageControl){
        labeltitle.text = pagetilte[sender.currentPage]
        imageview.image = UIImage(named: pageimage[sender.currentPage])
        textviewcontent.text = pagecontent[sender.currentPage]
    }
    
    override func viewWillAppear(animated: Bool) {
        
        
    }
    
    func PlayMusic(){
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            // Load and start background music.载入运行背景音乐
            let url = NSBundle.mainBundle().URLForResource("bk01", withExtension: "mp3")
            self.backgroundMusic = AVAudioPlayer(contentsOfURL: url, error: nil)
            self.backgroundMusic?.numberOfLoops = -1
            self.backgroundMusic?.volume = 1.0
            self.backgroundMusic?.play()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

