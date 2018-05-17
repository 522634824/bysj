package com.shuren.service;

import java.beans.IntrospectionException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.shuren.pojo.User;



public interface ExcelService {

	public XSSFWorkbook exportExcelInfo(User user) throws InvocationTargetException, ClassNotFoundException, IntrospectionException, ParseException, IllegalAccessException;
}
