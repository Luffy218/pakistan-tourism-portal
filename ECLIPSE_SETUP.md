# Eclipse Project Setup Instructions

## Prerequisites
1. Eclipse IDE for Enterprise Java and Web Developers
2. Apache Tomcat 9.0
3. MySQL 8.0
4. JDK 11

## Import Project

1. Open Eclipse IDE
2. Go to File -> Import
3. Select "Existing Projects into Workspace"
4. Select the root directory where you extracted the project
5. Make sure "PakistanTourismPortal" is checked
6. Click "Finish"

## Configure Build Path

1. Right-click on the project
2. Select Properties -> Java Build Path
3. Under "Libraries" tab, verify these JARs are present in WEB-INF/lib:
   - mysql-connector-j-8.0.33.jar
   - jstl-1.2.jar
   - commons-fileupload-1.4.jar
   - commons-io-2.11.0.jar
   - jbcrypt-0.4.jar

## Configure Tomcat

1. Window -> Show View -> Servers
2. Right-click -> New -> Server
3. Select Apache -> Tomcat v9.0 Server
4. Choose your Tomcat installation directory
5. Add the project to the configured server

## Configure Database

1. Open MySQL Workbench
2. Create a new database:
   ```sql
   CREATE DATABASE pakistan_tourism;
   USE pakistan_tourism;
   ```
3. Run the SQL scripts in this order:
   - WEB-INF/sql/setup.sql
   - WEB-INF/sql/logging_tables.sql

4. Update database connection in src/com/homeland/navigation/utils/DBUtil.java:
   ```java
   private static final String URL = "jdbc:mysql://localhost:3306/pakistan_tourism";
   private static final String USER = "your_username";
   private static final String PASSWORD = "your_password";
   ```

## Project Structure
```
PakistanTourismPortal/
├── src/
│   └── com/homeland/navigation/
│       ├── model/
│       ├── dao/
│       ├── servlets/
│       └── utils/
├── WebContent/
│   ├── WEB-INF/
│   │   ├── lib/
│   │   ├── jsp/
│   │   └── web.xml
│   └── index.jsp
└── build/
```

## Running the Application

1. Right-click on the project
2. Run As -> Run on Server
3. Select your configured Tomcat server
4. Click Finish
5. Access the application at: http://localhost:8080/PakistanTourismPortal

## Default Admin Account
- Username: admin
- Password: admin123

## Common Issues and Solutions

1. **Missing Dependencies**
   - Ensure all required JARs are in WEB-INF/lib
   - Update project (Right-click -> Maven -> Update Project)

2. **Database Connection Issues**
   - Verify MySQL is running
   - Check database credentials in DBUtil.java
   - Ensure database and tables are created

3. **Tomcat Errors**
   - Clean Tomcat work directory
   - Delete and recreate server configuration
   - Check port conflicts (default: 8080)

4. **Compilation Errors**
   - Ensure JDK 11 is selected in project properties
   - Clean and rebuild project
   - Update project facets if needed

## Additional Resources

- Project Documentation: See README.md
- Database Schema: See WEB-INF/sql/setup.sql
- Logging Configuration: See WEB-INF/classes/logging.properties

For further assistance, please refer to the project documentation or contact support.
