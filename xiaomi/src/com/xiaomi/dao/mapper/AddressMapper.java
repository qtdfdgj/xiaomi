package com.xiaomi.dao.mapper;

import java.util.List;

import com.xiaomi.dao.vo.Address;;

public interface AddressMapper
{
	public List<Address> selectAddrByUserId(String id);
	public int insertAddr(Address address);
	public int updateAddr(Address address);
	public int deleteAddr(String id);
	public Address finddefaultAddress(String id);
}