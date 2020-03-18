package com.soniu.utils_test;

import org.python.util.PythonInterpreter;

public class JythonTest {

	 private static PythonInterpreter interpreter;
	 
	    public static void main(String[] args) {
	 
	        interpreter = new PythonInterpreter();
	        interpreter.exec("from java.lang import System");
	        interpreter.exec("s = 'Hello World'");
	        interpreter.exec("System.out.println(s)");
	        interpreter.exec("print(s)");
	        interpreter.exec("print(s[1:-1])");
	 
	        interpreter = new PythonInterpreter();
	        interpreter.execfile("C:\\develop\\sonU\\pythonFile\\userFileterExam.py");
	        //interpreter.exec("print(sum(7,8))");
	    }
}
