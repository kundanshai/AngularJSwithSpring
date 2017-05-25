package com.javainterviewpoint;


public class UserDetail {
	
	    private String name;
	   
	    private String department;
	   
	    public UserDetail(String name, String department)
	    {
	    	super();
	        this.name = name;
	        this.department = department;
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
	    @Override
	    public String toString()
	    {
	        return "UserDetails [name=" + name + ", department=" + department + "]";
	    }
	
}
