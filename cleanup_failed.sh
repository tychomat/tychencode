#!/bin/bash

# Check if failed_to_encode.txt exists
if [ -f failed_to_encode.txt ]; then
  echo "Cleaning up files listed in failed_to_encode.txt..."
  all_files_deleted=true  # Flag to check if all files are deleted

  # Loop through each line (each file path) in failed_to_encode.txt
  while IFS= read -r file; do
    # Append "_tychencode" before the file extension
    file_with_suffix="${file%.*}_tychencode.mkv"
    
    # Check if the file with suffix exists, then delete it
    if [ -f "$file_with_suffix" ]; then
      echo "Deleting $file_with_suffix..."
      trash "$file_with_suffix"
    else
      echo "File not found: $file_with_suffix"
      all_files_deleted=false  # Mark as false if any file is not found
    fi
  done < failed_to_encode.txt

  # Delete failed_to_encode.txt only if all files were deleted
  if $all_files_deleted; then
    echo "All files deleted. Deleting failed_to_encode.txt..."
    trash failed_to_encode.txt
  else
    echo "Some files were not found. failed_to_encode.txt will not be deleted."
  fi
else
  echo "No failed_to_encode.txt file found. Nothing to clean up."
fi
