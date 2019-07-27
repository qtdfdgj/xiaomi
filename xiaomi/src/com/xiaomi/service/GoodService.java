package com.xiaomi.service;

import java.util.List;
import java.util.Map;

import com.xiaomi.dao.vo.Good_version;
import com.xiaomi.dao.vo.Goods;

public interface GoodService {

	Map<String, List<Goods>> showGoods();//展示商品
	Map<String, List<Goods>> showGoodsByLabel();
	List<Good_version> showVersion(String id);//展示商品规格
	List<Goods> showGoodsByLabel(String label);
	public boolean deleteGoods(String id,int deleteNum);
	public Goods showGoodsByID(String id);
	List<Goods> showGoodsByName(String name);
	public Good_version findGV(String gvID);
}
