//
//  runPython.swift
//  PythonTestApp
//
//  Created by Seth Lenhof on 3/8/24.
//

import Foundation
import Python
import PythonKit


func RunPython() -> PythonObject{
    if let stdLibPath = Bundle.main.path(forResource: "python-stdlib", ofType: nil),
        let libDynloadPath = Bundle.main.path(forResource: "python-stdlib/lib-dynload", ofType: nil){
        let mergedPaths = "\(stdLibPath):\(libDynloadPath)"
        setenv("PYTHONHOME", mergedPaths, 1)
        setenv("PYTHONPATH", mergedPaths, 1)
    }
    Py_Initialize()
//    testFileLocation()
    addResourcesPathToPythonSysPath()
    
    let helloWorld = Python.import("helloWorld")
    let response = helloWorld.helloWorld()
    print(response)
    return response
}

func testFileLocation() -> Void{
    if let scriptPath = Bundle.main.path(forResource: "script", ofType: "py"),
       let scriptContent = try? String(contentsOfFile: scriptPath) {
        print("Successfully read script.py: \(scriptContent)")
    } else {
        print("Unable to read script.py")
    }
    
}

func addResourcesPathToPythonSysPath() {
    // Obtain the path to the bundle's resources directory
    if let resourcesPath = Bundle.main.resourcePath {
        let sys = Python.import("sys")
        let resourcesDirectoryPath = PythonObject("\(resourcesPath)")
        if !sys.path.contains(resourcesDirectoryPath) {
            sys.path.append(resourcesDirectoryPath)
        }
        
        // For debugging: Print the updated sys.path
        print("Updated sys.path to include Resources directory: \(sys.path)")
    } else {
        print("Could not find the app bundle's resource path.")
    }
}

