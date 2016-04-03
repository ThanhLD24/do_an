package thanhld.appcode.controller;

import java.util.ArrayList;
import java.util.List;

public class TestClass {
	public static void main(String[] args) {
		List<String> list1 = new ArrayList<String>();
		List<String> list2 = new ArrayList<String>();
		List<String> list3 = new ArrayList<String>();
		List<String> list4 = new ArrayList<String>();
		List<List<String>> list = new ArrayList<>();
		list1.add("thanh11");
		list1.add("thanh12");
		list1.add("thanh13");
		list2.add("thanh21");
		list2.add("thanh22");
		list2.add("thanh23");
		list3.add("thanh31");
		list3.add("thanh32");
		list3.add("thanh33");
		list4.add("thanh41");
		list4.add("thanh42");
		list4.add("thanh43");
		list.add(list1);
		list.add(list2);
		list.add(list3);
		list.add(list4);
		for(int i=0; i<list.size(); i++){
			for(int j=0; j<list.get(i).size();j++){
				System.out.println(list.get(i).get(j));
			}
		}
	}
		
}
