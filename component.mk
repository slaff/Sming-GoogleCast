COMPONENT_SRCDIRS := src proto
COMPONENT_INCDIRS := src

COMPONENT_DEPENDS := \
	ArduinoJson6 \
	nanopb \
	MDNS

# Google Cast requires SSL for communication. Add this to project configuration.
# ENABLE_SSL = Bearssl

GOOGLECAST_PATH := $(COMPONENT_PATH)

##@Building

.PHONY: rebuild-cast-proto
rebuild-cast-proto: ##Rebuild the generated C and H files from the google-cast protocol
	echo "$(NANOPB_GENERATE) cast_channel.proto"
	$(Q) cd $(GOOGLECAST_PATH)/proto && $(NANOPB_GENERATE) cast_channel.proto
