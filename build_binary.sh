#!/bin/bash

SOURCE_FILE="main.go"
OUTPUT_BASE="http"
OUTPUT_DIR="./bin/"

# Assume Go is installed

# Build for Apple Silicon (arm64)
GOOS=darwin GOARCH=arm64 go build -o "${OUTPUT_DIR}${OUTPUT_BASE}_darwin_arm64" $SOURCE_FILE
echo "Built ${OUTPUT_BASE}_darwin_arm64"

# Build for Apple Intel 64-bit (amd64)
GOOS=darwin GOARCH=amd64 go build -o "${OUTPUT_DIR}${OUTPUT_BASE}_darwin_amd64" $SOURCE_FILE
echo "Built ${OUTPUT_BASE}_darwin_amd64"

# Build for Win 11 64-bit (amd64)
GOOS=windows GOARCH=amd64 go build -o "${OUTPUT_DIR}${OUTPUT_BASE}_windows_amd64.exe" $SOURCE_FILE
echo "Built ${OUTPUT_BASE}_windows_amd64.exe"

# Build for Linux 64-bit (amd64)
GOOS=linux GOARCH=amd64 go build -o "${OUTPUT_DIR}${OUTPUT_BASE}_linux_amd64" $SOURCE_FILE
echo "Built ${OUTPUT_BASE}_linux_amd64"

echo "Builds completed! Check the $OUTPUT_DIR directory."
