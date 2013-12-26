BUILD_PATH=core-firmware/build
CPP_PATH=core-firmware/src/application.cpp
TEMPLATE_FILE=template.cpp

%: src/%.cpp
	sed '/\/\/ INSERT/ r $<' template.cpp > ${CPP_PATH}
	make -C ${BUILD_PATH}

