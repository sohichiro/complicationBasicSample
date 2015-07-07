//
//  InterfaceController.swift
//  complicationBasicSample WatchKit Extension
//
//  Created by 長尾 聡一郎 on 2015/07/07.
//  Copyright © 2015年 長尾 聡一郎. All rights reserved.
//

import WatchKit
import Foundation
import ClockKit


class InterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func pushReflesh() {
        print(__FUNCTION__)
        let complicationServer = CLKComplicationServer.sharedInstance()
        for complication in complicationServer.activeComplications {
            complicationServer.reloadTimelineForComplication(complication)
        }
    }
}
