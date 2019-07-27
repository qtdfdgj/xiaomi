package com.xiaomi.test;

import java.util.UUID;

public class UUIDTest {

	public static void main(String[] args) {
	    String str = UUID.randomUUID().toString().replace("-", "");
	    System.out.println("str: " + str); // bb01a3cd-987f-469d-9e0f-04dffa2d3278

	}

}
