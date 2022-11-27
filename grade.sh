# Create your grading script here

set -e

rm -rf student-submission
git clone $1 student-submission
cd student-submission
if[[-e "ListExamples.java" ]]
then
    echo "ListExamples.java found! full credit!"
else
    echo "ListExamples.java is missing! no credit."
fi
logout
cp GradeServer.java Server.java TestListExamples.java student-submission
javac *.java
javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java
set +e
java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples.java
echo $?
