//
//  NewsSectionParsingTest.swift
//  
//
//  Created by Basheer Malaa on 5/27/18.
//

import XCTest
@testable import NBCU

class NewSectionsAndItemsParsingTest: XCTestCase {
    
    func testJsonParsedProperly() {
        let bundle = Bundle(for: type(of: self))
        
        guard let url = bundle.url(forResource: "NBCUNews", withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
                
                XCTFail("Could not load the json needed for the test")
                return
        }
        
        guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves),
            let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                
                XCTFail("Could not load the json needed for the test")
                return
        }
        

        let sections = try? JSONDecoder().decode([NewsSection].self, from: jsonData)
        XCTAssertTrue((sections!.count > 0) == true)
        XCTAssertEqual(sections?.first?.items.count, 3)
    }
}

