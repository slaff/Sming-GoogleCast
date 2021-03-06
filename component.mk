COMPONENT_SRCDIRS := src proto
COMPONENT_INCDIRS := src

COMPONENT_DEPENDS := \
	ArduinoJson6 \
	nanopb \
	MDNS

# Google Cast requires SSL for communication. Add this to project configuration.
# ENABLE_SSL = Bearssl


##@Building
.PHONY: rebuild-cast-proto

$(COMPONENT_PATH)/proto/cast_channel.pb.%: $(COMPONENT_PATH)/proto/cast_channel.proto
	$(Q) cd $(dir $<) && $(PYTHON) $(SMING_HOME)/Libraries/nanopb/nanopb/generator/nanopb_generator.py cast_channel.proto

rebuild-cast-proto: $(COMPONENT_PATH)/proto/cast_channel.pb.c ##Rebuild the generated C and H files from the google-cast protocol
