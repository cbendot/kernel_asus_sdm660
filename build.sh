 #!/bin/bash

export KERNELNAME=HMP-Perfomance

export KBUILD_BUILD_USER=ben863

export KBUILD_BUILD_HOST=LiteSpeed

export TOOLCHAIN=clang

export DEVICES=X00TD

source helper

gen_toolchain

send_msg "🔨Building Kernel... | Suit-Suit... He-He%0AKernel Version: ${KERNELNAME}%0A<b>Buildbot: ${KBUILD_BUILD_USER}%0AServer: ${KBUILD_BUILD_HOST}"

START=$(date +"%s")

for i in ${DEVICES//,/ }
do

	build ${i} -perf
	
done

END=$(date +"%s")

DIFF=$(( END - START ))

send_msg "✅ Build Selesai | $((DIFF / 60))Menit $((DIFF % 60))Detik | Pembaruan: $(git log --pretty=format:'%h : %s' -5)"
