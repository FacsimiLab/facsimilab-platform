#!/bin/bash

# Minimum size in MB for caches to keep
MIN_SIZE_MB=1000


# # List and process build caches
# docker buildx du | awk '/^[a-z0-9]/ {print $1, $3}' | while read -r id size; do
#     # Convert size to MB
#     case "$size" in
#         *MB)
#             SIZE_MB=$(echo "$size" | sed 's/MB//')
#             ;;
#         *GB)
#             SIZE_MB=$(echo "scale=2; $(echo "$size" | sed 's/GB//') * 1024" | bc)
#             ;;
#         *kB)
#             SIZE_MB=$(echo "scale=2; $(echo "$size" | sed 's/kB//') / 1024" | bc)
#             ;;
#         *)
#             echo "Unknown size format: $size"
#             continue
#             ;;
#     esac

#     # Check if size is smaller than MIN_SIZE_MB and if the cache is reclaimable
#     if (( $(echo "$SIZE_MB < $MIN_SIZE_MB" | bc -l) )); then
#         echo "Removing cache $id of size $SIZE_MB MB"
#         docker buildx prune --filter "id=$id" --force
#     fi
# done






# List Docker system disk usage
docker system df -v | awk '/^Cache/ {print $3, $4}' | while read -r size id; do
    # Extract size in MB
    case "$size" in
        *MB)
            SIZE_MB=$(echo "$size" | sed 's/MB//')
            ;;
        *GB)
            SIZE_MB=$(echo "scale=2; $(echo "$size" | sed 's/GB//') * 1024" | bc)
            ;;
        *kB)
            SIZE_MB=$(echo "scale=2; $(echo "$size" | sed 's/kB//') / 1024" | bc)
            ;;
        *)
            echo "Unknown size format: $size"
            continue
            ;;
    esac

    # Check if size is smaller than MIN_SIZE_MB
    if (( $(echo "$SIZE_MB < $MIN_SIZE_MB" | bc -l) )); then
        echo "Removing cache $id of size $SIZE_MB MB"
        docker builder prune --filter "id=$id" --force
    fi
done