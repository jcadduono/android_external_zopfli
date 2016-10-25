LOCAL_PATH := $(call my-dir)

common_cflags :=

common_c_includes := $(LOCAL_PATH)/src/zopfli

lib_src_files := \
	src/zopfli/blocksplitter.c \
	src/zopfli/cache.c \
	src/zopfli/deflate.c \
	src/zopfli/gzip_container.c \
	src/zopfli/hash.c \
	src/zopfli/katajainen.c\
	src/zopfli/lz77.c \
	src/zopfli/squeeze.c\
	src/zopfli/tree.c \
	src/zopfli/util.c \
	src/zopfli/zlib_container.c \
	src/zopfli/zopfli_lib.c

lib_cflags := -O2

programs_src_files := \
	src/zopfli/zopfli_bin.c

programs_cflags := -Os

include $(CLEAR_VARS)
LOCAL_MODULE := libzopfli-static
LOCAL_C_INCLUDES :=  $(common_c_includes)
LOCAL_CFLAGS := $(common_cflags) $(lib_cflags)
LOCAL_SRC_FILES := $(lib_src_files)
LOCAL_SDK_VERSION := 21
LOCAL_MODULE_TAGS := optional
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libzopfli
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_CFLAGS := $(common_cflags) $(lib_cflags)
LOCAL_SRC_FILES := $(lib_src_files)
LOCAL_SDK_VERSION := 21
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := zopfli
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_CFLAGS := $(common_cflags) $(programs_cflags)
LOCAL_SRC_FILES := $(programs_src_files)
LOCAL_SDK_VERSION := 21
LOCAL_MODULE_TAGS := optional
ifdef ZOPFLI_STATIC
	LOCAL_STATIC_LIBRARIES := libzopfli-static
else
	LOCAL_SHARED_LIBRARIES := libzopfli
endif
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE := libzopfli-static
LOCAL_C_INCLUDES :=  $(common_c_includes)
LOCAL_CFLAGS := $(common_cflags) $(lib_cflags)
LOCAL_SRC_FILES := $(lib_src_files)
LOCAL_MODULE_TAGS := optional
include $(BUILD_HOST_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := zopfli
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_CFLAGS := $(common_cflags) $(programs_cflags)
LOCAL_SRC_FILES := $(programs_src_files) $(lib_src_files)
LOCAL_STATIC_LIBRARIES := libzopfli-static
LOCAL_MODULE_TAGS := optional
include $(BUILD_HOST_EXECUTABLE)
