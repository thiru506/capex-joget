README
======
For an introduction to v5, please refer to http://dev.joget.org/community/display/KBv5/Joget+Workflow+v5+Knowledge+Base

UPGRADING FROM v4
=================
For details on upgrading from v4, please refer to http://dev.joget.org/community/display/KBv5/Upgrading+from+v4

UPGRADING FROM v3
=================
For details on upgrading from v3, please refer to http://dev.joget.org/community/display/KBv4/Joget+Workflow+v4+Upgrade+Guide

IMPORTANT NOTE: v5 requires re-activation with a new license, so 
users with an active Enterprise Software Subscription are required to request 
for a new license.


Prerequisites:
==============
- Java 7 and above
- MySQL 5 and above


Installation for Linux:
=======================
1. Create a new directory (e.g. /opt/joget) and extract the tar.gz bundle into that directory
2. Install the Java Runtime Environment (JRE) or Java Development Kit (JDK) version 7 and above
3. Install MySQL Server version 5 and above
4. Create an empty database 'jwdb' in the MySQL server
5. Execute the setup script to create the required database tables: ./setup.sh
6. Execute the bundled Apache Tomcat application server: ./tomcat8.sh run
7. Access the App Center at http://localhost:8080/jw


Installation for Windows:
=========================
1. Create a new folder e.g. C:\Joget and extract the ZIP bundle
2. Install the Java Runtime Environment (JRE) or Java Development Kit (JDK) version 7 and above
3. Install MySQL Server version 5 and above
4. Create an empty database 'jwdb' in the MySQL server
5. Populate the jwdb database with the SQL script in data\jwdb-empty.sql
6. Edit wflow\app_datasource-default.properties to match your database settings
7. Edit tomcat8-run.bat and change JAVA_HOME to your Java installation directory
8. Run tomcat8-run.bat to start the bundled Apache Tomcat application server
9. Access the App Center at http://localhost:8080/jw

