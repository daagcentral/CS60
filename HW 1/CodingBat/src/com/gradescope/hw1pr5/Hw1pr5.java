package com.gradescope.hw1pr5;

/*
 * Fill in the body of the methods below based upon the specification
 * provided. It may be helpful to look at the test cases provided in
 * Hw1pr5Test.java to understand the intended behavior of the method.
 * 
 * Most of the content is based upon problems at CodingBat.com
 * Other content is developed by Mudd faculty. 
 * 
 * Here are some helpful resources: 
 * http://codingbat.com/doc/java-if-boolean-logic.html
 */

public class Hw1pr5 {
	/*************************************************************
	 * STOP - if you haven't read the directions, do that first!
	 **************************************************************/

	// Source: http://codingbat.com/prob/p187868
	/*
	 * The parameter weekday is true if it is a weekday, and the parameter
	 * vacation is true if we are on vacation. We sleep in if it is not a
	 * weekday or we're on vacation. Return true if we sleep in.
	 */
	public static boolean sleepIn(boolean weekday, boolean vacation) {
	  if(vacation == true){
	    return true;
	  }
	  if(weekday == true){
	    return false;
	  }
	  else{
	    return true;
	  }
	}

	// Source: http://codingbat.com/prob/p182873
	/*
	 * Given 2 ints, a and b, return true if one if them is 10 or if their sum
	 * is 10.
	 */
	public static boolean makes10(int a, int b) {
	  if(a == 10 || b == 10 || a+b == 10){
	    return true;
	  }
	  return false;	
	}

	// Source: http://codingbat.com/prob/p181646
	/*
	 * We have two monkeys, a and b, and the parameters aSmile and bSmile
	 * indicate if each is smiling. We are in trouble if they are both smiling
	 * or if neither of them is smiling. Return true if we are in trouble.
	 */
	public static boolean monkeyTrouble(boolean aSmile, boolean bSmile) {
	  if(aSmile == bSmile){
	    return true;
	  }return false;	
	}

	// Source: http://codingbat.com/prob/p144535
	/*
	 * Given 2 int values, return true if either of them is in the range 10..20
	 * inclusive.
	 */
	public static boolean in1020(int a, int b) {
		if((a<=20 && a>=10) || (b<=20 && b >=10)){
			return true;
		}return false;
	}

	// Source: http://codingbat.com/prob/p192082
	/*
	 * Given two temperatures, return true if one is less than 0 and the other
	 * is greater than 100.
	 */
	public static boolean icyHot(int temp1, int temp2) {
		if((temp1>100 && temp2<0) || (temp1<0 && temp2>100)){
			return true;
		}return false;
	}

	// Source: http://codingbat.com/prob/p178986
	/*
	 * We'll say that a number is "teen" if it is in the range 13..19 inclusive.
	 * Given 3 int values, return true if 1 or more of them are teen.
	 */
	public static boolean hasTeen(int a, int b, int c) {
		/*used solution from codebat because i wanted to see if there was a more efficient
		 * way of doing this without writing a lot of if statements.
		 */
		return (a>=13 && a<=19) ||
		         (b>=13 && b<=19) ||
		         (c>=13 && c<=19);
	}

	// Source: http://codingbat.com/prob/p125339
	/*
	 * Given two non-negative int values, return true if they have the same last
	 * digit, such as with 27 and 57. Note that the % "mod" operator computes
	 * remainders, so 17 % 10 is 7.
	 */

	public static boolean lastDigit(int a, int b) {
		return (a%10 == b%10); // replace this with your code.
	}

	// Source: http://codingbat.com/prob/p159227
	/*
	 * Given 2 int values, return true if one is negative and one is positive.
	 * Except if the parameter "negative" is true, then return true only if both
	 * are negative.
	 */
	public static boolean posNeg(int a, int b, boolean negative) {
		if(negative==true) {
			if(a<0 && b<0) {
				return true;
			}return false;
		}else{
			if((a>0 && b>0)||(a<0 && b<0)){
				return false;
			}return true;
		}
	}

	// Source: Mudd faculty
	/*
	 * Given 2 int values, return the largest.
	 */
	public static int calculateMax(int a, int b) {
		// this one is provided as an example of using Math.max
		// no need to change this one :-)
		return Math.max(a, b);
	}

	// Source: Mudd faculty
	/*
	 * Given 4 int values, return the largest.
	 */
	public static int calculateMax(int a, int b, int c, int d) {
		// Please try to use Math.max (example above)
		// https://docs.oracle.com/javase/7/docs/api/java/lang/Math.html#max(int,%20int)
		return Math.max(Math.max(a, b), Math.max(c,d)); // replace this with your code.
	}

	// Source: Mudd faculty
	/*
	 * Given 2 int values, return the value with the highest absolute value
	 */
	public static int calculateAbsMax(int a, int b) {
		// Please try to use Math.abs and Math.max
		// https://docs.oracle.com/javase/7/docs/api/java/lang/Math.html#abs(int)
		// https://docs.oracle.com/javase/7/docs/api/java/lang/Math.html#max(int,%20int)
		int maxNum = Math.max(Math.abs(a), Math.abs(b));
		if(maxNum == Math.abs(a)) {
			return a;
		}return b; // replace this with your code.
	}

	// Source: Mudd faculty
	/*
	 * Given the radius of a circle as input, calculate the perimeter using
	 * Math.PI https://docs.oracle.com/javase/7/docs/api/java/lang/Math.html#PI
	 */
	public static double calculatePerimeter(double radius) {
		// replace this with your code :-)
		return 2*Math.PI*radius;
	}

	public static void main(String[] args) {
		System.out.println("Message from the CS60 teaching team:");
		System.out.println("Run the file Hw1pr5Test.java not Hw1pr5.java");
		System.out.println("-------------------------------------------");
		System.out.println("Running a Java file calls the main method");
		System.out.println("You can find this text of this message");
		System.out.println("at the bottom of the file: Hw1pr5Test");
	}

}
