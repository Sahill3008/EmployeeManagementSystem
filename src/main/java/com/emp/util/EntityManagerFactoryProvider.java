package com.emp.util;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class EntityManagerFactoryProvider {

    private static EntityManagerFactory emf;

    private EntityManagerFactoryProvider() {
    }

    public static EntityManagerFactory getEntityManagerFactory() {
        if (emf == null) {
            try {
                emf = Persistence.createEntityManagerFactory("EmployeePU");
            } catch (Exception e) {
                e.printStackTrace();
                throw new RuntimeException("Error initializing EntityManagerFactory: " + e.getMessage());
            }
        }
        return emf;
    }

    public static void close() {
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }
}
