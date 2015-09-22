#kill process named “wecode-dbviz-0.0.1.war”
ps -ef | grep "wecode-dbviz-0.0.1.war" | grep -v "grep" | awk '{print $2}' | xargs kill
nohup java -jar wecode-dbviz-0.0.1.war &