//  ChatViewController.swift
//  Beautefolio


import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import JSQMessagesViewController

class ChatViewController: JSQMessagesViewController {
    
    var messages = [JSQMessage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        senderDisplayName = "A"
        senderId = FIRAuth.auth()?.currentUser?.uid
        let ref = FIRDatabase.database().reference()
        ref.observe(.value, with: { snapshot in
            guard let dic = snapshot.value as? Dictionary<String, AnyObject> else {
                return
            }
            guard let posts = dic["messages"] as? Dictionary<String, Dictionary<String, AnyObject>> else {
                return
            }
            // keyとdateが入ったタプルを作る
            var keyValueArray: [(String, Int)] = []
            for (key, value) in posts {
                keyValueArray.append((key: key, date: value["date"] as! Int))
            }
            keyValueArray.sort{$0.1 < $1.1} // タプルの中のdate でソートしてタプルの順番を揃える(配列で) これでkeyが順番通りになる
            // messagesを再構成
            var preMessages = [JSQMessage]()
            for sortedTuple in keyValueArray {
                for (key, value) in posts {
                    if key == sortedTuple.0 { // 揃えた順番通りにメッセージを作成
                        let senderId = value["senderId"] as! String!
                        let text = value["text"] as! String!
                        let displayName = value["displayName"] as! String!
                        preMessages.append(JSQMessage(senderId: senderId, displayName: displayName, text: text))
                    }
                }
            }
            self.messages = preMessages
            
            self.collectionView.reloadData()
        })
    }
    
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView, messageDataForItemAt indexPath: IndexPath) -> JSQMessageData {
        return messages[indexPath.item]
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath) -> JSQMessageBubbleImageDataSource? {
        if messages[indexPath.row].senderId == senderId {
            return JSQMessagesBubbleImageFactory().outgoingMessagesBubbleImage(
                with: UIColor(red: 112/255, green: 192/255, blue:  75/255, alpha: 1))
        } else {
            return JSQMessagesBubbleImageFactory().incomingMessagesBubbleImage(
                with: UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1))
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as? JSQMessagesCollectionViewCell
        if messages[indexPath.row].senderId == senderId {
            cell?.textView?.textColor = UIColor.white
        } else {
            cell?.textView?.textColor = UIColor.darkGray
        }
        return cell!
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath) -> JSQMessageAvatarImageDataSource? {
        
        return JSQMessagesAvatarImageFactory.avatarImage(
            withUserInitials: messages[indexPath.row].senderDisplayName,
            backgroundColor: UIColor.lightGray, textColor: UIColor.white,
            font: UIFont.systemFont(ofSize: 10), diameter: 30)
    }
    
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        inputToolbar.contentView.textView.text = ""
        let ref = FIRDatabase.database().reference()
        ref.child("messages").childByAutoId().setValue(
            ["senderId": senderId, "text": text, "displayName": senderDisplayName , "date":[".sv": "timestamp"]])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
