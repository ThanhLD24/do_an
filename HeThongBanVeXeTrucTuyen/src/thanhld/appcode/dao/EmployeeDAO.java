package thanhld.appcode.dao;

import java.util.List;

import thanhld.appcode.model.Employee;

public interface EmployeeDAO {
	public List<Employee> getListEmployeeByJob(int jobId);
}
