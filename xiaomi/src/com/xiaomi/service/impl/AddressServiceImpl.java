package com.xiaomi.service.impl;

import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;

import com.xiaomi.dao.mapper.AddressMapper;
import com.xiaomi.dao.vo.Address;
import com.xiaomi.service.AddressService;
import com.xiaomi.util.DBUtil;

public class AddressServiceImpl implements AddressService 
{

	//����ID
	private String createId() {
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	//���ҵ�ַ
	@Override
	public List<Address> findAddressByUserId(String id)
	{
		SqlSession session = DBUtil.getSession();
		try
		{
			AddressMapper addressmapper = session.getMapper(AddressMapper.class);
			List<Address> addresses = addressmapper.selectAddrByUserId(id);
			return addresses;
		} 
		finally
		{
			if(session!=null) {
				session.close();
			}
		}
	}
	
	//�޸ĵ�ַ
	@Override
	public boolean modifyAddress(Address address) {
		SqlSession session = DBUtil.getSession();
		try
		{
			AddressMapper addressmapper = session.getMapper(AddressMapper.class);
			
			int n = addressmapper.updateAddr(address);
			session.commit();
			if (n > 0) return true;
			else return false;
		} 
		finally
		{
			if(session!=null) {
				session.close();
			}
		}
	}

	//���ӵ�ַ
	@Override
	public boolean addAddress(Address address) {
		SqlSession session = DBUtil.getSession();
		try
		{
			AddressMapper addressmapper = session.getMapper(AddressMapper.class);
			address.setAid(this.createId());
			int n = addressmapper.insertAddr(address);
			session.commit();
			if (n > 0) return true;
			else return false;
		} 
		finally
		{
			if(session!=null) {
				session.close();
			}
		}
	}

	//ɾ����ַ
	@Override
	public boolean deleteAddress(String id) {
		SqlSession session = DBUtil.getSession();
		try
		{
			AddressMapper addressmapper = session.getMapper(AddressMapper.class);
			int n = addressmapper.deleteAddr(id);
			session.commit();
			if (n > 0) return true;
			else return false;
		} 
		finally
		{
			if(session!=null) {
				session.close();
			}
		}
	}

	@Override
	public Address finddefaultAddress(String id) {
		SqlSession session = DBUtil.getSession();
		try
		{
			AddressMapper addressmapper = session.getMapper(AddressMapper.class);
			Address addresses = addressmapper.finddefaultAddress(id);
			return addresses;
		} 
		finally
		{
			if(session!=null) {
				session.close();
			}
		}
	}
}