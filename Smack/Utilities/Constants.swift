//
//  File.swift
//  Smack
//
//  Created by Ricardo Herrera Petit on 1/31/18.
//  Copyright © 2018 Ricardo Herrera Petit. All rights reserved.
//

import Foundation


typealias  CompletionHandler = (_ Sucess:Bool) -> ()

//URL_CONSTANTS
let BASE_URL = "https://chattychatcalimat.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"

//Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"

//User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

