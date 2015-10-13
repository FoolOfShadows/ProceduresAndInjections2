//
//  AppDelegate.swift
//  Procedures & Injections 2.0
//
//  Created by Fool on 1/23/15.
//  Copyright (c) 2015 Fulgent Wake. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
	@IBOutlet weak var winEducation: NSWindow!

    //Procedures
    @IBOutlet weak var papView: NSButton!
    @IBOutlet weak var dreView: NSButton!
    @IBOutlet weak var stoolCardView: NSButton!
    @IBOutlet weak var idView: NSButton!
    @IBOutlet weak var ekgView: NSButton!
    @IBOutlet weak var earLavageView: NSPopUpButton!
	@IBOutlet weak var nebulizerView: NSPopUpButton!
    @IBOutlet weak var cryoTextView: NSTextField!
    @IBOutlet weak var skinTagTextView: NSTextField!
    @IBOutlet weak var sutureRemovalTextView: NSTextField!
	
	//Labs
	@IBOutlet weak var udipView: NSComboBox!
	@IBOutlet weak var ucgComboView: NSComboBox!
	@IBOutlet weak var udsComboView: NSComboBox!
	@IBOutlet weak var mudsComboView: NSComboBox!
	@IBOutlet weak var fluSwabComboView: NSComboBox!
	@IBOutlet weak var glucometerTextView: NSTextField!
    
    //Injections
    @IBOutlet weak var dkSiteView: NSPopUpButton!
    @IBOutlet weak var cSiteView: NSPopUpButton!
    @IBOutlet weak var solSiteView: NSPopUpButton!
    @IBOutlet weak var b12SiteView: NSPopUpButton!
    @IBOutlet weak var phSiteView: NSPopUpButton!
    @IBOutlet weak var torSiteView: NSPopUpButton!
	@IBOutlet weak var torAmountView: NSPopUpButton!
    @IBOutlet weak var tstSiteView: NSPopUpButton!
    @IBOutlet weak var estSiteView: NSPopUpButton!
    @IBOutlet weak var ppdSiteView: NSPopUpButton!
    @IBOutlet weak var fluSiteView: NSPopUpButton!
	@IBOutlet weak var fluTypeView: NSPopUpButton!
    @IBOutlet weak var pnvSiteView: NSPopUpButton!
    @IBOutlet weak var tdapSiteView: NSPopUpButton!
    @IBOutlet weak var nphSiteView: NSPopUpButton!
    @IBOutlet weak var rocSiteView: NSPopUpButton!
	@IBOutlet weak var rocAmountView: NSPopUpButton!
    @IBOutlet weak var depoSiteView: NSPopUpButton!
    @IBOutlet weak var epoSiteView: NSPopUpButton!
    @IBOutlet weak var arthSiteView: NSPopUpButton!
    @IBOutlet weak var synvSiteView: NSPopUpButton!
    @IBOutlet weak var trigSiteView: NSComboBox!
    @IBOutlet weak var hepA1View: NSButton!
    @IBOutlet weak var hepA2View: NSButton!
    @IBOutlet weak var hepB1View: NSButton!
    @IBOutlet weak var hepB2View: NSButton!
    @IBOutlet weak var hepB3View: NSButton!
    @IBOutlet weak var hepTRx1View: NSButton!
    @IBOutlet weak var hepTRx2View: NSButton!
    @IBOutlet weak var hepTRx3View: NSButton!
    @IBOutlet weak var hepSiteView: NSPopUpButton!
    @IBOutlet weak var otherTextView: NSTextField!
	
	//Other
	//@IBOutlet weak var samplesTextView: NSTextField!
	//@IBOutlet weak var samplesTextView: NSScrollView!
	@IBOutlet var samplesTextView: NSTextView!
	//@IBOutlet weak var educationTextView: NSTextField!
	//@IBOutlet weak var educationTextView: NSScrollView!
	@IBOutlet var educationTextView: NSTextView!
	
	//Education Window Controllers
	@IBOutlet weak var weightLossView: NSButton!
	@IBOutlet weak var diabeticDietView: NSButton!
	@IBOutlet weak var lowCholesterolView: NSButton!
	@IBOutlet weak var lowSaltView: NSButton!
	@IBOutlet weak var hypertensionView: NSButton!
	@IBOutlet weak var dietaryFiberView: NSButton!
	@IBOutlet weak var coumadinView: NSButton!
	@IBOutlet weak var exerciseView: NSButton!
	@IBOutlet weak var tobaccoView: NSButton!
	@IBOutlet weak var stressView: NSButton!
	
    
    
    @IBAction func takeClearForm(sender: AnyObject) {
        clearForm()
    }
    
	@IBAction func takeEducation(sender: AnyObject) {
		clearEducation()
		winEducation.makeKeyAndOrderFront(self)
	}
    
	@IBAction func takeProcessEducation(sender: AnyObject) {
		var educationList = [String]()
		
		if !educationTextView.string!.isEmpty {
			educationList.append(educationTextView.string!)
		}
		
		let educationVarList = [weightLossView, diabeticDietView, lowCholesterolView, lowSaltView, hypertensionView, dietaryFiberView, coumadinView, exerciseView, tobaccoView, stressView]
		let educationVerbiageList = ["Weight loss diet with calorie restriction and food diary counseled and admonished, info given.", "Diabetic diet and lifestyle counseling and info given, 45 gm carb per meal.", "Low fat, low cholesterol diet and exercise counseling and info given.", "Low salt and cardiac diet counseling and info given, 2400 mg Sodium per day.", "Hypertension lifestyle management counseling and info given.", "Dietary fiber education and info given.", "Coumadin diet education with Vitamin K food  content info given.", "Exercise counseling, guidance and education given.", "Tobacco cessation admonished: counseling and info given (3-10 min or > 10 min).", "Stress and anxiety management counseling given."]
		
		for var i = 0; i < educationVarList.count; i++ {
			if (educationVarList[i].state == NSOnState) {
				educationList.append(educationVerbiageList[i])
			}
		}
		
		educationTextView.string = educationList.joinWithSeparator("\n")
		
		winEducation.orderOut(self)
	}
	
    @IBAction func takeProcessForm(sender: AnyObject) {
        
		let procedureList = processProcedures()
		let labList = processLabs()
		let injList = processInjections()
		
        

        let procedureListAsString = procedureList.joinWithSeparator("\n")
        var finalProcedureList = ""
        if procedureListAsString != "" {
        finalProcedureList = "Office procedure(s) performed:\n\(procedureListAsString)\n"
        }
		
		let labListAsString = labList.joinWithSeparator("\n")
		var finalLabList = ""
		if labListAsString != "" {
			finalLabList = "Lab(s) ordered:\n\(labListAsString)\n"
		}
        
        let injectionListAsString = injList.joinWithSeparator("\n")
        var finalInjectionList = ""
        if injectionListAsString != "" {
        finalInjectionList = "Injection(s) given:\n\(injectionListAsString)\n"
        }
		
		var finalEducationList = ""
		if educationTextView.string != "" {
			finalEducationList = "Patient education done:\n\(educationTextView.string!)\n"
		}
		
		var finalSampleList = ""
		if samplesTextView.string != "" {
			finalSampleList = "Samples given at visit:\n\(samplesTextView.string!)"
		}
		
        
        //Set final text for output
        let finalResults = "\(finalProcedureList)\(finalLabList)\(finalInjectionList)\(finalEducationList)\(finalSampleList)"
        //Clear the system clipboard
        let pasteBoard = NSPasteboard.generalPasteboard()
        pasteBoard.clearContents()
        //Set the system clipboard to the final text
        pasteBoard.setString(finalResults, forType: NSPasteboardTypeString)
        //Activate TextEdit
        NSWorkspace.sharedWorkspace().launchApplication("TextEdit")
        
        
    }
	
    //Quits program if window is closed
    func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool {
        return true
    }
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        clearForm()
    }


	func processProcedures() ->[String] {
		//Instantiate an array of strings to collect the results from processing the controllers
		var procedureList = [String]()
		
		//Process simple procedures (checkbox only) into variable procdureList
		let procedureVarListSimple = [papView, dreView, stoolCardView, idView, ekgView]
		let procedureVerbiageListSimple = ["Pap smear", "Digital rectal exam", "Hemoccult Stool cards x 3 given for colon cancer screening", "Incision and drainage of abscess, consent signed", "EKG, consent signed"]
		
		for var i = 0; i < procedureVarListSimple.count; i++ {
			if (procedureVarListSimple[i].state == NSOnState) {
		                procedureList.append(procedureVerbiageListSimple[i])
				}
			}
		
		
		//Process ear lavage into variable procedureList
		if (earLavageView.titleOfSelectedItem != nil) && (earLavageView.titleOfSelectedItem != "") {
			procedureList.append("Ear lavage of \(earLavageView.titleOfSelectedItem!), consent signed")
		}
		
		//Process nebulizer into variable procedureList
		if (nebulizerView.titleOfSelectedItem != nil) && (nebulizerView.titleOfSelectedItem != "") {
			let nebType = nebulizerView.titleOfSelectedItem!
			switch nebType {
				case "Albuterol":
					procedureList.append("Nebulizer treatment using Abluterol Sulfate 0.083% (2.5 mg/3 ml) solution")
				case "Atrovent":
				procedureList.append("Nebulizer treatment using Atrovent (Ipratropium Bromide) 0.02% (0.5 mg/2.5 ml) solution")
				case "Duoneb":
				procedureList.append("Nebulizer treatment using Duoneb (Ipratropium Bromide 0.5 mg + Albuterol sulfate 3 mg) in 3 ml solution")
			default:
				break
			}
		}
		
		//Process complex procedures into variable procedureList
		let procedureVarListComplex = [cryoTextView, skinTagTextView, sutureRemovalTextView, ]
		let procedureVarVerbiageComplex = ["Cryo treatment x \(cryoTextView.stringValue), consent signed", "Skin tag removal x \(skinTagTextView.stringValue), consent signed", "Suture/staple removal x \(sutureRemovalTextView.stringValue), consent signed"]
		
		for var i = 0; i < procedureVarListComplex.count; i++ {
			if (!procedureVarListComplex[i].stringValue.isEmpty) {
				procedureList.append(procedureVarVerbiageComplex[i])
			}
		}
		
		return procedureList
	}
	
	func processLabs() ->[String] {
		//Instantiate an array of strings to collect the results from processing the controllers
		var labList = [String]()
		
		
		//Process labs into variable labList
		let labVarList = [udipView, ucgComboView, udsComboView, mudsComboView, fluSwabComboView]
		let labVerbiageList = ["Urine Dip, consent signed", "UCG, consent signed", "UDS, consent signed", "m UDS, consent signed", "Rapid Flu A&B Swab, consent signed"]
		
		for var i = 0; i < labVarList.count; i++ {
			if (!labVarList[i].stringValue.isEmpty) {
				labList.append(labVerbiageList[i])
			}
		}
		
		//Process glucometer FBS into variable labList
		if !glucometerTextView.stringValue.isEmpty {
			labList.append("Glucometer finger blood sugar done in office today = \(glucometerTextView.stringValue)")
		}

		return labList
	}
	
	func processInjections() ->[String] {
		//Instantiate an array of strings to collect the results from processing the controllers
		var injList = [String]()
		
		//Set up variable for flu controllers to indicate which vaccine was used
		var vaccineType = "No flu vaccine type chosen"
		if (fluTypeView.titleOfSelectedItem != nil){
			vaccineType = fluTypeView.titleOfSelectedItem!
		}
		//Set up variables for Toradol and Rocephin doses
		var torDose = ""
		var rocDose = ""
		if (torAmountView.titleOfSelectedItem != nil){
			torDose = torAmountView.titleOfSelectedItem!
		}
		if (rocAmountView.titleOfSelectedItem != nil) {
			rocDose = rocAmountView.titleOfSelectedItem!
		}
		//Process simple injections into variable injList
		let injVarList = [dkSiteView, ppdSiteView, cSiteView, fluSiteView, solSiteView, pnvSiteView, b12SiteView, tdapSiteView, phSiteView, nphSiteView, torSiteView, rocSiteView, tstSiteView, depoSiteView, estSiteView, epoSiteView]
		let injVerbiageList = ["Decadron 4 mg/1 ml + Kenalog 40 mg/1 ml", "PPD (Purified Protein Derivative) Mantoux TB Skin Test 0.1 ml/5 TU", "Celestone 6 mg/1 ml", "Flu shot: \(vaccineType) 0.5 ml", "Solumedrol 125 mg", "Pneumovax 23: 0.5 ml", "B12 1000 mcg/1 ml", "Tdap 0.5 ml", "Phenergan 25 mg", "Nubain 10 mg + Phenergan 25 mg", "Toradol (Ketoralac) \(torDose) mg", "Rocephin \(rocDose) Lidocaine", "Testosterone Cypionate 200 mg/1 ml", "DepoProvera 150 mg/1 ml", "Estradiol Cypionate 5 mg/1ml", "Procrit/Epogen 10,000 u"]
		
		for var i = 0; i < injVarList.count; i++ {
			if (injVarList[i].titleOfSelectedItem != nil) && (injVarList[i].titleOfSelectedItem != "") {
				if (injVarList[i] == fluSiteView) || (injVarList[i] == pnvSiteView) || (injVarList[i] == tdapSiteView) {
					injList.append("\(injVerbiageList[i]) \(injVarList[i].titleOfSelectedItem!), consent signed, education: VIS given")
				} else {
				injList.append("\(injVerbiageList[i]) \(injVarList[i].titleOfSelectedItem!), consent signed")
				}
			}
		}
		
		
		//Process arthorcentesis into variable injList
		if (arthSiteView.titleOfSelectedItem != nil) && (arthSiteView.titleOfSelectedItem != "") {
			
			let titleString = arthSiteView.titleOfSelectedItem!
			
			if titleString.rangeOfString("Knee") != nil {
				injList.append("Arthrocentesis \(arthSiteView.titleOfSelectedItem!) medial flexed knee approach, with injection of 1 cc 1% lidocaine + 1 cc Marcaine + 1 cc (6 mg) Celestone, after cleansed and prepped with betadine and alcohol.  Pt tolerated procedure well. EBL: none. Consent signed.")
			} else if titleString.rangeOfString("Elbow") != nil  {
				injList.append("Arthrocentesis \(arthSiteView.titleOfSelectedItem!) olecranon bursa / lateral epicondyle, with injection of 1 cc 1% lidocaine + 1 cc (6 mg) Celestone, after cleansed and prepped with betadine and alcohol.  Pt tolerated procedure well. EBL: none. Consent signed.")
			} else if titleString.rangeOfString("Shoulder") != nil  {
				injList.append("Arthrocentesis \(arthSiteView.titleOfSelectedItem!) posterior approach, with injection of 1 cc 1% lidocaine + 1 cc Marcaine + 1 cc (6 mg) Celestone, after cleansed and prepped with betadine and alcohol.  Pt tolerated procedure well. EBL: none. Consent signed.")
			}
		}
		
		//Process Synvisc injection into variable injList
		if (synvSiteView.titleOfSelectedItem != nil) && (synvSiteView.titleOfSelectedItem != "") {
			injList.append("Arthrocentesis \(synvSiteView.titleOfSelectedItem!) medial flexed knee approach, with injection of 1 cc 1% lidocaine + Synvisc ONE, after cleansed and prepped with betadine and alcohol.  Pt tolerated procedure well. EBL: none. Consent signed.")
		}
		
		//Process trigger point injection into variable injList
		if (trigSiteView.indexOfSelectedItem != 0) && !(trigSiteView.stringValue.isEmpty){
			injList.append("Trigger point injection with Lidocaine 1 ml + Celestone 6 mg/1 ml \(trigSiteView.stringValue)")
		}
		
		//Process hepatitis section into variable injList
		var hepSite = ""
		if hepSiteView.titleOfSelectedItem != nil {
			hepSite = hepSiteView.titleOfSelectedItem!
		}
		let hepVarList = [hepA1View, hepA2View, hepB1View, hepB2View, hepB3View, hepTRx1View, hepTRx2View, hepTRx3View]
		let hepVarVerbiage = ["Hepatitis A Vaccine #1: 0.5 ml \(hepSite), consent signed, education: VIS given", "Hepatitis A Vaccine #2: 0.5 ml \(hepSite), consent signed, education: VIS given", "Hepatitis B Vaccine #1: 0.5 ml \(hepSite), consent signed, education: VIS given", "Hepatitis B Vaccine #2: 0.5 ml \(hepSite), consent signed, education: VIS given", "Hepatitis B Vaccine #3: 0.5 ml \(hepSite), consent signed, education: VIS given", "Hepatitis Trx Vaccine #1: 0.5 ml \(hepSite), consent signed, education: VIS given", "Hepatitis Trx Vaccine #2: 0.5 ml \(hepSite), consent signed, education: VIS given", "Hepatitis Trx Vaccine #3: 0.5 ml \(hepSite), consent signed, education: VIS given"]
		for var i = 0; i < hepVarList.count; i++ {
			if (hepVarList[i].state == NSOnState) {
				injList.append(hepVarVerbiage[i])
			}
		}

		
		//Process "Other" text box into variable injList
		if otherTextView.stringValue != "" {
			injList.append(otherTextView.stringValue)
		}

		return injList
	}
	
    func clearForm(){
        papView.state = NSOffState
        dreView.state = NSOffState
        stoolCardView.stringValue = ""
        idView.state = NSOffState
        ekgView.state = NSOffState
        earLavageView.selectItemWithTitle("")
		nebulizerView.selectItemWithTitle("")
        cryoTextView.stringValue = ""
        skinTagTextView.stringValue = ""
        sutureRemovalTextView.stringValue = ""
		udipView.removeAllItems()
		udipView.addItemsWithObjectValues(["", "v58.69", "v70.0"])
		udipView.selectItemAtIndex(0)
		ucgComboView.removeAllItems()
		ucgComboView.addItemsWithObjectValues(["", "v58.69", "v70.0"])
		ucgComboView.selectItemAtIndex(0)
		udsComboView.removeAllItems()
		udsComboView.addItemsWithObjectValues(["", "v58.69", "v70.0"])
		udsComboView.selectItemAtIndex(0)
		mudsComboView.removeAllItems()
		mudsComboView.addItemsWithObjectValues(["", "v58.69", "v70.0"])
		mudsComboView.selectItemAtIndex(0)
		fluSwabComboView.removeAllItems()
		fluSwabComboView.addItemsWithObjectValues(["", "v58.69", "v70.0"])
		fluSwabComboView.selectItemAtIndex(0)
		glucometerTextView.stringValue = ""
        dkSiteView.selectItemWithTitle("")
        cSiteView.selectItemWithTitle("")
        solSiteView.selectItemWithTitle("")
        b12SiteView.selectItemWithTitle("")
        phSiteView.selectItemWithTitle("")
        torSiteView.selectItemWithTitle("")
		torAmountView.selectItemWithTitle("")
        tstSiteView.selectItemWithTitle("")
        estSiteView.selectItemWithTitle("")
        ppdSiteView.selectItemWithTitle("")
        fluSiteView.selectItemWithTitle("")
		fluTypeView.selectItemWithTitle("")
        pnvSiteView.selectItemWithTitle("")
        tdapSiteView.selectItemWithTitle("")
        nphSiteView.selectItemWithTitle("")
        rocSiteView.selectItemWithTitle("")
		rocAmountView.selectItemWithTitle("")
        depoSiteView.selectItemWithTitle("")
        epoSiteView.selectItemWithTitle("")
        arthSiteView.selectItemWithTitle("")
        synvSiteView.selectItemWithTitle("")
        trigSiteView.selectItemAtIndex(0)
        hepA1View.state = NSOffState
        hepA2View.state = NSOffState
        hepB1View.state = NSOffState
        hepB2View.state = NSOffState
        hepB3View.state = NSOffState
        hepTRx1View.state = NSOffState
        hepTRx2View.state = NSOffState
        hepTRx3View.state = NSOffState
        hepSiteView.selectItemWithTitle("")
        otherTextView.stringValue = ""
		self.samplesTextView.string = ""
		self.educationTextView.string = ""
        
        
    }
	
	func clearEducation() {
		weightLossView.state = NSOffState
		diabeticDietView.state = NSOffState
		lowCholesterolView.state = NSOffState
		lowSaltView.state = NSOffState
		hypertensionView.state = NSOffState
		dietaryFiberView.state = NSOffState
		coumadinView.state = NSOffState
		exerciseView.state = NSOffState
		tobaccoView.state = NSOffState
		stressView.state = NSOffState
	}
	
	func applicationWillTerminate(aNotification: NSNotification) {
		// Insert code here to tear down your application
	}


}

