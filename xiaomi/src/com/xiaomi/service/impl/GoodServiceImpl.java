package com.xiaomi.service.impl;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.security.auth.callback.LanguageCallback;
import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;

import com.xiaomi.dao.mapper.GoodVersionMapper;
import com.xiaomi.dao.mapper.GoodsMapper;
import com.xiaomi.dao.vo.Good_version;
import com.xiaomi.dao.vo.Goods;
import com.xiaomi.service.GoodService;
import com.xiaomi.util.DBUtil;

public class GoodServiceImpl implements GoodService {

	private GoodsMapper goodsmapper;
	private GoodVersionMapper goodversionmapper;
	private SqlSession session;
	
	public GoodServiceImpl() {
		super();
		// TODO Auto-generated constructor stub
		SqlSession session = DBUtil.getSession();
		goodsmapper = session.getMapper(GoodsMapper.class);
		goodversionmapper = session.getMapper(GoodVersionMapper.class);
	}
	
	//展示商品
	@SuppressWarnings("unchecked")
	@Override
	public Map<String, List<Goods>> showGoods() {
		// TODO Auto-generated method stub
		Set<String> cats = selectAllGoodsVersion();	
		System.out.println(cats.size());
		Map<String, List<Goods>> sg = new HashMap<String,List<Goods>>(); 
		for (String string : cats) {
			List<Goods> list = goodsmapper.selectByType(string);
			sg.put(string, list);
		}
		if(session!=null) {
			session.close();
		}
		return sg;
	}
	
	public Set<String> selectAllGoodsVersion() {	
		List<Goods> list = goodsmapper.selectByCategory();
		Set<String> cats = new HashSet<>();
		for(int i=0;i<list.size();i++) {
			cats.add(list.get(i).getCategory_name());
		}
		if(session!=null) {
			session.close();
		}
 		return cats;
	}

	public Map<String, List<Goods>> showGoodsByLabel(){
		String[] lb = selectAllLabel();
		Map<String, List<Goods>> sg = new HashMap<String,List<Goods>>(); 	
		for(int i=0;i<lb.length;i++) {
			List<Goods> list = goodsmapper.selectByType(lb[i]);
			sg.put(lb[i], list);
		}
		if(session!=null) {
			session.close();
		}
		return sg;
	}
	public String[] selectAllLabel() {
		List<Goods> list = goodsmapper.selectByLabel();
		String lb[] = new String[list.size()] ;
		for(int i=0;i<list.size();i++) {
			lb[i] = list.get(i).getCategory_name();
		}
		if(session!=null) {
			session.close();
		}
 		return lb;
	}
	
	//展示商品规格
	@Override
	public List<Good_version> showVersion(String id) {
		// TODO Auto-generated method stub
		List<Good_version> list = goodversionmapper.selectByGoodId(id);
	if(session!=null) {
		session.close();
	}
		return list;
	}
	
	@Override
	public boolean deleteGoods(String id, int deleteNum) {
		// TODO Auto-generated method stub
		System.out.println(id);
		Good_version gVersion = goodversionmapper.selectByGoodVersionId(id);
		int num = gVersion.getNum();
		System.out.println(num);
		num = num - deleteNum;
		System.out.println(num);
		gVersion.setNum(num);
		int n = goodversionmapper.updateGood(gVersion);
		
		System.out.println("nnnnnnnnnnnnnnnnnnnnnnnnn"+n);
		if(session!=null) {
			session.commit();
			session.close();
		}
		return n==1;
	}
	
	@Override
	public List<Goods> showGoodsByName(String name) {
		List<Goods> list = goodsmapper.selectByName(name);
		if(session!=null) {
			session.close();
		}
		return list;
	}
	@Override
	public List<Goods> showGoodsByLabel(String label){	
		List<Goods> list = goodsmapper.selectByLabel(label);
		if(session!=null) {
			session.close();
		}
		return list;
	}
	@Override
	public Goods showGoodsByID(String id) {
		Goods goods = goodsmapper.selectGoodsByID(id);
		if(session!=null) {
			session.close();
		};
		return goods;
	}

	@Override
	public Good_version findGV(String gvID) {
		Good_version gv = goodversionmapper.selectByGoodVersionId(gvID);
		if(session!=null) {
			session.close();
		};
		return gv;
	}


}
