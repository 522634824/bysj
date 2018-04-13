package com.shuren.util;

import com.shuren.pojo.Tree;
import com.sun.tools.javac.util.List;

public class JsonFormat {

	/**
	 * �������ݼ��ϣ������ݼ���תΪ���ϸ�ʽ��json
	 * @param tList ����
	 * @return json�ַ���
	 */
	public String dealJsonFormat(List<Tree> tList){
		StringBuilder json = new StringBuilder();
		for (Tree tree : tList) {
			json.append("{\"id\":" +String.valueOf(tree.getId())); 
            json.append(",\"text\":\"" +tree.getText() + "\""); 
            json.append(",\"state\":\"closed\""); 
            json.append("},");
		}
		String str = json.toString();
		str = str.substring(0, str.length()-1);
		
		System.out.println("---------"+str);
		return str;
	}

}
