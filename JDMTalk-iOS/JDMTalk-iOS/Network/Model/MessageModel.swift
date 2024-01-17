//
//  MessageModel.swift
//  JDMTalk-iOS
//
//  Created by 픽셀로 on 1/17/24.
//

import Foundation

import MessageKit

struct Sender: SenderType {
    var senderId: String
    var displayName: String
}

struct MessageModel: MessageType {
    let messageId: String
    let sentDate: Date
    let kind: MessageKind
    let sender: SenderType

    init(messageId: String, kind: MessageKind, sender: SenderType, sentDate: Date) {
        self.messageId = messageId
        self.kind = kind
        self.sender = sender
        self.sentDate = sentDate
    }
}

extension MessageModel: Comparable {
    static func == (lhs: MessageModel, rhs: MessageModel) -> Bool {
        return lhs.messageId == rhs.messageId
    }

    static func < (lhs: MessageModel, rhs: MessageModel) -> Bool {
        return lhs.sentDate < rhs.sentDate
    }
}

// Create a text message using the 'MessageKind.text'
func createTextMessage(messageId: String, text: String, sender: SenderType, sentDate: Date) -> MessageModel {
    let kind = MessageKind.text(text)
    return MessageModel(messageId: messageId, kind: kind, sender: sender, sentDate: sentDate)
}
