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
	.file	"update.c"
	.text
	.align	2
	.global	updatePlayer
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #8]
	ldr	r3, [r0, #0]
	str	r2, [r0, #12]
	str	r3, [r0, #4]
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	tst	r2, #64
	bxne	lr
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r0, #0]
	bx	lr
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateDrop
	.type	updateDrop, %function
updateDrop:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #24]
	ldr	r3, [r0, #0]
	rsb	r2, r2, #160
	cmp	r3, r2
	addlt	r2, r3, #6
	strlt	r3, [r0, #4]
	strlt	r2, [r0, #0]
	bx	lr
	.size	updateDrop, .-updateDrop
	.align	2
	.global	updatePillar
	.type	updatePillar, %function
updatePillar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #24]
	ldr	r3, [r0, #8]
	cmp	r2, #0
	str	r3, [r0, #12]
	bxeq	lr
	sub	r3, r3, #2
	cmp	r3, #0
	str	r3, [r0, #8]
	rsble	r3, r3, #0
	strle	r3, [r0, #0]
	movle	r3, #0
	strle	r3, [r0, #24]
	bx	lr
	.size	updatePillar, .-updatePillar
	.align	2
	.global	collisionCheckObstacleTarget
	.type	collisionCheckObstacleTarget, %function
collisionCheckObstacleTarget:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	ldr	r3, [r1, #24]
	cmp	r3, #1
	beq	.L15
.L14:
	mov	r0, #0
.L9:
	ldmfd	sp!, {r4}
	bx	lr
.L15:
	ldr	r2, [r1, #8]
	ldr	r4, [r1, #20]
	ldr	ip, [r0, #8]
	add	r4, r2, r4
	cmp	ip, r4
	bgt	.L14
	ldr	r4, [r0, #28]
	add	ip, ip, r4
	cmp	r2, ip
	bgt	.L14
	ldr	r2, [r0, #0]
	ldr	r4, [r0, #24]
	ldr	ip, [r1, #0]
	add	r4, r2, r4
	cmp	r4, ip
	blt	.L14
	ldr	r4, [r1, #16]
	add	ip, ip, r4
	cmp	r2, ip
	bgt	.L14
	ldr	ip, [r0, #16]
	ldr	r2, [r0, #20]
	rsb	ip, ip, #0
	rsb	r2, r2, #0
	str	ip, [r0, #16]
	str	r2, [r0, #20]
	mov	r0, r3
	b	.L9
	.size	collisionCheckObstacleTarget, .-collisionCheckObstacleTarget
	.ident	"GCC: (devkitARM release 31) 4.5.0"
