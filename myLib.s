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
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L2
	rsb	r0, r0, r0, asl #4
	add	r0, r1, r0, asl #4
	ldr	r3, [r3, #0]
	mov	r0, r0, asl #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LANCHOR0
	.size	setPixel, .-setPixel
	.align	2
	.global	setPixel4
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r0, r0, r0, asl #4
	add	r3, r1, r0, asl #4
	ldr	r0, .L7
	add	r3, r3, r3, lsr #31
	ldr	ip, [r0, #0]
	bic	r3, r3, #1
	tst	r1, #1
	ldrh	r1, [ip, r3]
	andne	r1, r1, #255
	biceq	r1, r1, #255
	orrne	r2, r1, r2, asl #8
	orreq	r2, r2, r1
	strneh	r2, [ip, r3]	@ movhi
	streqh	r2, [ip, r3]	@ movhi
	bx	lr
.L8:
	.align	2
.L7:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	DMANow
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r0, r0, r0, asl #1
	mov	r0, r0, asl #2
	add	r0, r0, #67108864
	add	ip, r0, #176
	orr	r3, r3, #-2147483648
	str	r1, [r0, #176]
	str	r2, [ip, #4]
	str	r3, [ip, #8]
	bx	lr
	.size	DMANow, .-DMANow
	.align	2
	.global	drawRect3
	.type	drawRect3, %function
drawRect3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	sub	sp, sp, #12
	ldrh	ip, [sp, #16]
	cmp	r2, #0
	strh	ip, [sp, #6]	@ movhi
	ble	.L10
	ldr	ip, .L15
	rsb	r0, r0, r0, asl #4
	ldr	ip, [ip, #0]
	add	r1, r1, r0, asl #4
	orr	r4, r3, #-2130706432
	add	r1, ip, r1, asl #1
	mov	r0, #0
	add	r3, sp, #6
	mov	ip, #67108864
.L12:
	add	r0, r0, #1
	cmp	r0, r2
	str	r3, [ip, #212]
	str	r1, [ip, #216]
	str	r4, [ip, #220]
	add	r1, r1, #480
	bne	.L12
.L10:
	add	sp, sp, #12
	ldmfd	sp!, {r4}
	bx	lr
.L16:
	.align	2
.L15:
	.word	.LANCHOR0
	.size	drawRect3, .-drawRect3
	.align	2
	.global	drawRect4
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #36
	ldrb	r4, [sp, #72]	@ zero_extendqisi2
	cmp	r2, #0
	str	r2, [sp, #0]
	orr	r2, r4, r4, asl #8
	str	r4, [sp, #8]
	str	r1, [sp, #12]
	strh	r2, [sp, #30]	@ movhi
	ble	.L17
	ldr	r5, [sp, #12]
	add	r1, r3, r3, lsr #31
	mov	r1, r1, asr #1
	sub	ip, r1, #1
	sub	r2, r5, #1
	rsb	r4, r0, r0, asl #4
	add	r4, r5, r4, asl #4
	orr	r1, r1, #-2130706432
	orr	ip, ip, #-2130706432
	add	r2, r2, r3
	and	r8, r5, #1
	ldr	sl, .L26
	str	r1, [sp, #4]
	str	ip, [sp, #20]
	add	r4, r4, #1
	mov	r7, r0
	mov	r5, #0
	and	r9, r3, #1
	add	fp, sp, #30
	mov	r6, #67108864
	str	r2, [sp, #16]
	b	.L23
.L19:
	cmp	r9, #0
	bne	.L25
	sub	r3, r4, #1
	ldr	r2, [sl, #0]
	add	r3, r3, r3, lsr #31
	bic	r3, r3, #1
	add	r3, r2, r3
	ldr	r2, [sp, #4]
	str	fp, [r6, #212]
	str	r3, [r6, #216]
	str	r2, [r6, #220]
.L21:
	ldr	r3, [sp, #0]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #240
	add	r7, r7, #1
	ble	.L17
.L23:
	cmp	r8, #0
	beq	.L19
	mov	r0, r7
	ldr	r1, [sp, #12]
	ldr	r2, [sp, #8]
	bl	setPixel4
	cmp	r9, #0
	beq	.L20
	ldr	r2, [sl, #0]
	add	r3, r4, r4, lsr #31
	bic	r3, r3, #1
	add	r3, r2, r3
	str	fp, [r6, #212]
	str	r3, [r6, #216]
	ldmia	sp, {r3, ip}	@ phole ldm
	add	r5, r5, #1
	cmp	r3, r5
	str	ip, [r6, #220]
	add	r4, r4, #240
	add	r7, r7, #1
	bgt	.L23
.L17:
	add	sp, sp, #36
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L25:
	sub	r3, r4, #1
	ldr	r2, [sl, #0]
	add	r3, r3, r3, lsr #31
	ldr	ip, [sp, #4]
	bic	r3, r3, #1
	add	r3, r2, r3
	ldr	r1, [sp, #16]
	ldr	r2, [sp, #8]
	mov	r0, r7
	str	fp, [r6, #212]
	str	r3, [r6, #216]
	str	ip, [r6, #220]
	bl	setPixel4
	b	.L21
.L20:
	ldr	r2, [sl, #0]
	add	r3, r4, r4, lsr #31
	bic	r3, r3, #1
	add	r3, r2, r3
	ldr	r1, [sp, #16]
	ldr	r2, [sp, #8]
	str	fp, [r6, #212]
	str	r3, [r6, #216]
	ldr	r3, [sp, #20]
	mov	r0, r7
	str	r3, [r6, #220]
	bl	setPixel4
	b	.L21
.L27:
	.align	2
.L26:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	drawRectInBounds3
	.type	drawRectInBounds3, %function
drawRectInBounds3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	cmp	r1, #0
	addlt	r3, r3, r1
	movlt	r1, #0
	add	r4, r3, r1
	cmp	r4, #240
	ldrh	ip, [sp, #4]
	addgt	r3, r3, #240
	rsbgt	r3, r4, r3
	movgt	r1, #240
	str	ip, [sp, #4]
	ldmfd	sp!, {r4}
	b	drawRect3
	.size	drawRectInBounds3, .-drawRectInBounds3
	.align	2
	.global	drawBackgroundImage3
	.type	drawBackgroundImage3, %function
drawBackgroundImage3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L32
	mov	r2, #-2147483648
	ldr	r1, [r3, #0]
	add	r2, r2, #38400
	mov	r3, #67108864
	str	r0, [r3, #212]
	str	r1, [r3, #216]
	str	r2, [r3, #220]
	bx	lr
.L33:
	.align	2
.L32:
	.word	.LANCHOR0
	.size	drawBackgroundImage3, .-drawBackgroundImage3
	.align	2
	.global	drawBackgroundImage4
	.type	drawBackgroundImage4, %function
drawBackgroundImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L35
	mov	r2, #-2147483648
	ldr	r1, [r3, #0]
	add	r2, r2, #19200
	mov	r3, #67108864
	str	r0, [r3, #212]
	str	r1, [r3, #216]
	str	r2, [r3, #220]
	bx	lr
.L36:
	.align	2
.L35:
	.word	.LANCHOR0
	.size	drawBackgroundImage4, .-drawBackgroundImage4
	.align	2
	.global	drawImage3
	.type	drawImage3, %function
drawImage3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5}
	cmp	r3, #0
	ldr	r4, [sp, #8]
	ble	.L37
	ldr	ip, .L41
	rsb	r1, r1, r1, asl #4
	ldr	ip, [ip, #0]
	add	r1, r2, r1, asl #4
	orr	r5, r4, #-2147483648
	add	r1, ip, r1, asl #1
	mov	r4, r4, asl #1
	mov	ip, #0
	mov	r2, #67108864
.L39:
	add	ip, ip, #1
	cmp	ip, r3
	str	r0, [r2, #212]
	str	r1, [r2, #216]
	add	r0, r0, r4
	str	r5, [r2, #220]
	add	r1, r1, #480
	bne	.L39
.L37:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L42:
	.align	2
.L41:
	.word	.LANCHOR0
	.size	drawImage3, .-drawImage3
	.align	2
	.global	drawImage4
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	tst	r2, #1
	stmfd	sp!, {r4, r5, r6, r7, r8, sl}
	addne	r2, r2, #1
	cmp	r3, #0
	ldr	r7, [sp, #24]
	ble	.L43
	ldr	r4, .L48
	add	r8, r7, r7, lsr #31
	rsb	r1, r1, r1, asl #4
	mov	r8, r8, asr #1
	mov	ip, #0
	ldr	sl, [r4, #0]
	add	r2, r2, r1, asl #4
	orr	r8, r8, #-2147483648
	mov	r4, ip
	mov	r1, #67108864
.L46:
	add	r6, ip, ip, lsr #31
	add	r5, r2, r2, lsr #31
	bic	r6, r6, #1
	bic	r5, r5, #1
	add	r4, r4, #1
	add	r6, r0, r6
	add	r5, sl, r5
	cmp	r4, r3
	str	r6, [r1, #212]
	add	ip, ip, r7
	str	r5, [r1, #216]
	add	r2, r2, #240
	str	r8, [r1, #220]
	bne	.L46
.L43:
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl}
	bx	lr
.L49:
	.align	2
.L48:
	.word	.LANCHOR0
	.size	drawImage4, .-drawImage4
	.align	2
	.global	loadPalette
	.type	loadPalette, %function
loadPalette:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #-2147483648
	mov	r3, #67108864
	add	r2, r2, #256
	mov	r1, #83886080
	str	r0, [r3, #212]
	str	r1, [r3, #216]
	str	r2, [r3, #220]
	bx	lr
	.size	loadPalette, .-loadPalette
	.align	2
	.global	fillScreen
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
	ldr	r2, .L52
	add	r3, sp, #8
	strh	r0, [r3, #-2]!	@ movhi
	mov	r1, #-2130706432
	ldr	r0, [r2, #0]
	add	r1, r1, #38400
	mov	r2, #67108864
	str	r3, [r2, #212]
	str	r0, [r2, #216]
	str	r1, [r2, #220]
	add	sp, sp, #8
	bx	lr
.L53:
	.align	2
.L52:
	.word	.LANCHOR0
	.size	fillScreen, .-fillScreen
	.align	2
	.global	fillScreen4
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
	ldr	r2, .L55
	add	r3, sp, #8
	orr	r0, r0, r0, asl #8
	strh	r0, [r3, #-2]!	@ movhi
	mov	r1, #-2130706432
	ldr	r0, [r2, #0]
	add	r1, r1, #19200
	mov	r2, #67108864
	str	r3, [r2, #212]
	str	r0, [r2, #216]
	str	r1, [r2, #220]
	add	sp, sp, #8
	bx	lr
.L56:
	.align	2
.L55:
	.word	.LANCHOR0
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	flipPage
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r2, [r3, #0]
	tst	r2, #16
	ldrne	r1, .L60
	ldreq	r1, .L60
	ldrne	r0, [r1, #4]
	ldreq	r0, [r1, #8]
	bicne	r2, r2, #16
	orreq	r2, r2, #16
	strneh	r2, [r3, #0]	@ movhi
	streqh	r2, [r3, #0]	@ movhi
	strne	r0, [r1, #0]
	streq	r0, [r1, #0]
	bx	lr
.L61:
	.align	2
.L60:
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.align	2
	.global	waitForVBlank
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L63:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L63
	mov	r2, #67108864
.L65:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L65
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.global	videoBuffer
	.global	frontBuffer
	.global	backBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	backBuffer, %object
	.size	backBuffer, 4
backBuffer:
	.word	100704256
	.type	frontBuffer, %object
	.size	frontBuffer, 4
frontBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 31) 4.5.0"
