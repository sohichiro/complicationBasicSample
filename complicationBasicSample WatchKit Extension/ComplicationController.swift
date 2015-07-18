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

        var modularTemplate:CLKComplicationTemplate?
        switch complication.family {

            case .ModularLarge:
                let modularLargeTemplate = CLKComplicationTemplateModularLargeStandardBody()
                var rnd = arc4random() % 1000
                modularLargeTemplate.headerTextProvider = CLKSimpleTextProvider(text: "Header \(rnd) / 1000", shortText: "Header", accessibilityLabel: "Template Text")
                rnd = arc4random() % 10000
                modularLargeTemplate.body1TextProvider = CLKSimpleTextProvider(text: "Body1max16chars.", shortText: "Body1", accessibilityLabel: "Template Text")
                rnd = arc4random() % 1000
                modularLargeTemplate.body2TextProvider = CLKSimpleTextProvider(text: "Body2 \(rnd) / 1000", shortText: "Body2", accessibilityLabel: "Template Text")
                modularTemplate = modularLargeTemplate

            case .CircularSmall:
                let circularSmallTemplate = CLKComplicationTemplateCircularSmallRingText()
                let rnd = arc4random() % 100
                circularSmallTemplate.fillFraction = (Float)(rnd / 100);
                circularSmallTemplate.ringStyle = CLKComplicationRingStyle.Closed
                circularSmallTemplate.textProvider = CLKSimpleTextProvider(text: "\(rnd)")
                modularTemplate = circularSmallTemplate
            
            case .ModularSmall:
                let modularSmallTemplate = CLKComplicationTemplateModularSmallColumnsText()
                var rnd = arc4random() % 10
                modularSmallTemplate.row1Column1TextProvider = CLKSimpleTextProvider(text: "\(rnd)", shortText: "MS", accessibilityLabel: "Template Text1")
                rnd = arc4random() % 100
                modularSmallTemplate.row1Column2TextProvider = CLKSimpleTextProvider(text: "\(rnd)", shortText: "MS", accessibilityLabel: "Template Text2")
                rnd = arc4random() % 100
                modularSmallTemplate.row2Column1TextProvider = CLKSimpleTextProvider(text: "\(rnd)", shortText: "MS", accessibilityLabel: "Template Text3")
                rnd = arc4random() % 10
                modularSmallTemplate.row2Column2TextProvider = CLKSimpleTextProvider(text: "\(rnd)", shortText: "MS", accessibilityLabel: "Template Text4")
                modularTemplate = modularSmallTemplate
            
            case .UtilitarianLarge:
                let utilitarianLargeTemplate = CLKComplicationTemplateUtilitarianLargeFlat()
                let rnd = arc4random() % 1000000
                utilitarianLargeTemplate.textProvider = CLKSimpleTextProvider(text: "Utilitarial　\(rnd)", shortText: "ul", accessibilityLabel: "Template Text")
                modularTemplate = utilitarianLargeTemplate
            
            case .UtilitarianSmall:
                let utilitarianSmallTemplate = CLKComplicationTemplateUtilitarianSmallRingText()
                let rnd = arc4random() % 100
                utilitarianSmallTemplate.fillFraction = (Float)(rnd / 100);
                utilitarianSmallTemplate.ringStyle = CLKComplicationRingStyle.Open
                utilitarianSmallTemplate.textProvider = CLKSimpleTextProvider(text: "\(rnd)", shortText: "US", accessibilityLabel: "utilitarianSmall Text")
                modularTemplate = utilitarianSmallTemplate
        }
        
        let timelineEntry = CLKComplicationTimelineEntry(date: NSDate(), complicationTemplate: modularTemplate!)
        handler(timelineEntry)
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
            modularTemplate.headerTextProvider = CLKSimpleTextProvider(text: "LStandard header", shortText: "Lg", accessibilityLabel: "TempTextHeader")
            modularTemplate.body1TextProvider = CLKSimpleTextProvider(text: "Body1 max16chars", shortText: "B1", accessibilityLabel: "TempTextB1")
            modularTemplate.body2TextProvider = CLKSimpleTextProvider(text: "Body2 max16chars", shortText: "B2", accessibilityLabel: "TempTextB2")
            handler(modularTemplate)
            
        case .CircularSmall:
            let circularTemplate = CLKComplicationTemplateCircularSmallRingText()
            circularTemplate.fillFraction = 0.5;
            circularTemplate.ringStyle = CLKComplicationRingStyle.Closed
            circularTemplate.textProvider = CLKSimpleTextProvider(text: "--")
            handler(circularTemplate)
            
        case .ModularSmall:
            let moduleSmallTemplate = CLKComplicationTemplateModularSmallColumnsText()
            moduleSmallTemplate.row1Column1TextProvider = CLKSimpleTextProvider(text: "r1", shortText: "MS", accessibilityLabel: "Template Text1")
            moduleSmallTemplate.row1Column2TextProvider = CLKSimpleTextProvider(text: "c1", shortText: "MS", accessibilityLabel: "Template Text2")
            moduleSmallTemplate.row2Column1TextProvider = CLKSimpleTextProvider(text: "r2", shortText: "MS", accessibilityLabel: "Template Text3")
            moduleSmallTemplate.row2Column2TextProvider = CLKSimpleTextProvider(text: "c2", shortText: "MS", accessibilityLabel: "Template Text4")
            handler(moduleSmallTemplate)
            
        case .UtilitarianLarge:
            let utilitarianLargeTemplate = CLKComplicationTemplateUtilitarianLargeFlat()
            utilitarianLargeTemplate.textProvider = CLKSimpleTextProvider(text: "Utilitarian Lmax18", shortText: "ul", accessibilityLabel: "Template Text")
            handler(utilitarianLargeTemplate)
        case .UtilitarianSmall:
            let utilitarianSmallTemplate = CLKComplicationTemplateUtilitarianSmallRingText()
            utilitarianSmallTemplate.fillFraction = 0.5
            utilitarianSmallTemplate.ringStyle = CLKComplicationRingStyle.Closed
            utilitarianSmallTemplate.textProvider = CLKSimpleTextProvider(text: "utilitarian Small.", shortText: "US", accessibilityLabel: "utilitarianSmall Text")
            handler(utilitarianSmallTemplate)
        }
    }
    
}
