package com.shuren.mapper;

import java.util.List;

import com.shuren.pojo.Equipment;

public interface EquipmentMapper {
    int deleteByPrimaryKey(Integer equipmentid);

    int insert(Equipment record);

    int insertSelective(Equipment record);

    Equipment selectByPrimaryKey(Integer equipmentid);

    int updateByPrimaryKeySelective(Equipment record);

    int updateByPrimaryKey(Equipment record);

	List<Equipment> selectByClassId(int equipmentclassid);
}