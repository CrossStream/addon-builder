#!/bin/bash
set -e

OWRT_DIR="./bin"
OWRT_RPI="${OWRT_DIR}/owrt-arm_cortex-a7_neon-vfpv4"
OWRT_OMNIA="${OWRT_DIR}/owrt-arm_cortex-a9_vfpv3"

mkdir -p ${OWRT_DIR}

# Build the docker raspberry pi cross compiler
echo "Creating ${OWRT_RPI}"
docker run dhylands/openwrt-toolchain-rpi:toolchain-rpi > ${OWRT_RPI}
chmod +x ${OWRT_RPI}

# Build the turris omnia cross compiler
echo "Creating ${OWRT_OMNIA}"
docker run dhylands/openwrt-toolchain-arm_cortex-a9-vfpv3:toolchain-arm_cortex-a9-vfpv3 > ${OWRT_OMNIA}
chmod +x ${OWRT_OMNIA}
