	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"draw.c"
	.text
	.align	2
	.global	drawBird
	.type	drawBird, %function
drawBird:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r4, r0
	sub	sp, sp, #8
	ldr	r1, [r4, #12]
	add	r2, r4, #24
	ldmia	r2, {r2, r3}	@ phole ldm
	ldr	r0, [r0, #4]
	mov	ip, #0
	str	ip, [sp, #0]
	sub	r1, r1, #10
	add	r2, r2, #20
	add	r3, r3, #20
	ldr	ip, .L2
	sub	r0, r0, #10
	mov	lr, pc
	bx	ip
	ldr	ip, [r4, #24]
	ldr	r0, [r4, #36]
	ldr	r1, [r4, #0]
	ldr	r2, [r4, #8]
	ldr	r3, [r4, #28]
	str	ip, [sp, #0]
	ldr	ip, .L2+4
	mov	lr, pc
	bx	ip
	add	sp, sp, #8
	ldmfd	sp!, {r4, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	drawRect4
	.word	drawImage4
	.size	drawBird, .-drawBird
	.align	2
	.global	drawPillar
	.type	drawPillar, %function
drawPillar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	sub	sp, sp, #12
	ldr	ip, [r0, #24]
	cmp	ip, #0
	mov	r4, r0
	bne	.L8
	ldr	r3, [r4, #20]
	ldr	r0, [r0, #4]
	add	r1, r4, #12
	ldmia	r1, {r1, r2}	@ phole ldm
	add	r3, r3, #5
	str	ip, [sp, #0]
	ldr	ip, .L9
	mov	lr, pc
	bx	ip
.L4:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L8:
	add	r1, r4, #12
	ldmia	r1, {r1, r2, r3}	@ phole ldm
	mov	ip, #0
	ldr	r0, [r0, #4]
	add	r3, r3, #5
	ldr	r5, .L9
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r5
	ldrb	ip, [r4, #28]	@ zero_extendqisi2
	ldr	r0, [r4, #0]
	ldr	r1, [r4, #8]
	add	r2, r4, #16
	ldmia	r2, {r2, r3}	@ phole ldm
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r5
	b	.L4
.L10:
	.align	2
.L9:
	.word	drawRect4
	.size	drawPillar, .-drawPillar
	.ident	"GCC: (devkitARM release 31) 4.5.0"
