#!/bin/bash -x

echo Target dir: ${TARGETDIR}
echo CFLAGS: ${CFLAGS}
echo cmake generator: -G ${GM}

pushd ExternData/Resources/C-Sources

echo Running make: $MAKE CFLAGS="${CFLAGS}" TARGETDIR="${TARGETDIR}"
$MAKE CFLAGS="${CFLAGS}" TARGETDIR="${TARGETDIR}"

popd 
pushd libxml2/$PLATFORM 

which $CMAKE

echo Running cmake: $CMAKE -DZLIB_LIBRARY_RELEASE:FILEPATH="$TRAVIS_BUILD_DIR/ExternData/Resources/Library/$PLATFORM/libzlib.a" -DLIBXML2_WITH_DEBUG:BOOL="0" -DZLIB_INCLUDE_DIR:PATH="$TRAVIS_BUILD_DIR/ExternData/Resources/C-Sources/zlib/" -DLIBXML2_WITH_C14N:BOOL=OFF -DLIBXML2_WITH_CATALOG:BOOL=OFF -DLIBXML2_WITH_DEBUG:BOOL=OFF -DLIBXML2_WITH_DOCB:BOOL=OFF -DLIBXML2_WITH_FTP:BOOL=OFF -DLIBXML2_WITH_HTML:BOOL=OFF -DLIBXML2_WITH_HTTP:BOOL=OFF -DLIBXML2_WITH_ICONV:BOOL=OFF -DLIBXML2_WITH_ICU:BOOL=OFF -DLIBXML2_WITH_ISO8859X:BOOL=OFF -DLIBXML2_WITH_LEGACY:BOOL=OFF -DLIBXML2_WITH_LZMA:BOOL=OFF -DLIBXML2_WITH_MEM_DEBUG:BOOL=OFF -DLIBXML2_WITH_MODULES:BOOL=OFF -DLIBXML2_WITH_OUTPUT:BOOL=OFF -DLIBXML2_WITH_PATTERN:BOOL=OFF -DLIBXML2_WITH_PROGRAMS:BOOL=OFF -DLIBXML2_WITH_PUSH:BOOL=OFF -DLIBXML2_WITH_PYTHON:BOOL=OFF -DLIBXML2_WITH_READER:BOOL=OFF -DLIBXML2_WITH_REGEXPS:BOOL=OFF -DLIBXML2_WITH_RUN_DEBUG:BOOL=OFF -DLIBXML2_WITH_SAX1:BOOL=OFF -DLIBXML2_WITH_SCHEMAS:BOOL=OFF -DLIBXML2_WITH_SCHEMATRON:BOOL=OFF -DLIBXML2_WITH_TESTS:BOOL=OFF -DLIBXML2_WITH_THREADS:BOOL=ON -DLIBXML2_WITH_THREAD_ALLOC:BOOL=OFF -DLIBXML2_WITH_TREE:BOOL=OFF -DLIBXML2_WITH_VALID:BOOL=OFF -DLIBXML2_WITH_WRITER:BOOL=OFF -DLIBXML2_WITH_XINCLUDE:BOOL=OFF -DLIBXML2_WITH_XPATH:BOOL=ON -DLIBXML2_WITH_XPTR:BOOL=OFF -DLIBXML2_WITH_ZLIB:BOOL=ON -DBUILD_SHARED_LIBS:BOOL=OFF -DCPACK_BINARY_7Z:BOOL=OFF -DCPACK_BINARY_IFW:BOOL=OFF -DCPACK_BINARY_NSIS:BOOL=OFF -DCPACK_BINARY_NUGET:BOOL=OFF -DCPACK_BINARY_WIX:BOOL=OFF -DCPACK_BINARY_ZIP:BOOL=OFF -DCPACK_SOURCE_7Z:BOOL=OFF -DCPACK_SOURCE_ZIP:BOOL=OFF -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON ../ -G "${GM}"

$CMAKE -DZLIB_LIBRARY_RELEASE:FILEPATH="$TRAVIS_BUILD_DIR/ExternData/Resources/Library/$PLATFORM/libzlib.a" -DLIBXML2_WITH_DEBUG:BOOL="0" -DZLIB_INCLUDE_DIR:PATH="$TRAVIS_BUILD_DIR/ExternData/Resources/C-Sources/zlib/" -DLIBXML2_WITH_C14N:BOOL=OFF -DLIBXML2_WITH_CATALOG:BOOL=OFF -DLIBXML2_WITH_DEBUG:BOOL=OFF -DLIBXML2_WITH_DOCB:BOOL=OFF -DLIBXML2_WITH_FTP:BOOL=OFF -DLIBXML2_WITH_HTML:BOOL=OFF -DLIBXML2_WITH_HTTP:BOOL=OFF -DLIBXML2_WITH_ICONV:BOOL=OFF -DLIBXML2_WITH_ICU:BOOL=OFF -DLIBXML2_WITH_ISO8859X:BOOL=OFF -DLIBXML2_WITH_LEGACY:BOOL=OFF -DLIBXML2_WITH_LZMA:BOOL=OFF -DLIBXML2_WITH_MEM_DEBUG:BOOL=OFF -DLIBXML2_WITH_MODULES:BOOL=OFF -DLIBXML2_WITH_OUTPUT:BOOL=OFF -DLIBXML2_WITH_PATTERN:BOOL=OFF -DLIBXML2_WITH_PROGRAMS:BOOL=OFF -DLIBXML2_WITH_PUSH:BOOL=OFF -DLIBXML2_WITH_PYTHON:BOOL=OFF -DLIBXML2_WITH_READER:BOOL=OFF -DLIBXML2_WITH_REGEXPS:BOOL=OFF -DLIBXML2_WITH_RUN_DEBUG:BOOL=OFF -DLIBXML2_WITH_SAX1:BOOL=OFF -DLIBXML2_WITH_SCHEMAS:BOOL=OFF -DLIBXML2_WITH_SCHEMATRON:BOOL=OFF -DLIBXML2_WITH_TESTS:BOOL=OFF -DLIBXML2_WITH_THREADS:BOOL=ON -DLIBXML2_WITH_THREAD_ALLOC:BOOL=OFF -DLIBXML2_WITH_TREE:BOOL=OFF -DLIBXML2_WITH_VALID:BOOL=OFF -DLIBXML2_WITH_WRITER:BOOL=OFF -DLIBXML2_WITH_XINCLUDE:BOOL=OFF -DLIBXML2_WITH_XPATH:BOOL=ON -DLIBXML2_WITH_XPTR:BOOL=OFF -DLIBXML2_WITH_ZLIB:BOOL=ON -DBUILD_SHARED_LIBS:BOOL=OFF -DCPACK_BINARY_7Z:BOOL=OFF -DCPACK_BINARY_IFW:BOOL=OFF -DCPACK_BINARY_NSIS:BOOL=OFF -DCPACK_BINARY_NUGET:BOOL=OFF -DCPACK_BINARY_WIX:BOOL=OFF -DCPACK_BINARY_ZIP:BOOL=OFF -DCPACK_SOURCE_7Z:BOOL=OFF -DCPACK_SOURCE_ZIP:BOOL=OFF -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON ../ -G "${GM}"

echo Building with cmake
$CMAKE --build .

echo Moving libxml2.a

mv libxml2.a ../../ExternData/Resources/Library/$PLATFORM/libxml2.a 
popd 

echo Moving libxml2.a

cd ExternData/Resources/Library/$PLATFORM 
tar cJf ExternData_$PLATFORM.tar.xz $DEPLOY_LIBS
