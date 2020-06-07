//
//  FAQViewController.swift
//  Rental Service
//
//  Created by Amir Shokubassov on 4/22/20.
//  Copyright © 2020 Amir Shokubassov. All rights reserved.
//

import UIKit
import FAQView

class FAQViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let items = [FAQItem(question: "Что такое сервис \"HomeRent\"?", answer: "reddit is a source for what's new and popular on the web. Users like you provide all of the content and decide, through voting, what's good and what's junk. Links that receive community approval bubble up towards #1, so the front page is constantly in motion and (hopefully) filled with fresh, interesting links."), FAQItem(question: "Могу ли я подать свое жилье в аренду через Ваш сервис?", answer: "It's (sort of) a play on words -- i.e., \"I read it on reddit.\" Also, there are some unintentional but interesting Latin meanings to the word \"reddit\"."), FAQItem(question: "Можно ли снять жилье в аренду неиспользуя мобильное приложение?", answer: "A submission's score is simply the number of upvotes minus the number of downvotes. If five users like the submission and three users don't it will have a score of 2. Please note that the vote numbers are not \"real\" numbers, they have been \"fuzzed\" to prevent spam bots etc. So taking the above example, if five users upvoted the submission, and three users downvote it, the upvote/downvote numbers may say 23 upvotes and 21 downvotes, or 12 upvotes, and 10 downvotes. The points score is correct, but the vote totals are \"fuzzed\".")]
        let faqView = FAQView(frame: view.frame, title: "Топ запросы", items: items)
        faqView.viewBackgroundColor = UIColor.white
        self.view.addSubview(faqView)
        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
        let color = UIColor(rgb: 0xEBF9FD)
        let titlecolor = UIColor(rgb: 0x00E2D6)
        self.navigationController?.navigationBar.barTintColor = color
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titlecolor]
        self.navigationItem.title = "FAQ"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
        self.navigationItem.title = " "
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
