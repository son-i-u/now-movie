package com.soniu.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;


public class getBatchFile {
	public static Map<String,Double> CalPreferList(String user_id) {
		Map<String,Double> ret_map = new HashMap<>();

		boolean MoSoCross = true;

		String s = null;

		try {
			// print a message
			System.out.println("Executing python code");
			Process process = Runtime.getRuntime().exec("C:\\develop\\sonU\\batchFile\\batch.bat" + " " + user_id);

			BufferedReader stdInput = new BufferedReader(new InputStreamReader(process.getInputStream()));
			BufferedReader stdError = new BufferedReader(new InputStreamReader(process.getErrorStream()));

			// read output from the command
			System.out.println("python should be run.");

			Double score = null;
			String movie = null;
			
			/* 영화 _id  - predict 순으로 출력 됨 */
			while ((s = stdInput.readLine()) != null) {
				System.out.println(s);
				
				if( MoSoCross == true & s.length() <20 & s.length() != 0 ) {
					movie = s;
					MoSoCross = !MoSoCross;
				}else if(MoSoCross == false & s.length() <20 & s.length() != 0){
					score = Double.parseDouble(s);
					MoSoCross = !MoSoCross;
					ret_map.put(movie, score);
				}
				
			}

			System.out.println("Here is the standard error of the command( if any) : \n");
			while ((s = stdError.readLine()) != null) {
				System.out.println(s);

			}

			process.destroy();
			// System.exit(0);

		} catch (IOException e) {
			e.printStackTrace();
			System.exit(-1);
		}

		
		return ret_map;
	}
}
