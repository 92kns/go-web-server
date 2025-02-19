#!/bin/bash

# SOURCE_FILE="main.go"
OUTPUT_BASE="gws" #go web server
OUTPUT_DIR="./bin/"

# Assume Go is installed

# Build for Apple Silicon (arm64)
GOOS=darwin GOARCH=arm64 go build -o "${OUTPUT_DIR}darwin_arm64/${OUTPUT_BASE}"
echo "Built ${OUTPUT_BASE} for darwin_arm64"

# Build for Apple Intel 64-bit (amd64)
GOOS=darwin GOARCH=amd64 go build -o "${OUTPUT_DIR}darwin_amd64/${OUTPUT_BASE}"
echo "Built ${OUTPUT_BASE} for darwin_amd64"

# Build for Win 11 64-bit (amd64)
GOOS=windows GOARCH=amd64 go build -o "${OUTPUT_DIR}windows_amd64/${OUTPUT_BASE}.exe"
echo "Built ${OUTPUT_BASE} for windows_amd64"

# Build for Linux 64-bit (amd64)
GOOS=linux GOARCH=amd64 go build -o "${OUTPUT_DIR}linux_amd64/${OUTPUT_BASE}"
echo "Built ${OUTPUT_BASE} for linux_amd64"

echo "Builds completed! Check the $OUTPUT_DIR directory."
