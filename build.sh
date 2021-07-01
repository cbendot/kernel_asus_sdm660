 #!/bin/bash

export KERNELNAME=HMP-Perfomance

export KBUILD_BUILD_USER=ben863

export KBUILD_BUILD_HOST=LiteSpeed

export TOOLCHAIN=clang

export DEVICES=X00TD

source helper

gen_toolchain

send_msg "<b>🔨Building Kernel. . .</b>%0A<b>Kernel Version: ${KERNELNAME}</b>%0A<b>Buildbot: ${KBUILD_BUILD_USER}</b>%0A<b>Server: ${KBUILD_BUILD_HOST}</b>%0A<b>Suit-Suit... He-He"

START=$(date +"%s")

for i in ${DEVICES//,/ }
do

	build ${i} -perf
	
done

END=$(date +"%s")

DIFF=$(( END - START ))

send_msg "✅ Build Selesai | $((DIFF / 60))Menit $((DIFF % 60))Detik | Pembaruan: $(git log --pretty=format:'%h : %s' -5)"
