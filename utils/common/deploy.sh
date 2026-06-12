#!/bin/bash
set -euo pipefail

cd "$(dirname "$0")/../.."

POSITIONAL=()
for arg in "$@"; do
    case "${arg}" in
        -h|--help)
            cat <<EOF
Usage: $(basename "$0") [<module>]

Deploy an already-built camera module tarball to the target via adb.
Does not build, reboot, or run a capture test.

<module> defaults to ev2m_oom3.
EOF
            exit 0
            ;;
        *) POSITIONAL+=("${arg}") ;;
    esac
done

MODULE_NAME=${POSITIONAL[0]:-"ev2m_oom3"}

TARBALL="release/${MODULE_NAME}.tar.gz"
REMOTE_TARBALL="/home/root/${MODULE_NAME}.tar.gz"

if [ ! -f "${TARBALL}" ]; then
    echo "Error: ${TARBALL} not found. Build it first with ./build.sh ${MODULE_NAME}" >&2
    exit 1
fi

echo "==> Deploying ${TARBALL} to target"
adb push "${TARBALL}" "${REMOTE_TARBALL}"
adb shell 'mount -o rw,remount /usr'
adb shell "tar -xzvf ${REMOTE_TARBALL} -C /usr/lib/camera"

echo "==> Done"
