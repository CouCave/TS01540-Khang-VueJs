# Atomic Task List - OE Project

## Phase 1: Environment & Foundation
- [ ] **Task 1.1: Project Initialization**
    - Update `pom.xml` with dependencies: `hibernate-core`, `mssql-jdbc`, `jstl`, `javax.servlet-api`, `commons-beanutils`, `javax.mail`.
    - Create folder structure as per `implementation_plan.md`.
    - **Done:** `mvn clean install` passes with no errors.
- [ ] **Task 1.2: Database Configuration**
    - Create `src/main/resources/META-INF/persistence.xml`.
    - Configure connection string for SQL Server.
    - **Done:** Application can connect to DB (verify with a simple main method test).
- [ ] **Task 1.3: Entity Creation**
    - Create `@Entity` classes: `User`, `Video`, `Favorite`, `Share`.
    - Define relationships (`@OneToMany`, `@ManyToOne`).
    - **Done:** Hibernate auto-generates (or validates) schema upon startup.
- [ ] **Task 1.4: Utility Helper Classes**
    - Create `JpaUtils` (EntityManagerFactory singleton).
    - Create `XScope` (Helper for request/session attribute handling).
    - Create `CookieUtils`.
    - **Done:** Utilities compiled and unit tested.

## Phase 2: Core Data Access (DAO)
- [ ] **Task 2.1: Abstract DAO**
    - Create Generic DAO providing `create`, `update`, `delete`, `findById`, `findAll`.
    - **Done:** Base class exists and handles Transactions (`begin`, `commit`, `rollback`).
- [ ] **Task 2.2: Specific DAOs**
    - Implement `UserDAO` (findByEmail, changePassword).
    - Implement `VideoDAO` (findTop6, findByActive).
    - Implement `FavoriteDAO` (findByUserAndVideo).
    - **Done:** All DAOs created.

## Phase 3: Authentication Module
- [ ] **Task 3.1: Login Controller & View**
    - Create `LoginServlet`.
    - Create `login.jsp`.
    - Implement "Remember Me" logic (Cookies).
    - **Done:** User can login; Session stores `user` object.
- [ ] **Task 3.2: Registration**
    - Create `RegisterServlet` & `register.jsp`.
    - **Done:** New user saved to DB; Redirect to Login.
- [ ] **Task 3.3: Security Filter**
    - Create `AuthFilter` (implements `Filter`).
    - Block access to `/admin/*` for non-admins.
    - Block access to `/like`, `/share` for guests.
    - **Done:** Unloading unauthorized pages redirects to Login.

## Phase 4: User/Guest Screens ("BD Screens" Part 1)
- [ ] **Task 4.1: Home Page**
    - Create `HomeServlet` (fetching Top 6 videos).
    - Create `index.jsp` / `home.jsp`.
    - **Done:** Videos displayed in Grid layout.
- [ ] **Task 4.2: Video Detail**
    - Create `VideoDetailServlet`.
    - Display YouTube iframe.
    - **Done:** Clicking a video on Home opens Detail view.
- [ ] **Task 4.3: Interaction (Like/Share)**
    - Implement AJAX or Form Post for "Like".
    - Implement Email Sending for "Share".
    - **Done:** Like count updates; Email received in Mailtrap/FakeSMTP.

## Phase 5: Admin Dashboard ("BD Screens" Part 2)
- [ ] **Task 5.1: Admin Layout**
    - Create `admin/layout.jsp` (Sidebar/Navbar).
    - **Done:** Consistent layout for all admin pages.
- [ ] **Task 5.2: Video Management**
    - Create `VideoManageServlet`.
    - Implement CRUD (Table view + Edit Form).
    - **Done:** Admin can add/edit/hide videos.
- [ ] **Task 5.3: User Management**
    - Create `UserManageServlet`.
    - **Done:** Admin can edit user roles.
- [ ] **Task 5.4: Reports**
    - Create tabs/views for "Favorites List", "Shared Friends".
    - **Done:** Statistical tables populated with real data.

## Phase 6: Finalization
- [ ] **Task 6.1: UI Polish**
    - Apply Bootstrap 5 classes.
    - Ensure Responsive Design.
    - **Done:** UI matches "Perfect Execution" standard.
- [ ] **Task 6.2: Final Testing**
    - Run through all Use Cases in Assignment PDF.
    - **Done:** All features functional.
