# contrib/cube/Makefile

MODULE_big = cube
OBJS = \
	$(WIN32RES) \
	cube.o \
	cubeparse.o

EXTENSION = cube
DATA = cube--1.2.sql cube--1.2--1.3.sql cube--1.3--1.4.sql \
	cube--1.1--1.2.sql cube--1.0--1.1.sql
PGFILEDESC = "cube - multidimensional cube data type"

HEADERS = cubedata.h

REGRESS = cube cube_sci

EXTRA_CLEAN = y.tab.c y.tab.h

SHLIB_LINK += $(filter -lm, $(LIBS))

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)


# cubescan is compiled as part of cubeparse
cubeparse.o: cubescan.c

distprep: cubeparse.c cubescan.c

maintainer-clean:
	rm -f cubeparse.c cubescan.c
