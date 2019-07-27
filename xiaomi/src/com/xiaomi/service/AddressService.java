package com.xiaomi.service;

import java.util.List;

import com.xiaomi.dao.vo.Address;

public interface AddressService {
	public boolean modifyAddress(Address address);//修改地址
	public boolean addAddress(Address address);//添加地址
	public boolean deleteAddress(String id);//删除地址
	public List<Address> findAddressByUserId(String id);
	public Address finddefaultAddress(String id);//获取默认地址
}
