all: build doczip

clean:
	rm -rf *.o *.out latex html myexe* *~
build: course.o college.o node.h collegemain.cc
	g++ course.o college.o collegemain.cc -o myexe
doc: *.cc *.h
	doxygen
myexe: course.o college.o node.h collegemain.cc
	g++ course.o college.o collegemain.cc -o myexe
doczip:
	tar -czf doc.tar.gz html latex
college.o: course.o node.h college.h college.cc
	g++ -c course.o college.cc
course.o: course.cc course.h
	g++ -c course.cc
