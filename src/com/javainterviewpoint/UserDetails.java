package com.javainterviewpoint;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class UserDetails
{
    @XmlAttribute
    private String name;
    @XmlAttribute
    private String department;
    @XmlAttribute
    private String phone;
    public UserDetails()
    {
        super();
    }
    public UserDetails(String name, String department,String phone)
    {
        super();
        this.name = name;
        this.department = department;
        this.phone = phone;
    }
    public String getName()
    {
        return name;
    }
    public void setName(String name)
    {
        this.name = name;
    }
    public String getDepartment()
    {
        return department;
    }
    public void setDepartment(String department)
    {
        this.department = department;
    }
    
    public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
    public String toString()
    {
        return "UserDetails [name=" + name + ", department=" + department + ", phone="+phone+"]";
    }
}