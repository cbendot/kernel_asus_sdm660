 #!/bin/bash

export KERNELNAME=HMP-Perfomance

export KBUILD_BUILD_USER=ben863

export KBUILD_BUILD_HOST=LiteSpeed

export TOOLCHAIN=gcc

export DEVICES=X00TD

source helper

gen_toolchain

send_msg "<code>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</code>%0A🔨<code>Building Kernel.... Suit-Suit... He-He</code>%0A<code>${KERNELNAME}</code>%0A<code>Kernel Version: 4.4.274</code>%0A<code>Build Date: $DATE</code>%0A<code>Server: Drone CI</code>%0A<code>Bot: ${KBUILD_BUILD_USER}@${KBUILD_BUILD_HOST}</code>%0A<code>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</code>%0A1:00 ●━━━━━━─────── 2:00 ⇆ㅤㅤㅤ ㅤ◁ㅤㅤ❚❚ㅤㅤ▷ㅤㅤㅤㅤ↻"

START=$(date +"%s")

for i in ${DEVICES//,/ }
do

	build ${i} -perf
	
done

END=$(date +"%s")

DIFF=$(( END - START ))

send_msg "✅ Build Selesai | $((DIFF / 60))Menit $((DIFF % 60))Detik | Pembaruan: $(git log --pretty=format:'%h : %s' -5)"
