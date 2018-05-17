package com.shuren.service;

import java.util.List;

import com.shuren.pojo.Equipment;
import com.shuren.pojo.EquipmentClass;
import com.shuren.pojo.EquipmentRoot;
import com.shuren.pojo.Equipmentvo;

public interface EquipmentService {
	
	public abstract List<EquipmentRoot> EquipmentRootList();

	public abstract List<EquipmentClass> EquipmentClassList(int equipmentrootid);

	public abstract List<Equipment> EquipmentList(int equipmentclassid);

	public abstract int insertEquipment(Equipment equ);

	public abstract int updateEquipment(Equipment equ);
	
	public abstract List<Equipmentvo> selectAllEquipment();

	public abstract void deletEequipmentById(int parseInt);
}
