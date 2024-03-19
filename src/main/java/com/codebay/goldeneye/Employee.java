package com.codebay.goldeneye;

public class Employee {
    public String name;
    public String surname;
    public String office;
    public String department;

    public Employee() {}

    public Employee(String name, String surname, String office, String department) {
        this.name = name;
        this.surname = surname;
        this.office = office;
        this.department = department;
    }

    public String getName() {
        return name;
    }
    public String getSurname() {
        return surname;
    }
    public String getOffice() {
        return office;
    }
    public String getDepartment() {
        return department;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setSurname(String surname) {
        this.surname = surname;
    }
    public void setOffice(String office) {
        this.office = office;
    }
    public void setDepartment(String department) {
        this.department = department;
    }
}
