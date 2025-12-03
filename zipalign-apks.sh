#!/bin/bash
# Copyright (C) 2024 XperiaLabs Project
# SPDX-License-Identifier: Apache-2.0

# Script to zipalign APKs for Soong build system compatibility
# This script aligns APKs to 4-byte boundaries, which is required by Soong
# before these APKs can be successfully imported and built.
#
# Prerequisites:
# - zipalign tool must be available in PATH (typically from Android SDK build-tools)
#
# Usage:
#   ./zipalign-apks.sh

set -e  # Exit on first error

# Array of APK files to process (relative to repository root)
APKS=(
    "CameraApp/SomcCameraApp-Shimanto.apk"
    "CameraCommon/CameraCommon.apk"
    "CameraPanorama/CameraPanorama-Yodo.apk"
    "CameraCalibration/SomcCameraCalibration-Pdx245.apk"
)

# Check if zipalign is available
if ! command -v zipalign &> /dev/null; then
    echo "ERROR: zipalign not found in PATH"
    echo "Please install Android SDK build-tools and ensure zipalign is in your PATH"
    exit 1
fi

echo "Starting APK zipalignment process..."
echo "======================================"
echo ""

# Track if any verification failed
verification_failed=0

# Process each APK
for apk in "${APKS[@]}"; do
    echo "Processing: $apk"
    
    # Check if APK exists
    if [ ! -f "$apk" ]; then
        echo "  WARNING: APK not found, skipping"
        echo ""
        continue
    fi
    
    # Create aligned APK filename
    aligned_apk="${apk%.apk}-aligned.apk"
    
    # Zipalign the APK
    echo "  Aligning APK to 4-byte boundary..."
    if zipalign -f -p 4 "$apk" "$aligned_apk"; then
        echo "  ✓ Alignment successful"
    else
        echo "  ✗ Alignment failed"
        # Clean up temporary file if it exists
        [ -f "$aligned_apk" ] && rm -f "$aligned_apk"
        verification_failed=1
        echo ""
        continue
    fi
    
    # Replace original with aligned version
    echo "  Replacing original with aligned version..."
    mv "$aligned_apk" "$apk"
    echo "  ✓ Replacement complete"
    
    # Verify alignment
    echo "  Verifying alignment..."
    if zipalign -c 4 "$apk" &> /dev/null; then
        echo "  ✓ Verification successful - APK is properly aligned"
    else
        echo "  ✗ Verification failed - APK is NOT properly aligned"
        verification_failed=1
    fi
    
    echo ""
done

echo "======================================"
echo "APK alignment process complete!"
echo ""

# Check if any verification failed
if [ $verification_failed -ne 0 ]; then
    echo "ERROR: One or more APKs failed alignment or verification"
    echo "Please review the output above for details"
    exit 1
fi

echo "All APKs successfully aligned and verified!"
echo ""
echo "IMPORTANT: Please review the changes before committing:"
echo "  git diff"
echo ""
echo "If the changes look correct, you can commit them:"
echo "  git add -u"
echo "  git commit -m 'Zipalign APKs for Soong compatibility'"
echo ""
