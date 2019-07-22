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
	.file	"main.c"
	.text
	.align	2
	.global	updateInstruction
	.type	updateInstruction, %function
updateInstruction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L5
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L1
	ldr	r3, .L5+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L4
.L1:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L4:
	bl	goToStart
	b	.L1
.L6:
	.align	2
.L5:
	.word	oldButtons
	.word	buttons
	.size	updateInstruction, .-updateInstruction
	.align	2
	.global	goToLose
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r0, #31
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+4
	mov	r2, #3
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	fillScreen
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r4, .L11
	ldr	ip, .L11+4
	ldr	r6, .L11+8
	ldr	r5, .L11+12
	mov	lr, #4
	mov	r3, #15
	mov	r2, r4
	ldr	r7, .L11+16
	mov	r1, #60
	mov	r0, #80
	str	lr, [ip, #0]
	ldr	r8, .L11+20
	mov	lr, pc
	bx	r7
	mov	r1, r6
	ldr	r2, [r5, #0]
	mov	r0, r4
	mov	lr, pc
	bx	r8
	ldr	r3, .L11+24
	mov	lr, pc
	bx	r3
	mov	r2, r4
	mov	r1, #60
	mov	r3, #15
	mov	r0, #80
	mov	lr, pc
	bx	r7
	mov	r0, r4
	mov	r1, r6
	ldr	r2, [r5, #0]
	mov	lr, pc
	bx	r8
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	buffer1
	.word	state
	.word	.LC0
	.word	.LANCHOR0
	.word	drawString
	.word	sprintf
	.word	flipPage
	.size	goToPause, .-goToPause
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r0, #0
	ldr	r4, .L14
	mov	lr, pc
	bx	r4
	ldr	r3, .L14+4
	mov	lr, pc
	bx	r3
	mov	r0, #0
	mov	lr, pc
	bx	r4
	ldr	r3, .L14+8
	mov	r2, #2
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	fillScreen4
	.word	flipPage
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	goToStart
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r0, .L17
	sub	sp, sp, #8
	ldr	r6, .L17+4
	ldr	r3, .L17+8
	mov	lr, pc
	bx	r3
	mov	r1, #0
	mov	r2, r1
	mov	r0, r6
	mov	r3, #160
	mov	r5, #240
	ldr	r4, .L17+12
	str	r5, [sp, #0]
	mov	lr, pc
	bx	r4
	ldr	r3, .L17+16
	mov	lr, pc
	bx	r3
	mov	r1, #0
	mov	r2, r1
	mov	r3, #160
	mov	r0, r6
	str	r5, [sp, #0]
	mov	lr, pc
	bx	r4
	ldr	r3, .L17+20
	mov	r2, #1
	str	r2, [r3, #0]
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	titlegamePal
	.word	titlegameBitmap
	.word	loadPalette
	.word	drawImage4
	.word	flipPage
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	updatePause
	.type	updatePause, %function
updatePause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L24
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L20
	ldr	r2, .L24+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L22
.L20:
	tst	r3, #4
	beq	.L19
	ldr	r3, .L24+4
	ldr	r3, [r3, #0]
	tst	r3, #4
	beq	.L23
.L19:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L23:
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L22:
	bl	goToGame
	ldr	r3, [r4, #0]
	b	.L20
.L25:
	.align	2
.L24:
	.word	oldButtons
	.word	buttons
	.size	updatePause, .-updatePause
	.align	2
	.global	goToInstruction
	.type	goToInstruction, %function
goToInstruction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r0, .L27
	sub	sp, sp, #8
	ldr	r6, .L27+4
	ldr	r3, .L27+8
	mov	lr, pc
	bx	r3
	mov	r1, #0
	mov	r2, r1
	mov	r0, r6
	mov	r3, #160
	mov	r5, #240
	ldr	r4, .L27+12
	str	r5, [sp, #0]
	mov	lr, pc
	bx	r4
	ldr	r3, .L27+16
	mov	lr, pc
	bx	r3
	mov	r1, #0
	mov	r2, r1
	mov	r3, #160
	mov	r0, r6
	str	r5, [sp, #0]
	mov	lr, pc
	bx	r4
	ldr	r3, .L27+20
	mov	r2, #0
	str	r2, [r3, #0]
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	Instructions1Pal
	.word	Instructions1Bitmap
	.word	loadPalette
	.word	drawImage4
	.word	flipPage
	.word	state
	.size	goToInstruction, .-goToInstruction
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #1040
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	add	r3, r3, #4
	mov	r5, #67108864
	strh	r3, [r5, #0]	@ movhi
	bl	goToInstruction
	ldr	r8, .L41
	ldr	r4, .L41+4
	ldr	r7, .L41+8
	ldr	r6, .L41+12
.L40:
	ldr	r3, [r4, #0]
	ldr	r2, [r7, #0]
.L31:
	str	r3, [r6, #0]
	ldr	r3, [r5, #304]
	str	r3, [r4, #0]
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L31
.L37:
	.word	.L32
	.word	.L33
	.word	.L34
	.word	.L35
	.word	.L36
.L36:
	mov	lr, pc
	bx	r8
	b	.L40
.L35:
	bl	updateLose
	b	.L40
.L34:
	bl	updateGame
	b	.L40
.L33:
	bl	updateStart
	b	.L40
.L32:
	bl	updateInstruction
	b	.L40
.L42:
	.align	2
.L41:
	.word	updatePause
	.word	buttons
	.word	state
	.word	oldButtons
	.size	main, .-main
	.align	2
	.global	init
	.type	init, %function
init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	ldr	r0, .L44
	sub	sp, sp, #36
	ldr	r3, .L44+4
	mov	lr, pc
	bx	r3
	mov	r3, #83886080
	mvn	r2, #64512
	strh	r2, [r3, #32]	@ movhi
	mov	r4, #0
	mov	r2, #992	@ movhi
	strh	r2, [r3, #30]	@ movhi
	strh	r4, [r3, #0]	@ movhi
	mov	r3, #60
	str	r3, [sp, #0]
	mov	r3, #180
	str	r4, [sp, #4]
	str	r4, [sp, #12]
	str	r3, [sp, #8]
	ldr	r5, .L44+8
	mov	ip, sp
	ldmia	ip!, {r0, r1, r2, r3}
	mov	r7, r5
	mov	r6, #50
	stmia	r7!, {r0, r1, r2, r3}
	str	r6, [sp, #20]
	str	r6, [sp, #16]
	str	r4, [sp, #24]
	ldr	r5, .L44+12
	ldmia	ip, {r0, r1, r2, r3}
	mov	ip, #20
	str	ip, [r5, #28]
	str	ip, [r5, #24]
	mov	r6, #80
	stmia	r7, {r0, r1, r2, r3}
	ldr	ip, .L44+16
	ldr	r3, .L44+20
	str	r6, [r5, #0]
	str	r6, [r5, #8]
	str	r4, [r5, #16]
	str	r4, [r5, #20]
	mov	r5, #1
	str	r5, [ip, #0]
	str	r4, [r3, #0]
	add	sp, sp, #36
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	bird1fixPal
	.word	loadPalette
	.word	upperObs
	.word	bird
	.word	obstacleCount
	.word	activeTimer
	.size	init, .-init
	.align	2
	.global	updateLose
	.type	updateLose, %function
updateLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r0, .L49
	ldr	r3, .L49+4
	mov	lr, pc
	bx	r3
	ldr	r0, .L49+8
	ldr	r3, .L49+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L49+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L49+20
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L46
	ldr	r3, .L49+24
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L48
.L46:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L48:
	bl	init
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L50:
	.align	2
.L49:
	.word	lossPal
	.word	loadPalette
	.word	lossBitmap
	.word	drawBackgroundImage4
	.word	flipPage
	.word	oldButtons
	.word	buttons
	.size	updateLose, .-updateLose
	.align	2
	.global	updateStart
	.type	updateStart, %function
updateStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L54
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L51
	ldr	r3, .L54+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L53
.L51:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L53:
	bl	init
	bl	goToGame
	b	.L51
.L55:
	.align	2
.L54:
	.word	oldButtons
	.word	buttons
	.size	updateStart, .-updateStart
	.global	__aeabi_idivmod
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L74
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	r2, [r3, #0]
	ldr	r4, .L74+4
	add	r2, r2, #1
	str	r2, [r3, #0]
	mov	r0, r2
	ldr	r1, [r4, #0]
	ldr	r3, .L74+8
	mov	lr, pc
	bx	r3
	cmp	r1, #0
	ldrne	r6, .L74+12
	bne	.L57
	ldr	r6, .L74+12
	ldr	r0, [r6, #0]
	cmp	r0, #0
	ble	.L57
	ldr	r5, .L74+16
	ldr	r7, [r5, #24]
	cmp	r7, #0
	movne	r3, r5
	bne	.L60
	b	.L58
.L61:
	ldr	r2, [r3, #56]
	cmp	r2, #0
	mov	r7, r1
	add	r3, r3, #32
	beq	.L58
.L60:
	add	r1, r1, #1
	cmp	r1, r0
	blt	.L61
.L57:
	ldr	r0, .L74+20
	ldr	r2, [r0, #0]
	ldr	ip, .L74+24
	add	r2, r2, #1
	smull	r3, ip, r2, ip
	ldr	r1, .L74+28
	mov	lr, r2, asr #31
	ldr	r3, [r1, #0]
	rsb	ip, lr, ip, asr #1
	add	ip, ip, ip, asl #2
	add	r3, r3, #1
	cmp	r2, ip
	str	r2, [r0, #0]
	str	r3, [r1, #0]
	bne	.L62
	ldr	r2, .L74+32
	ldr	r0, [r2, #0]
	add	r0, r0, #1
	mov	r1, r0, asr #31
	mov	r1, r1, lsr #30
	add	r0, r0, r1
	and	r0, r0, #3
	rsb	r1, r1, r0
	str	r1, [r2, #0]
.L62:
	ldr	r2, .L74+24
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	rsb	r2, r1, r2, asr #2
	add	r2, r2, r2, asl #2
	cmp	r3, r2, asl #1
	beq	.L73
.L63:
	ldr	r3, .L74+36
	ldr	r0, .L74+40
	mov	lr, pc
	bx	r3
	ldr	r3, [r6, #0]
	cmp	r3, #0
	ble	.L56
	ldr	r5, .L74+16
	ldr	r8, .L74+44
	ldr	r7, .L74+48
	ldr	sl, .L74+52
	mov	r4, #0
	b	.L66
.L65:
	ldr	r3, [r6, #0]
	cmp	r3, r4
	ble	.L56
.L66:
	add	r9, r5, r4, asl #5
	mov	r0, r9
	mov	lr, pc
	bx	r8
	mov	r1, r9
	ldr	r0, .L74+40
	mov	lr, pc
	bx	r7
	cmp	r0, #1
	add	r4, r4, #1
	bne	.L65
	ldr	r3, [sl, #0]
	add	r3, r3, #1
	str	r3, [sl, #0]
	bl	goToLose
	ldr	r3, [r6, #0]
	cmp	r3, r4
	bgt	.L66
.L56:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L73:
	ldr	r0, .L74+40
	ldr	r3, .L74+56
	mov	lr, pc
	bx	r3
	b	.L63
.L58:
	add	r8, r5, r7, asl #5
	mov	r3, #1
	str	r3, [r8, #24]
	ldr	r3, .L74+60
	mov	lr, pc
	bx	r3
	ldr	r3, .L74+64
	smull	r1, r3, r0, r3
	mov	r2, r0, asr #31
	add	r3, r3, r0
	rsb	r3, r2, r3, asr #2
	rsb	r3, r3, r3, asl #3
	ldr	r2, .L74+68
	rsb	r0, r3, r0
	ldr	r3, [r2, r0, asl #2]
	mov	r1, #30
	mov	r2, #200
	add	r0, r8, #24
	str	r3, [r5, r7, asl #5]
	str	r1, [r8, #20]
	str	r1, [r8, #16]
	str	r3, [r8, #4]
	mov	r1, #15
	mov	r3, #80
	str	r2, [r8, #8]
	strb	r1, [r0, #4]
	str	r2, [r8, #12]
	str	r3, [r4, #0]
	b	.L57
.L75:
	.align	2
.L74:
	.word	activeTimer
	.word	timetoNext
	.word	__aeabi_idivmod
	.word	obstacleCount
	.word	upperObs
	.word	timer2
	.word	1717986919
	.word	timer3
	.word	timer
	.word	updatePlayer
	.word	bird
	.word	updatePillar
	.word	collisionCheckObstacleTarget
	.word	.LANCHOR0
	.word	updateDrop
	.word	rand
	.word	-1840700269
	.word	.LANCHOR1
	.size	update, .-update
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r3, .L85
	ldr	r3, [r3, #0]
	cmp	r3, #1
	beq	.L79
	cmp	r3, #2
	beq	.L80
	cmp	r3, #0
	beq	.L84
.L77:
	ldr	r5, .L85+4
	ldr	r3, [r5, #0]
	cmp	r3, #0
	ble	.L81
	ldr	r7, .L85+8
	ldr	r6, .L85+12
	mov	r4, #0
.L82:
	add	r0, r7, r4, asl #5
	mov	lr, pc
	bx	r6
	ldr	r3, [r5, #0]
	add	r4, r4, #1
	cmp	r3, r4
	bgt	.L82
.L81:
	ldr	r3, .L85+16
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L84:
	ldr	r3, .L85+20
	ldr	r2, .L85+24
	mov	r0, r3
	str	r2, [r3, #36]
	ldr	r3, .L85+28
	mov	lr, pc
	bx	r3
	b	.L77
.L80:
	ldr	r3, .L85+20
	ldr	r2, .L85+32
	mov	r0, r3
	str	r2, [r3, #36]
	ldr	r3, .L85+28
	mov	lr, pc
	bx	r3
	b	.L77
.L79:
	ldr	r3, .L85+20
	ldr	r2, .L85+36
	mov	r0, r3
	str	r2, [r3, #36]
	ldr	r3, .L85+28
	mov	lr, pc
	bx	r3
	b	.L77
.L86:
	.align	2
.L85:
	.word	timer
	.word	obstacleCount
	.word	upperObs
	.word	drawPillar
	.word	flipPage
	.word	bird
	.word	bird1fixBitmap
	.word	drawBird
	.word	bird3fixBitmap
	.word	bird2fixBitmap
	.size	draw, .-draw
	.align	2
	.global	updateGame
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	bl	update
	ldr	r3, .L90
	mov	lr, pc
	bx	r3
	bl	draw
	ldr	r3, .L90+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L87
	ldr	r3, .L90+8
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L89
.L87:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L89:
	bl	goToPause
	b	.L87
.L91:
	.align	2
.L90:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	updateGame, .-updateGame
	.global	lost
	.global	arr
	.global	arr2
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	buffer1,41,4
	.comm	timer,4,4
	.comm	timer2,4,4
	.comm	timer3,4,4
	.comm	timetoNext,4,4
	.comm	activeTimer,4,4
	.comm	obstacleCount,4,4
	.comm	bird,40,4
	.comm	upperObs,32,4
	.comm	lowerObs,32,4
	.comm	state,4,4
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	arr2, %object
	.size	arr2, 16
arr2:
	.word	0
	.word	80
	.word	30
	.word	110
	.type	arr, %object
	.size	arr, 16
arr:
	.word	70
	.word	50
	.word	60
	.word	80
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Games lost!  %d\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	lost, %object
	.size	lost, 4
lost:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
