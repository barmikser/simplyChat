//
//  WelcomeViewController.swift
//  SimplyChat
//
//  Created by Артем Маков on 25/04/2020.
//  Copyright © 2020 EPAM Match. All rights reserved.
//

import UIKit

 

class WelcomeViewController: UIViewController {
    
    @IBOutlet var holderView: UIView!
    
    let scrollView = UIScrollView()
    let titles = ["WELCOME", "test1", "test2", "test3"]
    var label = UILabel()
    
    var imageView = UIImageView()
    
    var button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        scrollView.frame =  holderView.bounds
        
        holderView.addSubview(scrollView)
        
        button = UIButton(frame: CGRect(x: 10, y: holderView.frame.size.height-120, width: holderView.frame.size.width-40, height: 60))
        button.backgroundColor = .black
        button.setTitle("Start", for: .normal)
        
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        configure()
    }
    
    func configure() {
        for iterator in 0..<3 {
            
            var xx = CGFloat(iterator) * holderView.frame.size.width
            var height = holderView.frame.size.height
            let pageView = UIView(frame: CGRect(x: xx, y: CGFloat(0), width: holderView.frame.width, height: height))
            scrollView.addSubview(pageView)
            //
            label = UILabel(frame: CGRect(x: 10, y: 10, width: pageView.frame.size.width-10, height: 120))
            
            imageView = UIImageView(frame: CGRect(x: 10, y: label.frame.minY+130, width: pageView.frame.size.width-10, height: pageView.frame.size.height - 60 - 130 - 15))
            
            
            
            label.textAlignment = .center
            label.font = UIFont(name: "Helvetica-Bold", size: 30)
            pageView.addSubview(label)
            label.text = titles[iterator]

            
            imageView.contentMode = .scaleAspectFit
            
            imageView.image = UIImage(systemName: "pencil")
            pageView.addSubview(imageView)
            
            
            if iterator == 2 {
                button.setTitle("Lets go", for: .normal)
            }
            button.addTarget(self, action: #selector(self.didTapButton(_:)), for: .touchUpInside)
            button.tag = iterator+1
            scrollView.addSubview(button)
        }
        
        scrollView.contentSize = CGSize(width: holderView.frame.size.width, height: 0)
        scrollView.isPagingEnabled = true
    }
    
    @objc func didTapButton(_ button: UIButton) {
        guard button.tag < 3 else {
            //при прохождении трех экранов переход на логин скрин
            print("over")
            //установка на то, что мы больше не видим инишнл инфу
            Core.shared.setIsNotNewUser()
            //закрытие контроллера
            dismiss(animated: true)
            return
        }
        //scroll to next
        print("tap")
        scrollView.setContentOffset(CGPoint(x: holderView.frame.size.width * CGFloat(button.tag), y: 0), animated: true)
    }
}

