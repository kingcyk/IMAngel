//
//  ChatListViewController.swift
//  IMAngel
//
//  Created by kingcyk on 31/01/2017.
//  Copyright © 2017 kingcyk. All rights reserved.
//

import UIKit

class ChatListViewController: RCConversationListViewController {

    @IBAction func showMenu(_ sender: UIBarButtonItem) {
//        let items = [MenuItem.initWithTitle("Chat with test", iconName: "tabbar_mainframeHL", glow: UIColor.gray, index: 0),
//                     MenuItem.initWithTitle("Contacts", iconName: "tabbar_contactsHL", glow: UIColor.gray, index: 1)]
//        let menu = PopMenu(frame: self.view.bounds, items: items)
//        menu?.menuAnimationType = .netEase
//        if (menu?.isShowed)! {
//            return
//        }
//        menu?.didSelectedItemCompletion? = { (selectedItem: MenuItem) -> Void in
//            print(selectedItem.index)
//        } as! DidSelectedItemBlock
//        menu?.show(at: self.view)
    }
    let ChatVC = RCConversationViewController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.connectServevr { 
            print("Success!")
            self.setDisplayConversationTypes([RCConversationType.ConversationType_PRIVATE.rawValue,
                                              RCConversationType.ConversationType_GROUP.rawValue,
                                              RCConversationType.ConversationType_DISCUSSION.rawValue,
                                              RCConversationType.ConversationType_PUBLICSERVICE.rawValue,
                                              RCConversationType.ConversationType_SYSTEM.rawValue])
            self.refreshConversationTableViewIfNeeded()
        }
        self.tabBarController?.tabBar.isHidden = false
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as? RCConversationViewController
        destinationVC?.targetId = self.ChatVC.targetId
        destinationVC?.title = self.ChatVC.title
        destinationVC?.conversationType = self.ChatVC.conversationType
        self.tabBarController?.tabBar.isHidden = true
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    override func onSelectedTableRow(_ conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, at indexPath: IndexPath!) {
        // Use code
//        let ChatVC = RCConversationViewController()
//        ChatVC.targetId = model.targetId
//        ChatVC.title = model.conversationTitle
//        ChatVC.conversationType = model.conversationType
//        self.navigationController?.pushViewController(ChatVC, animated: true)
//        self.tabBarController?.tabBar.isHidden = true
        
        // Use Storyboard
        ChatVC.targetId = model.targetId
        ChatVC.title = model.conversationTitle
        ChatVC.conversationType = model.conversationType
        self.performSegue(withIdentifier: "tapOnCell", sender: self)
    }

}
