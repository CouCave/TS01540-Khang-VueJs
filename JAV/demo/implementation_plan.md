# Implementation Plan - Online Entertainment (OE) System
## "BD Screens" (Business Domain Screens)

### 1. Project Overview
This project is a web-based "Online Entertainment" system allowing users to watch, like, and share videos. It includes a comprehensive Admin Dashboard for managing videos, users, and viewing statistical reports. The architecture follows the strict MVC (Model-View-Controller) pattern using Jakarta EE standards.

### 2. Technology Stack
*   **Language:** Java 8+ (Compatible with JDK 1.8 as per assignment).
*   **Build Tool:** Maven.
*   **Server:** Apache Tomcat 8.5/9.0.
*   **Database:** SQL Server 2008+ (Preferred) or MySQL/H2 (Fallback).
*   **ORM:** Hibernate 5.6.x (JPA 2.2).
*   **Frontend:** JSP 2.3, JSTL 1.2, HTML5, CSS3 (Bootstrap 5 recommended for "Perfect" UI), JavaScript.
*   **Libraries:**
    *   `mssql-jdbc` / `mysql-connector-java`
    *   `hibernate-core`
    *   `javax.servlet-api`
    *   `jstl`
    *   `commons-beanutils` (for automatic form population)
    *   `javax.mail` (for "Forgot Password" & "Share" features)
    *   `lombok` (Optional, for boilerplate reduction)

### 3. Folder Structure
```text
src/
├── main/
│   ├── java/
│   │   └── com/
│   │       └── poly/
│   │           └── oe/
│   │               ├── config/         # JPA Config, Email Config
│   │               ├── entity/         # JPA Entities (POJOs)
│   │               ├── dao/            # Data Access Object Layer (AbstractDAO + Impl)
│   │               ├── service/        # Business Logic Layer (Optional but recommended)
│   │               ├── controller/     # Servlets (Admin & User)
│   │               ├── filter/         # AuthFilter, UTF8Filter
│   │               └── util/           # JpaUtils, CookieUtils, XScope (Req/Ses/App Helper)
│   ├── resources/
│   │   └── META-INF/
│   │       └── persistence.xml         # JPA Configuration
│   └── webapp/
│       ├── common/                     # Header, Footer, Menu fragments
│       ├── views/
│       │   ├── user/                   # Home, Detail, Login, Register, Profile
│       │   └── admin/                  # Video List, Video Edit, User List, Reports
│       ├── css/
│       ├── js/
│       ├── images/                     # Uploaded posters/avatars
│       ├── WEB-INF/
│       │   └── web.xml                 # Deployment Descriptor
│       └── index.jsp                   # Redirect to HomeServlet
```

### 4. Data Models (ERD)

#### A. User (`Users`)
*   `id` (String/VARCHAR, PK): Username.
*   `password` (String/VARCHAR): Encrypted password.
*   `fullname` (String/NVARCHAR).
*   `email` (String/VARCHAR).
*   `admin` (Boolean): Role (True=Admin, False=User).

#### B. Video (`Videos`)
*   `id` (String/VARCHAR, PK): YouTube ID or Custom ID.
*   `title` (String/NVARCHAR).
*   `poster` (String/VARCHAR): Image URL/Path.
*   `description` (String/NVARCHAR).
*   `views` (Integer): Count.
*   `active` (Boolean): Status.
*   *Relationships:* One-to-Many with Favorites, Shares.

#### C. Favorite (`Favorites`)
*   `id` (Long, PK, Auto-increment).
*   `user` (User, FK).
*   `video` (Video, FK).
*   `likeDate` (Date): Default `now()`.
*   *Unique Constraint:* User + Video.

#### D. Share (`Shares`)
*   `id` (Long, PK, Auto-increment).
*   `user` (User, FK).
*   `video` (Video, FK).
*   `emails` (String/NVARCHAR): Receiver email(s).
*   `shareDate` (Date): Default `now()`.

### 5. Key Features ("BD Screens")

#### User Facing (Public/Protected)
1.  **Home Page:** Grid view of Top 6 Active Videos (Pagination implied or simple list).
2.  **Video Detail:** YouTube Player embedding, Description, "Like" button, "Share" button.
3.  **Auth:** Login (Remember Me), Register, Forgot Password (Email OTP/Link), Change Password.
4.  **My Favorites:** List of videos liked by the current user.

#### Admin Dashboard (Protected: Admin Only)
1.  **Video Management:** Table listing, Create New, Update, Delete (Logical Delete preferred).
2.  **User Management:** Table listing, Edit Roles, Delete.
3.  **Reports:**
    *   Favorites per Video.
    *   Favorite Users per Video.
    *   Share Friends per Video.
