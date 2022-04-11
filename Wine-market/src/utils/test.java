package utils;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class test {

	public static void main(String[] args) {
		String string = "aaaaaaaaaaaabbbbccccddddddkkkk";
		String rs = "";
		char[] charArr = string.toCharArray();
		Set<String> set = new HashSet<String>();
		for (char c : charArr) {
			set.add(String.valueOf(c));
		}
		for(String string2  : set) {
			int dem = string.lastIndexOf(string2) +1;
			string=string.substring(dem);
			rs +=( "" + dem + string2);
		}
		System.out.println(rs);
	}

}
