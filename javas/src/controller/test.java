package controller;

import java.text.SimpleDateFormat;
import java.util.Date;

public class test {
	public static void main(String[] args) {
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY/MM/dd");
		System.out.println(sdf.format(d));
		System.out.println(d);
	}
}
