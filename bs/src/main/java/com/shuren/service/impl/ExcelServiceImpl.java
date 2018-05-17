package com.shuren.service.impl;

import java.beans.IntrospectionException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import com.shuren.mapper.UserMapper;
import com.shuren.pojo.ExcelBean;
import com.shuren.pojo.User;
import com.shuren.service.ExcelService;
import com.shuren.util.ExcelUtil;

@Service
public class ExcelServiceImpl implements ExcelService{

	@Resource
	private UserMapper mapper;
	@Override
	public XSSFWorkbook exportExcelInfo(User user) throws InvocationTargetException, ClassNotFoundException, IntrospectionException, ParseException, IllegalAccessException {
	    //����������ѯ���ݣ�������װ�ص�һ��list��
	    List<User> list = mapper.selectByIf(user);
//	    for(int i=0;i<list.size();i++){
//	        int userid = list.get(i).getUserid();
//	        String adminName = mapper.selectByIf(user);
//	        list.get(i).setAdminName(adminName);
//	        list.get(i).setId(i+1);
//	    }
	    List<ExcelBean> excel=new ArrayList<>();
	    Map<Integer,List<ExcelBean>> map=new LinkedHashMap<>();
	    XSSFWorkbook xssfWorkbook=null;
	    //���ñ�����
	    excel.add(new ExcelBean("���","userid",0));
	    excel.add(new ExcelBean("�û���","username",0));
	    excel.add(new ExcelBean("����","password",0));
	    excel.add(new ExcelBean("��ʵ����","name",0));
	    excel.add(new ExcelBean("����","age",0));
	    excel.add(new ExcelBean("�Ա�","sex",0));
	    excel.add(new ExcelBean("��ϵ��ʽ","tel",0));
	    excel.add(new ExcelBean("Ȩ��","power",0));
	    map.put(0, excel);
	    String sheetName =  "�û���Ϣ";
	    //����ExcelUtil�ķ���
	    xssfWorkbook = ExcelUtil.createExcelFile(User.class, list, map, sheetName);
	    return xssfWorkbook;
	}

	
}
