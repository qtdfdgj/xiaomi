package com.xiaomi.dao.mapper;

import java.util.List;

import com.xiaomi.dao.vo.Goods;

public interface GoodsMapper {

	public List<Goods> selectByName(String name);
	public List<Goods> selectByType(String categary_name);
	public List<Goods> selectByLabel(String label);
	public List<Goods> selectByCategory();
	public List<Goods> selectByLabel();
	public Goods selectGoodsByID(String id);
}
