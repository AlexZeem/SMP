*g++*:QMAKE_CXXFLAGS += -std=c++11

TEMPLATE = app

QT += qml quick quick-private core-private qml-private gui-private

PROJECT_ROOT_DIR = ./

BUILD_DIR   = $${PROJECT_ROOT_DIR}/bld
OBJECTS_DIR = $${BUILD_DIR}/obj
MOC_DIR     = $${BUILD_DIR}/moc
DESTDIR     = $${BUILD_DIR}/bin
RCC_DIR     = $${BUILD_DIR}/rcc

SOURCES += \
    $$PWD/src/*.cpp

HEADERS += \
    $$PWD/src/*.h

QML_FILES = \
    $$PWD/res/qml/*.qml

JS_FILES = \
   $$PWD/res/helpers/*.js

DISTFILES += $$QML_FILES \
             $$JS_FILES

RESOURCES += \

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
