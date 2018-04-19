package com.shuren.mapper;

import java.util.List;

import com.shuren.pojo.EquipmentRoot;

public interface EquipmentRootMapper {
    int deleteByPrimaryKey(Integer equipmentrootid);

    int insert(EquipmentRoot record);

    int insertSelective(EquipmentRoot record);

    EquipmentRoot selectByPrimaryKey(Integer equipmentrootid);

    int updateByPrimaryKeySelective(EquipmentRoot record);

    int updateByPrimaryKey(EquipmentRoot record);

	List<EquipmentRoot> selectAll();
}