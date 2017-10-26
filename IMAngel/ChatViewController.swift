//
//  ChatViewController.swift
//  IMAngel
//
//  Created by kingcyk on 31/01/2017.
//  Copyright © 2017 kingcyk. All rights reserved.
//

import UIKit

class ChatViewController: RCConversationViewController {

    override func viewDidLoad() {
        RCIM.shared().globalMessageAvatarStyle = .USER_AVATAR_CYCLE
        super.viewDidLoad()
//        let targetUser = RCIMClient.shared().currentUserInfo!
        self.targetId = "Angel"
        self.userName = "Angel"
        self.conversationType = .ConversationType_PRIVATE
        self.title = self.userName
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
