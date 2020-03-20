package com.soniu.utils_test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class getBatchFileTest {

	public static void main(String[] args) {
		Map<String, String> map = CalPreferList("user10");

		List<String> keySetList = new ArrayList<>(map.keySet());
		
		// 내림차순
		System.out.println("------value 내림차순------");
		Collections.sort(keySetList, (o1, o2) -> (map.get(o2).compareTo(map.get(o1))));
		for(String key : keySetList) {
			System.out.println("key : " + key + " / " + "value : " + map.get(key));
		}
	}

	

	public static Map<String, String> CalPreferList(String user_id) {
		Map<String, String> ret_map = new HashMap<>();

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

			String score = null;
			String movie = null;

			while ((s = stdInput.readLine()) != null) {
				System.out.println(s);

				if (MoSoCross == true & s.length() < 20 & s.length() != 0) {
					score = s;
					MoSoCross = !MoSoCross;
				} else if (MoSoCross == false & s.length() < 20 & s.length() != 0) {
					ret_map.put(s, score);
					MoSoCross = !MoSoCross;
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
