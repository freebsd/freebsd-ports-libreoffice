PORTNAME=	zxing-cpp
DISTVERSION=	3.1.0
CATEGORIES=	textproc
MASTER_SITES=	https://github.com/${PORTNAME}/${PORTNAME}/releases/download/v${DISTVERSION}/

MAINTAINER=	kde@FreeBSD.org
COMMENT=	C++ library for linear/matrix barcode recognition
WWW=		https://github.com/zxing-cpp/zxing-cpp

LICENSE=	APACHE20
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/stb.pc:devel/stb
TEST_DEPENDS=	googletest>0:devel/googletest

USES=		cmake:testing compiler:c++20-lang iconv pathfix pkgconfig
USE_LDCONFIG=	yes

PLIST_SUB=	SOVERSION=${DISTVERSION}

CMAKE_TESTING_ON=	ZXING_UNIT_TESTS

CMAKE_ARGS+=	-DZXING_WRITERS:STRING="BOTH"
CMAKE_OFF=	ZXING_EXAMPLES

.include <bsd.port.mk>
