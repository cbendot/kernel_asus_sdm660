 #!/bin/bash

export KERNELNAME=HMP-Perfomance

export KBUILD_BUILD_USER=ben863

export KBUILD_BUILD_HOST=LiteSpeed

export TOOLCHAIN=clang

export DEVICES=X00TD

source helper

gen_toolchain

send_msg "π¨Building Kernel.... Suit-Suit... He-He%0A${KERNELNAME}%0AKernel Version: 4.4.274%0ABuild Date: $DATE%0AServer: Drone CI%0ABot: ${KBUILD_BUILD_USER}@${KBUILD_BUILD_HOST}%0A1:00 ββββββββββββββ 2:00 βγ€γ€γ€ γ€βγ€γ€ββγ€γ€β·γ€γ€γ€γ€β»"

START=$(date +"%s")

for i in ${DEVICES//,/ }
do

	build ${i} -perf
	
done

END=$(date +"%s")

DIFF=$(( END - START ))

send_msg "β Build Selesai | $((DIFF / 60))Menit $((DIFF % 60))Detik | Pembaruan: $(git log --pretty=format:'%h : %s' -5)"
