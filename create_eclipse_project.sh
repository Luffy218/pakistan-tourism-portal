#!/bin/bash

# Create necessary directories
mkdir -p WebContent/WEB-INF/lib
mkdir -p WebContent/WEB-INF/classes
mkdir -p WebContent/uploads
mkdir -p build/classes

# Download required JAR files
echo "Downloading required JAR files..."
wget -P WebContent/WEB-INF/lib https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.33/mysql-connector-java-8.0.33.jar
wget -P WebContent/WEB-INF/lib https://repo1.maven.org/maven2/javax/servlet/jstl/1.2/jstl-1.2.jar
wget -P WebContent/WEB-INF/lib https://repo1.maven.org/maven2/commons-fileupload/commons-fileupload/1.4/commons-fileupload-1.4.jar
wget -P WebContent/WEB-INF/lib https://repo1.maven.org/maven2/commons-io/commons-io/2.11.0/commons-io-2.11.0.jar
wget -P WebContent/WEB-INF/lib https://repo1.maven.org/maven2/org/mindrot/jbcrypt/0.4/jbcrypt-0.4.jar

# Create ZIP file
echo "Creating ZIP archive..."
zip -r PakistanTourismPortal.zip \
    src/ \
    WebContent/ \
    .project \
    .classpath \
    .settings/ \
    build.xml \
    README.md \
    ECLIPSE_SETUP.md \
    .gitignore \
    WebContent/WEB-INF/lib/*.jar

echo "Project has been packaged into PakistanTourismPortal.zip"
echo "Please follow the instructions in ECLIPSE_SETUP.md to import the project into Eclipse."
