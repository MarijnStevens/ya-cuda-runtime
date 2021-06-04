# Ya-cuda-runtime-test

NOTE: For dev's only. Don't expect things to run out of the box.
test.sh needs to be tweaked because of a hack for starting a new terminal window.

Run ./test.sh to display what lspci are visible in the vm.

# Notes

init.c can be used in the ya-runtime-vm/init-container/src/init.c to generate a custom initramfs.cpio.gz to use within runtime/
