FROM tomcat:8.0

ADD ./webapp/target/*.war /opt/apache-tomcat-8.5.35_prod/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
