package com.edu.viewentity;

import java.util.ArrayList;
import java.util.List;

import com.edu.model.Address;
import com.edu.model.Product;

/**
 * 地址显示层
 * @author kh
 *
 */
public class AddressVO
{
	private Integer id;
	private String address;
	private String receiver;
	private String telephone;
	
	public AddressVO(Address addressBean)
	{
		super();
		id = addressBean.getId();
		address = addressBean.getAddress();
		receiver = addressBean.getReceiver();
		telephone = addressBean.getTelephone();
	}
	
	/**
	 * 将list中的addressBean实体转变为addressVO
	 * @param list
	 * @return
	 */
	public static List<AddressVO> ChangeListAddressToAddressVo(List<Address> list)
	{
		List<AddressVO> addressVOs = new ArrayList<AddressVO>();
		for(int i=0;i<list.size();i++)
		{
			AddressVO addressVO = new AddressVO(list.get(i));
			addressVOs.add(addressVO);
		}
		return addressVOs;
	}

	public Integer getId()
	{
		return id;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}

	public String getAddress()
	{
		return address;
	}

	public void setAddress(String address)
	{
		this.address = address;
	}

	public String getReceiver()
	{
		return receiver;
	}

	public void setReceiver(String receiver)
	{
		this.receiver = receiver;
	}

	public String getTelephone()
	{
		return telephone;
	}

	public void setTelephone(String telephone)
	{
		this.telephone = telephone;
	}

	public AddressVO(Integer id, String address, String receiver,
			String telephone)
	{
		super();
		this.id = id;
		this.address = address;
		this.receiver = receiver;
		this.telephone = telephone;
	}
}
