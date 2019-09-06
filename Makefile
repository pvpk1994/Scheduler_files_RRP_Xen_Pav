obj-$(CONFIG_ARGO) += argo.o
obj-y += bitmap.o
obj-y += bsearch.o
obj-$(CONFIG_CORE_PARKING) += core_parking.o
obj-y += cpu.o
obj-y += cpupool.o
obj-$(CONFIG_HAS_DEVICE_TREE) += device_tree.o
obj-y += domctl.o
obj-y += domain.o
obj-y += event_2l.o
obj-y += event_channel.o
obj-y += event_fifo.o
obj-$(CONFIG_CRASH_DEBUG) += gdbstub.o
obj-y += grant_table.o
obj-y += guestcopy.o
obj-bin-y += gunzip.init.o
obj-y += irq.o
obj-y += kernel.o
obj-y += keyhandler.o
obj-$(CONFIG_KEXEC) += kexec.o
obj-$(CONFIG_KEXEC) += kimage.o
obj-y += lib.o
obj-$(CONFIG_NEEDS_LIST_SORT) += list_sort.o
obj-$(CONFIG_LIVEPATCH) += livepatch.o livepatch_elf.o
obj-$(CONFIG_TMEM) += lzo.o
obj-$(CONFIG_MEM_ACCESS) += mem_access.o
obj-y += memory.o
obj-y += monitor.o
obj-y += multicall.o
obj-y += notifier.o
obj-y += page_alloc.o
obj-$(CONFIG_HAS_PDX) += pdx.o
obj-$(CONFIG_PERF_COUNTERS) += perfc.o
obj-y += preempt.o
obj-y += random.o
obj-y += rangeset.o
obj-y += radix-tree.o
obj-y += rbtree.o
obj-y += rcupdate.o
obj-y += rwlock.o
#---------- SCHEDULER"S OBJECTS ---------------
obj-$(CONFIG_SCHED_ARINC653) += sched_arinc653.o
obj-$(CONFIG_SCHED_CREDIT) += sched_credit.o
obj-$(CONFIG_SCHED_CREDIT2) += sched_credit2.o
obj-$(CONFIG_SCHED_RTDS) += sched_rt.o
obj-$(CONFIG_SCHED_AAF) += sched_aaf.o
obj-$(CONFIG_SCHED_NULL) += sched_null.o
obj-$(CONFIG_SCHED_TRIVIAL) += sched_trivial.o
#----------------------------------------------
obj-y += schedule.o
obj-y += shutdown.o
obj-y += softirq.o
obj-y += sort.o
obj-y += smp.o
obj-y += spinlock.o
obj-y += stop_machine.o
obj-y += string.o
obj-y += symbols.o
obj-y += sysctl.o
obj-y += tasklet.o
obj-y += time.o
obj-y += timer.o
obj-y += trace.o
obj-y += version.o
obj-y += virtual_region.o
obj-y += vm_event.o
obj-y += vmap.o
obj-y += vsprintf.o
obj-y += wait.o
obj-bin-y += warning.init.o
obj-$(CONFIG_XENOPROF) += xenoprof.o
obj-y += xmalloc_tlsf.o

lzo-y := lzo
lzo-$(CONFIG_TMEM) :=
obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma $(lzo-y) unlzo unlz4 earlycpio,$(n).init.o)

obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o kernel.o memory.o multicall.o xlat.o)

tmem-y := tmem.o tmem_xen.o tmem_control.o
tmem-$(CONFIG_COMPAT) += compat/tmem_xen.o
obj-$(CONFIG_TMEM) += $(tmem-y)

extra-y := symbols-dummy.o

subdir-$(CONFIG_COVERAGE) += coverage
subdir-$(CONFIG_UBSAN) += ubsan

subdir-$(CONFIG_NEEDS_LIBELF) += libelf
subdir-$(CONFIG_HAS_DEVICE_TREE) += libfdt
