package com.emp.dao;

import com.emp.model.Employee;
import com.emp.util.EntityManagerFactoryProvider;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import java.util.List;

public class EmployeeDAO {

    // Conceptual Caching Layer (Interview Safe)
    // Acts as a simple second-level cache replacement for demonstration.
    // In production, use EhCache or Redis.
    private static final java.util.Map<Long, Employee> cache = new java.util.concurrent.ConcurrentHashMap<>();

    public void save(Employee employee) {
        EntityManager em = EntityManagerFactoryProvider.getEntityManagerFactory().createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(employee);
            tx.commit();
            // Optional: Populate cache on save
            if (employee.getId() != null) {
                cache.put(employee.getId(), employee);
            }
        } catch (Exception e) {
            if (tx.isActive())
                tx.rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    public void update(Employee employee) {
        EntityManager em = EntityManagerFactoryProvider.getEntityManagerFactory().createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.merge(employee);
            tx.commit();
            // Invalidate/Update cache
            cache.put(employee.getId(), employee);
        } catch (Exception e) {
            if (tx.isActive())
                tx.rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    public void delete(Long id) {
        EntityManager em = EntityManagerFactoryProvider.getEntityManagerFactory().createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Employee employee = em.find(Employee.class, id);
            if (employee != null) {
                em.remove(employee);
            }
            tx.commit();
            // Invalidate cache
            cache.remove(id);
        } catch (Exception e) {
            if (tx.isActive())
                tx.rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    public Employee findById(Long id) {
        // Check Cache First
        if (cache.containsKey(id)) {
            System.out.println("Fetching from Conceptual Cache: " + id);
            return cache.get(id);
        }

        EntityManager em = EntityManagerFactoryProvider.getEntityManagerFactory().createEntityManager();
        try {
            Employee employee = em.find(Employee.class, id);
            if (employee != null) {
                cache.put(id, employee); // Populate Cache
            }
            return employee;
        } finally {
            em.close();
        }
    }

    public List<Employee> findAll() {
        EntityManager em = EntityManagerFactoryProvider.getEntityManagerFactory().createEntityManager();
        try {
            TypedQuery<Employee> query = em.createQuery("SELECT e FROM Employee e", Employee.class);
            return query.getResultList();
        } finally {
            em.close();
        }
    }
}
