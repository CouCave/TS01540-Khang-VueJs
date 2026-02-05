# Project Context: Demo Maven Webapp

## Overview
This project is a basic skeleton of a Java Web Application managed by Maven. It follows the standard Maven archetype for web applications but currently appears to be in an initial setup phase.

## Tech Stack
*   **Language:** Java 8 (configured in `pom.xml`)
*   **Build Tool:** Maven
*   **Packaging:** WAR (Web Application Archive)
*   **Frontend:** JSP (JavaServer Pages)

## Project Structure
The current directory structure is as follows:

```text
demo/
├── pom.xml                  # Maven configuration (dependencies, build plugins)
└── src/
    └── main/
        └── webapp/          # Web application root
            ├── index.jsp    # Entry point (Hello World)
            └── WEB-INF/
                └── web.xml  # Web deployment descriptor
```

## Setup & Build
To build the project, use standard Maven commands from the `demo` directory:

```bash
# Clean and package the application into a WAR file
mvn clean package
```

The resulting WAR file will be generated in the `target/` directory (e.g., `target/demo.war`).

## Key Observations & TODOs
*   **Missing Source Directory:** The `src/main/java` directory (for Java source code) is currently missing.
*   **`web.xml` Content Mismatch:** The file located at `src/main/webapp/WEB-INF/web.xml` contains JPA configuration (`<persistence>...</persistence>`) instead of the expected Web Deployment Descriptor content (`<web-app>...</web-app>`). This likely needs to be corrected.
*   **Dependencies:** The `pom.xml` currently only lists `junit`. If this project intends to use JPA/Hibernate (as suggested by the `web.xml` content), appropriate dependencies need to be added.
