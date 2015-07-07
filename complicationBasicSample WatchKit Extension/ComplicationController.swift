//
//  ComplicationController.swift
//  complicationBasicSample WatchKit Extension
//
//  Created by 長尾 聡一郎 on 2015/07/07.
//  Copyright © 2015年 長尾 聡一郎. All rights reserved.
//

import ClockKit


class ComplicationController: NSObject, CLKComplicationDataSource {
    
    // MARK: - Timeline Configuration
    
    func getSupportedTimeTravelDirectionsForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTimeTravelDirections) -> Void) {
        handler([CLKComplicationTimeTravelDirections.None])
    }
    
    func getTimelineStartDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
        handler(nil)
    }
    
    func getTimelineEndDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
        handler(nil)
    }
    
    func getPrivacyBehaviorForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.ShowOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntryForComplication(complication: CLKComplication, withHandler handler: ((CLKComplicationTimelineEntry?) -> Void)) {
        // Call the handler with the current timeline entry
        if complication.family == .ModularLarge {
            let modularTemplate = CLKComplicationTemplateModularLargeStandardBody()
            var rnd = arc4random() % 100
            modularTemplate.headerTextProvider = CLKSimpleTextProvider(text: "\(rnd)", shortText: "Lg", accessibilityLabel: "Template Text")
            rnd = arc4random() % 10
            modularTemplate.body1TextProvider = CLKSimpleTextProvider(text: "\(rnd)", shortText: "B1", accessibilityLabel: "Template Text")
            rnd = arc4random() % 1000
            modularTemplate.body2TextProvider = CLKSimpleTextProvider(text: "\(rnd)", shortText: "B2", accessibilityLabel: "Template Text")
            let timelineEntry = CLKComplicationTimelineEntry(date: NSDate(), complicationTemplate: modularTemplate)
            handler(timelineEntry)
        }
        else {
            handler(nil)
        }
    }
    
    func getTimelineEntriesForComplication(complication: CLKComplication, beforeDate date: NSDate, limit: Int, withHandler handler: (([CLKComplicationTimelineEntry]?) -> Void)) {
        // Call the handler with the timeline entries prior to the given date
        handler(nil)
    }
    
    func getTimelineEntriesForComplication(complication: CLKComplication, afterDate date: NSDate, limit: Int, withHandler handler: (([CLKComplicationTimelineEntry]?) -> Void)) {
        // Call the handler with the timeline entries after to the given date
        handler(nil)
    }
    
    // MARK: - Update Scheduling
    
    func getNextRequestedUpdateDateWithHandler(handler: (NSDate?) -> Void) {
        // Call the handler with the date when you would next like to be given the opportunity to update your complication content
        handler(nil);
    }
    
    // MARK: - Placeholder Templates
    
    func getPlaceholderTemplateForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached
        switch complication.family {
        case .ModularLarge:
            let modularTemplate = CLKComplicationTemplateModularLargeStandardBody()
            modularTemplate.headerTextProvider = CLKSimpleTextProvider(text: "Large", shortText: "Lg", accessibilityLabel: "TempTextHeader")
            modularTemplate.body1TextProvider = CLKSimpleTextProvider(text: "Body1", shortText: "B1", accessibilityLabel: "TempTextB1")
            modularTemplate.body2TextProvider = CLKSimpleTextProvider(text: "Body2", shortText: "B2", accessibilityLabel: "TempTextB2")
            handler(modularTemplate)
        case .CircularSmall:
            handler(nil)
        case .ModularSmall:
            handler(nil)
        case .UtilitarianLarge:
            handler(nil)
        case .UtilitarianSmall:
            handler(nil)
        }
    }
    
}
