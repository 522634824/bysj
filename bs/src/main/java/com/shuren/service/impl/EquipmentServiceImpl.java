package com.shuren.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shuren.mapper.EquipmentClassMapper;
import com.shuren.mapper.EquipmentMapper;
import com.shuren.mapper.EquipmentRootMapper;
import com.shuren.pojo.Equipment;
import com.shuren.pojo.EquipmentClass;
import com.shuren.pojo.EquipmentRoot;
import com.shuren.service.EquipmentService;

@Service
public class EquipmentServiceImpl implements EquipmentService{
	
	@Resource
	private EquipmentRootMapper rootmapper;
	
	@Resource
	private EquipmentClassMapper classmapper;
	
	@Resource
	private EquipmentMapper mapper;
	
	@Override
	public List<EquipmentRoot> EquipmentRootList() {
		// TODO Auto-generated method stub
		return rootmapper.selectAll();
	}

	@Override
	public List<EquipmentClass> EquipmentClassList(int equipmentrootid) {
		// TODO Auto-generated method stub
		return classmapper.seletByRootId(equipmentrootid);
	}

	@Override
	public List<Equipment> EquipmentList(int equipmentclassid) {
		// TODO Auto-generated method stub
		return mapper.selectByClassId(equipmentclassid);
	}

}
