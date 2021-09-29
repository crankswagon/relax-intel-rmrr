##get the base iommu.c file
wget https://kernel.ubuntu.com/git/ubuntu/ubuntu-hirsute.git/plain/drivers/iommu/intel/iommu.c


##make desired changes to iommu.c then generate patch
diff -u ./iommu.c.1 ./iommu.c.2 > add-relaxable-rmrr-5_11.patch

##get the base makefile from proxmox kernel branch and do the same; it seems that the original patch for the perl script isn't required
wget https://raw.githubusercontent.com/proxmox/pve-kernel/pve-kernel-5.11/Makefile

diff -u ./Makefile.orig ./Makefile.alt > proxmox.patch

## test these before beginning the build 
patch iommu.c ./build/proxmox/patches/add-relaxable-rmrr-5_11.patch
patch Makefile ./build/proxmox/patches/proxmox.patch



## ok so commenting out the bit in find-firmware.pl is actually required

wget https://raw.githubusercontent.com/proxmox/pve-kernel/pve-kernel-5.11/debian/scripts/find-firmware.pl