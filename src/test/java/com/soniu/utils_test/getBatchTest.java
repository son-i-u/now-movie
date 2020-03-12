package com.soniu.utils_test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import lombok.extern.log4j.Log4j;

@Log4j
public class getBatchTest {
	public static void main(String[] args) throws IOException {

		 ProcessBuilder processBuilder = new ProcessBuilder("C:\\develop\\sonU\\batchFile\\batch.bat");
	       
			//Process process = Runtime.getRuntime().exec(
	        //            "cmd /c hello.bat", null, new File("C:\\Users\\mkyong\\"));
						
	        try {

	            Process process = processBuilder.start();

	            StringBuilder output = new StringBuilder();

	            BufferedReader reader = new BufferedReader(
	                    new InputStreamReader(process.getInputStream()));

	            String line;
	            while ((line = reader.readLine()) != null) {
	                output.append(line + "\n");
	            }

	            int exitVal = process.waitFor();
	            if (exitVal == 0) {
	                System.out.println(output);
	                System.exit(0);
	            } else {
	                //abnormal...
	            }

	        } catch (IOException e) {
	            e.printStackTrace();
	        } catch (InterruptedException e) {
	            e.printStackTrace();
	        }
	        
		/*
		try {
			Process p = Runtime.getRuntime().exec("C:\\develop\\sonU\\batchFile\\batch.bat");

			BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()));
			String line = null;

			while ((line = br.readLine()) != null) {				
				log.info(line);

			}
		} catch (Exception e) {
			System.err.println(e);
		}
*/
	}
}
