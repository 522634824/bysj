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
	    //根据条件查询数据，把数据装载到一个list中
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
	    //设置标题栏
	    excel.add(new ExcelBean("编号","userid",0));
	    excel.add(new ExcelBean("用户名","username",0));
	    excel.add(new ExcelBean("密码","password",0));
	    excel.add(new ExcelBean("真实姓名","name",0));
	    excel.add(new ExcelBean("年龄","age",0));
	    excel.add(new ExcelBean("性别","sex",0));
	    excel.add(new ExcelBean("联系方式","tel",0));
	    excel.add(new ExcelBean("权限","power",0));
	    map.put(0, excel);
	    String sheetName =  "用户信息";
	    //调用ExcelUtil的方法
	    xssfWorkbook = ExcelUtil.createExcelFile(User.class, list, map, sheetName);
	    return xssfWorkbook;
	}

	
}
