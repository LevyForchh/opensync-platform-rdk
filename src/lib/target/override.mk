# Copyright (c) 2017, Plume Design Inc. All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#    1. Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#    2. Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#    3. Neither the name of the Plume Design Inc. nor the
#       names of its contributors may be used to endorse or promote products
#       derived from this software without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL Plume Design Inc. BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

##############################################################################
#
# RDK unit override for target library
#
##############################################################################

UNIT_SRC := $(TARGET_COMMON_SRC)
UNIT_SRC := $(filter-out src/target_inet.c,$(UNIT_SRC))
UNIT_SRC := $(filter-out src/target_dhcp.c,$(UNIT_SRC))
UNIT_SRC := $(filter-out src/target_mac_learn.c,$(UNIT_SRC))

UNIT_SRC_DIR := $(OVERRIDE_DIR)/src

UNIT_SRC_TOP :=
UNIT_SRC_TOP += $(UNIT_SRC_DIR)/target.c
UNIT_SRC_TOP += $(UNIT_SRC_DIR)/entity.c
UNIT_SRC_TOP += $(UNIT_SRC_DIR)/managers.c
UNIT_SRC_TOP += $(UNIT_SRC_DIR)/clients.c
UNIT_SRC_TOP += $(UNIT_SRC_DIR)/dhcp.c
UNIT_SRC_TOP += $(UNIT_SRC_DIR)/radio.c
UNIT_SRC_TOP += $(UNIT_SRC_DIR)/vif.c
UNIT_SRC_TOP += $(UNIT_SRC_DIR)/inet.c
UNIT_SRC_TOP += $(UNIT_SRC_DIR)/stats.c
UNIT_SRC_TOP += $(UNIT_SRC_DIR)/log.c

UNIT_CFLAGS  += -I$(OVERRIDE_DIR)/inc

UNIT_DEPS    := $(PLATFORM_DIR)/src/lib/devinfo
UNIT_DEPS    += $(PLATFORM_DIR)/src/lib/wifihal
ifeq ($(RDK_LOGGER),1)
UNIT_DEPS    += $(PLATFORM_DIR)/src/lib/pl2rl
endif

UNIT_EXPORT_CFLAGS  := $(UNIT_CFLAGS)
UNIT_EXPORT_LDFLAGS := $(UNIT_LDFLAGS)
