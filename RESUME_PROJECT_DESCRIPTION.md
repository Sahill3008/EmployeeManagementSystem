# RESUME PROJECT DESCRIPTION
## Employee Management System

**Technologies Used:** Java (Core & EE), Servlet, JSP, Hibernate (JPA), PostgreSQL, Apache Tomcat, Maven, HTML/CSS.

**Project Description:**
*   Developed a full-stack CRUD web application using the **MVC (Model-View-Controller)** architecture to manage employee records efficiently.
*   Implemented a robust **DAO (Data Access Object)** layer using **Hibernate (JPA)** to handle database persistence, leveraging **Transactions** and **Entity Lifecycle** management (Transient, Persistent, Detached).
*   Designed a secure **Authentication System** using **Servlet Filters** to intercept requests and enforce strict **Session Management**, protecting unauthorized access to internal resources.
*   Utilized **PostgreSQL** as the relational database backend, optimizing data retrieval with **JPQL** (Java Persistence Query Language) and Hibernate's **First-Level Cache**.
*   Built dynamic and responsive user interfaces using **JSP (JavaServer Pages)**, adhering to industry standards by separating business logic from presentation code.

---

## WHY THIS IS "SAFE" FOR INTERVIEWS

1.  **"Hibernate (JPA)" instead of "Spring Data JPA"**: This invites questions about *how* ORM works (sessions, atomic transactions) rather than "which annotation did you use?". You can safely explain the `EntityManager` and transaction boundaries.
2.  **"Session Management"**: This allows you to explain standard `HttpSession` and Cookies `(JSESSIONID)`, which is a fundamental concept interviewer love to ask about.
3.  **"MVC Architecture"**: You can easily draw a diagram of how a request hits the Servlet (Controller) -> calls DAO (Model) -> forwards to JSP (View).
4.  **No "Microservices" or "Cloud" Claims**: You aren't claiming complex distributed system knowledge, so they won't drill you on CAP theorem, eventual consistency, or load balancing. You are focusing on the *fundamentals* of web applications.

---

## POTENTIAL INTERVIEW Q&A (Based on this description)

**Q: Why did you use Hibernate instead of plain JDBC?**
*   **A:** "While JDBC is great for control, Hibernate significantly reduces boilerplate code. It handles connection pooling, maps heavy SQL result sets to Java objects automatically, and provides caching which improves performance."

**Q: How did you handle security?**
*   **A:** "I used a Servlet Filter. It intercepts every request before it reaches a Servlet. If the user doesn't have a valid session (attribute 'user' is null), I redirect them to the login page. This prevents direct URL access."

**Q: What is the benefit of the DAO pattern you mentioned?**
*   **A:** "It enables separation of concerns. The Servlet doesn't need to know *how* data is saved (SQL or File). If we switch databases later, we only change the DAO code, not the controller logic."
