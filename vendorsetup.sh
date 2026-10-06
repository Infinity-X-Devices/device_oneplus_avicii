#!/usr/bin/env bash
#
# Copyright (C) 2026 Project Infinity X
#
# SPDX-License-Identifier: Apache-2.0
#

# Color code variables
B="\033[1;34m";
G="\033[1;32m";
N="\033[0m"; # No Color

# Source directory
SRC_DIR="${PWD}";

echo -e "${B}Adding device sources to repo target list${N}";
# Create local manifests directory if doesn't exist
if [ ! -d "${SRC_DIR}/.repo/local_manifests" ]; then
	mkdir "${SRC_DIR}/.repo/local_manifests";
fi;
# Copy roomservice.xml to local manifests directory
cp "${SRC_DIR}/device/oneplus/avicii/configs/roomservice.xml" \
   "${SRC_DIR}/.repo/local_manifests/";
sleep 2s;
echo -e "${G}Done${N}";
echo -e "${B}Executing repo sync${N}";
# Do repo sync
repo sync --quiet;
echo -e "${G}Done${N}";
# Clone signing keys
echo -e "${B}Cloning signing keys${N}";
git clone --quiet https://github.com/ProjectInfinity-X/vendor_infinity-priv_keys vendor/infinity-priv/keys;
echo -e "${G}Done${N}";
echo -e "${B}Apply OnePlus Camera patch${N}";
git clone --quiet https://github.com/sreeshankark/patches;
cd frameworks/base;
git apply ../../patches/infinity_camera.patch;
cd ../..;
echo -e "${G}Done${N}";
