#!/bin/sh

BASE_DIR=$(cd `dirname $0` && pwd)

# Download JAXB
if [ ! -d ${BASE_DIR}/download ]
then
  mkdir ${BASE_DIR}/download
fi

if [ ! -f ${BASE_DIR}/download/jaxb-ri-4.0.5.zip ]
then
  curl -SL https://repo1.maven.org/maven2/com/sun/xml/bind/jaxb-ri/4.0.5/jaxb-ri-4.0.5.zip -o ${BASE_DIR}/download/jaxb-ri-4.0.5.zip
  unzip -q ${BASE_DIR}/download/jaxb-ri-4.0.5.zip -d ${BASE_DIR}/download
fi

${BASE_DIR}/download/jaxb-ri/bin/xjc.sh -d ${BASE_DIR}/src/main/java -p mil.army.ldac.geia0007c \
    -enableIntrospection -b ${BASE_DIR}/bindings.xml ${BASE_DIR}/schema/GEIA_STD_0007_C.xsd

for file in ${BASE_DIR}/src/main/java/mil/army/ldac/geia0007c/*.java; do
  sed -i 's/(nillable = true)//g' $file
done
