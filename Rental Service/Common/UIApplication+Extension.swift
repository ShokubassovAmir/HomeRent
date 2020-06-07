//
//  UIApplication+Extension.swift
//  Rental Service
//
//  Created by Amir Shokubassov on 4/29/20.
//  Copyright © 2020 Amir Shokubassov. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication{

private struct AssociatedKeys {
    static var user:User!

    
}
    open var user:User? {
        get {
            if let temp = objc_getAssociatedObject(self, &AssociatedKeys.user) as? User {
                return temp;
            } else {
                if let data = UserDefaults.standard.object(forKey: "user") as? NSData {
                    let user = NSKeyedUnarchiver.unarchiveObject(with: data as Data) as? User
                    objc_setAssociatedObject(self,&AssociatedKeys.user,user,objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                    return user
                } else {
                    return nil
                }
            }
        }
    }
    
    
    public func updateUser(profile:User? = nil){
        if profile == nil {
            return
        }
        UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: profile), forKey: "user")
        objc_setAssociatedObject(self,&AssociatedKeys.user,nil,objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    public func clearUser(){
        UserDefaults.standard.removeObject(forKey: "user")
        objc_setAssociatedObject(self,&AssociatedKeys.user,nil,objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

}
