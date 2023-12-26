package ru.yakovitalik.phonebook.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;

import java.util.List;
import java.util.Objects;

/**
 * Класс отображает структурное подразделение предприятия
 * */
@Entity
@Table(name = "department")
public class Department {

    @Id
    @Column(name = "id")
    private long id;

    @NotEmpty(message = "Название подразделения не должно быть пустым!")
    @Column(name = "title")
    private String title;

    // Подразделение верхнего уровня
    @Column(name = "parent_department")
    private String parentDepartment;

    @OneToMany(mappedBy = "department")
    List<Employee> employees;

    public Department() {
    }

    public Department(String title, String parentDepartment) {
        this.title = title;
        this.parentDepartment = parentDepartment;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public List<Employee> getEmployees() {
        return employees;
    }

    public void setEmployees(List<Employee> employees) {
        this.employees = employees;
    }

    @Override
    public String toString() {
        return "Department{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", employees=" + employees +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Department that = (Department) o;
        return id == that.id && Objects.equals(title, that.title);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, title);
    }
}
