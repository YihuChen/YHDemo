//
//  MainViewController.swift
//  YHDemo
//
//  Created by 陈毅琥 on 2022/8/5.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let imgView = UIImageView.init(image: R.image.my_avatar())
        view.addSubview(imgView)
        imgView.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.center.equalToSuperview()
        }
        
        let content = R.string.localizable.localize_test()
        let label = UILabel()
        view.addSubview(label)
        label.text = content
        label.textColor = .red
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imgView.snp.bottom).offset(10)
        }
        print("content : \(content)")
        
        // Do any additional setup after loading the view.
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
