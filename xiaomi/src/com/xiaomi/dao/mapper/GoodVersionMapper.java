package com.xiaomi.dao.mapper;

import java.util.List;

import com.xiaomi.dao.vo.Good_version;

public interface GoodVersionMapper {
	public List<Good_version>  selectByGoodId(String id);//货id
	public Good_version  selectByGoodVersionId(String id);
	public int updateGood(Good_version gv);
}
