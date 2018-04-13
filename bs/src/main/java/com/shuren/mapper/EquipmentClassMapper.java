package com.shuren.mapper;

import java.util.List;

import com.shuren.pojo.EquipmentClass;

public interface EquipmentClassMapper {
    int deleteByPrimaryKey(Integer equipmentclassid);

    int insert(EquipmentClass record);

    int insertSelective(EquipmentClass record);

    EquipmentClass selectByPrimaryKey(Integer equipmentclassid);

    int updateByPrimaryKeySelective(EquipmentClass record);

    int updateByPrimaryKey(EquipmentClass record);

	List<EquipmentClass> seletByRootId(int equipmentrootid);
}