;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;>>>>       Keygen For HashAB           >>>>
;>>>>          code:    obaby           >>>>
;>>>>          Blog:    http://www.h4ck.org.cn           >>>>
;>>>>       Email : root@obaby.org.cn   >>>>
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 
;.586
.686
.model flat, stdcall  
option casemap :none  
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

include     windows.inc
include     user32.inc
include     kernel32.inc
include	cinvoke.inc
include	msvcrt.inc
include     HashData.inc
include     HashAB.inc
include	masm32.inc 

includelib user32.lib
includelib kernel32.lib
includelib msvcrt.lib
includelib masm32.lib 
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
.const

;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
.data
assume                  fs:nothing 
assume			gs:nothing
MsgboxText              db ' -=Author: obaby',0dh
                        db ' -=Email:root@obaby.org.cn',0
MsgboxCaption           db 'HASHAB',0
MsgBoxText1             db 'test!',0
MsgBoxCaption1          db 'hash',0    
;;;;;;;;;;;;;;;;;;;;;;Global Prameters And Datas,order by address;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
dword_1BEDC		db ?
dword_1BECC		db ?

;off_1BFA0		dd offset off_1BFA0_data
off_1BFA0		dd offset off_1BFA0_long
;off_1BFA4		dd offset off_1BFA4_data
off_1BFA4		dd offset off_1BFA4_long
;oba_1BFAC		dd offset oba_1BFAC_data
oba_1BFAC		dd offset oba_1BFAC_long
oba_1BFAC_long		dd ?	;Not used
oba_1BFAC_data		db ? 	;Not used
;oba_1BFB0		dd offset oba_1BFB0_data
oba_1BFB0		dd offset oba_1BFB0_long
;off_1BFB4		dd offset off_1BFB4_data
off_1BFB4		dd offset off_1BFB4_long
;off_1BFB8		dd offset off_1BFB8_data
off_1BFB8		dd offset off_1BFB8_long
;off_1BFBC		dd offset off_1BFBC_data
off_1BFBC		dd offset off_1BFBC_long
;oba_1BFC0		dd offset oba_1BFC0_data
oba_1BFC0		dd offset oba_1BFC0_long
;oba_1BFC4		dd offset oba_1BFC4_data
oba_1BFC4		dd offset oba_1BFC4_long
;oba_1BFC8		dd offset oba_1BFC8_data
oba_1BFC8		dd offset oba_1BFC8_long
oba_1BFC8_data		db ?
;off_1BFCC		dd offset off_1BFCC_data
off_1BFCC		dd offset off_1BFCC_long
;oba_1BFD0		dd offset oba_1BFD0_data
oba_1BFD0		dd offset oba_1BFD0_long
;oba_1BFD4		dd offset oba_1BFD4_data
oba_1BFD4		dd offset oba_1BFD4_long		
;off_1BFD8		dd offset off_1BFD8_data
off_1BFD8		dd offset off_1BFD8_long
;oba_1BFDC		dd offset oba_1BFDC_data	
oba_1BFDC		dd offset oba_1BFDC_long
;oba_1BFE0		dd offset oba_1BFE0_data
oba_1BFE0		dd offset oba_1BFE0_long
;oba_1BFE4		dd offset oba_1BFE4_data
oba_1BFE4		dd offset oba_1BFE4_long
oba_1BFE4_data		db ?
;off_1BFE8		dd offset off_1BFE8_data
off_1BFE8		dd offset off_1BFE8_long
;oba_1BFF0		dd offset oba_1BFF0_data
oba_1BFF0		dd offset oba_1BFF0_long
oba_1BFF0_data 		dd 24CC532Bh
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
asc_407078      db "\xFF\xFF\xFF\xFF",0
s_CMntSamoMingw db "c:/mnt/obaby/mingw/msys/mthr_stub.c",0
s_0             db "0",0
s_GoodJob       db "Good Job!",0
s_Uhmm__Bad     db "输入有误！",0
szabout         db "提示",0
NameBuffer      db 512 dup(0)
SerialBuffer    db 512 dup(0)
sha1            db 'AAAAAAAAAAAAAAAAAAAA',0
uuid		db 'BBBBBBBBBBBBBBBBBBBB',0
rnd_bytes	db 'ABCDEFGHIJKLMNOPQRSTUVWBBBBBBBBBBBBBBBBBBBB',0 ;rnd_bytes uuid 拼到一块
dword_408140    dd 000402322h
target          db 00Dh,000h,000h,000h,036h,000h,000h,000h,018h,000h,000h,000h,011h,000h,000h,000h
		db 02Ah,000h,000h,000h,020h,000h,000h,000h,012h,000h,000h,000h,00Fh,000h,000h,000h
		db 008h,000h,000h,000h,02Bh,000h,000h,000h,034h,000h,000h,000h,016h,000h,000h,000h
		db 02Ch,000h,000h,000h,01Eh,000h,000h,000h,022h,000h,000h,000h,031h,000h,000h,000h
		db 00Eh,000h,000h,000h,014h,000h,000h,000h,028h,000h,000h,000h,007h,000h,000h,000h
	Temp1_len EQU $ - OFFSET Temp1
gsdata		dw ?
strStartTest	db 'Start Hashing:'
.data? 
hInstance	HINSTANCE	? 
hDlg            HINSTANCE       ? 

;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
.code

;void calcHashAB(unsigned char target[57],
;		const unsigned char sha1[20],
;		const unsigned char uuid[20],
;		const unsigned char rnd_bytes[23]);
start: 
    invoke GetModuleHandle, NULL 
    mov    hInstance,eax 
    invoke StdOut, addr strStartTest 
    lea ebx,offset rnd_bytes
    lea ecx,offset uuid
    lea edx,offset sha1
    lea eax,offset target
    mov [esp + 0Ch],ebx
    mov [esp + 8],ecx
    mov [esp + 4],edx
    mov [esp],eax
    call calcHashAB     ;test here
    ;test end
    invoke ExitProcess,eax 
    

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __cdecl calcHashAB(int, int, void	*src, int)
		public calcHashAB
calcHashAB	proc near

var_6EC		= byte ptr -6ECh
var_6EB		= byte ptr -6EBh
var_6EA		= byte ptr -6EAh
var_6E9		= byte ptr -6E9h
var_6C9		= byte ptr -6C9h
var_6C0		= dword	ptr -6C0h
var_6BC		= dword	ptr -6BCh
var_6B8		= byte ptr -6B8h
var_69A		= byte ptr -69Ah
var_699		= byte ptr -699h
var_698		= byte ptr -698h
var_688		= byte ptr -688h
var_678		= byte ptr -678h
var_668		= byte ptr -668h
var_658		= byte ptr -658h
var_648		= byte ptr -648h
var_638		= byte ptr -638h
var_628		= byte ptr -628h
var_618		= byte ptr -618h
var_608		= byte ptr -608h
var_5F8		= byte ptr -5F8h
var_5E8		= byte ptr -5E8h
var_5D8		= byte ptr -5D8h
var_5C8		= byte ptr -5C8h
var_5B8		= byte ptr -5B8h
var_5A4		= dword	ptr -5A4h
var_5A0		= dword	ptr -5A0h
var_59C		= dword	ptr -59Ch
var_598		= dword	ptr -598h
var_594		= dword	ptr -594h
var_590		= dword	ptr -590h
var_58C		= dword	ptr -58Ch
var_588		= dword	ptr -588h
var_584		= dword	ptr -584h
var_580		= dword	ptr -580h
var_57C		= dword	ptr -57Ch
var_578		= dword	ptr -578h
var_574		= dword	ptr -574h
var_570		= dword	ptr -570h
var_56C		= dword	ptr -56Ch
var_568		= dword	ptr -568h
var_564		= dword	ptr -564h
var_560		= dword	ptr -560h
var_55C		= dword	ptr -55Ch
var_558		= dword	ptr -558h
var_554		= dword	ptr -554h
var_550		= dword	ptr -550h
var_54C		= dword	ptr -54Ch
var_548		= dword	ptr -548h
var_544		= dword	ptr -544h
var_540		= dword	ptr -540h
var_53C		= dword	ptr -53Ch
var_538		= dword	ptr -538h
var_534		= dword	ptr -534h
var_530		= dword	ptr -530h
var_52C		= dword	ptr -52Ch
var_528		= dword	ptr -528h
var_524		= dword	ptr -524h
var_520		= dword	ptr -520h
var_51C		= dword	ptr -51Ch
var_518		= dword	ptr -518h
var_514		= dword	ptr -514h
var_510		= dword	ptr -510h
var_50C		= dword	ptr -50Ch
var_508		= dword	ptr -508h
var_504		= dword	ptr -504h
var_500		= dword	ptr -500h
var_4FC		= dword	ptr -4FCh
var_4F8		= dword	ptr -4F8h
var_4F4		= dword	ptr -4F4h
var_4F0		= dword	ptr -4F0h
var_4EC		= dword	ptr -4ECh
var_4E8		= dword	ptr -4E8h
var_4E4		= dword	ptr -4E4h
var_4E0		= dword	ptr -4E0h
var_4DC		= dword	ptr -4DCh
var_4D8		= dword	ptr -4D8h
var_4D4		= dword	ptr -4D4h
var_4D0		= dword	ptr -4D0h
var_4CC		= dword	ptr -4CCh
var_4C8		= dword	ptr -4C8h
var_4C4		= dword	ptr -4C4h
var_4C0		= dword	ptr -4C0h
var_4BC		= dword	ptr -4BCh
var_4B8		= dword	ptr -4B8h
var_4B4		= dword	ptr -4B4h
var_4B0		= dword	ptr -4B0h
var_4AC		= dword	ptr -4ACh
var_4A8		= dword	ptr -4A8h
var_4A4		= dword	ptr -4A4h
var_4A0		= dword	ptr -4A0h
var_49C		= dword	ptr -49Ch
var_498		= dword	ptr -498h
var_494		= byte ptr -494h
var_493		= byte ptr -493h
var_492		= byte ptr -492h
var_491		= byte ptr -491h
var_490		= dword	ptr -490h
var_48C		= dword	ptr -48Ch
var_488		= dword	ptr -488h
var_484		= dword	ptr -484h
var_480		= dword	ptr -480h
var_47C		= dword	ptr -47Ch
var_478		= dword	ptr -478h
var_474		= dword	ptr -474h
var_470		= dword	ptr -470h
var_46C		= dword	ptr -46Ch
var_468		= dword	ptr -468h
var_464		= dword	ptr -464h
var_460		= dword	ptr -460h
dest		= dword	ptr -45Ch
var_458		= dword	ptr -458h
var_454		= dword	ptr -454h
var_450		= dword	ptr -450h
var_44C		= dword	ptr -44Ch
var_448		= byte ptr -448h
var_438		= dword	ptr -438h
var_428		= dword	ptr -428h
var_418		= dword	ptr -418h
var_3FC		= dword	ptr -3FCh
var_3F8		= dword	ptr -3F8h
var_3E8		= dword	ptr -3E8h
var_3D8		= dword	ptr -3D8h
var_3BC		= dword	ptr -3BCh
var_3B8		= dword	ptr -3B8h
var_3A8		= dword	ptr -3A8h
var_394		= dword	ptr -394h
var_390		= dword	ptr -390h
var_38C		= dword	ptr -38Ch
var_388		= dword	ptr -388h
var_374		= dword	ptr -374h
var_370		= dword	ptr -370h
var_36C		= dword	ptr -36Ch
var_368		= dword	ptr -368h
var_364		= dword	ptr -364h
var_360		= dword	ptr -360h
var_35C		= dword	ptr -35Ch
var_358		= dword	ptr -358h
var_354		= dword	ptr -354h
var_350		= dword	ptr -350h
var_34C		= dword	ptr -34Ch
var_348		= dword	ptr -348h
var_344		= dword	ptr -344h
var_340		= dword	ptr -340h
var_33C		= dword	ptr -33Ch
var_338		= dword	ptr -338h
var_334		= dword	ptr -334h
var_330		= dword	ptr -330h
var_32C		= dword	ptr -32Ch
var_28A		= byte ptr -28Ah
var_1CC		= byte ptr -1CCh
var_1CB		= byte ptr -1CBh
var_1CA		= byte ptr -1CAh
var_1C9		= byte ptr -1C9h
var_1C8		= byte ptr -1C8h
var_1C7		= byte ptr -1C7h
var_1C6		= byte ptr -1C6h
var_1C5		= byte ptr -1C5h
var_1C4		= byte ptr -1C4h
var_1C3		= byte ptr -1C3h
var_1C2		= byte ptr -1C2h
var_1C1		= byte ptr -1C1h
var_1C0		= byte ptr -1C0h
var_1BF		= byte ptr -1BFh
var_1BE		= byte ptr -1BEh
var_1BD		= byte ptr -1BDh
var_1BC		= byte ptr -1BCh
var_12C		= byte ptr -12Ch
var_12B		= byte ptr -12Bh
var_12A		= byte ptr -12Ah
var_129		= byte ptr -129h
var_128		= byte ptr -128h
var_127		= byte ptr -127h
var_126		= byte ptr -126h
var_125		= byte ptr -125h
var_124		= byte ptr -124h
var_123		= byte ptr -123h
var_122		= byte ptr -122h
var_121		= byte ptr -121h
var_120		= byte ptr -120h
var_11F		= byte ptr -11Fh
var_11E		= byte ptr -11Eh
var_11D		= byte ptr -11Dh
var_11C		= byte ptr -11Ch
var_F0		= dword	ptr -0F0h
var_EC		= dword	ptr -0ECh
var_E8		= dword	ptr -0E8h
var_E4		= dword	ptr -0E4h
var_E0		= dword	ptr -0E0h
var_DC		= dword	ptr -0DCh
var_D8		= dword	ptr -0D8h
var_D4		= dword	ptr -0D4h
var_CC		= byte ptr -0CCh
var_7C		= byte ptr -7Ch
var_7B		= byte ptr -7Bh
var_7A		= byte ptr -7Ah
var_79		= byte ptr -79h
var_78		= byte ptr -78h
var_77		= byte ptr -77h
var_76		= byte ptr -76h
var_75		= byte ptr -75h
var_74		= byte ptr -74h
var_73		= byte ptr -73h
var_72		= byte ptr -72h
var_71		= byte ptr -71h
var_70		= byte ptr -70h
var_6F		= byte ptr -6Fh
var_6E		= byte ptr -6Eh
var_6D		= byte ptr -6Dh
var_6C		= byte ptr -6Ch
var_6B		= byte ptr -6Bh
var_6A		= byte ptr -6Ah
var_69		= byte ptr -69h
var_68		= byte ptr -68h
var_67		= byte ptr -67h
var_66		= byte ptr -66h
var_65		= byte ptr -65h
var_64		= byte ptr -64h
var_63		= byte ptr -63h
var_62		= byte ptr -62h
var_61		= byte ptr -61h
var_60		= byte ptr -60h
var_5F		= byte ptr -5Fh
var_5E		= byte ptr -5Eh
var_5D		= byte ptr -5Dh
var_5C		= byte ptr -5Ch
var_5B		= byte ptr -5Bh
var_5A		= byte ptr -5Ah
var_59		= byte ptr -59h
var_58		= byte ptr -58h
var_57		= byte ptr -57h
var_56		= byte ptr -56h
var_55		= byte ptr -55h
var_54		= byte ptr -54h
var_53		= byte ptr -53h
var_52		= byte ptr -52h
var_51		= byte ptr -51h
var_50		= byte ptr -50h
var_4F		= byte ptr -4Fh
var_4E		= byte ptr -4Eh
var_4D		= byte ptr -4Dh
var_3C		= byte ptr -3Ch
var_2C		= byte ptr -2Ch
var_2B		= byte ptr -2Bh
var_2A		= byte ptr -2Ah
var_29		= byte ptr -29h
var_28		= byte ptr -28h
var_27		= byte ptr -27h
var_26		= byte ptr -26h
var_25		= byte ptr -25h
var_24		= byte ptr -24h
var_23		= byte ptr -23h
var_22		= byte ptr -22h
var_21		= byte ptr -21h
var_20		= byte ptr -20h
var_1F		= byte ptr -1Fh
var_1E		= byte ptr -1Eh
var_1D		= byte ptr -1Dh
var_1C		= dword	ptr -1Ch
arg_0		= dword	ptr  8
arg_4		= dword	ptr  0Ch
src		= dword	ptr  10h
arg_C		= dword	ptr  14h

		push	ebp
		mov	ebp, esp
		push	edi
		push	esi
		push	ebx
		call	sub_917
		add	ebx, 1B579h
		sub	esp, 6FCh
		mov	eax, [ebp+arg_0]
		mov	ecx, [ebp+arg_C]
		lea	edi, [ebp+var_1CC]
		mov	edx, [ebp+arg_4]
		mov     esi, dword ptr [gsdata]	;mov	esi, large gs:14h
		mov	[ebp+var_1C], esi
		xor	esi, esi
		mov	[ebp+var_498], eax	;eax error
		mov	[ebp+var_370], ecx
		mov	ecx, 2Ch
		lea	eax, offset unk_19F00
		mov	esi, eax
		rep movsd
		lea	eax, offset unk_19E00
		mov	[ebp+var_388], edx
		mov	edi, eax
		mov	edx, [ebp+src]
		mov	cl, 0Ch
		add	edx, 8
		mov	esi, edx
		repe cmpsb
		setb	al
		setnbe	dl
		sub	dl, al
		movsx	eax, dl
		cmp	eax, 1
		sbb	ecx, ecx
		and	ecx, 0FFFFFFF4h
		add	ecx, 3Fh
		cmp	eax, 1
		sbb	edi, edi
		and	edi, 0Ch
		add	edi, 11h
		cmp	eax, 1
		sbb	edx, edx
		and	edx, 0FFFFFFF4h
		add	edx, 28h
		cmp	eax, 1
		lea	eax, [ebp+var_CC]
		sbb	esi, esi
		mov	[ebp+dest], eax
		mov	eax, [ebp+src]
		and	esi, 0FFFFFFF4h
		add	esi, 14h
		mov	[esp+8], esi	; n
		mov	[ebp+var_6C0], edx
		mov	[esp+4], eax	; src
		mov	eax, [ebp+dest]
		mov	[ebp+var_6BC], ecx
		mov	[esp], eax	; dest
		call	_memcpy
		mov	eax, [ebp+var_388]
		add	esi, [ebp+dest]
		mov	eax, [eax]
		mov	[esi], eax
		mov	eax, [ebp+var_388]
		mov	eax, [eax+4]
		mov	[esi+4], eax
		mov	eax, [ebp+var_388]
		mov	eax, [eax+8]
		mov	[esi+8], eax
		mov	eax, [ebp+var_388]
		mov	eax, [eax+0Ch]
		mov	[esi+0Ch], eax
		mov	eax, [ebp+var_388]
		mov	eax, [eax+10h]
		mov	[esi+10h], eax
		mov	edx, [ebp+var_6C0]
		add	edx, [ebp+dest]
		mov	[ebp+var_48C], edx
		mov	edx, [ebp+var_370]
		mov	esi, [ebp+var_48C]
		mov	eax, [edx]
		mov	[esi], eax
		mov	eax, [edx+4]
		mov	[esi+4], eax
		mov	eax, [edx+8]
		mov	[esi+8], eax
		mov	eax, [edx+0Ch]
		mov	[esi+0Ch], eax
		mov	eax, [edx+10h]
		mov	[esi+10h], eax
		movzx	eax, word ptr [edx+14h]
		mov	[esi+14h], ax
		movzx	eax, byte ptr [edx+16h]
		mov	[esi+16h], al
		mov	ecx, [ebp+var_6BC]
		add	ecx, [ebp+dest]
		mov	[esp+8], edi	; n
		mov	dword ptr [esp+4], 0A5h	; c
		mov	[esp], ecx	; s
		call	_memset
		movzx	eax, [ebp+var_1CC]
		mov	edx, eax
		mov	edi, eax
		shr	dl, 4
		and	edi, 0Fh
		movzx	edx, dl
		mov	[ebp+var_598], edx
		movzx	edx, [ebp+var_1CB]
		mov	[ebp+var_518], edi
		mov	eax, edx
		shr	al, 4
		movzx	eax, al
		mov	[ebp+var_594], eax
		mov	eax, edx
		movzx	edx, [ebp+var_1CA]
		and	eax, 0Fh
		mov	[ebp+var_514], eax
		mov	ecx, edx
		mov	eax, edx
		movzx	edx, [ebp+var_1C9]
		shr	al, 4
		and	ecx, 0Fh
		movzx	eax, al
		mov	[ebp+var_590], eax
		mov	esi, edx
		mov	eax, edx
		movzx	edx, [ebp+var_1C8]
		shr	al, 4
		and	esi, 0Fh
		movzx	eax, al
		mov	[ebp+var_58C], eax
		mov	edi, edx
		mov	eax, edx
		movzx	edx, [ebp+var_1C7]
		shr	al, 4
		and	edi, 0Fh
		movzx	eax, al
		mov	[ebp+var_588], eax
		mov	eax, edx
		shr	al, 4
		movzx	eax, al
		mov	[ebp+var_584], eax
		mov	eax, edx
		movzx	edx, [ebp+var_1C6]
		and	eax, 0Fh
		mov	[ebp+var_510], ecx
		mov	[ebp+var_504], eax
		mov	ecx, edx
		mov	eax, edx
		movzx	edx, [ebp+var_1C5]
		shr	al, 4
		and	ecx, 0Fh
		movzx	eax, al
		mov	[ebp+var_50C], esi
		mov	[ebp+var_580], eax
		mov	esi, edx
		mov	eax, edx
		movzx	edx, [ebp+var_1C4]
		shr	al, 4
		and	esi, 0Fh
		movzx	eax, al
		mov	[ebp+var_508], edi
		mov	[ebp+var_57C], eax
		mov	edi, edx
		mov	eax, edx
		movzx	edx, [ebp+var_1C3]
		shr	al, 4
		and	edi, 0Fh
		movzx	eax, al
		mov	[ebp+var_578], eax
		mov	eax, edx
		shr	al, 4
		movzx	eax, al
		mov	[ebp+var_574], eax
		mov	eax, edx
		movzx	edx, [ebp+var_1C2]
		and	eax, 0Fh
		mov	[ebp+var_500], ecx
		mov	[ebp+var_4F4], eax
		mov	ecx, edx
		mov	eax, edx
		movzx	edx, [ebp+var_1C1]
		shr	al, 4
		and	ecx, 0Fh
		movzx	eax, al
		mov	[ebp+var_570], eax
		mov	eax, edx
		shr	al, 4
		movzx	eax, al
		mov	[ebp+var_4FC], esi
		mov	esi, edx
		mov	[ebp+var_4F8], edi
		and	esi, 0Fh
		mov	[ebp+var_4F0], ecx
		mov	[ebp+var_56C], eax
		movzx	edx, [ebp+var_1C0]
		mov	[ebp+var_4EC], esi
		mov	eax, edx
		mov	edi, edx
		movzx	edx, [ebp+var_1BF]
		shr	al, 4
		and	edi, 0Fh
		movzx	eax, al
		mov	[ebp+var_568], eax
		mov	eax, edx
		shr	al, 4
		movzx	eax, al
		mov	[ebp+var_564], eax
		mov	eax, edx
		movzx	edx, [ebp+var_1BE]
		and	eax, 0Fh
		mov	[ebp+var_4E4], eax
		mov	[ebp+var_4E8], edi
		mov	eax, edx
		mov	ecx, edx
		movzx	edx, [ebp+var_1BD]
		shr	al, 4
		and	ecx, 0Fh
		movzx	eax, al
		mov	[ebp+var_560], eax
		mov	esi, edx
		mov	eax, edx
		movzx	edx, [ebp+var_12C]
		shr	al, 4
		and	esi, 0Fh
		movzx	eax, al
		mov	[ebp+var_55C], eax
		mov	edi, edx
		mov	eax, edx
		movzx	edx, [ebp+var_12B]
		shr	al, 4
		and	edi, 0Fh
		movzx	eax, al
		mov	[ebp+var_558], eax
		mov	eax, edx
		shr	al, 4
		movzx	eax, al
		mov	[ebp+var_554], eax
		mov	eax, edx
		movzx	edx, [ebp+var_12A]
		and	eax, 0Fh
		mov	[ebp+var_4E0], ecx
		mov	[ebp+var_4D4], eax
		mov	ecx, edx
		mov	eax, edx
		movzx	edx, [ebp+var_129]
		shr	al, 4
		and	ecx, 0Fh
		movzx	eax, al
		mov	[ebp+var_4DC], esi
		mov	[ebp+var_550], eax
		mov	esi, edx
		mov	eax, edx
		movzx	edx, [ebp+var_128]
		shr	al, 4
		and	esi, 0Fh
		movzx	eax, al
		mov	[ebp+var_4D8], edi
		mov	[ebp+var_54C], eax
		mov	edi, edx
		mov	eax, edx
		movzx	edx, [ebp+var_127]
		shr	al, 4
		and	edi, 0Fh
		movzx	eax, al
		mov	[ebp+var_548], eax
		mov	eax, edx
		shr	al, 4
		movzx	eax, al
		mov	[ebp+var_544], eax
		mov	eax, edx
		movzx	edx, [ebp+var_126]
		and	eax, 0Fh
		mov	[ebp+var_4C4], eax
		mov	[ebp+var_4D0], ecx
		mov	eax, edx
		mov	ecx, edx
		shr	al, 4
		and	ecx, 0Fh
		movzx	eax, al
		mov	[ebp+var_4CC], esi
		mov	[ebp+var_4C8], edi
		mov	[ebp+var_540], eax
		mov	[ebp+var_4C0], ecx
		movzx	edx, [ebp+var_125]
		mov	[ebp+var_3F8], 0
		mov	byte ptr [ebp+var_370],	0C9h
		mov	byte ptr [ebp+var_388],	0A1h
		mov	eax, edx
		mov	esi, edx
		movzx	edx, [ebp+var_124]
		shr	al, 4
		and	esi, 0Fh
		movzx	eax, al
		mov	[ebp+var_53C], eax
		mov	edi, edx
		mov	eax, edx
		movzx	edx, [ebp+var_123]
		shr	al, 4
		and	edi, 0Fh
		movzx	eax, al
		mov	[ebp+var_538], eax
		mov	eax, edx
		shr	al, 4
		movzx	eax, al
		mov	[ebp+var_534], eax
		mov	eax, edx
		movzx	edx, [ebp+var_122]
		and	eax, 0Fh
		mov	[ebp+var_4B4], eax
		mov	[ebp+var_4BC], esi
		mov	eax, edx
		mov	ecx, edx
		movzx	edx, [ebp+var_121]
		shr	al, 4
		and	ecx, 0Fh
		movzx	eax, al
		mov	[ebp+var_530], eax
		mov	esi, edx
		mov	eax, edx
		movzx	edx, [ebp+var_120]
		shr	al, 4
		and	esi, 0Fh
		movzx	eax, al
		mov	[ebp+var_4B8], edi
		mov	[ebp+var_52C], eax
		mov	edi, edx
		mov	eax, edx
		movzx	edx, [ebp+var_11F]
		shr	al, 4
		and	edi, 0Fh
		movzx	eax, al
		mov	[ebp+var_528], eax
		mov	[ebp+var_4B0], ecx
		mov	eax, edx
		shr	al, 4
		movzx	eax, al
		mov	[ebp+var_524], eax
		mov	eax, edx
		movzx	edx, [ebp+var_11E]
		and	eax, 0Fh
		mov	[ebp+var_4A4], eax
		mov	[ebp+var_4AC], esi
		mov	eax, edx
		mov	ecx, edx
		movzx	edx, [ebp+var_11D]
		shr	al, 4
		and	ecx, 0Fh
		movzx	eax, al
		mov	[ebp+var_520], eax
		mov	eax, edx
		mov	esi, edx
		shr	al, 4
		and	esi, 0Fh
		mov	[ebp+var_4A0], ecx
		movzx	eax, al
		lea	ecx, [ebp+var_2C]
		mov	[ebp+var_4A8], edi
		lea	edx, [ebp+var_12C]
		mov	edi, 5Eh
		mov	[ebp+var_51C], eax
		lea	eax, [ebp+var_1BC]
		mov	[ebp+var_49C], esi
		lea	esi, [ebp+var_368]
		mov	byte ptr [ebp+var_374],	5Ch
		mov	byte ptr [ebp+var_38C],	44h
		mov	byte ptr [ebp+var_390],	17h
		mov	byte ptr [ebp+var_3B8],	4Bh
		mov	[ebp+var_3A8], ecx
		lea	ecx, [ebp+var_11C]
		mov	[ebp+var_460], ecx
		mov	ecx, dword ptr [off_1BFA0]
		mov	[ebp+var_464], esi
		mov	esi, dword ptr [off_1BFE8]
		mov	[ebp+var_59C], eax
		mov	eax, dword ptr [off_1BFB4]
		mov	[ebp+var_468], edx
		mov	edx, dword ptr [off_1BFA4]
		mov	[ebp+var_5A4], ecx
		mov	ecx, edi
		mov	byte ptr [ebp+var_36C],	0FAh
		mov	byte ptr [ebp+var_394],	0CDh
		mov	byte ptr [ebp+var_3BC],	0F3h
		mov	byte ptr [ebp+var_3D8],	32h
		mov	byte ptr [ebp+var_3FC],	85h
		mov	byte ptr [ebp+var_418],	94h
		mov	byte ptr [ebp+var_428],	0
		mov	byte ptr [ebp+var_438],	5Ch
		mov	byte ptr [ebp+var_3E8],	0Eh
		mov	[ebp+var_458], 0
		mov	[ebp+var_5A0], esi
		mov	[ebp+var_448], cl
		nop

loc_10D0:				; CODE XREF: calcHashAB+2AEEj
		mov	esi, [ebp+dest]
		mov	edi, [ebp+var_3F8]
		movzx	ecx, byte ptr [esi+edi+1]
		mov	edi, dword ptr [off_1BFCC]	;offset
		movzx	ecx, byte ptr [edi+ecx]
		mov	edi, [ebp+var_3F8]
		mov	[ebp+var_6C9], cl
		movzx	ecx, byte ptr [esi+edi+2]
		mov	esi, dword ptr [off_1BFCC]	;offset 
		movzx	ecx, byte ptr [esi+ecx]
		mov	esi, [ebp+dest]
		mov	byte ptr [ebp+var_480],	cl
		movzx	ecx, byte ptr [esi+edi+3]
		mov	edi, dword ptr [off_1BFCC]	;offset 
		movzx	ecx, byte ptr [edi+ecx]
		mov	edi, [ebp+var_3F8]
		mov	byte ptr [ebp+var_47C],	cl
		movzx	ecx, byte ptr [esi+edi+4]
		mov	esi, dword ptr [off_1BFCC]	;offset 
		movzx	ecx, byte ptr [esi+ecx]
		mov	esi, [ebp+dest]
		mov	byte ptr [ebp+var_478],	cl
		movzx	ecx, byte ptr [esi+edi+5]
		mov	edi, dword ptr [off_1BFCC]	;offset
		movzx	ecx, byte ptr [edi+ecx]
		mov	edi, [ebp+var_3F8]
		mov	[ebp+var_494], cl
		movzx	ecx, byte ptr [esi+edi+6]
		mov	esi,dword ptr [off_1BFCC]	;offset 
		movzx	ecx, byte ptr [esi+ecx]
		mov	esi, [ebp+dest]
		mov	byte ptr [ebp+var_474],	cl
		movzx	ecx, byte ptr [esi+edi+7]
		mov	edi, dword ptr [off_1BFCC]	;offset
		movzx	ecx, byte ptr [edi+ecx]
		mov	byte ptr [ebp+var_470],	cl
		mov	edi, [ebp+var_3F8]
		movzx	ecx, byte ptr [esi+edi+8]
		mov	esi, dword ptr [off_1BFCC]	;offset
		movzx	ecx, byte ptr [esi+ecx]
		mov	esi, [ebp+dest]
		mov	byte ptr [ebp+var_46C],	cl
		movzx	ecx, byte ptr [esi+edi+9]
		mov	edi, dword ptr [off_1BFCC]	;offset
		movzx	ecx, byte ptr [edi+ecx]
		mov	edi, [ebp+var_3F8]
		mov	byte ptr [ebp+var_450],	cl
		movzx	ecx, byte ptr [esi+edi+0Ah]
		mov	esi, dword ptr [off_1BFCC]	;offset 
		movzx	ecx, byte ptr [esi+ecx]
		mov	esi, [ebp+dest]
		mov	byte ptr [ebp+var_44C],	cl
		movzx	ecx, byte ptr [esi+edi+0Bh]
		mov	edi, dword ptr [off_1BFCC]	;offset
		movzx	ecx, byte ptr [edi+ecx]
		mov	edi, [ebp+var_3F8]
		mov	byte ptr [ebp+var_454],	cl
		movzx	ecx, byte ptr [esi+edi+0Ch]
		mov	esi, dword ptr [off_1BFCC]	;offset 
		movzx	ecx, byte ptr [esi+ecx]
		mov	esi, [ebp+dest]
		mov	[ebp+var_493], cl
		movzx	ecx, byte ptr [esi+edi+0Dh]
		mov	edi, dword ptr [off_1BFCC]	;offset 
		movzx	ecx, byte ptr [edi+ecx]
		mov	edi, [ebp+var_3F8]
		mov	[ebp+var_492], cl
		movzx	ecx, byte ptr [esi+edi+0Eh]
		mov	esi, dword ptr [off_1BFCC]	;offset 
		movzx	ecx, byte ptr [esi+ecx]
		mov	[ebp+var_491], cl
		mov	esi, [ebp+dest]
		movzx	ecx, byte ptr [esi+edi+0Fh]
		mov	edi, dword ptr [off_1BFCC]	;offset
		movzx	ecx, byte ptr [edi+ecx]
		mov	edi, [ebp+var_3F8]
		mov	byte ptr [ebp+var_490],	cl
		movzx	ecx, byte ptr [esi+edi]
		mov	esi, dword ptr [off_1BFCC]	;offset 
		movzx	edi, byte ptr [esi+ecx]
		movzx	ecx, byte ptr [ebp+var_370]
		shr	cl, 4
		mov	esi, ecx
		mov	ecx, edi
		and	ecx, 0F0h
		and	esi, 0FFh
		add	esi, ecx
		movzx	ecx, byte ptr [ebp+var_370]
		mov	[ebp+var_484], esi
		and	ecx, 0Fh
		mov	esi, ecx
		mov	ecx, edi
		shl	ecx, 4
		add	ecx, esi
		mov	esi, [ebp+var_458]
		and	ecx, 0FFh
		mov	[ebp+var_370], ecx
		test	esi, esi
		jnz	loc_4AFF
		mov	esi, ecx
		mov	edi, [ebp+var_484]
		mov	ecx, dword ptr [off_1BFE8]	;offset 
		movzx	edi, byte ptr [ecx+edi]
		movzx	ecx, byte ptr [esi+ecx+100h]
		mov	[ebp+var_484], edi
		mov	esi, edi

loc_12F0:				; CODE XREF: calcHashAB+40B9j
		shl	esi, 4
		and	ecx, 0Fh
		movzx	edi, [ebp+var_6C9]
		add	ecx, esi
		mov	byte ptr [ebp+var_488],	cl
		movzx	ecx, byte ptr [ebp+var_388]
		mov	[ebp+var_370], edi
		and	edi, 0F0h
		shr	cl, 4
		mov	esi, ecx
		movzx	ecx, byte ptr [ebp+var_388]
		and	esi, 0FFh
		add	esi, edi
		and	ecx, 0Fh
		mov	edi, ecx
		mov	ecx, [ebp+var_370]
		shl	ecx, 4
		lea	ecx, [edi+ecx]
		mov	edi, [ebp+var_458]
		and	ecx, 0FFh
		test	edi, edi
		jz	loc_4AE8
		mov	edi, [ebp+var_5A4]
		movzx	esi, byte ptr [edi+esi]
		movzx	ecx, byte ptr [ecx+edi+100h]

loc_1363:				; CODE XREF: calcHashAB+408Aj
		shl	esi, 4
		and	ecx, 0Fh
		add	ecx, esi
		mov	byte ptr [ebp+var_484],	cl
		movzx	ecx, byte ptr [ebp+var_480]
		mov	[ebp+var_370], ecx
		movzx	ecx, byte ptr [ebp+var_374]
		mov	edi, [ebp+var_370]
		shr	cl, 4
		mov	esi, ecx
		movzx	ecx, byte ptr [ebp+var_374]
		and	edi, 0F0h
		and	esi, 0FFh
		add	esi, edi
		and	ecx, 0Fh
		mov	edi, ecx
		mov	ecx, [ebp+var_370]
		shl	ecx, 4
		lea	ecx, [edi+ecx]
		mov	edi, [ebp+var_458]
		and	ecx, 0FFh
		test	edi, edi
		jz	loc_4AD1
		mov	edi, dword ptr [off_1BFA0]	;offset 
		movzx	esi, byte ptr [edi+esi]
		movzx	ecx, byte ptr [ecx+edi+100h]

loc_13DC:				; CODE XREF: calcHashAB+4073j
		shl	esi, 4
		and	ecx, 0Fh
		add	ecx, esi
		movzx	esi, byte ptr [ebp+var_47C]
		mov	byte ptr [ebp+var_480],	cl
		movzx	ecx, byte ptr [ebp+var_38C]
		mov	[ebp+var_370], esi
		mov	edi, [ebp+var_370]
		shr	cl, 4
		mov	esi, ecx
		movzx	ecx, byte ptr [ebp+var_38C]
		and	esi, 0FFh
		and	edi, 0F0h
		add	esi, edi
		and	ecx, 0Fh
		mov	edi, ecx
		mov	ecx, [ebp+var_370]
		shl	ecx, 4
		lea	ecx, [edi+ecx]
		mov	edi, [ebp+var_458]
		and	ecx, 0FFh
		test	edi, edi
		jz	loc_4ABA
		mov	edi, dword ptr [off_1BFA0]	;offset 
		movzx	esi, byte ptr [edi+esi]
		movzx	ecx, byte ptr [ecx+edi+100h]

loc_1455:				; CODE XREF: calcHashAB+405Cj
		shl	esi, 4
		and	ecx, 0Fh
		add	ecx, esi
		movzx	esi, byte ptr [ebp+var_478]
		mov	byte ptr [ebp+var_47C],	cl
		movzx	ecx, byte ptr [ebp+var_390]
		mov	[ebp+var_370], esi
		mov	edi, [ebp+var_370]
		shr	cl, 4
		mov	esi, ecx
		movzx	ecx, byte ptr [ebp+var_390]
		and	esi, 0FFh
		and	edi, 0F0h
		add	esi, edi
		and	ecx, 0Fh
		mov	edi, ecx
		mov	ecx, [ebp+var_370]
		shl	ecx, 4
		lea	ecx, [edi+ecx]
		mov	edi, [ebp+var_458]
		and	ecx, 0FFh
		test	edi, edi
		jz	loc_4AA3
		mov	edi, dword ptr [off_1BFA0]	;offset 
		movzx	esi, byte ptr [edi+esi]
		movzx	ecx, byte ptr [ecx+edi+100h]

loc_14CE:				; CODE XREF: calcHashAB+4045j
		shl	esi, 4
		and	ecx, 0Fh
		add	ecx, esi
		movzx	esi, [ebp+var_494]
		mov	byte ptr [ebp+var_478],	cl
		movzx	ecx, byte ptr [ebp+var_3B8]
		mov	[ebp+var_370], esi
		mov	edi, [ebp+var_370]
		shr	cl, 4
		mov	esi, ecx
		movzx	ecx, byte ptr [ebp+var_3B8]
		and	esi, 0FFh
		and	edi, 0F0h
		add	esi, edi
		and	ecx, 0Fh
		mov	edi, ecx
		mov	ecx, [ebp+var_370]
		shl	ecx, 4
		lea	ecx, [edi+ecx]
		mov	edi, [ebp+var_458]
		and	ecx, 0FFh
		test	edi, edi
		jz	loc_4A8C
		mov	edi, dword ptr [off_1BFA0]	;offset 
		movzx	esi, byte ptr [edi+esi]
		movzx	ecx, byte ptr [ecx+edi+100h]

loc_1547:				; CODE XREF: calcHashAB+402Ej
		shl	esi, 4
		and	ecx, 0Fh
		add	ecx, esi
		movzx	esi, byte ptr [ebp+var_474]
		mov	byte ptr [ebp+var_374],	cl
		movzx	ecx, byte ptr [ebp+var_36C]
		mov	[ebp+var_370], esi
		mov	edi, [ebp+var_370]
		shr	cl, 4
		mov	esi, ecx
		movzx	ecx, byte ptr [ebp+var_36C]
		and	esi, 0FFh
		and	edi, 0F0h
		add	esi, edi
		and	ecx, 0Fh
		mov	edi, ecx
		mov	ecx, [ebp+var_370]
		shl	ecx, 4
		lea	ecx, [edi+ecx]
		mov	edi, [ebp+var_458]
		and	ecx, 0FFh
		test	edi, edi
		jz	loc_4A75
		mov	edi, dword ptr [off_1BFA0]	;offset 
		movzx	esi, byte ptr [edi+esi]
		movzx	ecx, byte ptr [ecx+edi+100h]

loc_15C0:				; CODE XREF: calcHashAB+4017j
		shl	esi, 4
		and	ecx, 0Fh
		add	ecx, esi
		movzx	esi, byte ptr [ebp+var_470]
		mov	byte ptr [ebp+var_474],	cl
		movzx	ecx, byte ptr [ebp+var_394]
		mov	[ebp+var_36C], esi
		mov	edi, [ebp+var_36C]
		shr	cl, 4
		mov	esi, ecx
		movzx	ecx, byte ptr [ebp+var_394]
		and	esi, 0FFh
		and	edi, 0F0h
		add	esi, edi
		and	ecx, 0Fh
		mov	edi, ecx
		mov	ecx, [ebp+var_36C]
		shl	ecx, 4
		lea	ecx, [edi+ecx]
		mov	edi, [ebp+var_458]
		and	ecx, 0FFh
		test	edi, edi
		jz	loc_4A5E
		mov	edi, dword ptr [off_1BFA0]	;offset 
		movzx	esi, byte ptr [edi+esi]
		movzx	ecx, byte ptr [ecx+edi+100h]

loc_1639:				; CODE XREF: calcHashAB+4000j
		shl	esi, 4
		and	ecx, 0Fh
		add	ecx, esi
		movzx	esi, byte ptr [ebp+var_46C]
		mov	byte ptr [ebp+var_470],	cl
		movzx	ecx, byte ptr [ebp+var_3BC]
		mov	[ebp+var_36C], esi
		mov	edi, [ebp+var_36C]
		shr	cl, 4
		mov	esi, ecx
		movzx	ecx, byte ptr [ebp+var_3BC]
		and	esi, 0FFh
		and	edi, 0F0h
		add	esi, edi
		and	ecx, 0Fh
		mov	edi, ecx
		mov	ecx, [ebp+var_36C]
		shl	ecx, 4
		lea	ecx, [edi+ecx]
		mov	edi, [ebp+var_458]
		and	ecx, 0FFh
		test	edi, edi
		jz	loc_4B81
		mov	edi, dword ptr [off_1BFA0]	;offset 
		movzx	esi, byte ptr [edi+esi]
		movzx	ecx, byte ptr [ecx+edi+100h]

loc_16B2:				; CODE XREF: calcHashAB+4123j
		shl	esi, 4
		and	ecx, 0Fh
		add	ecx, esi
		movzx	esi, byte ptr [ebp+var_450]
		mov	byte ptr [ebp+var_46C],	cl
		movzx	ecx, byte ptr [ebp+var_3D8]
		mov	[ebp+var_36C], esi
		mov	edi, [ebp+var_36C]
		shr	cl, 4
		mov	esi, ecx
		movzx	ecx, byte ptr [ebp+var_3D8]
		and	esi, 0FFh
		and	edi, 0F0h
		add	esi, edi
		and	ecx, 0Fh
		mov	edi, ecx
		mov	ecx, [ebp+var_36C]
		shl	ecx, 4
		lea	ecx, [edi+ecx]
		mov	edi, [ebp+var_458]
		and	ecx, 0FFh
		test	edi, edi
		jz	loc_4B6A
		mov	edi, dword ptr [off_1BFA0]	;offset
		movzx	esi, byte ptr [edi+esi]
		movzx	ecx, byte ptr [ecx+edi+100h]

loc_172B:				; CODE XREF: calcHashAB+410Cj
		shl	esi, 4
		and	ecx, 0Fh
		add	ecx, esi
		movzx	esi, byte ptr [ebp+var_44C]
		mov	byte ptr [ebp+var_450],	cl
		movzx	ecx, byte ptr [ebp+var_3FC]
		mov	[ebp+var_36C], esi
		mov	edi, [ebp+var_36C]
		shr	cl, 4
		mov	esi, ecx
		movzx	ecx, byte ptr [ebp+var_3FC]
		and	esi, 0FFh
		and	edi, 0F0h
		add	esi, edi
		and	ecx, 0Fh
		mov	edi, ecx
		mov	ecx, [ebp+var_36C]
		shl	ecx, 4
		lea	ecx, [edi+ecx]
		mov	edi, [ebp+var_458]
		and	ecx, 0FFh
		test	edi, edi
		jz	loc_4B53
		mov	edi, dword ptr [off_1BFA0]	;offset 
		movzx	esi, byte ptr [edi+esi]
		movzx	ecx, byte ptr [ecx+edi+100h]

loc_17A4:				; CODE XREF: calcHashAB+40F5j
		shl	esi, 4
		and	ecx, 0Fh
		add	ecx, esi
		movzx	esi, byte ptr [ebp+var_454]
		mov	byte ptr [ebp+var_44C],	cl
		movzx	ecx, byte ptr [ebp+var_418]
		mov	[ebp+var_370], esi
		mov	edi, [ebp+var_370]
		shr	cl, 4
		mov	esi, ecx
		movzx	ecx, byte ptr [ebp+var_418]
		and	esi, 0FFh
		and	edi, 0F0h
		lea	edi, [esi+edi]
		and	ecx, 0Fh
		mov	esi, ecx
		mov	ecx, [ebp+var_370]
		mov	[ebp+var_36C], edi
		shl	ecx, 4
		add	esi, ecx
		mov	ecx, [ebp+var_458]
		and	esi, 0FFh
		mov	[ebp+var_370], esi
		test	ecx, ecx
		jz	loc_4B2E
		mov	ecx, esi
		mov	esi, dword ptr [off_1BFA0]	;offset 
		movzx	esi, byte ptr [esi+edi]
		mov	edi, dword ptr [off_1BFA0]	;offset 
		mov	[ebp+var_36C], esi
		movzx	esi, byte ptr [ecx+edi+100h]

loc_1837:				; CODE XREF: calcHashAB+40DEj
		mov	ecx, [ebp+var_36C]
		and	esi, 0Fh
		shl	ecx, 4
		lea	ecx, [esi+ecx]
		movzx	esi, [ebp+var_493]
		mov	byte ptr [ebp+var_454],	cl
		movzx	ecx, byte ptr [ebp+var_428]
		mov	[ebp+var_36C], esi
		mov	edi, [ebp+var_36C]
		shr	cl, 4
		mov	esi, ecx
		movzx	ecx, byte ptr [ebp+var_428]
		and	esi, 0FFh
		and	edi, 0F0h
		lea	edi, [esi+edi]
		and	ecx, 0Fh
		mov	[ebp+var_370], edi
		mov	edi, ecx
		mov	ecx, [ebp+var_36C]
		shl	ecx, 4
		lea	ecx, [edi+ecx]
		mov	edi, [ebp+var_458]
		and	ecx, 0FFh
		mov	[ebp+var_36C], ecx
		test	edi, edi
		jz	loc_4BAF
		mov	edi, dword ptr [off_1BFA0]	;offset 
		mov	esi, [ebp+var_370]
		movzx	esi, byte ptr [edi+esi]
		mov	[ebp+var_370], esi
		movzx	esi, byte ptr [ecx+edi+100h]
		mov	ecx, [ebp+var_370]

loc_18D6:				; CODE XREF: calcHashAB+415Fj
		and	esi, 0Fh
		shl	ecx, 4
		lea	ecx, [esi+ecx]
		movzx	esi, [ebp+var_492]
		mov	byte ptr [ebp+var_3B8],	cl
		movzx	ecx, byte ptr [ebp+var_438]
		mov	[ebp+var_36C], esi
		mov	edi, [ebp+var_36C]
		shr	cl, 4
		mov	esi, ecx
		movzx	ecx, byte ptr [ebp+var_438]
		and	esi, 0FFh
		and	edi, 0F0h
		lea	edi, [esi+edi]
		and	ecx, 0Fh
		mov	esi, ecx
		mov	ecx, [ebp+var_36C]
		shl	ecx, 4
		lea	ecx, [esi+ecx]
		mov	esi, [ebp+var_458]
		and	ecx, 0FFh
		test	esi, esi
		jz	loc_4B98
		mov	esi, dword ptr [off_1BFA0]	;offset
		movzx	edi, byte ptr [esi+edi]
		movzx	esi, byte ptr [ecx+esi+100h]

loc_1951:				; CODE XREF: calcHashAB+413Aj
		mov	ecx, edi
		and	esi, 0Fh
		shl	ecx, 4
		lea	ecx, [esi+ecx]
		movzx	esi, [ebp+var_491]
		mov	byte ptr [ebp+var_390],	cl
		movzx	ecx, byte ptr [ebp+var_3E8]
		mov	[ebp+var_36C], esi
		mov	edi, [ebp+var_36C]
		shr	cl, 4
		mov	esi, ecx
		movzx	ecx, byte ptr [ebp+var_3E8]
		and	esi, 0FFh
		and	edi, 0F0h
		lea	edi, [esi+edi]
		and	ecx, 0Fh
		mov	esi, ecx
		mov	ecx, [ebp+var_36C]
		shl	ecx, 4
		lea	ecx, [esi+ecx]
		mov	esi, [ebp+var_458]
		and	ecx, 0FFh
		test	esi, esi
		jz	loc_4BD4
		mov	esi, dword ptr [off_1BFA0]	;offset 
		movzx	edi, byte ptr [esi+edi]
		movzx	esi, byte ptr [ecx+esi+100h]

loc_19CE:				; CODE XREF: calcHashAB+4176j
		mov	ecx, edi
		and	esi, 0Fh
		shl	ecx, 4
		lea	ecx, [esi+ecx]
		movzx	esi, byte ptr [ebp+var_490]
		mov	byte ptr [ebp+var_38C],	cl
		movzx	ecx, [ebp+var_448]
		mov	[ebp+var_36C], esi
		mov	edi, [ebp+var_36C]
		shr	cl, 4
		mov	esi, ecx
		movzx	ecx, [ebp+var_448]
		and	esi, 0FFh
		and	edi, 0F0h
		lea	edi, [esi+edi]
		and	ecx, 0Fh
		mov	[ebp+var_370], edi
		mov	edi, ecx
		mov	ecx, [ebp+var_36C]
		shl	ecx, 4
		lea	ecx, [edi+ecx]
		mov	edi, [ebp+var_458]
		and	ecx, 0FFh
		mov	[ebp+var_36C], ecx
		test	edi, edi
		jz	loc_4A39
		mov	edi, dword ptr [off_1BFA0]	;offset 
		mov	esi, [ebp+var_370]
		movzx	esi, byte ptr [edi+esi]
		mov	[ebp+var_370], esi
		movzx	esi, byte ptr [ecx+edi+100h]
		mov	ecx, [ebp+var_370]

loc_1A69:				; CODE XREF: calcHashAB+3FE9j
		and	esi, 0Fh
		movzx	edi, byte ptr [ebp+var_488]
		shl	ecx, 4
		lea	ecx, [esi+ecx]
		mov	esi, dword ptr [off_1BFBC]	;offset
		mov	byte ptr [ebp+var_370],	cl
		movzx	ecx, byte ptr [ebp+var_488]
		mov	[ebp+var_2C], cl
		movzx	ecx, byte ptr [ebp+var_484]
		mov	[ebp+var_2B], cl
		movzx	ecx, byte ptr [ebp+var_480]
		mov	[ebp+var_2A], cl
		movzx	ecx, byte ptr [ebp+var_47C]
		mov	[ebp+var_29], cl
		movzx	ecx, byte ptr [ebp+var_478]
		mov	[ebp+var_28], cl
		movzx	ecx, byte ptr [ebp+var_374]
		mov	[ebp+var_27], cl
		movzx	ecx, byte ptr [ebp+var_474]
		mov	[ebp+var_26], cl
		movzx	ecx, byte ptr [ebp+var_470]
		mov	[ebp+var_25], cl
		movzx	ecx, byte ptr [ebp+var_46C]
		mov	[ebp+var_24], cl
		movzx	ecx, byte ptr [ebp+var_450]
		mov	[ebp+var_23], cl
		movzx	ecx, byte ptr [ebp+var_44C]
		mov	[ebp+var_22], cl
		movzx	ecx, byte ptr [ebp+var_454]
		mov	[ebp+var_21], cl
		movzx	ecx, byte ptr [ebp+var_3B8]
		mov	[ebp+var_20], cl
		movzx	ecx, byte ptr [ebp+var_390]
		mov	[ebp+var_1F], cl
		movzx	ecx, byte ptr [ebp+var_38C]
		mov	[ebp+var_1E], cl
		movzx	ecx, byte ptr [ebp+var_370]
		mov	[ebp+var_1D], cl
		mov	ecx, edi
		and	edi, 0F0h
		shl	ecx, 4
		add	ecx, [ebp+var_518]
		and	ecx, 0FFh
		movzx	ecx, byte ptr [esi+ecx+100h]
		mov	esi, [ebp+var_598]
		add	esi, dword ptr [off_1BFBC]	;offset 
		and	ecx, 0Fh
		movzx	esi, byte ptr [esi+edi]
		shl	esi, 4
		add	ecx, esi
		mov	byte ptr [ebp+var_388],	cl
		movzx	edi, byte ptr [ebp+var_484]
		mov	esi, dword ptr [off_1BFBC]	;offset 
		mov	ecx, edi
		and	edi, 0F0h
		shl	ecx, 4
		add	ecx, [ebp+var_514]
		and	ecx, 0FFh
		movzx	ecx, byte ptr [esi+ecx+100h]
		mov	esi, [ebp+var_594]
		add	esi, dword ptr [off_1BFBC]	;offset
		and	ecx, 0Fh
		movzx	esi, byte ptr [esi+edi]
		movzx	edi, byte ptr [ebp+var_480]
		shl	esi, 4
		add	ecx, esi
		mov	esi, dword ptr [off_1BFBC]	;offset 
		mov	byte ptr [ebp+var_36C],	cl
		mov	ecx, edi
		and	edi, 0F0h
		shl	ecx, 4
		add	ecx, [ebp+var_510]
		and	ecx, 0FFh
		movzx	ecx, byte ptr [esi+ecx+100h]
		mov	esi, [ebp+var_590]
		add	esi, dword ptr [off_1BFBC]	;offset
		and	ecx, 0Fh
		movzx	esi, byte ptr [esi+edi]
		movzx	edi, byte ptr [ebp+var_47C]
		shl	esi, 4
		add	ecx, esi
		mov	esi, dword ptr [off_1BFBC]	;offset
		mov	byte ptr [ebp+var_394],	cl
		mov	ecx, edi
		and	edi, 0F0h
		shl	ecx, 4
		add	ecx, [ebp+var_50C]
		and	ecx, 0FFh
		movzx	ecx, byte ptr [esi+ecx+100h]
		mov	esi, [ebp+var_58C]
		add	esi, dword ptr [off_1BFBC]	;offset 
		and	ecx, 0Fh
		movzx	esi, byte ptr [esi+edi]
		movzx	edi, byte ptr [ebp+var_478]
		shl	esi, 4
		add	ecx, esi
		mov	esi, dword ptr [off_1BFBC]	;offset 
		mov	byte ptr [ebp+var_3BC],	cl
		mov	ecx, edi
		and	edi, 0F0h
		shl	ecx, 4
		add	ecx, [ebp+var_508]
		and	ecx, 0FFh
		movzx	ecx, byte ptr [esi+ecx+100h]
		mov	esi, [ebp+var_588]
		add	esi, dword ptr [off_1BFBC]	;offset
		and	ecx, 0Fh
		movzx	esi, byte ptr [esi+edi]
		movzx	edi, byte ptr [ebp+var_374]
		shl	esi, 4
		add	ecx, esi
		mov	esi, dword ptr [off_1BFBC]	;offset 
		mov	byte ptr [ebp+var_3D8],	cl
		mov	ecx, edi
		and	edi, 0F0h
		shl	ecx, 4
		add	ecx, [ebp+var_504]
		and	ecx, 0FFh
		movzx	ecx, byte ptr [esi+ecx+100h]
		mov	esi, [ebp+var_584]
		add	esi, dword ptr [off_1BFBC]	;offset 
		and	ecx, 0Fh
		movzx	esi, byte ptr [esi+edi]
		shl	esi, 4
		add	ecx, esi
		mov	byte ptr [ebp+var_374],	cl
		movzx	edi, byte ptr [ebp+var_474]
		mov	esi, dword ptr [off_1BFBC]	;offset 
		mov	ecx, edi
		and	edi, 0F0h
		shl	ecx, 4
		add	ecx, [ebp+var_500]
		and	ecx, 0FFh
		movzx	ecx, byte ptr [esi+ecx+100h]
		mov	esi, [ebp+var_580]
		add	esi, dword ptr [off_1BFBC]	;offset 
		and	ecx, 0Fh
		movzx	esi, byte ptr [esi+edi]
		movzx	edi, byte ptr [ebp+var_470]
		shl	esi, 4
		add	ecx, esi
		mov	esi, dword ptr [off_1BFBC]	;offset
		mov	byte ptr [ebp+var_3FC],	cl
		mov	ecx, edi
		and	edi, 0F0h
		shl	ecx, 4
		add	ecx, [ebp+var_4FC]
		and	ecx, 0FFh
		movzx	ecx, byte ptr [esi+ecx+100h]
		mov	esi, [ebp+var_57C]
		add	esi, dword ptr [off_1BFBC]	;offset 
		and	ecx, 0Fh
		movzx	esi, byte ptr [esi+edi]
		movzx	edi, byte ptr [ebp+var_46C]
		shl	esi, 4
		add	ecx, esi
		mov	esi, dword ptr [off_1BFBC]	;offset
		mov	byte ptr [ebp+var_418],	cl
		mov	ecx, edi
		shl	ecx, 4
		and	edi, 0F0h
		add	ecx, [ebp+var_4F8]
		and	ecx, 0FFh
		movzx	ecx, byte ptr [esi+ecx+100h]
		mov	esi, [ebp+var_578]
		add	esi, dword ptr [off_1BFBC]	;offset 
		and	ecx, 0Fh
		movzx	esi, byte ptr [esi+edi]
		movzx	edi, byte ptr [ebp+var_450]
		shl	esi, 4
		add	ecx, esi
		mov	esi, dword ptr [off_1BFBC]	;offset 
		mov	byte ptr [ebp+var_428],	cl
		mov	ecx, edi
		and	edi, 0F0h
		shl	ecx, 4
		add	ecx, [ebp+var_4F4]
		and	ecx, 0FFh
		movzx	ecx, byte ptr [esi+ecx+100h]
		mov	esi, [ebp+var_574]
		add	esi, dword ptr [off_1BFBC]	;offset 
		and	ecx, 0Fh
		movzx	esi, byte ptr [esi+edi]
		movzx	edi, byte ptr [ebp+var_44C]
		shl	esi, 4
		add	ecx, esi
		mov	esi, dword ptr [off_1BFBC]	;offset 
		mov	byte ptr [ebp+var_438],	cl
		mov	ecx, edi
		and	edi, 0F0h
		shl	ecx, 4
		add	ecx, [ebp+var_4F0]
		and	ecx, 0FFh
		movzx	ecx, byte ptr [esi+ecx+100h]
		mov	esi, [ebp+var_570]
		add	esi, dword ptr [off_1BFBC]	;offset 
		and	ecx, 0Fh
		movzx	esi, byte ptr [esi+edi]
		shl	esi, 4
		add	ecx, esi
		mov	byte ptr [ebp+var_3E8],	cl
		movzx	edi, byte ptr [ebp+var_454]
		mov	esi, dword ptr [off_1BFBC]	;offset 
		mov	ecx, edi
		and	edi, 0F0h
		shl	ecx, 4
		add	ecx, [ebp+var_4EC]
		and	ecx, 0FFh
		movzx	ecx, byte ptr [esi+ecx+100h]
		mov	esi, [ebp+var_56C]
		add	esi, dword ptr [off_1BFBC]	;offset	--add
		and	ecx, 0Fh
		movzx	esi, byte ptr [esi+edi]
		movzx	edi, byte ptr [ebp+var_3B8]
		shl	esi, 4
		add	ecx, esi
		mov	esi, dword ptr [off_1BFBC]	;offset 
		mov	[ebp+var_448], cl
		mov	ecx, edi
		shl	ecx, 4
		add	ecx, [ebp+var_4E8]
		and	edi, 0F0h
		and	ecx, 0FFh
		movzx	ecx, byte ptr [esi+ecx+100h]
		mov	esi, [ebp+var_568]
		add	esi, dword ptr [off_1BFBC]	;offset --add
		and	ecx, 0Fh
		movzx	esi, byte ptr [esi+edi]
		mov	edi, dword ptr [off_1BFBC]	;offset
		shl	esi, 4
		add	ecx, esi
		mov	byte ptr [ebp+var_454],	cl
		movzx	ecx, byte ptr [ebp+var_390]
		mov	esi, ecx
		shl	esi, 4
		add	esi, [ebp+var_4E4]
		and	esi, 0FFh
		movzx	esi, byte ptr [edi+esi+100h]
		mov	edi, ecx
		mov	ecx, [ebp+var_564]
		and	edi, 0F0h
		add	ecx, dword ptr [off_1BFBC]	;offset --add 
		and	esi, 0Fh
		movzx	ecx, byte ptr [ecx+edi]
		shl	ecx, 4
		lea	edi, [esi+ecx]
		mov	[ebp+var_390], ecx
		mov	ecx, edi
		mov	edi, dword ptr [off_1BFBC]	;offset 
		mov	byte ptr [ebp+var_44C],	cl
		movzx	ecx, byte ptr [ebp+var_38C]
		mov	esi, ecx
		shl	esi, 4
		add	esi, [ebp+var_4E0]
		and	esi, 0FFh
		movzx	esi, byte ptr [edi+esi+100h]
		mov	edi, ecx
		mov	ecx, [ebp+var_560]
		and	edi, 0F0h
		add	ecx, dword ptr [off_1BFBC]	;offset 
		and	esi, 0Fh
		movzx	ecx, byte ptr [ecx+edi]
		shl	ecx, 4
		lea	edi, [esi+ecx]
		mov	[ebp+var_38C], ecx
		mov	ecx, edi
		mov	byte ptr [ebp+var_450],	cl
		movzx	edi, byte ptr [ebp+var_370]
		mov	ecx, edi
		and	edi, 0F0h
		shl	ecx, 4
		add	ecx, [ebp+var_4DC]
		movzx	esi, cl
		mov	ecx, dword ptr [off_1BFBC]	;offset 
		movzx	esi, byte ptr [ecx+esi+100h]
		mov	ecx, [ebp+var_55C]
		add	ecx, dword ptr [off_1BFBC]	;offset
		and	esi, 0Fh
		movzx	ecx, byte ptr [ecx+edi]
		shl	ecx, 4
		lea	edi, [esi+ecx]
		mov	esi, [ebp+var_59C]
		mov	ecx, edi
		mov	[ebp+var_3B8], esi
		lea	esi, [esi+0]

loc_1FD8:				; CODE XREF: calcHashAB+2330j
		movzx	ecx, cl
		movzx	esi, byte ptr [ebp+var_388]
		lea	ecx, ds:0C00h[ecx*4]
		mov	[ebp+var_388], ecx
		mov	[ebp+var_35C], ecx
		movzx	ecx, byte ptr [ebp+var_3D8]
		shl	esi, 2
		mov	[ebp+var_390], esi
		mov	[ebp+var_368], esi
		movzx	esi, byte ptr [ebp+var_374]
		shl	ecx, 2
		mov	[ebp+var_358], ecx
		movzx	ecx, byte ptr [ebp+var_438]
		lea	esi, ds:400h[esi*4]
		mov	[ebp+var_38C], esi
		lea	ecx, ds:400h[ecx*4]
		mov	[ebp+var_354], ecx
		movzx	ecx, byte ptr [ebp+var_450]
		mov	[ebp+var_364], esi
		movzx	esi, byte ptr [ebp+var_3E8]
		lea	ecx, ds:800h[ecx*4]
		mov	[ebp+var_350], ecx
		movzx	ecx, byte ptr [ebp+var_3BC]
		lea	esi, ds:800h[esi*4]
		mov	[ebp+var_374], esi
		mov	[ebp+var_360], esi
		lea	ecx, ds:0C00h[ecx*4]
		mov	[ebp+var_34C], ecx
		movzx	ecx, byte ptr [ebp+var_428]
		shl	ecx, 2
		mov	[ebp+var_348], ecx
		movzx	ecx, byte ptr [ebp+var_44C]
		lea	ecx, ds:400h[ecx*4]
		mov	[ebp+var_344], ecx
		movzx	ecx, byte ptr [ebp+var_394]
		lea	ecx, ds:800h[ecx*4]
		mov	[ebp+var_340], ecx
		movzx	ecx, byte ptr [ebp+var_418]
		lea	ecx, ds:0C00h[ecx*4]
		mov	[ebp+var_33C], ecx
		movzx	ecx, byte ptr [ebp+var_454]
		shl	ecx, 2
		mov	[ebp+var_338], ecx
		movzx	ecx, byte ptr [ebp+var_36C]
		lea	ecx, ds:400h[ecx*4]
		mov	[ebp+var_334], ecx
		movzx	ecx, byte ptr [ebp+var_3FC]
		lea	ecx, ds:800h[ecx*4]
		mov	[ebp+var_330], ecx
		movzx	ecx, [ebp+var_448]
		lea	ecx, ds:0C00h[ecx*4]
		mov	[ebp+var_32C], ecx
		mov	[ebp+var_370], 0

loc_2126:				; CODE XREF: calcHashAB+1BA2j
		mov	edi, [ebp+var_390]
		mov	ecx, [ebp+var_38C]
		movzx	esi, byte ptr [edx+esi]
		movzx	edi, byte ptr [edx+edi]
		movzx	ecx, byte ptr [edx+ecx]
		mov	[ebp+var_36C], esi
		mov	[ebp+var_3BC], edi
		mov	edi, [ebp+var_388]
		mov	[ebp+var_394], ecx
		movzx	esi, byte ptr [edx+edi]
		mov	edi, ecx
		mov	ecx, [ebp+var_3BC]
		shr	edi, 4
		lea	edi, [eax+edi]
		and	ecx, 0F0h
		movzx	edi, byte ptr [edi+ecx]
		mov	ecx, [ebp+var_36C]
		shl	edi, 4
		and	edi, 0FFh
		and	ecx, 0F0h
		mov	[ebp+var_3D8], edi
		mov	edi, esi
		and	esi, 0Fh
		shr	edi, 4
		lea	ecx, [eax+ecx]
		movzx	ecx, byte ptr [edi+ecx+200h]
		lea	esi, [eax+esi]
		mov	edi, [ebp+var_3D8]
		and	ecx, 0Fh
		lea	edi, [eax+edi]
		movzx	edi, byte ptr [ecx+edi+400h]
		mov	ecx, [ebp+var_394]
		shl	edi, 4
		mov	[ebp+var_3FC], edi
		mov	edi, [ebp+var_36C]
		and	ecx, 0Fh
		shl	edi, 4
		and	edi, 0FFh
		movzx	esi, byte ptr [edi+esi+300h]
		mov	edi, [ebp+var_3BC]
		and	esi, 0Fh
		shl	edi, 4
		and	edi, 0FFh
		mov	[ebp+var_394], edi
		lea	edi, [eax+ecx]
		mov	ecx, [ebp+var_394]
		lea	esi, [eax+esi]
		movzx	edi, byte ptr [ecx+edi+100h]
		movzx	ecx, byte ptr [ebp+var_3FC]
		shl	edi, 4
		and	edi, 0FFh
		movzx	esi, byte ptr [edi+esi+500h]
		mov	edi, [ebp+var_3A8]
		and	esi, 0Fh
		lea	ecx, [esi+ecx]
		mov	esi, [ebp+var_370]
		mov	[ebp+var_6E9], cl
		mov	[edi+esi], cl
		mov	ecx, [ebp+var_390]
		movzx	ecx, byte ptr [ecx+edx+1]
		mov	[ebp+var_3BC], ecx
		mov	esi, [ebp+var_38C]
		mov	edi, [ebp+var_374]
		mov	ecx, [ebp+var_388]
		movzx	esi, byte ptr [esi+edx+1]
		movzx	edi, byte ptr [edi+edx+1]
		mov	[ebp+var_394], esi
		movzx	esi, byte ptr [ecx+edx+1]
		mov	ecx, [ebp+var_3BC]
		mov	[ebp+var_36C], edi
		mov	edi, [ebp+var_394]
		and	ecx, 0F0h
		shr	edi, 4
		lea	ecx, [eax+ecx]
		movzx	edi, byte ptr [edi+ecx+600h]
		mov	ecx, [ebp+var_36C]
		shl	edi, 4
		and	edi, 0FFh
		and	ecx, 0F0h
		mov	[ebp+var_3D8], edi
		mov	edi, esi
		and	esi, 0Fh
		shr	edi, 4
		lea	ecx, [eax+ecx]
		movzx	ecx, byte ptr [edi+ecx+800h]
		lea	esi, [eax+esi]
		mov	edi, [ebp+var_3D8]
		and	ecx, 0Fh
		lea	edi, [eax+edi]
		movzx	edi, byte ptr [ecx+edi+0A00h]
		mov	ecx, [ebp+var_394]
		shl	edi, 4
		mov	[ebp+var_3FC], edi
		mov	edi, [ebp+var_36C]
		and	ecx, 0Fh
		shl	edi, 4
		and	edi, 0FFh
		movzx	esi, byte ptr [edi+esi+900h]
		mov	edi, [ebp+var_3BC]
		and	esi, 0Fh
		shl	edi, 4
		and	edi, 0FFh
		mov	[ebp+var_394], edi
		lea	edi, [eax+ecx]
		mov	ecx, [ebp+var_394]
		lea	esi, [eax+esi]
		movzx	edi, byte ptr [ecx+edi+700h]
		movzx	ecx, byte ptr [ebp+var_3FC]
		shl	edi, 4
		and	edi, 0FFh
		movzx	esi, byte ptr [edi+esi+0B00h]
		mov	edi, [ebp+var_3A8]
		and	esi, 0Fh
		lea	ecx, [esi+ecx]
		mov	esi, [ebp+var_370]
		mov	[ebp+var_6EA], cl
		mov	[edi+esi+1], cl
		mov	ecx, [ebp+var_390]
		mov	esi, [ebp+var_38C]
		movzx	ecx, byte ptr [ecx+edx+2]
		movzx	esi, byte ptr [esi+edx+2]
		mov	[ebp+var_3BC], ecx
		mov	[ebp+var_394], esi
		mov	edi, [ebp+var_374]
		mov	ecx, [ebp+var_388]
		movzx	edi, byte ptr [edi+edx+2]
		movzx	esi, byte ptr [ecx+edx+2]
		mov	ecx, [ebp+var_3BC]
		mov	[ebp+var_36C], edi
		mov	edi, [ebp+var_394]
		and	ecx, 0F0h
		lea	ecx, [eax+ecx]
		shr	edi, 4
		movzx	edi, byte ptr [edi+ecx+0C00h]
		mov	ecx, [ebp+var_36C]
		shl	edi, 4
		and	edi, 0FFh
		and	ecx, 0F0h
		mov	[ebp+var_3D8], edi
		mov	edi, esi
		and	esi, 0Fh
		shr	edi, 4
		lea	ecx, [eax+ecx]
		movzx	ecx, byte ptr [edi+ecx+0E00h]
		lea	esi, [eax+esi]
		mov	edi, [ebp+var_3D8]
		and	ecx, 0Fh
		lea	edi, [eax+edi]
		movzx	edi, byte ptr [ecx+edi+1000h]
		mov	ecx, [ebp+var_394]
		shl	edi, 4
		mov	[ebp+var_3FC], edi
		mov	edi, [ebp+var_36C]
		and	ecx, 0Fh
		shl	edi, 4
		and	edi, 0FFh
		movzx	esi, byte ptr [edi+esi+0F00h]
		mov	edi, [ebp+var_3BC]
		and	esi, 0Fh
		shl	edi, 4
		and	edi, 0FFh
		mov	[ebp+var_394], edi
		lea	edi, [eax+ecx]
		mov	ecx, [ebp+var_394]
		lea	esi, [eax+esi]
		movzx	edi, byte ptr [ecx+edi+0D00h]
		movzx	ecx, byte ptr [ebp+var_3FC]
		shl	edi, 4
		and	edi, 0FFh
		movzx	esi, byte ptr [edi+esi+1100h]
		mov	edi, [ebp+var_3A8]
		and	esi, 0Fh
		lea	ecx, [esi+ecx]
		mov	esi, [ebp+var_370]
		mov	[ebp+var_6EB], cl
		mov	[edi+esi+2], cl
		mov	ecx, [ebp+var_390]
		mov	esi, [ebp+var_38C]
		mov	edi, [ebp+var_374]
		movzx	ecx, byte ptr [ecx+edx+3]
		movzx	esi, byte ptr [esi+edx+3]
		movzx	edi, byte ptr [edi+edx+3]
		mov	[ebp+var_390], ecx
		mov	[ebp+var_38C], esi
		mov	[ebp+var_374], edi
		mov	ecx, [ebp+var_388]
		mov	edi, [ebp+var_38C]
		movzx	esi, byte ptr [ecx+edx+3]
		mov	ecx, [ebp+var_390]
		shr	edi, 4
		and	ecx, 0F0h
		lea	ecx, [eax+ecx]
		movzx	edi, byte ptr [edi+ecx+1200h]
		mov	ecx, [ebp+var_374]
		shl	edi, 4
		and	edi, 0FFh
		and	ecx, 0F0h
		mov	[ebp+var_388], edi
		mov	edi, esi
		and	esi, 0Fh
		shr	edi, 4
		lea	ecx, [eax+ecx]
		movzx	ecx, byte ptr [edi+ecx+1400h]
		lea	esi, [eax+esi]
		mov	edi, [ebp+var_388]
		and	ecx, 0Fh
		lea	edi, [eax+edi]
		movzx	edi, byte ptr [ecx+edi+1600h]
		mov	ecx, [ebp+var_38C]
		shl	edi, 4
		mov	[ebp+var_36C], edi
		mov	edi, [ebp+var_374]
		shl	edi, 4
		and	edi, 0FFh
		movzx	esi, byte ptr [edi+esi+1500h]
		mov	edi, [ebp+var_390]
		and	esi, 0Fh
		and	ecx, 0Fh
		shl	edi, 4
		and	edi, 0FFh
		mov	[ebp+var_374], edi
		lea	edi, [eax+ecx]
		mov	ecx, [ebp+var_374]
		lea	esi, [eax+esi]
		movzx	edi, byte ptr [ecx+edi+1300h]
		movzx	ecx, byte ptr [ebp+var_36C]
		shl	edi, 4
		and	edi, 0FFh
		movzx	esi, byte ptr [edi+esi+1700h]
		mov	edi, [ebp+var_3A8]
		and	esi, 0Fh
		lea	ecx, [esi+ecx]
		mov	esi, [ebp+var_370]
		mov	[ebp+var_6EC], cl
		mov	[edi+esi+3], cl
		add	esi, 4
		cmp	esi, 10h
		mov	[ebp+var_370], esi
		jz	short loc_2618
		mov	ecx, [ebp+var_464]
		mov	edi, [ebp+var_464]
		mov	ecx, [ecx+esi*4]
		mov	edi, [edi+esi*4+4]
		mov	[ebp+var_390], ecx
		mov	ecx, [ebp+var_464]
		mov	[ebp+var_38C], edi
		mov	edi, [ebp+var_464]
		mov	ecx, [ecx+esi*4+8]
		mov	edi, [edi+esi*4+0Ch]
		mov	[ebp+var_374], ecx
		mov	esi, ecx
		mov	[ebp+var_388], edi
		jmp	loc_2126
; ---------------------------------------------------------------------------
		align 4

loc_2618:				; CODE XREF: calcHashAB+1B5Fj
		movzx	ecx, [ebp+var_2C]
		mov	edi, dword ptr [off_1BFBC]	;offset 
		mov	[ebp+var_36C], ecx
		mov	ecx, [ebp+var_3B8]
		mov	esi, [ebp+var_36C]
		movzx	ecx, byte ptr [ecx]
		shl	esi, 4
		mov	[ebp+var_6B8], cl
		and	ecx, 0Fh
		lea	esi, [ecx+esi]
		movzx	ecx, [ebp+var_6B8]
		and	esi, 0FFh
		movzx	esi, byte ptr [edi+esi+100h]
		shr	cl, 4
		mov	edi, ecx
		mov	ecx, [ebp+var_36C]
		and	edi, 0FFh
		and	esi, 0Fh
		add	edi, dword ptr [off_1BFBC]	;offset 
		and	ecx, 0F0h
		movzx	edi, byte ptr [edi+ecx]
		shl	edi, 4
		mov	ecx, edi
		lea	edi, [esi+ecx]
		mov	ecx, edi
		mov	edi, dword ptr [off_1BFBC]	;offset 
		mov	byte ptr [ebp+var_388],	cl
		movzx	ecx, [ebp+var_2B]
		mov	[ebp+var_36C], ecx
		mov	ecx, [ebp+var_3B8]
		mov	esi, [ebp+var_36C]
		movzx	ecx, byte ptr [ecx+1]
		shl	esi, 4
		mov	[ebp+var_698], cl
		and	ecx, 0Fh
		lea	esi, [ecx+esi]
		movzx	ecx, [ebp+var_698]
		and	esi, 0FFh
		movzx	esi, byte ptr [edi+esi+100h]
		shr	cl, 4
		mov	edi, ecx
		mov	ecx, [ebp+var_36C]
		and	edi, 0FFh
		and	esi, 0Fh
		add	edi, dword ptr [off_1BFBC]	;offset 
		and	ecx, 0F0h
		movzx	edi, byte ptr [edi+ecx]
		shl	edi, 4
		mov	ecx, edi
		lea	edi, [esi+ecx]
		mov	ecx, edi
		mov	edi, dword ptr [off_1BFBC]	;offset 
		mov	byte ptr [ebp+var_36C],	cl
		movzx	ecx, [ebp+var_2A]
		mov	[ebp+var_370], ecx
		mov	ecx, [ebp+var_3B8]
		mov	esi, [ebp+var_370]
		movzx	ecx, byte ptr [ecx+2]
		shl	esi, 4
		mov	[ebp+var_688], cl
		and	ecx, 0Fh
		lea	esi, [ecx+esi]
		movzx	ecx, [ebp+var_688]
		and	esi, 0FFh
		movzx	esi, byte ptr [edi+esi+100h]
		shr	cl, 4
		mov	edi, ecx
		mov	ecx, [ebp+var_370]
		and	edi, 0FFh
		and	esi, 0Fh
		add	edi, dword ptr [off_1BFBC]	;offset 
		and	ecx, 0F0h
		movzx	edi, byte ptr [edi+ecx]
		shl	edi, 4
		mov	ecx, edi
		lea	edi, [esi+ecx]
		mov	ecx, edi
		mov	byte ptr [ebp+var_394],	cl
		movzx	ecx, [ebp+var_29]
		mov	edi, dword ptr [off_1BFBC]	;offset 
		mov	[ebp+var_370], ecx
		mov	ecx, [ebp+var_3B8]
		mov	esi, [ebp+var_370]
		movzx	ecx, byte ptr [ecx+3]
		shl	esi, 4
		mov	[ebp+var_678], cl
		and	ecx, 0Fh
		lea	esi, [ecx+esi]
		movzx	ecx, [ebp+var_678]
		and	esi, 0FFh
		movzx	esi, byte ptr [edi+esi+100h]
		shr	cl, 4
		mov	edi, ecx
		mov	ecx, [ebp+var_370]
		and	esi, 0Fh
		and	edi, 0FFh
		and	ecx, 0F0h
		add	edi, dword ptr [off_1BFBC]	;offset 
		movzx	edi, byte ptr [edi+ecx]
		shl	edi, 4
		mov	ecx, edi
		lea	edi, [esi+ecx]
		mov	ecx, edi
		mov	edi, dword ptr [off_1BFBC]	;offset
		mov	byte ptr [ebp+var_3BC],	cl
		movzx	ecx, [ebp+var_28]
		mov	[ebp+var_370], ecx
		mov	ecx, [ebp+var_3B8]
		mov	esi, [ebp+var_370]
		movzx	ecx, byte ptr [ecx+4]
		shl	esi, 4
		mov	[ebp+var_668], cl
		and	ecx, 0Fh
		lea	esi, [ecx+esi]
		movzx	ecx, [ebp+var_668]
		and	esi, 0FFh
		movzx	esi, byte ptr [edi+esi+100h]
		shr	cl, 4
		mov	edi, ecx
		mov	ecx, [ebp+var_370]
		and	edi, 0FFh
		and	esi, 0Fh
		add	edi, dword ptr [off_1BFBC]	;offset 
		and	ecx, 0F0h
		movzx	edi, byte ptr [edi+ecx]
		shl	edi, 4
		mov	ecx, edi
		lea	edi, [esi+ecx]
		mov	ecx, edi
		mov	edi, dword ptr [off_1BFBC]	;offset 
		mov	byte ptr [ebp+var_3D8],	cl
		movzx	ecx, [ebp+var_27]
		mov	[ebp+var_370], ecx
		mov	ecx, [ebp+var_3B8]
		mov	esi, [ebp+var_370]
		movzx	ecx, byte ptr [ecx+5]
		shl	esi, 4
		mov	[ebp+var_658], cl
		and	ecx, 0Fh
		lea	esi, [ecx+esi]
		movzx	ecx, [ebp+var_658]
		and	esi, 0FFh
		movzx	esi, byte ptr [edi+esi+100h]
		shr	cl, 4
		mov	edi, ecx
		mov	ecx, [ebp+var_370]
		and	edi, 0FFh
		and	esi, 0Fh
		add	edi, dword ptr [off_1BFBC]	;offset
		and	ecx, 0F0h
		movzx	edi, byte ptr [edi+ecx]
		shl	edi, 4
		mov	ecx, edi
		lea	edi, [esi+ecx]
		mov	ecx, edi
		mov	byte ptr [ebp+var_374],	cl
		movzx	ecx, [ebp+var_26]
		mov	edi, dword ptr [off_1BFBC]	;offset 
		mov	[ebp+var_370], ecx
		mov	ecx, [ebp+var_3B8]
		mov	esi, [ebp+var_370]
		movzx	ecx, byte ptr [ecx+6]
		shl	esi, 4
		mov	[ebp+var_648], cl
		and	ecx, 0Fh
		lea	esi, [ecx+esi]
		movzx	ecx, [ebp+var_648]
		and	esi, 0FFh
		movzx	esi, byte ptr [edi+esi+100h]
		shr	cl, 4
		mov	edi, ecx
		mov	ecx, [ebp+var_370]
		and	edi, 0FFh
		and	esi, 0Fh
		add	edi, dword ptr [off_1BFBC]	;offset
		and	ecx, 0F0h
		movzx	edi, byte ptr [edi+ecx]
		shl	edi, 4
		mov	ecx, edi
		lea	edi, [esi+ecx]
		mov	ecx, edi
		mov	edi, dword ptr [off_1BFBC]	;offset 
		mov	byte ptr [ebp+var_3FC],	cl
		movzx	ecx, [ebp+var_25]
		mov	[ebp+var_370], ecx
		mov	ecx, [ebp+var_3B8]
		mov	esi, [ebp+var_370]
		movzx	ecx, byte ptr [ecx+7]
		shl	esi, 4
		mov	[ebp+var_638], cl
		and	ecx, 0Fh
		lea	esi, [ecx+esi]
		movzx	ecx, [ebp+var_638]
		and	esi, 0FFh
		movzx	esi, byte ptr [edi+esi+100h]
		and	esi, 0Fh
		shr	cl, 4
		mov	edi, ecx
		mov	ecx, [ebp+var_370]
		and	edi, 0FFh
		add	edi, dword ptr [off_1BFBC]	;offset 
		and	ecx, 0F0h
		movzx	edi, byte ptr [edi+ecx]
		shl	edi, 4
		mov	ecx, edi
		lea	edi, [esi+ecx]
		mov	ecx, edi
		mov	edi, dword ptr [off_1BFBC]	;offset 
		mov	byte ptr [ebp+var_418],	cl
		movzx	ecx, [ebp+var_24]
		mov	[ebp+var_370], ecx
		mov	ecx, [ebp+var_3B8]
		mov	esi, [ebp+var_370]
		movzx	ecx, byte ptr [ecx+8]
		shl	esi, 4
		mov	[ebp+var_628], cl
		and	ecx, 0Fh
		lea	esi, [ecx+esi]
		movzx	ecx, [ebp+var_628]
		and	esi, 0FFh
		movzx	esi, byte ptr [edi+esi+100h]
		shr	cl, 4
		mov	edi, ecx
		mov	ecx, [ebp+var_370]
		and	edi, 0FFh
		and	esi, 0Fh
		add	edi, dword ptr [off_1BFBC]	;offset 
		and	ecx, 0F0h
		movzx	edi, byte ptr [edi+ecx]
		shl	edi, 4
		mov	ecx, edi
		lea	edi, [esi+ecx]
		mov	ecx, edi
		mov	byte ptr [ebp+var_428],	cl
		movzx	ecx, [ebp+var_23]
		mov	edi, dword ptr [off_1BFBC]	;offset
		mov	[ebp+var_370], ecx
		mov	ecx, [ebp+var_3B8]
		mov	esi, [ebp+var_370]
		movzx	ecx, byte ptr [ecx+9]
		shl	esi, 4
		mov	[ebp+var_618], cl
		and	ecx, 0Fh
		lea	esi, [ecx+esi]
		movzx	ecx, [ebp+var_618]
		and	esi, 0FFh
		movzx	esi, byte ptr [edi+esi+100h]
		shr	cl, 4
		mov	edi, ecx
		mov	ecx, [ebp+var_370]
		and	edi, 0FFh
		and	esi, 0Fh
		add	edi, dword ptr [off_1BFBC]	;offset
		and	ecx, 0F0h
		movzx	edi, byte ptr [edi+ecx]
		shl	edi, 4
		mov	ecx, edi
		lea	edi, [esi+ecx]
		mov	ecx, edi
		mov	edi, dword ptr [off_1BFBC]	;offset 
		mov	byte ptr [ebp+var_438],	cl
		movzx	ecx, [ebp+var_22]
		mov	[ebp+var_370], ecx
		mov	ecx, [ebp+var_3B8]
		mov	esi, [ebp+var_370]
		movzx	ecx, byte ptr [ecx+0Ah]
		shl	esi, 4
		mov	[ebp+var_608], cl
		and	ecx, 0Fh
		lea	esi, [ecx+esi]
		movzx	ecx, [ebp+var_608]
		and	esi, 0FFh
		movzx	esi, byte ptr [edi+esi+100h]
		shr	cl, 4
		mov	edi, ecx
		mov	ecx, [ebp+var_370]
		and	edi, 0FFh
		and	esi, 0Fh
		add	edi, dword ptr [off_1BFBC]	;offset 
		and	ecx, 0F0h
		movzx	edi, byte ptr [edi+ecx]
		shl	edi, 4
		mov	ecx, edi
		lea	edi, [esi+ecx]
		mov	ecx, edi
		mov	edi, dword ptr [off_1BFBC]	;offset
		mov	byte ptr [ebp+var_3E8],	cl
		movzx	ecx, [ebp+var_21]
		mov	[ebp+var_370], ecx
		mov	ecx, [ebp+var_3B8]
		mov	esi, [ebp+var_370]
		movzx	ecx, byte ptr [ecx+0Bh]
		mov	[ebp+var_5F8], cl
		and	ecx, 0Fh
		shl	esi, 4
		lea	esi, [ecx+esi]
		movzx	ecx, [ebp+var_5F8]
		and	esi, 0FFh
		movzx	esi, byte ptr [edi+esi+100h]
		shr	cl, 4
		mov	edi, ecx
		mov	ecx, [ebp+var_370]
		and	edi, 0FFh
		and	esi, 0Fh
		add	edi, dword ptr [off_1BFBC]	;offset 
		and	ecx, 0F0h
		movzx	edi, byte ptr [edi+ecx]
		shl	edi, 4
		mov	ecx, edi
		lea	edi, [esi+ecx]
		mov	ecx, edi
		mov	[ebp+var_448], cl
		movzx	ecx, [ebp+var_20]
		mov	edi, dword ptr [off_1BFBC]	;offset 
		mov	[ebp+var_370], ecx
		mov	ecx, [ebp+var_3B8]
		mov	esi, [ebp+var_370]
		movzx	ecx, byte ptr [ecx+0Ch]
		shl	esi, 4
		mov	[ebp+var_5E8], cl
		and	ecx, 0Fh
		lea	esi, [ecx+esi]
		movzx	ecx, [ebp+var_5E8]
		and	esi, 0FFh
		movzx	esi, byte ptr [edi+esi+100h]
		shr	cl, 4
		mov	edi, ecx
		mov	ecx, [ebp+var_370]
		and	edi, 0FFh
		and	esi, 0Fh
		add	edi, dword ptr [off_1BFBC]	;offset
		and	ecx, 0F0h
		movzx	edi, byte ptr [edi+ecx]
		shl	edi, 4
		mov	ecx, edi
		lea	edi, [esi+ecx]
		mov	ecx, edi
		mov	edi, dword ptr [off_1BFBC]	;offset 
		mov	byte ptr [ebp+var_454],	cl
		movzx	ecx, [ebp+var_1F]
		mov	[ebp+var_370], ecx
		mov	ecx, [ebp+var_3B8]
		mov	esi, [ebp+var_370]
		movzx	ecx, byte ptr [ecx+0Dh]
		shl	esi, 4
		mov	[ebp+var_5D8], cl
		and	ecx, 0Fh
		lea	esi, [ecx+esi]
		movzx	ecx, [ebp+var_5D8]
		and	esi, 0FFh
		movzx	esi, byte ptr [edi+esi+100h]
		shr	cl, 4
		mov	edi, ecx
		mov	ecx, [ebp+var_370]
		and	edi, 0FFh
		and	esi, 0Fh
		add	edi, dword ptr [off_1BFBC]	;offset 
		and	ecx, 0F0h
		movzx	edi, byte ptr [edi+ecx]
		shl	edi, 4
		mov	ecx, edi
		lea	edi, [esi+ecx]
		mov	ecx, edi
		mov	edi, dword ptr [off_1BFBC]	;offset 
		mov	byte ptr [ebp+var_44C],	cl
		movzx	ecx, [ebp+var_1E]
		mov	[ebp+var_370], ecx
		mov	ecx, [ebp+var_3B8]
		mov	esi, [ebp+var_370]
		movzx	ecx, byte ptr [ecx+0Eh]
		shl	esi, 4
		mov	[ebp+var_5C8], cl
		and	ecx, 0Fh
		lea	esi, [ecx+esi]
		movzx	ecx, [ebp+var_5C8]
		and	esi, 0FFh
		movzx	esi, byte ptr [edi+esi+100h]
		shr	cl, 4
		mov	edi, ecx
		mov	ecx, [ebp+var_370]
		and	esi, 0Fh
		and	edi, 0FFh
		and	ecx, 0F0h
		add	edi, dword ptr [off_1BFBC]	;offset
		movzx	edi, byte ptr [edi+ecx]
		shl	edi, 4
		mov	ecx, edi
		lea	edi, [esi+ecx]
		mov	ecx, edi
		mov	byte ptr [ebp+var_450],	cl
		movzx	ecx, [ebp+var_1D]
		mov	edi, dword ptr [off_1BFBC]	;offset 
		mov	[ebp+var_370], ecx
		mov	ecx, [ebp+var_3B8]
		mov	esi, [ebp+var_370]
		add	[ebp+var_3B8], 10h
		movzx	ecx, byte ptr [ecx+0Fh]
		shl	esi, 4
		mov	[ebp+var_5B8], cl
		and	ecx, 0Fh
		lea	esi, [ecx+esi]
		movzx	ecx, [ebp+var_5B8]
		and	esi, 0FFh
		movzx	esi, byte ptr [edi+esi+100h]
		shr	cl, 4
		mov	edi, ecx
		mov	ecx, [ebp+var_370]
		and	edi, 0FFh
		and	esi, 0Fh
		add	edi, dword ptr [off_1BFBC]	;offset 
		and	ecx, 0F0h
		movzx	ecx, byte ptr [edi+ecx]
		shl	ecx, 4
		lea	ecx, [esi+ecx]
		mov	esi, [ebp+var_468]
		cmp	[ebp+var_3B8], esi
		jnz	loc_1FD8
		movzx	esi, byte ptr [ebp+var_374]
		mov	edi, ecx
		mov	ecx, dword ptr [off_1BFD8]	;offset
		and	edi, 0FFh
		movzx	ecx, byte ptr [ecx+esi]
		movzx	esi, byte ptr [ebp+var_3E8]
		mov	byte ptr [ebp+var_470],	cl
		mov	ecx, dword ptr [off_1BFD8]	;offset
		movzx	ecx, byte ptr [ecx+esi]
		mov	esi, dword ptr [off_1BFD8]	;offset
		mov	byte ptr [ebp+var_374],	cl
		mov	ecx, dword ptr [off_1BFD8]	;offset 
		movzx	ecx, byte ptr [ecx+edi]
		mov	byte ptr [ebp+var_38C],	cl
		movzx	ecx, byte ptr [ebp+var_3D8]
		movzx	ecx, byte ptr [esi+ecx]
		mov	byte ptr [ebp+var_390],	cl
		movzx	ecx, byte ptr [ebp+var_438]
		movzx	ecx, byte ptr [esi+ecx]
		mov	byte ptr [ebp+var_3B8],	cl
		movzx	ecx, byte ptr [ebp+var_450]
		movzx	ecx, byte ptr [esi+ecx]
		mov	byte ptr [ebp+var_46C],	cl
		movzx	ecx, byte ptr [ebp+var_3BC]
		movzx	ecx, byte ptr [esi+ecx]
		mov	byte ptr [ebp+var_450],	cl
		movzx	ecx, byte ptr [ebp+var_428]
		movzx	ecx, byte ptr [esi+ecx]
		mov	byte ptr [ebp+var_3BC],	cl
		movzx	ecx, byte ptr [ebp+var_44C]
		movzx	ecx, byte ptr [esi+ecx]
		mov	byte ptr [ebp+var_3D8],	cl
		movzx	ecx, byte ptr [ebp+var_394]
		movzx	ecx, byte ptr [esi+ecx]
		mov	byte ptr [ebp+var_44C],	cl
		movzx	ecx, byte ptr [ebp+var_418]
		movzx	ecx, byte ptr [esi+ecx]
		mov	byte ptr [ebp+var_418],	cl
		movzx	ecx, byte ptr [ebp+var_454]
		movzx	ecx, byte ptr [esi+ecx]
		mov	byte ptr [ebp+var_428],	cl
		movzx	ecx, byte ptr [ebp+var_36C]
		movzx	ecx, byte ptr [esi+ecx]
		mov	byte ptr [ebp+var_438],	cl
		movzx	ecx, byte ptr [ebp+var_3FC]
		movzx	ecx, byte ptr [esi+ecx]
		mov	byte ptr [ebp+var_3E8],	cl
		movzx	ecx, [ebp+var_448]
		movzx	ecx, byte ptr [esi+ecx]
		mov	[ebp+var_448], cl
		movzx	ecx, byte ptr [ebp+var_388]
		movzx	edi, byte ptr [esi+ecx]
		mov	esi, dword ptr [off_1BFBC]	;offset 
		mov	ecx, edi
		and	edi, 0F0h
		shl	ecx, 4
		add	ecx, [ebp+var_4D8]
		and	ecx, 0FFh
		movzx	ecx, byte ptr [esi+ecx+100h]
		mov	esi, [ebp+var_558]
		add	esi, dword ptr [off_1BFBC]	;offset 
		and	ecx, 0Fh
		movzx	esi, byte ptr [esi+edi]
		movzx	edi, byte ptr [ebp+var_470]
		shl	esi, 4
		add	ecx, esi
		mov	esi, dword ptr [off_1BFBC]	;offset 
		mov	byte ptr [ebp+var_370],	cl
		mov	[ebp+var_2C], cl
		mov	ecx, edi
		and	edi, 0F0h
		shl	ecx, 4
		add	ecx, [ebp+var_4D4]
		and	ecx, 0FFh
		movzx	ecx, byte ptr [esi+ecx+100h]
		mov	esi, [ebp+var_554]
		add	esi, dword ptr [off_1BFBC]	;offset 
		and	ecx, 0Fh
		movzx	esi, byte ptr [esi+edi]
		movzx	edi, byte ptr [ebp+var_374]
		shl	esi, 4
		add	ecx, esi
		mov	esi, dword ptr [off_1BFBC]	;offset
		mov	byte ptr [ebp+var_388],	cl
		mov	[ebp+var_2B], cl
		mov	ecx, edi
		and	edi, 0F0h
		shl	ecx, 4
		add	ecx, [ebp+var_4D0]
		and	ecx, 0FFh
		movzx	ecx, byte ptr [esi+ecx+100h]
		mov	esi, [ebp+var_550]
		add	esi, dword ptr [off_1BFBC]	;offset
		and	ecx, 0Fh
		movzx	esi, byte ptr [esi+edi]
		shl	esi, 4
		add	ecx, esi
		mov	byte ptr [ebp+var_374],	cl
		movzx	edi, byte ptr [ebp+var_38C]
		mov	[ebp+var_2A], cl
		mov	esi, dword ptr [off_1BFBC]	;offset
		mov	ecx, edi
		and	edi, 0F0h
		shl	ecx, 4
		add	ecx, [ebp+var_4CC]
		and	ecx, 0FFh
		movzx	ecx, byte ptr [esi+ecx+100h]
		mov	esi, [ebp+var_54C]
		add	esi, dword ptr [off_1BFBC]	;offset 
		and	ecx, 0Fh
		movzx	esi, byte ptr [esi+edi]
		movzx	edi, byte ptr [ebp+var_390]
		shl	esi, 4
		add	ecx, esi
		mov	esi, dword ptr [off_1BFBC]	;offset 
		mov	byte ptr [ebp+var_38C],	cl
		mov	[ebp+var_29], cl
		mov	ecx, edi
		shl	ecx, 4
		and	edi, 0F0h
		add	ecx, [ebp+var_4C8]
		and	ecx, 0FFh
		movzx	ecx, byte ptr [esi+ecx+100h]
		mov	esi, [ebp+var_548]
		add	esi, dword ptr [off_1BFBC]	;offset 
		and	ecx, 0Fh
		movzx	esi, byte ptr [esi+edi]
		movzx	edi, byte ptr [ebp+var_3B8]
		shl	esi, 4
		add	ecx, esi
		mov	esi, dword ptr [off_1BFBC]	;offset 
		mov	byte ptr [ebp+var_390],	cl
		mov	[ebp+var_28], cl
		mov	ecx, edi
		and	edi, 0F0h
		shl	ecx, 4
		add	ecx, [ebp+var_4C4]
		and	ecx, 0FFh
		movzx	ecx, byte ptr [esi+ecx+100h]
		mov	esi, [ebp+var_544]
		add	esi, dword ptr [off_1BFBC]	;offset
		and	ecx, 0Fh
		movzx	esi, byte ptr [esi+edi]
		movzx	edi, byte ptr [ebp+var_46C]
		shl	esi, 4
		add	ecx, esi
		mov	esi, dword ptr [off_1BFBC]	;offset 
		mov	byte ptr [ebp+var_3B8],	cl
		mov	[ebp+var_27], cl
		mov	ecx, edi
		and	edi, 0F0h
		shl	ecx, 4
		add	ecx, [ebp+var_4C0]
		and	ecx, 0FFh
		movzx	ecx, byte ptr [esi+ecx+100h]
		mov	esi, [ebp+var_540]
		add	esi, dword ptr [off_1BFBC]	;offset 
		and	ecx, 0Fh
		movzx	esi, byte ptr [esi+edi]
		shl	esi, 4
		add	ecx, esi
		mov	byte ptr [ebp+var_36C],	cl
		movzx	edi, byte ptr [ebp+var_450]
		mov	[ebp+var_26], cl
		mov	esi, dword ptr [off_1BFBC]	;offset 
		mov	ecx, edi
		and	edi, 0F0h
		shl	ecx, 4
		add	ecx, [ebp+var_4BC]
		and	ecx, 0FFh
		movzx	ecx, byte ptr [esi+ecx+100h]
		mov	esi, [ebp+var_53C]
		add	esi, dword ptr [off_1BFBC]	;offset 
		and	ecx, 0Fh
		movzx	esi, byte ptr [esi+edi]
		movzx	edi, byte ptr [ebp+var_3BC]
		shl	esi, 4
		add	ecx, esi
		mov	esi, dword ptr [off_1BFBC]	;offset 
		mov	byte ptr [ebp+var_394],	cl
		mov	[ebp+var_25], cl
		mov	ecx, edi
		shl	ecx, 4
		add	ecx, [ebp+var_4B8]
		and	edi, 0F0h
		and	ecx, 0FFh
		movzx	ecx, byte ptr [esi+ecx+100h]
		mov	esi, [ebp+var_538]
		add	esi, dword ptr [off_1BFBC]	;offset 
		and	ecx, 0Fh
		movzx	esi, byte ptr [esi+edi]
		movzx	edi, byte ptr [ebp+var_3D8]
		shl	esi, 4
		add	ecx, esi
		mov	esi, dword ptr [off_1BFBC]	;offset
		mov	byte ptr [ebp+var_3BC],	cl
		mov	[ebp+var_24], cl
		mov	ecx, edi
		and	edi, 0F0h
		shl	ecx, 4
		add	ecx, [ebp+var_4B4]
		and	ecx, 0FFh
		movzx	ecx, byte ptr [esi+ecx+100h]
		mov	esi, [ebp+var_534]
		add	esi, dword ptr [off_1BFBC]	;offset
		and	ecx, 0Fh
		movzx	esi, byte ptr [esi+edi]
		movzx	edi, byte ptr [ebp+var_44C]
		shl	esi, 4
		add	ecx, esi
		mov	esi, dword ptr [off_1BFBC]	;offset
		mov	byte ptr [ebp+var_3D8],	cl
		mov	[ebp+var_23], cl
		mov	ecx, edi
		and	edi, 0F0h
		shl	ecx, 4
		add	ecx, [ebp+var_4B0]
		and	ecx, 0FFh
		movzx	ecx, byte ptr [esi+ecx+100h]
		mov	esi, [ebp+var_530]
		add	esi, dword ptr [off_1BFBC]	;offset 
		and	ecx, 0Fh
		movzx	esi, byte ptr [esi+edi]
		shl	esi, 4
		add	ecx, esi
		mov	byte ptr [ebp+var_3FC],	cl
		movzx	edi, byte ptr [ebp+var_418]
		mov	[ebp+var_22], cl
		mov	esi, dword ptr [off_1BFBC]	;offset 
		mov	ecx, edi
		and	edi, 0F0h
		shl	ecx, 4
		add	ecx, [ebp+var_4AC]
		and	ecx, 0FFh
		movzx	ecx, byte ptr [esi+ecx+100h]
		mov	esi, [ebp+var_52C]
		add	esi, dword ptr [off_1BFBC]	;offset 
		and	ecx, 0Fh
		movzx	esi, byte ptr [esi+edi]
		movzx	edi, byte ptr [ebp+var_428]
		shl	esi, 4
		add	ecx, esi
		mov	esi, dword ptr [off_1BFBC]	;offset 
		mov	byte ptr [ebp+var_418],	cl
		mov	[ebp+var_21], cl
		mov	ecx, edi
		shl	ecx, 4
		add	ecx, [ebp+var_4A8]
		and	ecx, 0FFh
		and	edi, 0F0h
		movzx	ecx, byte ptr [esi+ecx+100h]
		mov	esi, [ebp+var_528]
		add	esi, dword ptr [off_1BFBC]	;offset 
		and	ecx, 0Fh
		movzx	esi, byte ptr [esi+edi]
		movzx	edi, byte ptr [ebp+var_438]
		shl	esi, 4
		add	ecx, esi
		mov	esi, dword ptr [off_1BFBC]	;offset 
		mov	byte ptr [ebp+var_428],	cl
		mov	[ebp+var_20], cl
		mov	ecx, edi
		and	edi, 0F0h
		shl	ecx, 4
		add	ecx, [ebp+var_4A4]
		and	ecx, 0FFh
		movzx	ecx, byte ptr [esi+ecx+100h]
		mov	esi, [ebp+var_524]
		add	esi, dword ptr [off_1BFBC]	;offset 
		and	ecx, 0Fh
		movzx	esi, byte ptr [esi+edi]
		movzx	edi, byte ptr [ebp+var_3E8]
		shl	esi, 4
		add	ecx, esi
		mov	esi, dword ptr [off_1BFBC]	;offset 
		mov	byte ptr [ebp+var_438],	cl
		mov	[ebp+var_1F], cl
		mov	ecx, edi
		and	edi, 0F0h
		shl	ecx, 4
		add	ecx, [ebp+var_4A0]
		and	ecx, 0FFh
		movzx	ecx, byte ptr [esi+ecx+100h]
		mov	esi, [ebp+var_520]
		add	esi, dword ptr [off_1BFBC]	;offset 
		and	ecx, 0Fh
		movzx	esi, byte ptr [esi+edi]
		shl	esi, 4
		add	ecx, esi
		mov	byte ptr [ebp+var_3E8],	cl
		movzx	edi, [ebp+var_448]
		mov	[ebp+var_1E], cl
		mov	esi, dword ptr [off_1BFBC]	;offset 
		mov	ecx, edi
		and	edi, 0F0h
		shl	ecx, 4
		add	ecx, [ebp+var_49C]
		and	ecx, 0FFh
		movzx	ecx, byte ptr [esi+ecx+100h]
		mov	esi, [ebp+var_51C]
		add	esi, dword ptr [off_1BFBC]	;offset 
		and	ecx, 0Fh
		movzx	esi, byte ptr [esi+edi]
		mov	edi, dword ptr [off_1BFB8]	;offset 
		shl	esi, 4
		add	ecx, esi
		mov	esi, [ebp+var_3F8]
		mov	[ebp+var_448], cl
		mov	[ebp+var_1D], cl
		movzx	ecx, byte ptr [ebp+var_370]
		movzx	ecx, byte ptr [edi+ecx]
		mov	edi, [ebp+var_460]
		mov	[edi+esi], cl
		mov	esi, dword ptr [off_1BFB8]	;offset 
		movzx	ecx, byte ptr [ebp+var_388]
		movzx	ecx, byte ptr [esi+ecx]
		mov	esi, [ebp+var_3F8]
		mov	[edi+esi+1], cl
		mov	edi, dword ptr [off_1BFB8]	;offset 
		movzx	ecx, byte ptr [ebp+var_374]
		movzx	ecx, byte ptr [edi+ecx]
		mov	edi, [ebp+var_460]
		mov	[edi+esi+2], cl
		mov	esi, dword ptr [off_1BFB8]	;offset 
		movzx	ecx, byte ptr [ebp+var_38C]
		movzx	ecx, byte ptr [esi+ecx]
		mov	esi, [ebp+var_3F8]
		mov	[edi+esi+3], cl
		mov	edi, dword ptr [off_1BFB8]	;offset stop edit here
		movzx	ecx, byte ptr [ebp+var_390]
		movzx	ecx, byte ptr [edi+ecx]
		mov	edi, [ebp+var_460]
		mov	[edi+esi+4], cl
		mov	esi, dword ptr [off_1BFB8]	;offset 
		movzx	ecx, byte ptr [ebp+var_3B8]
		movzx	ecx, byte ptr [esi+ecx]
		mov	esi, [ebp+var_3F8]
		mov	[edi+esi+5], cl
		mov	edi, dword ptr [off_1BFB8]	;offset 
		movzx	ecx, byte ptr [ebp+var_36C]
		movzx	ecx, byte ptr [edi+ecx]
		mov	edi, [ebp+var_460]
		mov	[edi+esi+6], cl
		mov	esi, dword ptr [off_1BFB8]	;offset 
		movzx	ecx, byte ptr [ebp+var_394]
		movzx	ecx, byte ptr [esi+ecx]
		mov	esi, [ebp+var_3F8]
		mov	[edi+esi+7], cl
		mov	edi, dword ptr [off_1BFB8]	;offset 
		movzx	ecx, byte ptr [ebp+var_3BC]
		movzx	ecx, byte ptr [edi+ecx]
		mov	edi, [ebp+var_460]
		mov	[edi+esi+8], cl
		mov	esi, dword ptr [off_1BFB8]	;offset 
		movzx	ecx, byte ptr [ebp+var_3D8]
		movzx	ecx, byte ptr [esi+ecx]
		mov	esi, [ebp+var_3F8]
		mov	[edi+esi+9], cl
		mov	edi, dword ptr [off_1BFB8]	;offset 
		movzx	ecx, byte ptr [ebp+var_3FC]
		movzx	ecx, byte ptr [edi+ecx]
		mov	edi, [ebp+var_460]
		mov	[edi+esi+0Ah], cl
		mov	esi, dword ptr [off_1BFB8]	;offset
		movzx	ecx, byte ptr [ebp+var_418]
		movzx	ecx, byte ptr [esi+ecx]
		mov	esi, [ebp+var_3F8]
		mov	[edi+esi+0Bh], cl
		mov	edi, dword ptr [off_1BFB8]	;offset
		movzx	ecx, byte ptr [ebp+var_428]
		add	[ebp+var_458], 1
		movzx	ecx, byte ptr [edi+ecx]
		mov	edi, [ebp+var_460]
		mov	[edi+esi+0Ch], cl
		mov	esi, dword ptr [off_1BFB8]	;offset 
		movzx	ecx, byte ptr [ebp+var_438]
		movzx	ecx, byte ptr [esi+ecx]
		mov	esi, [ebp+var_3F8]
		mov	[edi+esi+0Dh], cl
		mov	edi, dword ptr [off_1BFB8]	;offset 
		movzx	ecx, byte ptr [ebp+var_3E8]
		movzx	ecx, byte ptr [edi+ecx]
		mov	edi, [ebp+var_460]
		mov	[edi+esi+0Eh], cl
		mov	esi, dword ptr [off_1BFB8]	;offset
		movzx	ecx, [ebp+var_448]
		movzx	ecx, byte ptr [esi+ecx]
		mov	esi, [ebp+var_3F8]
		mov	[edi+esi+0Fh], cl
		add	esi, 10h
		cmp	[ebp+var_458], 5
		mov	[ebp+var_3F8], esi
		jnz	loc_10D0
		lea	esi, [ebp+var_5C]
		mov	edx, 6
		mov	[ebp+var_480], esi
		xor	eax, eax
		mov	esi, [ebp+var_460]
		mov	[ebp+var_7C], 6
		lea	ecx, [ebp+var_7C]
		mov	edi, [ebp+var_480]
		mov	[ebp+var_7B], 18h
		mov	[ebp+var_7A], 11h
		mov	[ebp+var_79], 7
		mov	[ebp+var_78], 13h
		mov	[ebp+var_77], 0Dh
		mov	[ebp+var_76], 0Eh
		mov	[ebp+var_75], 9
		mov	[ebp+var_74], 15h
		mov	[ebp+var_73], 1Dh
		mov	[ebp+var_72], 2
		mov	[ebp+var_71], 1Fh
		mov	[ebp+var_70], 1
		mov	[ebp+var_6F], 4
		mov	[ebp+var_6E], 1Ch
		mov	[ebp+var_6D], 1Ah
		mov	[ebp+var_6C], 10h
		mov	[ebp+var_6B], 14h
		mov	[ebp+var_6A], 0Bh
		mov	[ebp+var_69], 1Eh
		mov	[ebp+var_68], 3
		mov	[ebp+var_67], 0Ah
		mov	[ebp+var_66], 1Bh
		mov	[ebp+var_65], 19h
		mov	[ebp+var_64], 5
		mov	[ebp+var_63], 0Fh
		mov	[ebp+var_62], 16h
		mov	[ebp+var_61], 0
		mov	[ebp+var_60], 12h
		mov	[ebp+var_5F], 17h
		mov	[ebp+var_5E], 8
		mov	[ebp+var_5D], 0Ch
		jmp	short loc_360C
; ---------------------------------------------------------------------------
		align 4

loc_3608:				; CODE XREF: calcHashAB+2BADj
		movzx	edx, byte ptr [ecx+eax]

loc_360C:				; CODE XREF: calcHashAB+2B93j
		movzx	edx, dl
		movzx	edx, byte ptr [esi+edx+2Ch]
		mov	[edi+eax], dl
		add	eax, 1
		cmp	eax, 20h
		jnz	short loc_3608
		mov	edi, [ebp+var_480]
		mov	eax, [edi]
		mov	[ebp+var_F0], eax
		mov	eax, [edi+4]
		mov	[ebp+var_EC], eax
		mov	eax, [edi+8]
		mov	[ebp+var_E8], eax
		mov	eax, [edi+0Ch]
		mov	[ebp+var_E4], eax
		mov	eax, [edi+10h]
		mov	[ebp+var_E0], eax
		mov	eax, [edi+14h]
		mov	[ebp+var_DC], eax
		mov	eax, [edi+18h]
		mov	[ebp+var_D8], eax
		mov	eax, [edi+1Ch]
		mov	edi, 45h
		mov	[ebp+var_D4], eax
		mov	eax, [ebp+var_498]	;;;;;;;;;;;;;;;;;;;;;;;error here
		mov	byte ptr [eax],	3
		mov	byte ptr [eax+1], 0
		mov	edx, [ebp+var_48C]
		add	eax, 2
		mov	[ebp+var_484], eax
		mov	ecx, [ebp+var_498]
		mov	eax, [edx]
		mov	[ecx+2], eax
		mov	esi, [ebp+var_484]
		mov	eax, [edx+4]
		mov	[esi+4], eax
		mov	eax, [edx+8]
		mov	[esi+8], eax
		mov	eax, [edx+0Ch]
		mov	[esi+0Ch], eax
		mov	eax, [edx+10h]
		mov	[esi+10h], eax
		movzx	eax, word ptr [edx+14h]
		mov	[esi+14h], ax
		movzx	eax, byte ptr [edx+16h]
		xor	edx, edx
		mov	[esi+16h], al
		mov	esi, ecx
		lea	esi, [esi+0]

loc_36D0:				; CODE XREF: calcHashAB+2C92j
		movzx	ecx, byte ptr [esi+edx+2]
		mov	eax, edi
		imul	eax, ecx
		mov	byte ptr [ebp+var_370],	al
		mov	eax, ecx
		mov	ecx, 76h
		and	eax, 5Dh
		imul	eax, ecx
		movzx	ecx, byte ptr [ebp+var_370]
		lea	eax, [ecx+eax+11h]
		mov	[esi+edx+2], al
		add	edx, 1
		cmp	edx, 17h
		jnz	short loc_36D0
		mov	edi, [ebp+var_460]
		lea	esi, [ebp+var_28A]
		mov	[esp+4], esi
		mov	[esp], edi
		call	gen_tab190
		mov	[esp+4], esi
		lea	esi, [ebp+var_3C]
		mov	[esp], esi
		call	get_ibuff
		mov	eax, [ebp+var_498]
		mov	edx, esi
		mov	[ebp+var_490], 0
		add	eax, 19h
		mov	[ebp+var_48C], eax

loc_3746:				; CODE XREF: calcHashAB+430Bj
		mov	eax, [ebp+var_490]
		test	eax, eax
		jnz	loc_4E25
		mov	ecx, dword ptr [oba_1BFE0]	 ;;offset
		movzx	eax, byte ptr [ebp+var_F0+1]
		movzx	eax, byte ptr [eax+ecx+100h]
		mov	byte ptr [ebp+var_3D8],	al
		movzx	eax, byte ptr [ebp+var_F0+2]
		movzx	eax, byte ptr [eax+ecx+200h]
		mov	byte ptr [ebp+var_3BC],	al
		movzx	eax, byte ptr [ebp+var_F0+3]
		movzx	eax, byte ptr [eax+ecx+300h]
		mov	byte ptr [ebp+var_474],	al
		movzx	eax, byte ptr [ebp+var_EC]
		movzx	eax, byte ptr [eax+ecx+400h]
		mov	byte ptr [ebp+var_470],	al
		movzx	eax, byte ptr [ebp+var_EC+1]
		movzx	eax, byte ptr [eax+ecx+500h]
		mov	byte ptr [ebp+var_46C],	al
		movzx	eax, byte ptr [ebp+var_EC+2]
		movzx	eax, byte ptr [eax+ecx+600h]
		mov	byte ptr [ebp+var_468],	al
		movzx	eax, byte ptr [ebp+var_EC+3]
		movzx	eax, byte ptr [eax+ecx+700h]
		mov	byte ptr [ebp+var_460],	al
		movzx	eax, byte ptr [ebp+var_E8]
		movzx	eax, byte ptr [eax+ecx+800h]
		mov	byte ptr [ebp+dest], al
		movzx	eax, byte ptr [ebp+var_E8+1]
		movzx	eax, byte ptr [eax+ecx+900h]
		mov	byte ptr [ebp+var_458],	al
		movzx	eax, byte ptr [ebp+var_E8+2]
		movzx	eax, byte ptr [eax+ecx+0A00h]
		mov	byte ptr [ebp+var_450],	al
		movzx	eax, byte ptr [ebp+var_E8+3]
		movzx	eax, byte ptr [eax+ecx+0B00h]
		mov	byte ptr [ebp+var_44C],	al
		movzx	eax, byte ptr [ebp+var_E4]
		mov	esi, dword ptr [oba_1BFB0]	;offset 
		movzx	eax, byte ptr [eax+ecx+0C00h]
		mov	byte ptr [ebp+var_454],	al
		movzx	eax, byte ptr [ebp+var_E4+1]
		movzx	eax, byte ptr [eax+ecx+0D00h]
		mov	[ebp+var_448], al
		movzx	eax, byte ptr [ebp+var_E4+2]
		movzx	eax, byte ptr [eax+ecx+0E00h]
		mov	byte ptr [ebp+var_3E8],	al
		movzx	eax, byte ptr [ebp+var_E4+3]
		movzx	eax, byte ptr [eax+ecx+0F00h]
		mov	byte ptr [ebp+var_438],	al
		movzx	eax, byte ptr [edx]
		movzx	edi, byte ptr [edx+2]
		movzx	ecx, byte ptr [eax+esi]
		movzx	eax, byte ptr [edx+1]
		movzx	esi, byte ptr [eax+esi+100h]
		mov	eax, dword ptr [oba_1BFB0]	;offset
		movzx	eax, byte ptr [edi+eax+200h]
		mov	byte ptr [ebp+var_47C],	al
		mov	eax, dword ptr [oba_1BFB0]	;offset 
		movzx	edi, byte ptr [edx+3]
		movzx	eax, byte ptr [edi+eax+300h]
		mov	byte ptr [ebp+var_394],	al
		mov	eax, dword ptr [oba_1BFB0]	;offset 
		movzx	edi, byte ptr [edx+4]
		movzx	eax, byte ptr [edi+eax+400h]
		mov	byte ptr [ebp+var_428],	al
		mov	eax, dword ptr [oba_1BFB0]	;offset
		movzx	edi, byte ptr [edx+5]
		movzx	eax, byte ptr [edi+eax+500h]
		mov	byte ptr [ebp+var_370],	al
		mov	eax, dword ptr [oba_1BFB0]	;offset 
		movzx	edi, byte ptr [edx+6]
		movzx	eax, byte ptr [edi+eax+600h]
		mov	byte ptr [ebp+var_36C],	al
		movzx	edi, byte ptr [edx+7]
		mov	eax, dword ptr [oba_1BFB0]	;offset 
		movzx	eax, byte ptr [edi+eax+700h]
		mov	byte ptr [ebp+var_3A8],	al
		mov	eax, dword ptr [oba_1BFB0]	;offset 
		movzx	edi, byte ptr [edx+8]
		movzx	eax, byte ptr [edi+eax+800h]
		mov	byte ptr [ebp+var_3B8],	al
		mov	eax, dword ptr [oba_1BFB0]	;offset 
		movzx	edi, byte ptr [edx+9]
		movzx	eax, byte ptr [edi+eax+900h]
		mov	byte ptr [ebp+var_390],	al
		mov	eax, dword ptr [oba_1BFB0]	;offset 
		movzx	edi, byte ptr [edx+0Ah]
		movzx	eax, byte ptr [edi+eax+0A00h]
		mov	byte ptr [ebp+var_3F8],	al
		mov	eax, dword ptr	[oba_1BFB0]	;offset
		movzx	edi, byte ptr [edx+0Bh]
		movzx	eax, byte ptr [edi+eax+0B00h]
		mov	byte ptr [ebp+var_38C],	al
		mov	eax, dword ptr [oba_1BFB0]	;offset
		movzx	edi, byte ptr [edx+0Ch]
		movzx	eax, byte ptr [edi+eax+0C00h]
		mov	byte ptr [ebp+var_374],	al
		mov	eax, dword ptr [oba_1BFB0]	;offset
		movzx	edi, byte ptr [edx+0Dh]
		movzx	eax, byte ptr [edi+eax+0D00h]
		mov	byte ptr [ebp+var_388],	al
		mov	eax, dword ptr [oba_1BFB0]	;offset 
		movzx	edi, byte ptr [edx+0Eh]
		movzx	eax, byte ptr [edi+eax+0E00h]
		mov	byte ptr [ebp+var_3FC],	al
		movzx	eax, byte ptr [edx+0Fh]
		mov	edx, dword ptr [oba_1BFB0]	;offset 
		movzx	eax, byte ptr [eax+edx+0F00h]
		mov	byte ptr [ebp+var_418],	al
		mov	edi, dword ptr [oba_1BFE0]	;offset 
		movzx	edx, byte ptr [ebp+var_F0]
		movzx	edx, byte ptr [edx+edi]
		mov	edi, 0Fh
		and	edi, ecx
		shr	cl, 4
		movzx	ecx, cl
		mov	eax, edx
		and	edx, 0F0h
		shl	eax, 4
		mov	[ebp+var_478], eax
		lea	eax, [edi+eax]
		mov	edi, dword ptr [oba_1BFD4]	;offset 
		and	eax, 0FFh
		lea	edx, [ecx+edx]
		movzx	ecx, byte ptr [edx+edi]
		mov	edx, esi
		movzx	eax, byte ptr [eax+edi+100h]
		and	edx, 0Fh
		shl	ecx, 4
		and	eax, 0Fh
		lea	ecx, [eax+ecx]
		movzx	eax, byte ptr [ebp+var_3D8]
		mov	[ebp+var_5C], cl
		mov	edi, eax
		shl	edi, 4
		add	edx, edi
		mov	edi, dword ptr [oba_1BFD4]	;offset 
		and	edx, 0FFh
		movzx	edx, byte ptr [edx+edi+300h]
		mov	edi, eax
		mov	eax, esi
		mov	esi, dword ptr [oba_1BFD4]	;offset 
		shr	al, 4
		and	edi, 0F0h
		movzx	eax, al
		add	eax, edi
		mov	edi,dword ptr [oba_1BFD4]	;offset 
		and	edx, 0Fh
		movzx	eax, byte ptr [eax+esi+200h]
		shl	eax, 4
		lea	eax, [edx+eax]
		movzx	edx, byte ptr [ebp+var_47C]
		mov	byte ptr [ebp+var_3D8],	al
		mov	[ebp+var_5B], al
		movzx	eax, byte ptr [ebp+var_3BC]
		and	edx, 0Fh
		mov	esi, eax
		shl	esi, 4
		add	edx, esi
		mov	esi, eax
		movzx	eax, byte ptr [ebp+var_47C]
		and	esi, 0F0h
		and	edx, 0FFh
		movzx	edx, byte ptr [edx+edi+500h]
		shr	al, 4
		movzx	eax, al
		lea	eax, [esi+eax]
		and	edx, 0Fh
		movzx	eax, byte ptr [eax+edi+400h]
		shl	eax, 4
		lea	eax, [edx+eax]
		movzx	edx, byte ptr [ebp+var_394]
		mov	byte ptr [ebp+var_3BC],	al
		mov	[ebp+var_5A], al
		movzx	eax, byte ptr [ebp+var_474]
		and	edx, 0Fh
		mov	esi, eax
		shl	esi, 4
		add	edx, esi
		mov	esi, eax
		movzx	eax, byte ptr [ebp+var_394]
		and	esi, 0F0h
		and	edx, 0FFh
		movzx	edx, byte ptr [edx+edi+700h]
		shr	al, 4
		movzx	eax, al
		lea	eax, [esi+eax]
		and	edx, 0Fh
		movzx	eax, byte ptr [eax+edi+600h]
		shl	eax, 4
		lea	eax, [edx+eax]
		movzx	edx, byte ptr [ebp+var_428]
		mov	byte ptr [ebp+var_394],	al
		mov	[ebp+var_59], al
		movzx	eax, byte ptr [ebp+var_470]
		and	edx, 0Fh
		mov	esi, eax
		shl	esi, 4
		add	edx, esi
		mov	esi, eax
		movzx	eax, byte ptr [ebp+var_428]
		and	esi, 0F0h
		and	edx, 0FFh
		movzx	edx, byte ptr [edx+edi+900h]
		shr	al, 4
		movzx	eax, al
		lea	eax, [esi+eax]
		and	edx, 0Fh
		movzx	eax, byte ptr [eax+edi+800h]
		shl	eax, 4
		add	edx, eax
		mov	[ebp+var_58], dl
		movzx	esi, byte ptr [ebp+var_46C]
		movzx	eax, byte ptr [ebp+var_370]
		mov	edi, esi
		and	esi, 0F0h
		shl	edi, 4
		and	eax, 0Fh
		add	eax, edi
		movzx	edi, al
		mov	eax, dword ptr [oba_1BFD4]	;offset 
		movzx	edi, byte ptr [edi+eax+0B00h]
		movzx	eax, byte ptr [ebp+var_370]
		and	edi, 0Fh
		shr	al, 4
		movzx	eax, al
		add	esi, eax
		mov	eax, dword ptr [oba_1BFD4]	;offset 
		movzx	esi, byte ptr [esi+eax+0A00h]
		shl	esi, 4
		lea	esi, [edi+esi]
		movzx	edi, byte ptr [ebp+var_468]
		mov	eax, esi
		mov	[ebp+var_57], al
		movzx	eax, byte ptr [ebp+var_36C]
		mov	[ebp+var_370], edi
		shl	edi, 4
		and	eax, 0Fh
		add	eax, edi
		movzx	edi, al
		mov	eax,dword ptr [oba_1BFD4]	;offset 
		movzx	eax, byte ptr [edi+eax+0D00h]
		mov	edi, [ebp+var_370]
		and	eax, 0Fh
		mov	byte ptr [ebp+var_428],	al
		movzx	eax, byte ptr [ebp+var_36C]
		and	edi, 0F0h
		shr	al, 4
		movzx	eax, al
		add	eax, edi
		mov	edi, dword ptr [oba_1BFD4]	;offset
		movzx	eax, byte ptr [eax+edi+0C00h]
		movzx	edi, byte ptr [ebp+var_460]
		shl	eax, 4
		mov	[ebp+var_36C], eax
		movzx	eax, byte ptr [ebp+var_428]
		add	al, byte ptr [ebp+var_36C]
		mov	[ebp+var_370], edi
		shl	edi, 4
		mov	byte ptr [ebp+var_36C],	al
		mov	[ebp+var_56], al
		movzx	eax, byte ptr [ebp+var_3A8]
		and	eax, 0Fh
		add	eax, edi
		movzx	edi, al
		mov	eax, dword ptr [oba_1BFD4]	;offset 
		movzx	eax, byte ptr [edi+eax+0F00h]
		mov	edi, [ebp+var_370]
		and	eax, 0Fh
		mov	byte ptr [ebp+var_428],	al
		movzx	eax, byte ptr [ebp+var_3A8]
		and	edi, 0F0h
		shr	al, 4
		movzx	eax, al
		add	eax, edi
		mov	edi, dword ptr [oba_1BFD4]	;offset 
		movzx	eax, byte ptr [eax+edi+0E00h]
		shl	eax, 4
		mov	[ebp+var_370], eax
		movzx	eax, byte ptr [ebp+var_428]
		add	al, byte ptr [ebp+var_370]
		movzx	edi, byte ptr [ebp+dest]
		mov	byte ptr [ebp+var_3A8],	al
		mov	[ebp+var_55], al
		movzx	eax, byte ptr [ebp+var_3B8]
		mov	[ebp+var_370], edi
		shl	edi, 4
		and	eax, 0Fh
		add	eax, edi
		movzx	edi, al
		mov	eax, dword ptr [oba_1BFD4]	;offset 
		movzx	eax, byte ptr [edi+eax+1100h]
		mov	edi, [ebp+var_370]
		and	eax, 0Fh
		mov	byte ptr [ebp+var_428],	al
		movzx	eax, byte ptr [ebp+var_3B8]
		and	edi, 0F0h
		shr	al, 4
		movzx	eax, al
		add	eax, edi
		mov	edi, dword ptr [oba_1BFD4]	;offset 
		movzx	eax, byte ptr [eax+edi+1000h]
		movzx	edi, byte ptr [ebp+var_458]
		shl	eax, 4
		mov	[ebp+var_370], eax
		movzx	eax, byte ptr [ebp+var_428]
		add	al, byte ptr [ebp+var_370]
		mov	[ebp+var_370], edi
		shl	edi, 4
		mov	byte ptr [ebp+var_3B8],	al
		mov	[ebp+var_54], al
		movzx	eax, byte ptr [ebp+var_390]
		and	eax, 0Fh
		add	eax, edi
		movzx	edi, al
		mov	eax, dword ptr [oba_1BFD4]	;offset 
		movzx	eax, byte ptr [edi+eax+1300h]
		mov	edi, [ebp+var_370]
		and	eax, 0Fh
		mov	byte ptr [ebp+var_428],	al
		movzx	eax, byte ptr [ebp+var_390]
		and	edi, 0F0h
		shr	al, 4
		movzx	eax, al
		add	eax, edi
		mov	edi, dword ptr [oba_1BFD4]	;offset 
		movzx	eax, byte ptr [eax+edi+1200h]
		shl	eax, 4
		mov	[ebp+var_370], eax
		movzx	eax, byte ptr [ebp+var_428]
		add	al, byte ptr [ebp+var_370]
		mov	byte ptr [ebp+var_390],	al
		mov	[ebp+var_53], al
		movzx	edi, byte ptr [ebp+var_450]
		movzx	eax, byte ptr [ebp+var_3F8]
		mov	[ebp+var_370], edi
		shl	edi, 4
		and	eax, 0Fh
		add	eax, edi
		movzx	edi, al
		mov	eax, dword ptr [oba_1BFD4]	;offset
		movzx	eax, byte ptr [edi+eax+1500h]
		mov	edi, [ebp+var_370]
		and	eax, 0Fh
		mov	byte ptr [ebp+var_428],	al
		movzx	eax, byte ptr [ebp+var_3F8]
		and	edi, 0F0h
		shr	al, 4
		movzx	eax, al
		add	eax, edi
		mov	edi, dword ptr [oba_1BFD4]	;offset 
		movzx	eax, byte ptr [eax+edi+1400h]
		movzx	edi, byte ptr [ebp+var_44C]
		shl	eax, 4
		mov	[ebp+var_370], eax
		movzx	eax, byte ptr [ebp+var_428]
		add	al, byte ptr [ebp+var_370]
		mov	[ebp+var_370], edi
		shl	edi, 4
		mov	byte ptr [ebp+var_3F8],	al
		mov	[ebp+var_52], al
		movzx	eax, byte ptr [ebp+var_38C]
		and	eax, 0Fh
		add	eax, edi
		movzx	edi, al
		mov	eax, dword ptr [oba_1BFD4]	;offset 
		movzx	eax, byte ptr [edi+eax+1700h]
		mov	edi, [ebp+var_370]
		and	eax, 0Fh
		mov	byte ptr [ebp+var_428],	al
		movzx	eax, byte ptr [ebp+var_38C]
		and	edi, 0F0h
		shr	al, 4
		movzx	eax, al
		add	eax, edi
		mov	edi, dword ptr [oba_1BFD4]	;offset 
		movzx	eax, byte ptr [eax+edi+1600h]
		movzx	edi, byte ptr [ebp+var_454]
		shl	eax, 4
		mov	[ebp+var_370], eax
		movzx	eax, byte ptr [ebp+var_428]
		add	al, byte ptr [ebp+var_370]
		mov	[ebp+var_370], edi
		shl	edi, 4
		mov	byte ptr [ebp+var_38C],	al
		mov	[ebp+var_51], al
		movzx	eax, byte ptr [ebp+var_374]
		and	eax, 0Fh
		add	eax, edi
		movzx	edi, al
		mov	eax, dword ptr [oba_1BFD4]	;offset 
		movzx	eax, byte ptr [edi+eax+1900h]
		and	eax, 0Fh
		mov	byte ptr [ebp+var_428],	al
		movzx	eax, byte ptr [ebp+var_374]
		mov	edi, [ebp+var_370]
		shr	al, 4
		and	edi, 0F0h
		movzx	eax, al
		add	eax, edi
		mov	edi, dword ptr [oba_1BFD4]	;offset 
		movzx	eax, byte ptr [eax+edi+1800h]
		movzx	edi, [ebp+var_448]
		shl	eax, 4
		mov	[ebp+var_370], eax
		movzx	eax, byte ptr [ebp+var_428]
		add	al, byte ptr [ebp+var_370]
		mov	[ebp+var_370], edi
		shl	edi, 4
		mov	byte ptr [ebp+var_374],	al
		mov	[ebp+var_50], al
		movzx	eax, byte ptr [ebp+var_388]
		and	eax, 0Fh
		add	eax, edi
		movzx	edi, al
		mov	eax, dword ptr [oba_1BFD4]	;offset 
		movzx	eax, byte ptr [edi+eax+1B00h]
		mov	edi, [ebp+var_370]
		and	eax, 0Fh
		mov	byte ptr [ebp+var_428],	al
		movzx	eax, byte ptr [ebp+var_388]
		and	edi, 0F0h
		shr	al, 4
		movzx	eax, al
		add	eax, edi
		mov	edi, dword ptr [oba_1BFD4]	;offset
		movzx	eax, byte ptr [eax+edi+1A00h]
		movzx	edi, byte ptr [ebp+var_3E8]
		shl	eax, 4
		mov	[ebp+var_370], eax
		movzx	eax, byte ptr [ebp+var_428]
		add	al, byte ptr [ebp+var_370]
		mov	[ebp+var_370], edi
		shl	edi, 4
		mov	byte ptr [ebp+var_388],	al
		mov	[ebp+var_4F], al
		movzx	eax, byte ptr [ebp+var_3FC]
		and	eax, 0Fh
		add	eax, edi
		movzx	edi, al
		mov	eax, dword ptr [oba_1BFD4]	;offset 
		movzx	eax, byte ptr [edi+eax+1D00h]
		mov	edi, [ebp+var_370]
		and	eax, 0Fh
		mov	byte ptr [ebp+var_3E8],	al
		movzx	eax, byte ptr [ebp+var_3FC]
		and	edi, 0F0h
		shr	al, 4
		movzx	eax, al
		add	eax, edi
		mov	edi, dword ptr [oba_1BFD4]	;offset 
		movzx	eax, byte ptr [eax+edi+1C00h]
		shl	eax, 4
		mov	[ebp+var_370], eax
		movzx	eax, byte ptr [ebp+var_3E8]
		add	al, byte ptr [ebp+var_370]
		movzx	edi, byte ptr [ebp+var_438]
		mov	byte ptr [ebp+var_370],	al
		mov	[ebp+var_4E], al
		movzx	eax, byte ptr [ebp+var_418]
		mov	[ebp+var_3FC], edi
		shl	edi, 4
		and	eax, 0Fh
		add	eax, edi
		movzx	edi, al
		mov	eax, dword ptr [oba_1BFD4]	;offset 
		movzx	eax, byte ptr [edi+eax+1F00h]
		mov	edi, [ebp+var_3FC]
		and	eax, 0Fh
		mov	byte ptr [ebp+var_3E8],	al
		movzx	eax, byte ptr [ebp+var_418]
		and	edi, 0F0h
		shr	al, 4
		movzx	eax, al
		add	eax, edi
		mov	edi, dword ptr [oba_1BFD4]	;offset
		movzx	eax, byte ptr [eax+edi+1E00h]
		shl	eax, 4
		add	al, byte ptr [ebp+var_3E8]
		mov	[ebp+var_4D], al

loc_40E9:				; CODE XREF: calcHashAB+4D4Aj
		mov	edi, ecx
		movzx	ecx, byte ptr [ebp+var_3F8]
		mov	[ebp+var_488], 0
		mov	[ebp+var_47C], 0
		mov	byte ptr [ebp+var_3E8],	dl
		lea	esi, [esi+0]

loc_4110:				; CODE XREF: calcHashAB+3FC4j
		and	edi, 0FFh
		movzx	edx, byte ptr [ebp+var_3E8]
		and	esi, 0FFh
		add	edi, [ebp+var_47C]
		movzx	ecx, cl
		movzx	eax, al
		shl	edi, 2
		mov	[ebp+var_44C], edi
		mov	[ebp+var_368], edi
		mov	edi, [ebp+var_47C]
		lea	esi, [edi+esi+100h]
		lea	ecx, [edi+ecx+200h]
		lea	eax, [edi+eax+300h]
		lea	edi, [edi+edx+400h]
		mov	edx, edi
		mov	edi, [ebp+var_47C]
		shl	edx, 2
		mov	[ebp+var_358], edx
		movzx	edx, byte ptr [ebp+var_390]
		shl	eax, 2
		shl	esi, 2
		shl	ecx, 2
		mov	[ebp+var_364], esi
		lea	edi, [edi+edx+500h]
		mov	edx, edi
		mov	edi, [ebp+var_47C]
		shl	edx, 2
		mov	[ebp+var_354], edx
		movzx	edx, byte ptr [ebp+var_370]
		mov	[ebp+var_360], ecx
		mov	[ebp+var_35C], eax
		lea	edi, [edi+edx+600h]
		mov	edx, edi
		mov	edi, [ebp+var_47C]
		shl	edx, 2
		mov	[ebp+var_350], edx
		movzx	edx, byte ptr [ebp+var_394]
		lea	edi, [edi+edx+700h]
		mov	edx, edi
		mov	edi, [ebp+var_47C]
		shl	edx, 2
		mov	[ebp+var_34C], edx
		movzx	edx, byte ptr [ebp+var_3B8]
		lea	edi, [edi+edx+800h]
		mov	edx, edi
		mov	edi, [ebp+var_47C]
		shl	edx, 2
		mov	[ebp+var_348], edx
		movzx	edx, byte ptr [ebp+var_388]
		lea	edi, [edi+edx+900h]
		mov	edx, edi
		mov	edi, [ebp+var_47C]
		shl	edx, 2
		mov	[ebp+var_344], edx
		movzx	edx, byte ptr [ebp+var_3BC]
		lea	edi, [edi+edx+0A00h]
		mov	edx, edi
		mov	edi, [ebp+var_47C]
		shl	edx, 2
		mov	[ebp+var_340], edx
		movzx	edx, byte ptr [ebp+var_3A8]
		lea	edi, [edi+edx+0B00h]
		mov	edx, edi
		mov	edi, [ebp+var_47C]
		shl	edx, 2
		mov	[ebp+var_33C], edx
		movzx	edx, byte ptr [ebp+var_374]
		lea	edi, [edi+edx+0C00h]
		mov	edx, edi
		mov	edi, [ebp+var_47C]
		shl	edx, 2
		mov	[ebp+var_338], edx
		movzx	edx, byte ptr [ebp+var_3D8]
		lea	edi, [edi+edx+0D00h]
		mov	edx, edi
		shl	edx, 2
		mov	[ebp+var_334], edx
		movzx	edx, byte ptr [ebp+var_36C]
		mov	edi, [ebp+var_47C]
		mov	[ebp+var_460], 0
		mov	[ebp+var_36C], eax
		lea	edi, [edi+edx+0E00h]
		mov	edx, edi
		mov	edi, [ebp+var_47C]
		shl	edx, 2
		mov	[ebp+var_330], edx
		movzx	edx, byte ptr [ebp+var_38C]
		lea	edi, [edi+edx+0F00h]
		mov	edx, edi
		mov	edi, [ebp+var_44C]
		shl	edx, 2
		mov	[ebp+var_32C], edx
		mov	edx, [ebp+var_488]
		mov	[ebp+var_468], edx

loc_42FD:				; CODE XREF: calcHashAB+3F0Dj
		add	ecx, dword ptr [oba_1BFD0] 	;offset	20110922 11:20	error here
		add	edi, dword ptr [oba_1BFD0] 	;offset
		add	esi, dword ptr [oba_1BFD0]	;offset 
		mov	[ebp+var_474], ecx
		mov	ecx, [ebp+var_36C]
		add	ecx, dword ptr [oba_1BFD0]	;offset 
		mov	[ebp+var_370], edx
		xor	edx, edx
		mov	[ebp+var_394], 0
		mov	[ebp+var_46C], edi
		mov	[ebp+var_470], esi
		mov	[ebp+var_478], ecx

loc_4345:				; CODE XREF: calcHashAB+3EC4j
		mov	eax, [ebp+var_46C]
		mov	edi, [ebp+var_474]
		movzx	ecx, byte ptr [eax+edx]
		mov	eax, [ebp+var_470]
		movzx	esi, cl
		mov	[ebp+var_374], esi
		movzx	eax, byte ptr [eax+edx]
		movzx	esi, al
		mov	[ebp+var_69A], al
		mov	[ebp+dest], esi
		movzx	esi, byte ptr [edi+edx]
		mov	eax, esi
		movzx	eax, al
		mov	[ebp+var_388], eax
		mov	eax, [ebp+var_478]
		movzx	eax, byte ptr [eax+edx]
		mov	[ebp+var_699], al
		movzx	edi, al
		imul	eax, [ebp+dest], 0E5h
		mov	[ebp+var_458], edi
		mov	edi, 0FFFFFFF9h
		mov	[ebp+var_3E8], eax
		mov	eax, 0FFFFFFE5h
		mul	[ebp+var_69A]
		mov	[ebp+var_448], al
		movzx	eax, al
		sub	edi, eax
		mov	eax, edi
		mov	edi, [ebp+var_3E8]
		and	edi, 6
		lea	eax, [eax+edi*2]
		mov	edi, 1659AA2Fh
		sar	eax, 4
		sub	edi, eax
		not	eax
		or	eax, 1659AA31h
		neg	eax
		lea	eax, [edi+eax*2]
		mov	[ebp+var_450], eax
		mov	eax, 0FFFFFFCAh
		imul	eax, ecx
		lea	ecx, [ecx+ecx*2]
		lea	edi, [ecx+ecx*8]
		imul	ecx, [ebp+var_374], 0FFFFFF1Bh
		mov	byte ptr [ebp+var_38C],	al
		mov	eax, edi
		mov	byte ptr [ebp+var_36C],	al
		imul	eax, [ebp+var_374], 1CAh
		mov	[ebp+var_454], ecx
		mov	[ebp+var_390], eax
		mov	ecx, eax
		mov	eax, [ebp+var_454]
		or	ecx, 90F043A2h
		lea	edi, [eax+ecx+3787DE2Fh]
		movzx	eax, byte ptr [ebp+var_38C]
		movzx	ecx, byte ptr [ebp+var_36C]
		and	edi, 0D7h
		add	edi, edi
		or	eax, 0FFFFFFA2h
		lea	eax, [ecx+eax+2Fh]
		movzx	eax, al
		mov	ecx, eax
		sub	ecx, edi
		sub	edi, eax
		lea	eax, [edi+edi-1AFh]
		and	eax, 0E3879136h
		lea	eax, [ecx+eax-71C3C7C4h]
		mov	ecx, 0FFFFFFF9h
		imul	edi, [ebp+var_458], 0E5h
		mov	[ebp+var_44C], eax
		mov	eax, 0FFFFFFE5h
		mul	[ebp+var_699]
		mov	[ebp+var_3BC], edi
		and	edi, 6
		mov	byte ptr [ebp+var_3D8],	al
		movzx	eax, al
		sub	ecx, eax
		lea	eax, [ecx+edi*2]
		mov	edi, 1659AA2Fh
		sar	eax, 4
		mov	ecx, 0FFFFFFCAh
		sub	edi, eax
		not	eax
		or	eax, 1659AA31h
		neg	eax
		lea	eax, [edi+eax*2]
		mov	[ebp+var_438], eax
		mov	eax, esi
		imul	eax, ecx
		imul	edi, [ebp+var_388], 1CAh
		lea	esi, [esi+esi*2]
		lea	esi, [esi+esi*8]
		mov	byte ptr [ebp+var_3F8],	al
		imul	eax, [ebp+var_388], 0FFFFFF1Bh
		mov	[ebp+var_3FC], edi
		mov	[ebp+var_418], eax
		mov	ecx, [ebp+var_418]
		mov	eax, edi
		or	eax, 90F043A2h
		lea	edi, [ecx+eax+3787DE2Fh]
		movzx	eax, byte ptr [ebp+var_3F8]
		and	edi, 0D7h
		add	edi, edi
		or	eax, 0FFFFFFA2h
		lea	eax, [esi+eax+2Fh]
		movzx	eax, al
		mov	ecx, eax
		sub	ecx, edi
		sub	edi, eax
		lea	eax, [edi+edi-1AFh]
		and	eax, 0E3879136h
		lea	eax, [ecx+eax-71C3C7C4h]
		movzx	ecx, byte ptr [ebp+var_36C]
		mov	[ebp+var_428], eax
		movzx	eax, byte ptr [ebp+var_38C]
		or	eax, 0FFFFFFF4h
		lea	edi, [eax+ecx+6]
		mov	ecx, edi
		movzx	edi, cl
		mov	[ebp+var_3B8], edi
		mov	edi, [ebp+var_374]
		lea	ecx, [edi+edi*2]
		mov	edi, [ebp+var_3E8]
		lea	ecx, [ecx+ecx*8+6]
		add	ecx, eax
		mov	eax, [ebp+var_390]
		and	ecx, 0FCh
		mov	[ebp+var_38C], ecx
		mov	ecx, [ebp+var_454]
		add	edi, 4Ch
		or	eax, 4C582BF4h
		lea	eax, [ecx+eax-262C15FAh]
		movzx	ecx, [ebp+var_448]
		and	eax, 0FCh
		mov	[ebp+var_390], eax
		imul	eax, [ebp+dest], 0CAh
		add	ecx, 4Ch
		and	eax, 98h
		sub	edi, eax
		mov	eax, 0FFFFFFCAh
		mul	[ebp+var_69A]
		and	edi, 4Ah
		add	edi, edi
		and	eax, 0FFFFFF98h
		sub	cl, al
		movzx	eax, byte ptr [ebp+var_3F8]
		movzx	ecx, cl
		sub	edi, ecx
		imul	edi, 3B236295h
		or	eax, 0FFFFFFF4h
		lea	esi, [eax+esi+6]
		mov	ecx, esi
		movzx	esi, cl
		mov	[ebp+var_374], esi
		mov	esi, [ebp+var_388]
		mov	[ebp+var_3E8], edi
		mov	edi, [ebp+var_418]
		lea	ecx, [esi+esi*2]
		lea	ecx, [ecx+ecx*8+6]
		add	ecx, eax
		mov	eax, [ebp+var_3FC]
		and	ecx, 0FCh
		mov	[ebp+var_388], ecx
		or	eax, 4C582BF4h
		lea	ecx, [edi+eax-262C15FAh]
		mov	edi, [ebp+var_3BC]
		imul	eax, [ebp+var_458], 0CAh
		and	ecx, 0FCh
		add	edi, 4Ch
		and	eax, 98h
		sub	edi, eax
		movzx	eax, byte ptr [ebp+var_3D8]
		and	edi, 4Ah
		add	edi, edi
		lea	esi, [eax+4Ch]
		mov	eax, 0FFFFFFCAh
		mul	[ebp+var_699]
		and	eax, 0FFFFFF98h
		mov	byte ptr [ebp+var_36C],	al
		mov	eax, esi
		sub	al, byte ptr [ebp+var_36C]
		mov	esi, eax
		and	esi, 0FFh
		sub	edi, esi
		imul	edi, 3B236295h
		mov	[ebp+var_3BC], edi
		mov	esi, [ebp+var_460]
		mov	edi, 8E3C3764h
		add	esi, [ebp+var_480]
		mov	eax, [ebp+var_450]
		mov	[ebp+var_3D8], esi
		mov	esi, [ebp+var_450]
		sub	eax, 1659AA42h
		add	esi, esi
		and	esi, 0D34CAB9Ch
		sub	eax, esi
		mov	esi, edi
		sub	esi, [ebp+var_44C]
		add	eax, [ebp+var_370]
		sub	edi, [ebp+var_428]
		mov	[ebp+var_3A8], esi
		mov	esi, [ebp+var_44C]
		add	esi, esi
		and	esi, 0E3879136h
		add	esi, [ebp+var_3A8]
		and	esi, 0FFFFFFF0h
		sub	eax, esi
		mov	esi, dword ptr [oba_1BFC8]        ;offset
		movzx	eax, byte ptr [eax+esi]
		mov	esi, [ebp+var_438]
		shl	eax, 4
		and	eax, 0FFh
		add	esi, esi
		mov	[ebp+var_36C], eax
		mov	eax, [ebp+var_438]
		and	esi, 0D34CAB9Ch
		sub	eax, esi
		mov	esi, [ebp+var_468]
		mov	[ebp+var_3FC], eax
		mov	eax, [ebp+var_428]
		add	esi, [ebp+var_394]
		add	eax, eax
		and	eax, 0E3879136h
		lea	eax, [edi+eax]
		mov	edi, [ebp+var_3FC]
		and	eax, 0FFFFFFF0h
		mov	[ebp+var_44C], eax
		mov	[ebp+var_3A8], esi
		lea	eax, [edi+esi-1659AA42h]
		mov	esi, dword ptr [oba_1BFC8] 	;offset
		sub	eax, [ebp+var_44C]
		mov	edi, dword ptr [oba_1BFC8] 	;offset
		movzx	eax, byte ptr [eax+esi+200h]	;error here
		mov	esi, [ebp+var_370]
		add	esi, [ebp+var_36C]
		and	eax, 0Fh
		lea	eax, [esi+eax]
		mov	esi, 71C3C79Fh
		movzx	eax, byte ptr [eax+edi+400h]
		mov	edi, [ebp+var_374]
		shl	eax, 4
		mov	[ebp+var_36C], eax
		mov	eax, esi
		sub	eax, [ebp+var_374]
		lea	eax, [eax+ecx*2]
		add	ecx, ecx
		sub	ecx, [ebp+var_374]
		lea	ecx, [ecx+ecx-1F9h]
		and	ecx, 0E3879136h
		sub	eax, ecx
		mov	ecx, [ebp+var_388]
		neg	ecx
		lea	ecx, [edi+ecx*2+61h]
		mov	[ebp+var_3FC], ecx
		mov	ecx, [ebp+var_388]
		sub	esi, [ebp+var_3B8]
		add	ecx, ecx
		sub	ecx, edi
		mov	edi, [ebp+var_3BC]
		lea	ecx, [ecx+ecx+7]
		and	ecx, 36h
		add	ecx, [ebp+var_3FC]
		add	ecx, ecx
		and	ecx, 6
		lea	ecx, [eax+ecx+4]
		lea	eax, [edi+edi*2-48AF7D36h]
		not	ecx
		mov	edi, eax
		add	eax, eax
		neg	edi
		or	eax, 6
		shl	ecx, 4
		and	ecx, 0FFh
		lea	eax, [edi+eax+5]
		mov	edi, dword ptr [oba_1BFC8] 		;offset
		add	ecx, [ebp+var_3A8]
		and	eax, 0Fh
		xor	eax, 0Bh
		add	ecx, eax
		movzx	eax, byte ptr [ecx+edi+300h]
		mov	edi, [ebp+var_390]
		and	eax, 0Fh
		lea	ecx, [esi+edi*2]
		mov	esi, edi
		mov	edi, [ebp+var_3B8]
		add	esi, esi
		sub	esi, [ebp+var_3B8]
		lea	esi, [esi+esi-1F9h]
		and	esi, 0E3879136h
		sub	ecx, esi
		mov	esi, [ebp+var_38C]
		neg	esi
		lea	esi, [edi+esi*2+61h]
		mov	[ebp+var_374], esi
		mov	esi, [ebp+var_38C]
		add	esi, esi
		sub	esi, edi
		mov	edi, [ebp+var_3E8]
		lea	esi, [esi+esi+7]
		and	esi, 36h
		add	esi, [ebp+var_374]
		add	esi, esi
		and	esi, 6
		lea	esi, [ecx+esi+4]
		not	esi
		lea	ecx, [edi+edi*2-48AF7D36h]
		shl	esi, 4
		mov	edi, ecx
		and	esi, 0FFh
		neg	edi
		add	ecx, ecx
		or	ecx, 6
		add	esi, [ebp+var_3A8]
		lea	ecx, [edi+ecx+5]
		mov	edi, dword ptr [oba_1BFC8] 		;offset
		and	ecx, 0Fh
		xor	ecx, 0Bh
		add	esi, ecx
		movzx	ecx, byte ptr [esi+edi+100h]
		add	eax, [ebp+var_370]
		shl	ecx, 4
		and	ecx, 0FFh
		lea	ecx, [eax+ecx]
		movzx	eax, byte ptr [ecx+edi+500h]
		mov	ecx, [ebp+var_3D8]
		and	eax, 0Fh
		add	al, byte ptr [ebp+var_36C]
		mov	[ecx+edx], al
		add	edx, 1
		add	[ebp+var_370], 600h
		add	[ebp+var_394], 600h
		cmp	edx, 4
		jnz	loc_4345
		add	[ebp+var_460], 4
		add	[ebp+var_468], 1800h
		cmp	[ebp+var_460], 10h
		jz	short loc_4988
		mov	esi, [ebp+var_460]
		mov	eax, [ebp+var_464]
		mov	edx, esi
		mov	edi, [eax+esi*4]
		mov	ecx, [eax+edx*4+8]
		mov	esi, [eax+esi*4+4]
		mov	eax, [eax+edx*4+0Ch]
		mov	edx, [ebp+var_468]
		mov	[ebp+var_36C], eax
		jmp	loc_42FD
; ---------------------------------------------------------------------------
		align 8

loc_4988:				; CODE XREF: calcHashAB+3EE2j
		add	[ebp+var_47C], 1000h
		add	[ebp+var_488], 6000h
		cmp	[ebp+var_47C], 9000h
		jz	loc_4BEB
		movzx	edx, [ebp+var_58]
		movzx	edi, [ebp+var_5C]
		movzx	esi, [ebp+var_57]
		movzx	ecx, [ebp+var_52]
		mov	byte ptr [ebp+var_3E8],	dl
		movzx	edx, [ebp+var_53]
		movzx	eax, [ebp+var_4D]
		mov	byte ptr [ebp+var_390],	dl
		movzx	edx, [ebp+var_4E]
		mov	byte ptr [ebp+var_370],	dl
		movzx	edx, [ebp+var_59]
		mov	byte ptr [ebp+var_394],	dl
		movzx	edx, [ebp+var_54]
		mov	byte ptr [ebp+var_3B8],	dl
		movzx	edx, [ebp+var_4F]
		mov	byte ptr [ebp+var_388],	dl
		movzx	edx, [ebp+var_5A]
		mov	byte ptr [ebp+var_3BC],	dl
		movzx	edx, [ebp+var_55]
		mov	byte ptr [ebp+var_3A8],	dl
		movzx	edx, [ebp+var_50]
		mov	byte ptr [ebp+var_374],	dl
		movzx	edx, [ebp+var_5B]
		mov	byte ptr [ebp+var_3D8],	dl
		movzx	edx, [ebp+var_56]
		mov	byte ptr [ebp+var_36C],	dl
		movzx	edx, [ebp+var_51]
		mov	byte ptr [ebp+var_38C],	dl
		jmp	loc_4110
; ---------------------------------------------------------------------------

loc_4A39:				; CODE XREF: calcHashAB+FCFj
		mov	esi, dword ptr [off_1BFE8] 		;offset
		mov	edi, [ebp+var_370]
		movzx	edi, byte ptr [esi+edi]
		movzx	esi, byte ptr [ecx+esi+100h]
		mov	[ebp+var_370], edi
		mov	ecx, edi
		jmp	loc_1A69
; ---------------------------------------------------------------------------

loc_4A5E:				; CODE XREF: calcHashAB+BB1j
		mov	edi, dword ptr [off_1BFE8]	;offset	 
		movzx	esi, byte ptr [edi+esi]
		movzx	ecx, byte ptr [ecx+edi+100h]
		jmp	loc_1639
; ---------------------------------------------------------------------------

loc_4A75:				; CODE XREF: calcHashAB+B38j
		mov	edi, dword ptr [off_1BFE8]	;offset 
		movzx	esi, byte ptr [edi+esi]
		movzx	ecx, byte ptr [ecx+edi+100h]
		jmp	loc_15C0
; ---------------------------------------------------------------------------

loc_4A8C:				; CODE XREF: calcHashAB+ABFj
		mov	edi, dword ptr [off_1BFE8]	;offset 
		movzx	esi, byte ptr [edi+esi]
		movzx	ecx, byte ptr [ecx+edi+100h]
		jmp	loc_1547
; ---------------------------------------------------------------------------

loc_4AA3:				; CODE XREF: calcHashAB+A46j
		mov	edi, dword ptr [off_1BFE8]	;offset 
		movzx	esi, byte ptr [edi+esi]
		movzx	ecx, byte ptr [ecx+edi+100h]
		jmp	loc_14CE
; ---------------------------------------------------------------------------

loc_4ABA:				; CODE XREF: calcHashAB+9CDj
		mov	edi, dword ptr [off_1BFE8]	;offset 
		movzx	esi, byte ptr [edi+esi]
		movzx	ecx, byte ptr [ecx+edi+100h]
		jmp	loc_1455
; ---------------------------------------------------------------------------

loc_4AD1:				; CODE XREF: calcHashAB+954j
		mov	edi, dword ptr [off_1BFE8] 	;offset
		movzx	esi, byte ptr [edi+esi]
		movzx	ecx, byte ptr [ecx+edi+100h]
		jmp	loc_13DC
; ---------------------------------------------------------------------------

loc_4AE8:				; CODE XREF: calcHashAB+8DBj
		mov	edi, [ebp+var_5A0]
		movzx	esi, byte ptr [edi+esi]
		movzx	ecx, byte ptr [ecx+edi+100h]
		jmp	loc_1363
; ---------------------------------------------------------------------------

loc_4AFF:				; CODE XREF: calcHashAB+858j
		mov	edi, dword ptr [off_1BFA0]	;offset 
		mov	esi, [ebp+var_484]
		movzx	esi, byte ptr [edi+esi]
		mov	[ebp+var_484], esi
		mov	esi, [ebp+var_370]
		movzx	ecx, byte ptr [esi+edi+100h]
		mov	esi, [ebp+var_484]
		jmp	loc_12F0
; ---------------------------------------------------------------------------

loc_4B2E:				; CODE XREF: calcHashAB+DA1j
		mov	esi, edi
		mov	edi, dword ptr [off_1BFE8]	;offset 
		mov	ecx, [ebp+var_370]
		movzx	esi, byte ptr [edi+esi]
		mov	[ebp+var_36C], esi
		movzx	esi, byte ptr [ecx+edi+100h]
		jmp	loc_1837
; ---------------------------------------------------------------------------

loc_4B53:				; CODE XREF: calcHashAB+D1Cj
		mov	edi, dword ptr [off_1BFE8]	;offset 
		movzx	esi, byte ptr [edi+esi]
		movzx	ecx, byte ptr [ecx+edi+100h]
		jmp	loc_17A4
; ---------------------------------------------------------------------------

loc_4B6A:				; CODE XREF: calcHashAB+CA3j
		mov	edi, dword ptr [off_1BFE8]	;offset 
		movzx	esi, byte ptr [edi+esi]
		movzx	ecx, byte ptr [ecx+edi+100h]
		jmp	loc_172B
; ---------------------------------------------------------------------------

loc_4B81:				; CODE XREF: calcHashAB+C2Aj
		mov	edi, dword ptr [off_1BFE8]	;offset 
		movzx	esi, byte ptr [edi+esi]
		movzx	ecx, byte ptr [ecx+edi+100h]
		jmp	loc_16B2
; ---------------------------------------------------------------------------

loc_4B98:				; CODE XREF: calcHashAB+EC9j
		mov	esi, dword ptr [off_1BFE8]	;;offset 
		movzx	edi, byte ptr [esi+edi]
		movzx	esi, byte ptr [ecx+esi+100h]
		jmp	loc_1951
; ---------------------------------------------------------------------------

loc_4BAF:				; CODE XREF: calcHashAB+E3Cj
		mov	esi, dword ptr [off_1BFE8]	;offset 
		mov	edi, [ebp+var_370]
		movzx	edi, byte ptr [esi+edi]
		movzx	esi, byte ptr [ecx+esi+100h]
		mov	[ebp+var_370], edi
		mov	ecx, edi
		jmp	loc_18D6
; ---------------------------------------------------------------------------

loc_4BD4:				; CODE XREF: calcHashAB+F46j
		mov	esi, dword ptr [off_1BFE8]	;offset 
		movzx	edi, byte ptr [esi+edi]
		movzx	esi, byte ptr [ecx+esi+100h]
		jmp	loc_19CE
; ---------------------------------------------------------------------------

loc_4BEB:				; CODE XREF: calcHashAB+3F36j
		movzx	ecx, [ebp+var_5B]
		movzx	edi, [ebp+var_5C]
		movzx	edx, [ebp+var_56]
		movzx	eax, [ebp+var_5A]
		mov	byte ptr [ebp+var_374],	cl
		movzx	ecx, [ebp+var_51]
		movzx	esi, [ebp+var_55]
		mov	byte ptr [ebp+var_388],	dl
		movzx	edx, [ebp+var_59]
		movzx	eax, al
		mov	byte ptr [ebp+var_370],	cl
		mov	ecx, dword ptr [oba_1BFC4]	;offset 
		and	esi, 0FFh
		movzx	edx, dl
		movzx	ecx, byte ptr [edi+ecx]
		movzx	edi, [ebp+var_57]
		mov	[ebp+var_5C], cl
		mov	ecx, dword ptr [oba_1BFC4]	;offset 
		movzx	ecx, byte ptr [edi+ecx+100h]
		movzx	edi, [ebp+var_52]
		mov	[ebp+var_5B], cl
		mov	ecx, dword ptr [oba_1BFC4]	;offset 
		movzx	ecx, byte ptr [edi+ecx+200h]
		movzx	edi, [ebp+var_4D]
		mov	[ebp+var_5A], cl
		mov	ecx, dword ptr [oba_1BFC4]	;offset 
		movzx	ecx, byte ptr [edi+ecx+300h]
		movzx	edi, [ebp+var_58]
		mov	[ebp+var_59], cl
		mov	ecx, dword ptr [oba_1BFC4]	;offset 
		movzx	ecx, byte ptr [edi+ecx+400h]
		movzx	edi, [ebp+var_53]
		mov	[ebp+var_58], cl
		mov	ecx, dword ptr [oba_1BFC4]	;offset 
		movzx	ecx, byte ptr [edi+ecx+500h]
		movzx	edi, [ebp+var_4E]
		mov	[ebp+var_57], cl
		mov	ecx, dword ptr [oba_1BFC4]	;offset 
		movzx	ecx, byte ptr [edi+ecx+600h]
		mov	[ebp+var_56], cl
		mov	edi, dword ptr [oba_1BFC4]	;offset
		mov	ecx, [ebp+var_480]
		movzx	edx, byte ptr [edx+edi+700h]
		mov	[ebp+var_55], dl
		movzx	edx, [ebp+var_54]
		movzx	edx, byte ptr [edx+edi+800h]
		mov	[ebp+var_54], dl
		movzx	edx, [ebp+var_4F]
		movzx	edx, byte ptr [edx+edi+900h]
		mov	[ebp+var_53], dl
		movzx	eax, byte ptr [eax+edi+0A00h]
		mov	edx, dword ptr [oba_1BFC4]	;offset 
		mov	[ebp+var_52], al
		movzx	eax, byte ptr [esi+edi+0B00h]
		mov	esi, [ebp+var_48C]
		mov	[ebp+var_51], al
		movzx	eax, [ebp+var_50]
		movzx	eax, byte ptr [eax+edi+0C00h]
		movzx	edi, byte ptr [ebp+var_374]
		mov	[ebp+var_50], al
		movzx	eax, byte ptr [edi+edx+0D00h]
		mov	[ebp+var_4F], al
		movzx	eax, byte ptr [ebp+var_388]
		movzx	eax, byte ptr [eax+edx+0E00h]
		mov	[ebp+var_4E], al
		movzx	eax, byte ptr [ebp+var_370]
		movzx	eax, byte ptr [eax+edx+0F00h]
		mov	edx, ecx
		mov	[ebp+var_4D], al
		mov	eax, [ecx]
		mov	[esi], eax
		mov	eax, [ecx+4]
		mov	[esi+4], eax
		mov	eax, [ecx+8]
		mov	[esi+8], eax
		mov	eax, [ecx+0Ch]
		mov	[esi+0Ch], eax
		add	esi, 10h
		add	[ebp+var_490], 1
		cmp	[ebp+var_490], 2
		mov	[ebp+var_48C], esi
		jnz	loc_3746
		lea	eax, offset unk_19FC0	;offset nochange
		mov	edi, [ebp+var_464]
		mov	ecx, 37h
		mov	esi, eax
		xor	eax, eax
		rep movsd
		mov	ecx, [ebp+var_498]
		db	66h
		nop

loc_4DA0:				; CODE XREF: calcHashAB+4361j
		mov	edx, [ebp+var_464]
		mov	esi, [ebp+var_484]
		add	esi, [edx+eax*4]
		mov	[ebp+var_36C], esi
		movzx	edx, byte ptr [ecx+eax+2]
		movzx	esi, byte ptr [esi]
		mov	edi, [ebp+var_36C]
		mov	[edi], dl
		mov	edx, esi
		mov	[ecx+eax+2], dl
		add	eax, 1
		cmp	eax, 37h
		jnz	short loc_4DA0
		mov	esi, [ebp+var_498]
		xor	al, al
		nop
		lea	esi, [esi+0]

loc_4DE0:				; CODE XREF: calcHashAB+4398j
		movzx	ecx, byte ptr [esi+eax+2]
		imul	edi, ecx, 8Dh
		imul	edx, ecx, 11Ah
		add	edi, 5Dh
		and	edx, 0BAh
		mov	ecx, edi
		sub	cl, dl
		mov	[esi+eax+2], cl
		add	eax, 1
		cmp	eax, 37h
		jnz	short loc_4DE0
		mov	esi, [ebp+var_1C]
		xor	esi,dword ptr [gsdata] ;xor	esi, large gs:14h
		jnz	loc_57BF
		add	esp, 6FCh
		pop	ebx
		pop	esi
		pop	edi
		pop	ebp
		retn
; ---------------------------------------------------------------------------

loc_4E25:				; CODE XREF: calcHashAB+2CDEj
		mov	ecx, dword ptr [oba_1BFE0]	;offset 
		movzx	eax, byte ptr [ebp+var_E0+1]
		movzx	eax, byte ptr [eax+ecx+100h]
		mov	byte ptr [ebp+var_3D8],	al
		movzx	eax, byte ptr [ebp+var_E0+2]
		movzx	eax, byte ptr [eax+ecx+200h]
		mov	byte ptr [ebp+var_3BC],	al
		movzx	eax, byte ptr [ebp+var_E0+3]
		movzx	eax, byte ptr [eax+ecx+300h]
		mov	byte ptr [ebp+var_474],	al
		movzx	eax, byte ptr [ebp+var_DC]
		movzx	eax, byte ptr [eax+ecx+400h]
		mov	byte ptr [ebp+var_470],	al
		movzx	eax, byte ptr [ebp+var_DC+1]
		movzx	eax, byte ptr [eax+ecx+500h]
		mov	byte ptr [ebp+var_46C],	al
		movzx	eax, byte ptr [ebp+var_DC+2]
		movzx	eax, byte ptr [eax+ecx+600h]
		mov	byte ptr [ebp+var_468],	al
		movzx	eax, byte ptr [ebp+var_DC+3]
		movzx	eax, byte ptr [eax+ecx+700h]
		mov	byte ptr [ebp+var_460],	al
		movzx	eax, byte ptr [ebp+var_D8]
		movzx	eax, byte ptr [eax+ecx+800h]
		mov	byte ptr [ebp+dest], al
		movzx	eax, byte ptr [ebp+var_D8+1]
		movzx	eax, byte ptr [eax+ecx+900h]
		mov	byte ptr [ebp+var_458],	al
		movzx	eax, byte ptr [ebp+var_D8+2]
		movzx	eax, byte ptr [eax+ecx+0A00h]
		mov	byte ptr [ebp+var_450],	al
		movzx	eax, byte ptr [ebp+var_D8+3]
		movzx	eax, byte ptr [eax+ecx+0B00h]
		mov	byte ptr [ebp+var_44C],	al
		movzx	eax, byte ptr [ebp+var_D4]
		mov	esi, dword ptr [oba_1BFC0]	;offset 
		movzx	eax, byte ptr [eax+ecx+0C00h]
		mov	byte ptr [ebp+var_454],	al
		movzx	eax, byte ptr [ebp+var_D4+1]
		movzx	eax, byte ptr [eax+ecx+0D00h]
		mov	[ebp+var_448], al
		movzx	eax, byte ptr [ebp+var_D4+2]
		movzx	eax, byte ptr [eax+ecx+0E00h]
		mov	byte ptr [ebp+var_3E8],	al
		movzx	eax, byte ptr [ebp+var_D4+3]
		movzx	eax, byte ptr [eax+ecx+0F00h]
		mov	byte ptr [ebp+var_438],	al
		movzx	eax, byte ptr [edx]
		movzx	edi, byte ptr [edx+2]
		movzx	ecx, byte ptr [eax+esi]
		movzx	eax, byte ptr [edx+1]
		movzx	esi, byte ptr [eax+esi+100h]
		mov	eax, dword ptr [oba_1BFC0]	;offset 
		movzx	eax, byte ptr [edi+eax+200h]
		mov	byte ptr [ebp+var_47C],	al
		mov	eax, dword ptr [oba_1BFC0]	;offset 
		movzx	edi, byte ptr [edx+3]
		movzx	eax, byte ptr [edi+eax+300h]
		mov	byte ptr [ebp+var_394],	al
		mov	eax, dword ptr [oba_1BFC0]	;offset 
		movzx	edi, byte ptr [edx+4]
		movzx	eax, byte ptr [edi+eax+400h]
		mov	byte ptr [ebp+var_428],	al
		mov	eax, dword ptr [oba_1BFC0]	;offset 
		movzx	edi, byte ptr [edx+5]
		movzx	eax, byte ptr [edi+eax+500h]
		mov	byte ptr [ebp+var_370],	al
		mov	eax, dword ptr [oba_1BFC0]	;offset 
		movzx	edi, byte ptr [edx+6]
		movzx	eax, byte ptr [edi+eax+600h]
		mov	byte ptr [ebp+var_36C],	al
		movzx	edi, byte ptr [edx+7]
		mov	eax, dword ptr [oba_1BFC0]	;offset 
		movzx	eax, byte ptr [edi+eax+700h]
		mov	byte ptr [ebp+var_3A8],	al
		mov	eax, dword ptr [oba_1BFC0]	;offset
		movzx	edi, byte ptr [edx+8]
		movzx	eax, byte ptr [edi+eax+800h]
		mov	byte ptr [ebp+var_3B8],	al
		mov	eax, dword ptr [oba_1BFC0]	;offset 
		movzx	edi, byte ptr [edx+9]
		movzx	eax, byte ptr [edi+eax+900h]
		mov	byte ptr [ebp+var_390],	al
		mov	eax, dword ptr [oba_1BFC0]	;offset 
		movzx	edi, byte ptr [edx+0Ah]
		movzx	eax, byte ptr [edi+eax+0A00h]
		mov	byte ptr [ebp+var_3F8],	al
		mov	eax, dword ptr [oba_1BFC0]	;offset
		movzx	edi, byte ptr [edx+0Bh]
		movzx	eax, byte ptr [edi+eax+0B00h]
		mov	byte ptr [ebp+var_38C],	al
		mov	eax, dword ptr [oba_1BFC0]	;offset 
		movzx	edi, byte ptr [edx+0Ch]
		movzx	eax, byte ptr [edi+eax+0C00h]
		mov	byte ptr [ebp+var_374],	al
		mov	eax, dword ptr [oba_1BFC0]	;offset 
		movzx	edi, byte ptr [edx+0Dh]
		movzx	eax, byte ptr [edi+eax+0D00h]
		mov	byte ptr [ebp+var_388],	al
		mov	eax, dword ptr [oba_1BFC0]	;offset
		movzx	edi, byte ptr [edx+0Eh]
		movzx	eax, byte ptr [edi+eax+0E00h]
		mov	byte ptr [ebp+var_3FC],	al
		movzx	eax, byte ptr [edx+0Fh]
		mov	edx, dword ptr [oba_1BFC0]	;offset
		movzx	eax, byte ptr [eax+edx+0F00h]
		mov	byte ptr [ebp+var_418],	al
		mov	edi, dword ptr [oba_1BFE0]	;offset 
		movzx	edx, byte ptr [ebp+var_E0]
		movzx	edx, byte ptr [edx+edi]
		mov	edi, 0Fh
		and	edi, ecx
		shr	cl, 4
		movzx	ecx, cl
		mov	eax, edx
		and	edx, 0F0h
		shl	eax, 4
		mov	[ebp+var_478], eax
		lea	eax, [edi+eax]
		mov	edi, dword ptr [oba_1BFDC]	;offset
		and	eax, 0FFh
		lea	edx, [ecx+edx]
		movzx	ecx, byte ptr [edx+edi]
		mov	edx, esi
		movzx	eax, byte ptr [eax+edi+100h]
		and	edx, 0Fh
		shl	ecx, 4
		and	eax, 0Fh
		lea	ecx, [eax+ecx]
		movzx	eax, byte ptr [ebp+var_3D8]
		mov	[ebp+var_5C], cl
		mov	edi, eax
		shl	edi, 4
		add	edx, edi
		mov	edi, dword ptr [oba_1BFDC]	;offset 
		and	edx, 0FFh
		movzx	edx, byte ptr [edx+edi+300h]
		mov	edi, eax
		mov	eax, esi
		mov	esi, dword ptr [oba_1BFDC]	;offset 
		shr	al, 4
		and	edi, 0F0h
		movzx	eax, al
		add	eax, edi
		mov	edi, dword ptr [oba_1BFDC]	;offset 
		and	edx, 0Fh
		movzx	eax, byte ptr [eax+esi+200h]
		shl	eax, 4
		lea	eax, [edx+eax]
		movzx	edx, byte ptr [ebp+var_47C]
		mov	byte ptr [ebp+var_3D8],	al
		mov	[ebp+var_5B], al
		movzx	eax, byte ptr [ebp+var_3BC]
		and	edx, 0Fh
		mov	esi, eax
		shl	esi, 4
		add	edx, esi
		mov	esi, eax
		movzx	eax, byte ptr [ebp+var_47C]
		and	esi, 0F0h
		and	edx, 0FFh
		movzx	edx, byte ptr [edx+edi+500h]
		shr	al, 4
		movzx	eax, al
		lea	eax, [esi+eax]
		and	edx, 0Fh
		movzx	eax, byte ptr [eax+edi+400h]
		shl	eax, 4
		lea	eax, [edx+eax]
		movzx	edx, byte ptr [ebp+var_394]
		mov	byte ptr [ebp+var_3BC],	al
		mov	[ebp+var_5A], al
		movzx	eax, byte ptr [ebp+var_474]
		and	edx, 0Fh
		mov	esi, eax
		shl	esi, 4
		add	edx, esi
		mov	esi, eax
		movzx	eax, byte ptr [ebp+var_394]
		and	esi, 0F0h
		and	edx, 0FFh
		movzx	edx, byte ptr [edx+edi+700h]
		shr	al, 4
		movzx	eax, al
		lea	eax, [esi+eax]
		and	edx, 0Fh
		movzx	eax, byte ptr [eax+edi+600h]
		shl	eax, 4
		lea	eax, [edx+eax]
		movzx	edx, byte ptr [ebp+var_428]
		mov	byte ptr [ebp+var_394],	al
		mov	[ebp+var_59], al
		movzx	eax, byte ptr [ebp+var_470]
		and	edx, 0Fh
		mov	esi, eax
		shl	esi, 4
		add	edx, esi
		mov	esi, eax
		movzx	eax, byte ptr [ebp+var_428]
		and	esi, 0F0h
		and	edx, 0FFh
		movzx	edx, byte ptr [edx+edi+900h]
		shr	al, 4
		movzx	eax, al
		lea	eax, [esi+eax]
		and	edx, 0Fh
		movzx	eax, byte ptr [eax+edi+800h]
		shl	eax, 4
		add	edx, eax
		mov	[ebp+var_58], dl
		movzx	esi, byte ptr [ebp+var_46C]
		movzx	eax, byte ptr [ebp+var_370]
		mov	edi, esi
		and	esi, 0F0h
		shl	edi, 4
		and	eax, 0Fh
		add	eax, edi
		movzx	edi, al
		mov	eax, dword ptr [oba_1BFDC]	;offset 
		movzx	edi, byte ptr [edi+eax+0B00h]
		movzx	eax, byte ptr [ebp+var_370]
		and	edi, 0Fh
		shr	al, 4
		movzx	eax, al
		add	esi, eax
		mov	eax, dword ptr [oba_1BFDC]	;offset 
		movzx	esi, byte ptr [esi+eax+0A00h]
		shl	esi, 4
		lea	esi, [edi+esi]
		movzx	edi, byte ptr [ebp+var_468]
		mov	eax, esi
		mov	[ebp+var_57], al
		movzx	eax, byte ptr [ebp+var_36C]
		mov	[ebp+var_370], edi
		shl	edi, 4
		and	eax, 0Fh
		add	eax, edi
		movzx	edi, al
		mov	eax, dword ptr [oba_1BFDC]	;;offset 
		movzx	eax, byte ptr [edi+eax+0D00h]
		mov	edi, [ebp+var_370]
		and	eax, 0Fh
		mov	byte ptr [ebp+var_428],	al
		movzx	eax, byte ptr [ebp+var_36C]
		and	edi, 0F0h
		shr	al, 4
		movzx	eax, al
		add	eax, edi
		mov	edi, dword ptr [oba_1BFDC]	;offset 
		movzx	eax, byte ptr [eax+edi+0C00h]
		movzx	edi, byte ptr [ebp+var_460]
		shl	eax, 4
		mov	[ebp+var_36C], eax
		movzx	eax, byte ptr [ebp+var_428]
		add	al, byte ptr [ebp+var_36C]
		mov	[ebp+var_370], edi
		shl	edi, 4
		mov	byte ptr [ebp+var_36C],	al
		mov	[ebp+var_56], al
		movzx	eax, byte ptr [ebp+var_3A8]
		and	eax, 0Fh
		add	eax, edi
		movzx	edi, al
		mov	eax, dword ptr [oba_1BFDC]	;offset 
		movzx	eax, byte ptr [edi+eax+0F00h]
		mov	edi, [ebp+var_370]
		and	eax, 0Fh
		mov	byte ptr [ebp+var_428],	al
		movzx	eax, byte ptr [ebp+var_3A8]
		and	edi, 0F0h
		shr	al, 4
		movzx	eax, al
		add	eax, edi
		mov	edi, dword ptr [oba_1BFDC]	;offset
		movzx	eax, byte ptr [eax+edi+0E00h]
		shl	eax, 4
		mov	[ebp+var_370], eax
		movzx	eax, byte ptr [ebp+var_428]
		add	al, byte ptr [ebp+var_370]
		movzx	edi, byte ptr [ebp+dest]
		mov	byte ptr [ebp+var_3A8],	al
		mov	[ebp+var_55], al
		movzx	eax, byte ptr [ebp+var_3B8]
		mov	[ebp+var_370], edi
		shl	edi, 4
		and	eax, 0Fh
		add	eax, edi
		movzx	edi, al
		mov	eax, dword ptr [oba_1BFDC]	;offset
		movzx	eax, byte ptr [edi+eax+1100h]
		mov	edi, [ebp+var_370]
		and	eax, 0Fh
		mov	byte ptr [ebp+var_428],	al
		movzx	eax, byte ptr [ebp+var_3B8]
		and	edi, 0F0h
		shr	al, 4
		movzx	eax, al
		add	eax, edi
		mov	edi, dword ptr [oba_1BFDC]	;offset 
		movzx	eax, byte ptr [eax+edi+1000h]
		movzx	edi, byte ptr [ebp+var_458]
		shl	eax, 4
		mov	[ebp+var_370], eax
		movzx	eax, byte ptr [ebp+var_428]
		add	al, byte ptr [ebp+var_370]
		mov	[ebp+var_370], edi
		shl	edi, 4
		mov	byte ptr [ebp+var_3B8],	al
		mov	[ebp+var_54], al
		movzx	eax, byte ptr [ebp+var_390]
		and	eax, 0Fh
		add	eax, edi
		movzx	edi, al
		mov	eax, dword ptr [oba_1BFDC]	;offset 
		movzx	eax, byte ptr [edi+eax+1300h]
		mov	edi, [ebp+var_370]
		and	eax, 0Fh
		mov	byte ptr [ebp+var_428],	al
		movzx	eax, byte ptr [ebp+var_390]
		and	edi, 0F0h
		shr	al, 4
		movzx	eax, al
		add	eax, edi
		mov	edi, dword ptr [oba_1BFDC]	;offset
		movzx	eax, byte ptr [eax+edi+1200h]
		shl	eax, 4
		mov	[ebp+var_370], eax
		movzx	eax, byte ptr [ebp+var_428]
		add	al, byte ptr [ebp+var_370]
		mov	byte ptr [ebp+var_390],	al
		mov	[ebp+var_53], al
		movzx	edi, byte ptr [ebp+var_450]
		movzx	eax, byte ptr [ebp+var_3F8]
		mov	[ebp+var_370], edi
		shl	edi, 4
		and	eax, 0Fh
		add	eax, edi
		movzx	edi, al
		mov	eax, dword ptr [oba_1BFDC]	;offset 
		movzx	eax, byte ptr [edi+eax+1500h]
		mov	edi, [ebp+var_370]
		and	eax, 0Fh
		mov	byte ptr [ebp+var_428],	al
		movzx	eax, byte ptr [ebp+var_3F8]
		and	edi, 0F0h
		shr	al, 4
		movzx	eax, al
		add	eax, edi
		mov	edi, dword ptr [oba_1BFDC]	;offset 
		movzx	eax, byte ptr [eax+edi+1400h]
		movzx	edi, byte ptr [ebp+var_44C]
		shl	eax, 4
		mov	[ebp+var_370], eax
		movzx	eax, byte ptr [ebp+var_428]
		add	al, byte ptr [ebp+var_370]
		mov	[ebp+var_370], edi
		shl	edi, 4
		mov	byte ptr [ebp+var_3F8],	al
		mov	[ebp+var_52], al
		movzx	eax, byte ptr [ebp+var_38C]
		and	eax, 0Fh
		add	eax, edi
		movzx	edi, al
		mov	eax, dword ptr [oba_1BFDC]	;offset 
		movzx	eax, byte ptr [edi+eax+1700h]
		mov	edi, [ebp+var_370]
		and	eax, 0Fh
		mov	byte ptr [ebp+var_428],	al
		movzx	eax, byte ptr [ebp+var_38C]
		and	edi, 0F0h
		shr	al, 4
		movzx	eax, al
		add	eax, edi
		mov	edi, dword ptr [oba_1BFDC]	;offset
		movzx	eax, byte ptr [eax+edi+1600h]
		movzx	edi, byte ptr [ebp+var_454]
		shl	eax, 4
		mov	[ebp+var_370], eax
		movzx	eax, byte ptr [ebp+var_428]
		add	al, byte ptr [ebp+var_370]
		mov	[ebp+var_370], edi
		shl	edi, 4
		mov	byte ptr [ebp+var_38C],	al
		mov	[ebp+var_51], al
		movzx	eax, byte ptr [ebp+var_374]
		and	eax, 0Fh
		add	eax, edi
		movzx	edi, al
		mov	eax, dword ptr [oba_1BFDC]	;offset 
		movzx	eax, byte ptr [edi+eax+1900h]
		and	eax, 0Fh
		mov	byte ptr [ebp+var_428],	al
		movzx	eax, byte ptr [ebp+var_374]
		mov	edi, [ebp+var_370]
		shr	al, 4
		and	edi, 0F0h
		movzx	eax, al
		add	eax, edi
		mov	edi, dword ptr [oba_1BFDC]	;offset
		movzx	eax, byte ptr [eax+edi+1800h]
		movzx	edi, [ebp+var_448]
		shl	eax, 4
		mov	[ebp+var_370], eax
		movzx	eax, byte ptr [ebp+var_428]
		add	al, byte ptr [ebp+var_370]
		mov	[ebp+var_370], edi
		shl	edi, 4
		mov	byte ptr [ebp+var_374],	al
		mov	[ebp+var_50], al
		movzx	eax, byte ptr [ebp+var_388]
		and	eax, 0Fh
		add	eax, edi
		movzx	edi, al
		mov	eax, dword ptr [oba_1BFDC]	;offset
		movzx	eax, byte ptr [edi+eax+1B00h]
		mov	edi, [ebp+var_370]
		and	eax, 0Fh
		mov	byte ptr [ebp+var_428],	al
		movzx	eax, byte ptr [ebp+var_388]
		and	edi, 0F0h
		shr	al, 4
		movzx	eax, al
		add	eax, edi
		mov	edi, dword ptr [oba_1BFDC]	;offset 
		movzx	eax, byte ptr [eax+edi+1A00h]
		movzx	edi, byte ptr [ebp+var_3E8]
		shl	eax, 4
		mov	[ebp+var_370], eax
		movzx	eax, byte ptr [ebp+var_428]
		add	al, byte ptr [ebp+var_370]
		mov	[ebp+var_370], edi
		shl	edi, 4
		mov	byte ptr [ebp+var_388],	al
		mov	[ebp+var_4F], al
		movzx	eax, byte ptr [ebp+var_3FC]
		and	eax, 0Fh
		add	eax, edi
		movzx	edi, al
		mov	eax, dword ptr [oba_1BFDC]	;offset 
		movzx	eax, byte ptr [edi+eax+1D00h]
		mov	edi, [ebp+var_370]
		and	eax, 0Fh
		mov	byte ptr [ebp+var_3E8],	al
		movzx	eax, byte ptr [ebp+var_3FC]
		and	edi, 0F0h
		shr	al, 4
		movzx	eax, al
		add	eax, edi
		mov	edi, dword ptr [oba_1BFDC]	;offset 
		movzx	eax, byte ptr [eax+edi+1C00h]
		shl	eax, 4
		mov	[ebp+var_370], eax
		movzx	eax, byte ptr [ebp+var_3E8]
		add	al, byte ptr [ebp+var_370]
		movzx	edi, byte ptr [ebp+var_438]
		mov	byte ptr [ebp+var_370],	al
		mov	[ebp+var_4E], al
		movzx	eax, byte ptr [ebp+var_418]
		mov	[ebp+var_3FC], edi
		shl	edi, 4
		and	eax, 0Fh
		add	eax, edi
		movzx	edi, al
		mov	eax, dword ptr [oba_1BFDC]	;offset 
		movzx	eax, byte ptr [edi+eax+1F00h]
		mov	edi, [ebp+var_3FC]
		and	eax, 0Fh
		mov	byte ptr [ebp+var_3E8],	al
		movzx	eax, byte ptr [ebp+var_418]
		and	edi, 0F0h
		shr	al, 4
		movzx	eax, al
		add	eax, edi
		mov	edi, dword ptr [oba_1BFDC]	;offset 
		movzx	eax, byte ptr [eax+edi+1E00h]
		shl	eax, 4
		add	al, byte ptr [ebp+var_3E8]
		mov	[ebp+var_4D], al
		jmp	loc_40E9
; ---------------------------------------------------------------------------

loc_57BF:				; CODE XREF: calcHashAB+43A4j
		call	sub_19D70
calcHashAB	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

		public gen_buff2
gen_buff2	proc near		; CODE XREF: _gen_buff2j
					; DATA XREF: .got.plt:off_1C014o

var_1F8		= dword	ptr -1F8h
var_1F4		= dword	ptr -1F4h
var_1F0		= dword	ptr -1F0h
var_1EC		= dword	ptr -1ECh
var_1E8		= dword	ptr -1E8h
var_1E4		= dword	ptr -1E4h
var_1E0		= dword	ptr -1E0h
var_1DC		= dword	ptr -1DCh
var_1D8		= dword	ptr -1D8h
var_1D4		= dword	ptr -1D4h
var_1D0		= dword	ptr -1D0h
var_1CC		= dword	ptr -1CCh
var_1C8		= dword	ptr -1C8h
var_1C4		= dword	ptr -1C4h
var_1C0		= dword	ptr -1C0h
var_1BC		= dword	ptr -1BCh
var_1B8		= dword	ptr -1B8h
var_1B4		= dword	ptr -1B4h
var_1B0		= dword	ptr -1B0h
var_1AC		= dword	ptr -1ACh
var_1A8		= dword	ptr -1A8h
var_1A4		= dword	ptr -1A4h
var_1A0		= dword	ptr -1A0h
var_19C		= dword	ptr -19Ch
var_198		= dword	ptr -198h
var_194		= dword	ptr -194h
var_190		= dword	ptr -190h
var_18C		= dword	ptr -18Ch
var_188		= dword	ptr -188h
var_184		= dword	ptr -184h
var_180		= dword	ptr -180h
var_17C		= dword	ptr -17Ch
var_178		= dword	ptr -178h
var_174		= dword	ptr -174h
var_170		= dword	ptr -170h
var_16C		= dword	ptr -16Ch
var_168		= dword	ptr -168h
var_164		= dword	ptr -164h
var_160		= dword	ptr -160h
var_15C		= dword	ptr -15Ch
var_158		= dword	ptr -158h
var_154		= dword	ptr -154h
var_150		= dword	ptr -150h
var_14C		= dword	ptr -14Ch
var_148		= dword	ptr -148h
var_144		= dword	ptr -144h
var_140		= dword	ptr -140h
var_13C		= dword	ptr -13Ch
var_138		= dword	ptr -138h
var_134		= dword	ptr -134h
var_130		= dword	ptr -130h
var_12C		= dword	ptr -12Ch
var_128		= dword	ptr -128h
var_124		= dword	ptr -124h
var_120		= dword	ptr -120h
var_11C		= dword	ptr -11Ch
var_118		= dword	ptr -118h
var_114		= dword	ptr -114h
var_110		= dword	ptr -110h
var_10C		= dword	ptr -10Ch
var_108		= dword	ptr -108h
var_104		= dword	ptr -104h
var_100		= dword	ptr -100h
var_FC		= dword	ptr -0FCh
var_F8		= dword	ptr -0F8h
var_F4		= dword	ptr -0F4h
var_F0		= dword	ptr -0F0h
var_EC		= dword	ptr -0ECh
var_E8		= dword	ptr -0E8h
var_E4		= dword	ptr -0E4h
var_E0		= dword	ptr -0E0h
var_DC		= dword	ptr -0DCh
var_D8		= dword	ptr -0D8h
var_D4		= dword	ptr -0D4h
var_D0		= dword	ptr -0D0h
var_CC		= dword	ptr -0CCh
var_C8		= dword	ptr -0C8h
var_C4		= dword	ptr -0C4h
var_C0		= dword	ptr -0C0h
var_BC		= dword	ptr -0BCh
var_B8		= dword	ptr -0B8h
var_B4		= dword	ptr -0B4h
var_B0		= dword	ptr -0B0h
var_AC		= dword	ptr -0ACh
var_A8		= dword	ptr -0A8h
var_A4		= dword	ptr -0A4h
var_A0		= dword	ptr -0A0h
var_9C		= dword	ptr -9Ch
var_98		= dword	ptr -98h
var_94		= dword	ptr -94h
var_90		= dword	ptr -90h
var_8C		= dword	ptr -8Ch
var_88		= dword	ptr -88h
var_84		= dword	ptr -84h
var_80		= dword	ptr -80h
var_7C		= dword	ptr -7Ch
var_78		= dword	ptr -78h
var_74		= dword	ptr -74h
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_68		= dword	ptr -68h
var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
arg_0		= dword	ptr  8
arg_4		= dword	ptr  0Ch

		push	ebp
		mov	ebp, esp
		push	edi
		push	esi
		sub	esp, 1F0h
		mov	eax, [ebp+arg_0]
		mov	esi, [ebp+arg_0]
		mov	eax, [eax+3Ch]
		lea	edi, [eax+eax-2E1478F2h]
		mov	edx, edi
		or	edi, 0A50FF288h
		and	edx, 0A50FF288h
		mov	[ebp+var_1F8], eax
		sub	eax, edx
		mov	edx, [ebp+arg_0]
		mov	[ebp+var_3C], eax
		mov	eax, [esi+38h]
		mov	esi, [esi+2Ch]
		mov	edx, [edx+34h]
		mov	[ebp+var_1F0], esi
		mov	[ebp+var_1F4], edx
		lea	ecx, [edx+edx-2E1478F2h]
		lea	edx, [eax+eax-2E1478F2h]
		mov	[ebp+var_64], ecx
		mov	ecx, eax
		mov	[ebp+var_C], edx
		and	edx, 0A50FF288h
		sub	ecx, edx
		mov	[ebp+var_38], ecx
		lea	ecx, [esi+esi-2E1478F2h]
		mov	[ebp+var_7C], ecx
		and	ecx, 0A50FF288h
		sub	esi, ecx
		mov	[ebp+var_20], esi
		mov	esi, [ebp+var_64]
		mov	[ebp+var_F8], ecx
		mov	ecx, [ebp+var_38]
		add	ecx, [ebp+var_3C]
		add	ecx, [ebp+var_20]
		and	esi, 0A50FF288h
		mov	[ebp+var_C0], esi
		mov	esi, [ebp+var_1F4]
		sub	esi, [ebp+var_C0]
		lea	ecx, [esi+ecx-675E622Ah]
		mov	esi, [ebp+arg_0]
		xor	ecx, 0B5951117h
		mov	esi, [esi+20h]
		mov	[ebp+var_1EC], esi
		lea	esi, [esi+esi-2E1478F2h]
		mov	[ebp+var_148], esi
		and	esi, 0A50FF288h
		mov	[ebp+var_164], esi
		mov	esi, [ebp+var_1EC]
		sub	esi, [ebp+var_164]
		mov	[ebp+var_30], esi
		neg	esi
		sub	esi, ecx
		add	ecx, ecx
		and	ecx, 6B2A222Eh
		add	esi, ecx
		mov	ecx, [ebp+arg_0]
		imul	esi, 1F218ABFh
		mov	[ebp+var_18], edi
		mov	ecx, [ecx+30h]
		mov	[ebp+var_B8], esi
		add	esi, 3CD8E2BCh
		mov	[ebp+var_40], esi
		lea	esi, [ecx+ecx-2E1478F2h]
		mov	[ebp+var_1E8], ecx
		mov	ecx, esi
		mov	[ebp+var_78], esi
		mov	esi, [ebp+var_1E8]
		and	ecx, 0A50FF288h
		sub	esi, ecx
		mov	ecx, eax
		sub	ecx, [ebp+var_1F8]
		mov	[ebp+var_1C], esi
		add	ecx, edi
		mov	edi, [ebp+var_20]
		sub	ecx, edx
		lea	esi, [ecx+esi-44824335h]
		xor	esi, 4CD98F44h
		lea	edx, [esi+edi+3B6538E1h]
		add	esi, esi
		mov	edi, [ebp+var_30]
		and	esi, 99B31E88h
		sub	edx, esi
		mov	esi, [ebp+var_164]
		sub	esi, [ebp+var_1EC]
		mov	[ebp+var_180], esi
		sub	esi, edx
		lea	edx, [edx+edi+86FCFF9h]
		add	edx, edx
		or	edx, 0C21F75ECh
		lea	edx, [esi+edx+458E905h]
		mov	esi, [ebp+arg_0]
		mov	[ebp+var_2C], edx
		mov	edx, [ebp+var_C]
		mov	esi, [esi+24h]
		or	edx, 0A50FF288h
		sub	edx, eax
		mov	eax, [ebp+var_3C]
		lea	edi, [esi+esi-2E1478F2h]
		mov	[ebp+var_1E4], esi
		lea	eax, [edx+eax]
		mov	edx, [ebp+var_7C]
		xor	eax, 0FCEFB34Eh
		mov	[ebp+var_144], edi
		or	edx, 0A50FF288h
		mov	[ebp+var_7C], edx
		sub	edx, [ebp+var_1F0]
		lea	edx, [eax+edx-1714A0A4h]
		add	eax, eax
		and	eax, 0F9DF669Ch
		sub	edx, eax
		mov	eax, edi
		and	eax, 0A50FF288h
		sub	esi, eax
		mov	eax, [ebp+var_30]
		mov	[ebp+var_C], esi
		mov	edi, [ebp+var_C]
		lea	esi, [esi+edx+140453F2h]
		add	esi, esi
		or	esi, 0DEAA357Eh
		lea	eax, [edi+eax-51792F79h]
		mov	edi, eax
		mov	eax, 7CA6914Fh
		sub	eax, [ebp+var_C]
		add	edi, edx
		sub	edi, esi
		sub	eax, edx
		mov	edx, [ebp+var_78]
		lea	esi, [eax+esi]
		mov	eax, [ebp+var_1F4]
		add	esi, esi
		or	esi, 0DEAA357Eh
		add	esi, edi
		or	edx, 0A50FF288h
		mov	[ebp+var_74], esi
		mov	esi, [ebp+arg_0]
		sub	eax, [ebp+var_1E8]
		mov	[ebp+var_78], edx
		mov	esi, [esi+28h]
		add	eax, edx
		sub	eax, [ebp+var_C0]
		lea	edi, [esi+esi-2E1478F2h]
		xor	eax, 0EB5A92AAh
		mov	edx, edi
		and	edx, 0A50FF288h
		mov	[ebp+var_1E0], esi
		sub	esi, edx
		mov	edx, esi
		sub	edx, eax
		add	eax, eax
		or	eax, 0D6B52554h
		lea	eax, [edx+eax+243C33D6h]
		imul	edx, eax, 72DB486Bh
		sub	eax, 541909B5h
		and	eax, 35A4DDE5h
		imul	eax, 1A496F2Ah
		mov	[ebp+var_F0], edi
		mov	edi, [ebp+var_C]
		mov	[ebp+var_48], esi
		imul	esi, [ebp+var_30], 0AC2C0F37h
		lea	edx, [edx+eax+7E2F3010h]
		imul	eax, edx, 7D0E4886h
		imul	edx, 17D98C57h
		and	eax, 6B49BBCAh
		sub	edi, eax
		imul	eax, edi, 0F3D3205Dh
		mov	edi, [ebp+var_1C]
		lea	edx, [eax+edx]
		mov	eax, [ebp+var_64]
		imul	edx, 816104A3h
		or	eax, 0A50FF288h
		lea	edx, [esi+edx-2D080653h]
		mov	esi, [ebp+var_38]
		mov	[ebp+var_64], eax
		sub	eax, [ebp+var_1F4]
		mov	[ebp+var_10], edx
		lea	edx, [esi+eax+2FE61028h]
		mov	eax, 864741A1h
		sub	eax, [ebp+var_1C]
		imul	esi, [ebp+var_C], 0D61D15BBh
		sub	eax, edx
		lea	edx, [edx+edi-7468535Dh]
		add	edx, edx
		or	edx, 68F0F6F8h
		lea	edx, [eax+edx]
		mov	eax, edx
		sub	eax, [ebp+var_48]
		lea	edx, [edx+edx+73512C80h]
		or	edx, 68F0F6F8h
		sub	eax, edx
		imul	eax, 29E2EA45h
		lea	eax, [esi+eax-5CEECEEEh]
		mov	esi, [ebp+var_20]
		mov	[ebp+var_14], eax
		mov	eax, [ebp+var_1F4]
		sub	eax, [ebp+var_C0]
		mov	[ebp+var_A8], eax
		mov	edx, eax
		mov	eax, 98C1B5D0h
		sub	eax, [ebp+var_18]
		sub	edx, [ebp+var_1F8]
		sub	eax, edi
		mov	edi, [ebp+var_18]
		sub	eax, [ebp+var_20]
		lea	esi, [edi+esi+76FB7996h]
		sub	eax, edx
		mov	edi, [ebp+var_48]
		add	esi, [ebp+var_1C]
		lea	edx, [esi+edx]
		mov	esi, [ebp+var_30]
		add	edx, edx
		or	edx, 890AE92h
		add	eax, edx
		sub	edi, eax
		lea	eax, [eax+eax-280B0D5Eh]
		or	eax, 890AE92h
		lea	eax, [edi+eax]
		mov	edi, [ebp+var_48]
		mov	[ebp+var_84], eax
		mov	eax, 59DA6EECh
		sub	eax, [ebp+var_C]
		lea	edx, [edi+ecx-159D4251h]
		mov	ecx, [ebp+var_C]
		sub	eax, edx
		mov	edi, [ebp+var_20]
		lea	edx, [edx+ecx-73674419h]
		add	edx, edx
		or	edx, 0FF018BFEh
		add	eax, edx
		lea	edx, [eax+eax+34181E5Ch]
		sub	esi, eax
		or	edx, 0FF018BFEh
		lea	eax, [edx+esi]
		mov	[ebp+var_18], eax
		mov	eax, [ebp+var_64]
		sub	eax, [ebp+var_1F4]
		lea	eax, [edi+eax+76FB7996h]
		add	eax, [ebp+var_1C]
		add	eax, [ebp+var_48]
		xor	eax, 2A8C16h
		add	ecx, eax
		add	eax, eax
		and	eax, 55182Ch
		sub	ecx, eax
		mov	eax, 8CC8B8FDh
		mov	[ebp+var_50], ecx
		mov	edx, [ebp+var_2C]
		sub	eax, [ebp+var_2C]
		lea	esi, [edx+edx+244F1818h]
		mov	edx, 0D12A4280h
		and	esi, 0C21F75ECh
		lea	esi, [eax+esi]
		mov	eax, esi
		shr	eax, 1Ch
		imul	esi, 66097910h
		mov	ecx, eax
		not	eax
		neg	ecx
		add	eax, 10h
		add	ecx, 28059E96h
		or	eax, 56DB5C07h
		add	esi, 1119CE0Dh
		add	eax, eax
		sub	ecx, eax
		imul	eax, esi, 6EF90971h
		sub	edx, ecx
		add	eax, 18999752h
		xor	eax, 1BBFh
		add	eax, 721F0000h
		xor	eax, edx
		xor	eax, 0FFFFE440h
		or	eax, edx
		mov	edx, esi
		not	edx
		mov	edi, eax
		imul	edx, 6EF90971h
		not	edi
		imul	esi, 0EEF90971h
		sub	edx, ecx
		lea	esi, [ecx+esi]
		mov	ecx, 0DF04BFC9h
		lea	eax, [esi+eax*2]
		mov	esi, [ebp+var_74]
		sub	ecx, [ebp+var_74]
		lea	edx, [edx+edi*2-24E7F07Bh]
		lea	eax, [eax+eax+731CA9A7h]
		mov	edi, ecx
		and	eax, 9056321Ch
		shr	edi, 18h
		add	esi, 20FB4037h
		add	edx, eax
		imul	esi, 1A7FAB00h
		imul	eax, edi, 9E58055h
		shl	ecx, 9
		add	ecx, 1FFh
		lea	eax, [esi+eax-38BE3FAEh]
		lea	esi, [edi+edi-1FFh]
		or	esi, ecx
		imul	esi, 0F61A7FABh
		lea	esi, [eax+esi]
		imul	eax, [ebp+var_10], 0DD056000h
		mov	[ebp+var_74], esi
		add	eax, 6C090CD6h
		mov	[ebp+var_44], eax
		imul	eax, [ebp+var_10], 51AB2979h
		add	eax, 619EF0BFh
		shr	eax, 13h
		imul	ecx, eax, 0B7C265E3h
		lea	eax, [eax+eax-3FFFh]
		and	eax, 0E227902Eh
		imul	eax, 483D9A1Dh
		lea	ecx, [ecx+eax-70107AB8h]
		imul	eax, [ebp+var_44], 0F2BD1EEBh
		imul	esi, ecx, 24B007CBh
		imul	edi, ecx, 12D56E63h
		sub	eax, 1F13DC73h
		xor	eax, 0E98Dh
		sub	esi, 1
		sub	eax, 4A20000h
		xor	eax, 0FFFF1672h
		xor	eax, esi
		or	eax, esi
		imul	esi, [ebp+var_44], 902A9683h
		sub	esi, edi
		imul	edi, eax, 0A7A7E192h
		imul	ecx, 0B69FF06Ah
		lea	esi, [esi+edi-2A6F70A1h]
		imul	edi, [ebp+var_44], 0E57A3DD6h
		lea	ecx, [edi+ecx-476BB8E1h]
		lea	eax, [ecx+eax*4]
		and	eax, 0E227902Eh
		imul	eax, 0AC2C0F37h
		lea	eax, [esi+eax]
		mov	esi, [ebp+var_14]
		mov	[ebp+var_44], eax
		imul	eax, [ebp+var_14], 2BFC988Dh
		shl	esi, 11h
		add	eax, 1DD2E13Bh
		shr	eax, 0Fh
		imul	eax, 43C7B8Bh
		sub	eax, 7C99EC5h
		imul	ecx, eax, 0D1DB2B6Fh
		imul	eax, 3B89A846h
		lea	ecx, [esi+ecx-13439EC1h]
		imul	esi, [ebp+var_14], 62340000h
		sub	eax, 30444E21h
		sub	esi, 7B100001h
		or	eax, esi
		imul	eax, 0D61D15BBh
		lea	eax, [ecx+eax]
		mov	ecx, [ebp+var_84]
		mov	[ebp+var_54], eax
		mov	eax, 34C513CEh
		sub	eax, [ebp+var_84]
		sub	ecx, 34C513CEh
		imul	edi, ecx, 0B2C00000h
		neg	ecx
		shr	eax, 0Ah
		shl	ecx, 17h
		imul	esi, eax, 5FF1935h
		add	ecx, 7FFFFFh
		lea	eax, [eax+eax-7FFFFFh]
		or	eax, ecx
		imul	eax, 0FA00E6CBh
		lea	esi, [edi+esi-3D8C87A6h]
		lea	eax, [esi+eax]
		mov	esi, 5E0F1861h
		sub	esi, [ebp+var_18]
		mov	[ebp+var_4C], eax
		mov	eax, esi
		shr	eax, 8
		imul	ecx, eax, 513F4197h
		imul	esi, 97000000h
		lea	edi, [esi+ecx-3A366474h]
		lea	esi, [eax+eax-1FFFFFFh]
		mov	eax, [ebp+var_18]
		sub	eax, 5E0F1861h
		neg	eax
		shl	eax, 19h
		add	eax, 1FFFFFFh
		or	esi, eax
		mov	eax, 4457B71Eh
		imul	esi, 0AEC0BE69h
		sub	eax, [ebp+var_50]
		mov	ecx, eax
		lea	esi, [edi+esi]
		shr	ecx, 3
		mov	[ebp+var_2C], esi
		imul	esi, ecx, 68D558C5h
		lea	eax, [eax+eax*4]
		shl	eax, 1Dh
		lea	ecx, [ecx+ecx-3FFFFFFFh]
		lea	eax, [eax+esi-645F2424h]
		mov	esi, [ebp+var_50]
		sub	esi, 4457B71Eh
		neg	esi
		shl	esi, 1Eh
		add	esi, 3FFFFFFFh
		or	ecx, esi
		imul	ecx, 972AA73Bh
		lea	ecx, [eax+ecx]
		imul	eax, [ebp+var_44], 0A35652F2h
		mov	[ebp+var_70], ecx
		imul	ecx, [ebp+var_4C], 148FA599h
		sub	eax, 3CC21E81h
		mov	[ebp+var_9C], eax
		imul	eax, [ebp+var_44], 33B6F7C5h
		lea	ecx, [ecx+eax-41FCBC2Dh]
		imul	eax, [ebp+var_4C], 0CA16623Ah
		add	eax, 6208479Bh
		or	eax, [ebp+var_9C]
		imul	eax, 0C6AFC653h
		lea	eax, [ecx+eax]
		imul	ecx, eax, 0ADDF244Ah
		imul	eax, 79993F75h
		add	ecx, 16FDE21Bh
		mov	[ebp+var_6C], ecx
		imul	ecx, [ebp+var_2C], 578E9C4Eh
		add	ecx, 6214B57h
		or	[ebp+var_6C], ecx
		imul	ecx, [ebp+var_2C], 5EF29997h
		add	eax, ecx
		imul	eax, 864E1E0Fh
		imul	edi, [ebp+var_74], 40EB7CFDh
		imul	esi, [ebp+var_4C], 0E50B311Dh
		mov	[ebp+var_110], eax
		lea	eax, [edi-1670C90Bh]
		sub	edi, 922C90Bh
		lea	ecx, [esi-1503DC33h]
		xor	eax, 4BF8h
		xor	ecx, 4BF8h
		add	eax, 46080000h
		add	ecx, 46080000h
		xor	edi, 0EEABh
		xor	eax, ecx
		add	edi, 38BA0000h
		mov	ecx, eax
		xor	eax, 82F7BFC3h
		xor	ecx, 7D08403Ch
		xor	edi, 75F8203Bh
		mov	[ebp+var_C8], ecx
		add	esi, 23B423CDh
		imul	ecx, [ebp+var_2C], 2BC74E27h
		xor	esi, 4BF8h
		add	esi, 0D500000h
		xor	esi, 0FFFFB407h
		mov	[ebp+var_90], ecx
		add	ecx, 5A94A5ABh
		xor	ecx, 0D749h
		sub	ecx, 57840000h
		mov	[ebp+var_50], ecx
		xor	ecx, eax
		xor	ecx, 0FFFF28B6h
		or	ecx, eax
		imul	eax, [ebp+var_44], 51AB2979h
		mov	[ebp+var_18], ecx
		mov	ecx, 6DD873F3h
		sub	ecx, edx
		add	eax, 28E4F0BFh
		xor	eax, 0EEABh
		add	eax, 38BA0000h
		xor	edi, eax
		mov	eax, edi
		not	eax
		xor	esi, eax
		or	esi, eax
		mov	[ebp+var_14], esi
		imul	esi, [ebp+var_40], 0FCDEE53Fh
		mov	[ebp+var_10], edi
		mov	[ebp+var_84], esi
		mov	eax, esi
		mov	esi, [ebp+var_B8]
		add	eax, 384D39D9h
		xor	eax, 0E6D4h
		sub	eax, 549A0000h
		add	esi, 3CD8E2BDh
		xor	eax, ecx
		imul	esi, 3211AC1h
		xor	eax, 0FFFF192Bh
		or	eax, ecx
		mov	edi, eax
		not	edi
		sub	esi, edx
		lea	esi, [esi+edi*2+45F6F11Dh]
		mov	edi, [ebp+var_84]
		lea	edi, [edx+edi]
		lea	eax, [edi+eax*2]
		lea	eax, [eax+eax-144A7431h]
		and	eax, 0E0A445DEh
		lea	eax, [esi+eax]
		mov	[ebp+var_94], eax
		imul	esi, [ebp+var_40], 0BAC5DC37h
		imul	eax, [ebp+var_54], 0C99E33F5h
		imul	edi, [ebp+var_40], 0F9BDCA7Eh
		lea	esi, [esi+eax-6AB798A4h]
		imul	eax, [ebp+var_54], 57F9311Ah
		sub	edi, 38998C4Dh
		add	eax, 3BA5C277h
		or	eax, edi
		imul	eax, 0F1940CF7h
		lea	eax, [esi+eax]
		mov	[ebp+var_C4], eax
		imul	eax, [ebp+var_70], 2B8CC1Ah
		add	eax, 44565BA7h
		mov	[ebp+var_B4], eax
		mov	eax, [ebp+var_50]
		xor	eax, ecx
		xor	eax, 0FFFF28B6h
		or	eax, ecx
		mov	ecx, [ebp+var_2C]
		mov	esi, eax
		not	esi
		not	ecx
		imul	ecx, 2BC74E27h
		sub	ecx, 137B524Ch
		sub	ecx, edx
		lea	ecx, [ecx+esi*2]
		mov	esi, [ebp+var_90]
		lea	esi, [edx+esi]
		lea	eax, [esi+eax*2]
		lea	eax, [eax+eax+2A706373h]
		and	eax, 38C4296h
		lea	eax, [ecx+eax]
		imul	ecx, [ebp+var_54], 2BFC988Dh
		lea	edi, [eax+eax+50889AE0h]
		and	edi, 0C193377Ah
		mov	[ebp+var_A0], eax
		sub	ecx, 1AB81EC5h
		xor	ecx, 0F1D6h
		add	ecx, 388B0000h
		mov	[ebp+var_8C], edi
		xor	ecx, 61B59AF8h
		imul	edi, [ebp+var_44], 0DF9CED59h
		imul	eax, [ebp+var_74], 1F5C7C5Dh
		imul	esi, [ebp+var_74], 81D6F9FAh
		add	edi, eax
		imul	edi, 2C9DF921h
		add	esi, 5F2E6DEBh
		or	esi, [ebp+var_9C]
		lea	eax, [edx+edx+244F1818h]
		and	eax, 0C21F75ECh
		sub	edi, esi
		add	edi, 58AB27B4h
		xor	edi, 0F1D6h
		add	edi, 388B0000h
		xor	ecx, edi
		sub	ecx, 0E1BC872h
		mov	[ebp+var_B0], ecx
		imul	ecx, edx, 0BC87AEE9h
		imul	esi, [ebp+var_40], 0CEE87857h
		lea	esi, [esi+ecx-445CA644h]
		imul	ecx, eax, 43785117h
		sub	eax, edx
		lea	ecx, [esi+ecx]
		lea	esi, [eax+eax+199171FBh]
		imul	eax, [ebp+var_40], 6423582h
		add	eax, 38998C4Ch
		and	esi, eax
		mov	eax, [ebp+arg_0]
		imul	esi, 0BC87AEE9h
		mov	eax, [eax]
		lea	esi, [ecx+esi]
		mov	ecx, [ebp+arg_0]
		mov	[ebp+var_D0], esi
		lea	edx, [eax+eax-2E1478F2h]
		mov	ecx, [ecx+4]
		mov	[ebp+var_17C], edx
		and	edx, 0A50FF288h
		mov	[ebp+var_1DC], eax
		sub	eax, edx
		mov	[ebp+var_98], eax
		mov	esi, eax
		mov	[ebp+var_1D8], ecx
		mov	edi, [ebp+var_1D8]
		lea	ecx, [ecx+ecx-2E1478F2h]
		mov	eax, ecx
		add	esi, 10D31220h
		and	eax, 0A50FF288h
		xor	esi, 40A0D227h
		sub	edi, eax
		lea	eax, [esi+edi]
		add	esi, esi
		and	esi, 8141A44Eh
		sub	eax, esi
		imul	esi, eax, 99A31207h
		sub	eax, 3E1710Eh
		and	eax, 4256887h
		or	ecx, 0A50FF288h
		imul	eax, 0CCB9DBF2h
		mov	[ebp+var_154], edi
		lea	esi, [esi+eax-53B2B9B1h]
		mov	eax, [ebp+arg_0]
		mov	eax, [eax+1Ch]
		mov	[ebp+var_1D4], eax
		lea	edi, [eax+eax-2E1478F2h]
		mov	eax, [ebp+arg_0]
		mov	[ebp+var_CC], edi
		mov	eax, [eax+8]
		lea	edi, [eax+eax-2E1478F2h]
		mov	[ebp+var_84], edi
		and	edi, 0A50FF288h
		mov	[ebp+var_1D0], eax
		sub	eax, edi
		mov	[ebp+var_108], eax
		mov	eax, [ebp+arg_0]
		mov	[ebp+var_150], edi
		mov	eax, [eax+14h]
		lea	edi, [eax+eax-2E1478F2h]
		mov	[ebp+var_9C], edi
		mov	edi, [ebp+var_1D4]
		mov	[ebp+var_1CC], eax
		add	edi, eax
		mov	eax, [ebp+var_9C]
		and	eax, 0A50FF288h
		mov	[ebp+var_158], eax
		sub	edi, eax
		mov	eax, [ebp+var_CC]
		and	eax, 0A50FF288h
		mov	[ebp+var_15C], eax
		sub	edi, eax
		imul	eax, esi, 45CB776Eh
		imul	esi, 0CE0F99ADh
		imul	edi, 0E0DE7541h
		and	eax, 84AD10Eh
		mov	[ebp+var_24], eax
		mov	eax, [ebp+var_108]
		sub	eax, [ebp+var_24]
		imul	eax, 0F9625DBBh
		lea	esi, [eax+esi]
		imul	esi, 0AD704B33h
		lea	esi, [edi+esi-30EB4CBEh]
		mov	[ebp+var_5C], esi
		mov	esi, [ebp+arg_0]
		mov	eax, [ebp+arg_0]
		mov	[ebp+var_100], ecx
		mov	esi, [esi+18h]
		mov	eax, [eax+0Ch]
		lea	edi, [esi+esi-2E1478F2h]
		and	edi, 0A50FF288h
		mov	[ebp+var_1C8], esi
		sub	esi, edi
		mov	[ebp+var_E8], edi
		mov	edi, [ebp+arg_0]
		lea	ecx, [eax+eax-2E1478F2h]
		mov	[ebp+var_E4], esi
		mov	[ebp+var_1C4], eax
		mov	[ebp+var_160], ecx
		and	ecx, 0A50FF288h
		mov	esi, [edi+10h]
		mov	[ebp+var_FC], ecx
		mov	edi, [ebp+var_E8]
		sub	edi, [ebp+var_1C8]
		lea	eax, [esi+eax+1AF0C756h]
		sub	eax, [ebp+var_1D8]
		add	eax, [ebp+var_98]
		add	eax, [ebp+var_100]
		lea	ecx, [esi+esi-2E1478F2h]
		and	ecx, 0A50FF288h
		sub	eax, ecx
		sub	eax, [ebp+var_FC]
		mov	[ebp+var_58], edi
		sub	edi, eax
		mov	[ebp+var_24], edi
		mov	edi, [ebp+var_E4]
		lea	eax, [eax+edi+17886F0Bh]
		mov	edi, [ebp+var_24]
		add	eax, eax
		or	eax, 0C21F75ECh
		lea	eax, [edi+eax+754049F3h]
		mov	edi, [ebp+var_84]
		mov	[ebp+var_34], eax
		mov	eax, [ebp+var_100]
		sub	eax, edx
		mov	edx, eax
		mov	eax, [ebp+var_1DC]
		sub	eax, [ebp+var_1D8]
		lea	eax, [edx+eax]
		mov	edx, eax
		sub	edx, 6C428982h
		or	edi, 0A50FF288h
		mov	[ebp+var_84], edi
		mov	edi, [ebp+var_108]
		sub	esi, ecx
		mov	[ebp+var_28], eax
		lea	eax, [edx+edi+27C0464Dh]
		mov	edi, [ebp+var_150]
		sub	edi, [ebp+var_1D0]
		add	eax, eax
		or	eax, 56BA105Ah
		sub	eax, edx
		lea	edx, [eax+edi-489A7723h]
		mov	eax, [ebp+var_1C4]
		sub	eax, 655C740Bh
		sub	eax, [ebp+var_FC]
		sub	eax, edx
		lea	edx, [edx+edx-1505AEAEh]
		or	edx, 56BA105Ah
		add	eax, edx
		mov	edx, [ebp+var_9C]
		xor	eax, 9CEDC51Ch
		or	edx, 0A50FF288h
		mov	[ebp+var_9C], edx
		lea	edx, [eax+edx-14B73870h]
		add	eax, eax
		and	eax, 39DB8A38h
		mov	ecx, [ebp+var_1D0]
		sub	edx, eax
		mov	eax, [ebp+var_FC]
		sub	eax, [ebp+var_1C4]
		mov	edi, [ebp+var_1D4]
		sub	edi, [ebp+var_15C]
		lea	eax, [eax+ecx+5B23A39Bh]
		mov	ecx, [ebp+var_1C4]
		sub	eax, [ebp+var_84]
		mov	[ebp+var_40], esi
		sub	edx, [ebp+var_1CC]
		add	ecx, 3B7DBCCBh
		sub	eax, esi
		sub	ecx, [ebp+var_1D0]
		add	ecx, [ebp+var_84]
		mov	[ebp+var_14C], edi
		add	ecx, esi
		mov	esi, [ebp+var_28]
		sub	ecx, [ebp+var_FC]
		add	ecx, ecx
		xor	esi, 4723802Fh
		or	ecx, 576AD78Eh
		add	eax, ecx
		mov	ecx, [ebp+var_E4]
		add	ecx, edi
		mov	edi, [ebp+var_1CC]
		sub	ecx, eax
		lea	eax, [eax+eax+7B5267A6h]
		or	eax, 576AD78Eh
		lea	eax, [ecx+eax]
		mov	[ebp+var_A4], eax
		mov	eax, [ebp+var_160]
		or	eax, 0A50FF288h
		mov	[ebp+var_24], eax
		sub	eax, [ebp+var_1C4]
		sub	edi, [ebp+var_158]
		lea	ecx, [esi+eax-0F4596EBh]
		lea	eax, [esi+esi]
		mov	esi, [ebp+var_40]
		and	eax, 8E47005Eh
		sub	ecx, eax
		mov	eax, 0B45E3936h
		sub	eax, [ebp+var_40]
		mov	[ebp+var_178], edi
		sub	eax, ecx
		lea	ecx, [ecx+esi+5669171Ah]
		mov	esi, [ebp+var_1D0]
		add	ecx, ecx
		or	ecx, 0C8D4B4F0h
		lea	ecx, [eax+ecx]
		mov	eax, [ebp+var_9C]
		add	esi, 2FE4BA6Dh
		sub	esi, [ebp+var_84]
		sub	esi, [ebp+var_40]
		lea	eax, [ecx+eax]
		lea	ecx, [ecx+ecx+219CAA70h]
		and	ecx, 0C8D4B4F0h
		sub	eax, ecx
		mov	ecx, [ebp+var_158]
		sub	ecx, [ebp+var_1CC]
		sub	eax, [ebp+var_1CC]
		mov	[ebp+var_174], ecx
		lea	edi, [esi+ecx]
		mov	esi, [ebp+var_40]
		mov	ecx, [ebp+var_84]
		sub	ecx, [ebp+var_1D0]
		lea	ecx, [esi+ecx+3B7DBCCBh]
		mov	esi, [ebp+var_E4]
		add	ecx, [ebp+var_178]
		add	ecx, ecx
		or	ecx, 62C1C4BEh
		add	edi, ecx
		lea	ecx, [edi+edi-3986B32Eh]
		sub	esi, edi
		or	ecx, 62C1C4BEh
		lea	ecx, [esi+ecx-591FCBFDh]
		mov	esi, [ebp+var_14C]
		xor	ecx, 0AC3D1A1Dh
		sub	esi, ecx
		add	ecx, ecx
		or	ecx, 587A343Ah
		lea	ecx, [esi+ecx-1B33051Fh]
		mov	[ebp+var_80], ecx
		mov	ecx, [ebp+var_1D0]
		sub	ecx, [ebp+var_1D8]
		add	ecx, [ebp+var_100]
		sub	ecx, [ebp+var_150]
		mov	edi, [ebp+var_9C]
		sub	edi, [ebp+var_1CC]
		xor	ecx, 27A965FCh
		lea	esi, [ecx+22C841D4h]
		add	ecx, ecx
		and	ecx, 4F52CBF8h
		sub	esi, ecx
		lea	ecx, [edi+esi-0CDA8A4Eh]
		mov	esi, [ebp+var_58]
		mov	edi, [ebp+var_E4]
		sub	esi, ecx
		lea	ecx, [ecx+edi+11BBAE76h]
		mov	edi, [ebp+var_24]
		add	ecx, ecx
		or	ecx, 1957A17Ch
		lea	ecx, [esi+ecx-3EF6AC54h]
		mov	esi, [ebp+var_CC]
		add	edi, [ebp+var_98]
		sub	edi, [ebp+var_1C4]
		or	esi, 0A50FF288h
		mov	[ebp+var_CC], esi
		sub	esi, [ebp+var_1D4]
		add	esi, ecx
		lea	ecx, [ecx+ecx+411E5A40h]
		and	ecx, 1957A17Ch
		sub	esi, ecx
		imul	ecx, edi, 0DEBE1505h
		and	edi, 0C0882CA1h
		imul	edi, 4283D5F6h
		mov	[ebp+var_60], esi
		lea	esi, [ecx+edi-542FEBDBh]
		imul	ecx, esi, 0B778DF9Ah
		imul	esi, 14D5B133h
		imul	edi, [ebp+var_14C], 972AA73Bh
		and	ecx, 81105942h
		mov	[ebp+var_24], ecx
		mov	ecx, [ebp+var_40]
		sub	ecx, [ebp+var_24]
		imul	ecx, 0AD8FA4FFh
		lea	esi, [ecx+esi]
		imul	esi, 0B37BB06Bh
		imul	ecx, [ebp+var_E4], 0DFFE4695h
		lea	ecx, [esi+ecx]
		mov	esi, [ebp+var_34]
		imul	ecx, 618FD28Fh
		lea	ecx, [edi+ecx-0F2304AEh]
		mov	[ebp+var_58], ecx
		lea	ecx, [esi+esi+244F1818h]
		and	ecx, 0C21F75ECh
		sub	ecx, esi
		lea	edi, [ecx+4C8B8FDh]
		sub	ecx, 73374703h
		shr	ecx, 1Bh
		mov	[ebp+var_28], ecx
		shl	edi, 5
		mov	ecx, 0FFFFFFE0h
		sub	ecx, edi
		mov	esi, edi
		mov	edi, [ebp+var_28]
		neg	esi
		or	ecx, 0D39407B5h
		sub	esi, 2794344h
		add	ecx, ecx
		sub	esi, ecx
		mov	ecx, [ebp+var_28]
		not	edi
		add	edi, 20h
		or	edi, 700227EEh
		neg	ecx
		add	edi, edi
		sub	ecx, 4BE848A1h
		sub	ecx, edi
		lea	edi, [ecx+esi-6E08447Ah]
		neg	esi
		neg	ecx
		lea	ecx, [ecx+ecx-77D4E15Bh]
		lea	esi, [esi+esi+53E56A4Fh]
		or	esi, ecx
		lea	esi, [edi+esi]
		mov	edi, 9D8BF3Eh
		sub	edi, edx
		sub	edx, 9D8BF3Eh
		mov	ecx, edi
		neg	edx
		xor	esi, 42999AADh
		shr	ecx, 17h
		shl	edx, 0Ah
		mov	[ebp+var_28], esi
		add	edx, 3FFh
		imul	esi, ecx, 9E58055h
		lea	ecx, [ecx+ecx-3FFh]
		imul	edi, 0CB00AA00h
		or	ecx, edx
		imul	ecx, 0F61A7FABh
		lea	esi, [edi+esi-38BE3FAEh]
		lea	ecx, [esi+ecx]
		mov	[ebp+var_68], ecx
		mov	ecx, 72632603h
		sub	ecx, [ebp+var_A4]
		mov	edx, ecx
		shr	ecx, 15h
		imul	ecx, 5EEA7097h
		shl	edx, 0Bh
		imul	edi, edx, 53D3F0C9h
		lea	edx, [edx+edx+0FFFh]
		sub	ecx, 498C6Fh
		imul	esi, ecx, 60B5759Fh
		imul	ecx, 4BA01E4Eh
		lea	esi, [edi+esi+5F98ED31h]
		sub	ecx, 0C2442Dh
		or	ecx, edx
		imul	ecx, 0AC2C0F37h
		lea	edi, [eax+39BAF2E6h]
		lea	ecx, [esi+ecx]
		mov	[ebp+var_34], ecx
		mov	ecx, 0C6450D1Ah
		sub	ecx, eax
		add	eax, 39BAF2E5h
		shr	ecx, 11h
		mov	edx, ecx
		sub	ecx, 8000h
		not	ecx
		neg	edx
		or	ecx, 152592B6h
		sub	edx, 415F4430h
		add	ecx, ecx
		sub	edx, ecx
		lea	ecx, [edx+edx-52F55238h]
		and	ecx, 0D5B4DA92h
		imul	esi, ecx, 29E2EA45h
		sub	ecx, edx
		shl	eax, 10h
		lea	ecx, [ecx+ecx+7D4077A5h]
		and	ecx, eax
		mov	eax, 0D58C5832h
		imul	edi, 75228000h
		lea	edx, [ecx+edx]
		imul	edx, 0D61D15BBh
		sub	eax, [ebp+var_80]
		lea	esi, [edi+esi-40AD0F4Dh]
		lea	edx, [esi+edx]
		mov	esi, [ebp+var_80]
		mov	[ebp+var_A4], edx
		mov	edx, eax
		shr	edx, 0Ch
		shl	eax, 15h
		imul	ecx, edx, 5FF1935h
		add	eax, 1FFFFFh
		add	esi, 2A73A7CEh
		lea	edx, [edx+edx-1FFFFFh]
		imul	esi, 6CB00000h
		or	edx, eax
		imul	edx, 0FA00E6CBh
		imul	eax, [ebp+var_58], 0B8000000h
		lea	ecx, [esi+ecx-3D8C87A6h]
		lea	edx, [ecx+edx]
		mov	[ebp+var_80], edx
		sub	eax, 439A750Fh
		imul	edx, [ebp+var_58], 15C660Dh
		imul	esi, eax, 0F7D33E27h
		add	edx, 222B2DD3h
		shr	edx, 5
		imul	edx, 798B2D8Fh
		sub	edx, 4570265Dh
		imul	ecx, edx, 1A16D26Bh
		imul	edx, 0E8E6A2DEh
		imul	eax, 7B0363F6h
		lea	ecx, [esi+ecx+35A604h]
		sub	edx, 20E9E159h
		sub	eax, 7A21B697h
		or	edx, eax
		imul	edx, 972AA73Bh
		lea	edx, [ecx+edx]
		mov	ecx, 8E42BEECh
		mov	[ebp+var_58], edx
		mov	esi, [ebp+var_60]
		sub	ecx, [ebp+var_60]
		imul	edi, [ebp+var_34], 0A35652F2h
		add	esi, 71BD4114h
		mov	edx, ecx
		neg	esi
		shr	edx, 7
		shl	esi, 1Ah
		shl	ecx, 19h
		add	esi, 3FFFFFFh
		lea	eax, [edx+edx-3FFFFFFh]
		or	eax, esi
		lea	edx, [ecx+edx]
		sub	edx, eax
		lea	eax, [edx+5783FFFFh]
		imul	esi, [ebp+var_34], 0C3D1070Bh
		mov	ecx, eax
		mov	[ebp+var_E0], eax
		xor	ecx, 6C26h
		imul	eax, [ebp+var_A4], 0F0A88CC7h
		sub	ecx, 57840000h
		mov	[ebp+var_10C], edi
		sub	edi, 3CC21E81h
		xor	ecx, 11AE4E69h
		mov	[ebp+var_BC], edi
		lea	eax, [esi+eax-375DD00Dh]
		imul	esi, [ebp+var_A4], 57F9311Ah
		imul	eax, 5349140Bh
		add	esi, 3BA5C277h
		or	esi, edi
		sub	eax, esi
		mov	esi, [ebp+var_6C]
		add	eax, 16F3C689h
		xor	eax, 6C26h
		sub	eax, 57840000h
		xor	ecx, eax
		mov	eax, [ebp+var_110]
		lea	edi, [ecx+63D6E532h]
		add	ecx, ecx
		and	ecx, 235C9CD2h
		lea	esi, [eax+esi-60B82D82h]
		mov	eax, 47168272h
		add	esi, edi
		sub	eax, edi
		sub	eax, [ebp+var_110]
		sub	esi, ecx
		sub	eax, [ebp+var_6C]
		add	esi, esi
		or	esi, 9F7B52BCh
		imul	edi, [ebp+var_68], 40EB7CFDh
		add	eax, ecx
		lea	eax, [esi+eax]
		imul	ecx, [ebp+var_58], 15C660Dh
		imul	esi, [ebp+var_80], 0E50B311Dh
		mov	[ebp+var_60], eax
		imul	eax, [ebp+var_80], 0CA16623Ah
		sub	ecx, 160ED22Dh
		mov	[ebp+var_6C], ecx
		mov	[ebp+var_D8], edi
		mov	[ebp+var_DC], eax
		mov	eax, ecx
		lea	ecx, [edi+esi+28615AC2h]
		xor	eax, 4801h
		imul	edi, [ebp+var_68], 81D6F9FAh
		add	eax, 383A0000h
		xor	eax, 0CD78425Ch
		add	edi, 5F2E6DEBh
		mov	[ebp+var_24], edi
		mov	edi, [ebp+var_DC]
		add	edi, 6208479Bh
		or	[ebp+var_24], edi
		sub	ecx, [ebp+var_24]
		mov	edi, [ebp+var_C8]
		xor	ecx, 4801h
		add	ecx, 383A0000h
		sub	edi, 7FE71A16h
		xor	eax, ecx
		imul	edi, 74744C9h
		imul	ecx, [ebp+var_2C], 0E0FB89Fh
		add	edi, ecx
		imul	ecx, [ebp+var_18], 0E8E8992h
		lea	ecx, [edi+ecx]
		mov	edi, [ebp+var_90]
		imul	ecx, 8CB3EA87h
		lea	ecx, [eax+ecx-3287BDA4h]
		add	eax, eax
		and	eax, 9AF084B8h
		sub	ecx, eax
		mov	eax, [ebp+var_C8]
		add	edx, 48ADFFFFh
		xor	edx, 0D749h
		sub	edx, 48AE0000h
		xor	edx, 0B3ECC361h
		lea	eax, [edi+eax+310A5AEh]
		mov	edi, [ebp+var_18]
		lea	edi, [eax+edi*2]
		lea	eax, [edi+edi-1]
		and	eax, 0FA108078h
		add	ecx, eax
		xor	ecx, 0CE12A47Fh
		add	ecx, 22B5C28Dh
		mov	[ebp+var_18], ecx
		mov	ecx, [ebp+var_6C]
		imul	eax, [ebp+var_A4], 2BFC988Dh
		xor	ecx, 20CEh
		add	eax, 6680E13Bh
		add	ecx, 383A0000h
		mov	[ebp+var_80], eax
		xor	eax, 0D749h
		sub	eax, 48AE0000h
		xor	edx, eax
		mov	eax, ecx
		mov	[ebp+var_C8], ecx
		mov	edi, edx
		imul	ecx, [ebp+var_58], 2B8CC1Ah
		not	edi
		xor	eax, edi
		xor	eax, 0FFFFDF31h
		or	eax, edi
		sub	ecx, 1
		mov	[ebp+var_6C], ecx
		lea	ecx, [edx-29E80EC9h]
		imul	edi, [ebp+var_58], 293A3183h
		imul	ecx, 24CC21CFh
		lea	edi, [edi+ecx-5B50CDE2h]
		imul	ecx, eax, 4998439Eh
		add	edi, ecx
		mov	ecx, [ebp+var_6C]
		lea	edx, [ecx+edx*2+44565BACh]
		lea	ecx, [edx+eax*4]
		mov	eax, [ebp+var_10]
		imul	edx, [ebp+var_4C], 19836C73h
		and	ecx, 67D986C2h
		imul	ecx, 0DB33DE31h
		sub	eax, 5903BBF5h
		imul	eax, 6359AECFh
		lea	ecx, [edi+ecx]
		mov	edi, [ebp+var_10]
		imul	ecx, 12CACD49h
		lea	edx, [edx+eax-4E57E0C1h]
		imul	eax, [ebp+var_14], 0C6B35D9Eh
		add	edx, eax
		imul	eax, [ebp+var_4C], 650B311Dh
		lea	eax, [edi+eax+310423D0h]
		mov	edi, [ebp+var_14]
		lea	eax, [eax+edi*2]
		lea	eax, [eax+eax-1]
		and	eax, 0EBF04076h
		imul	eax, 9CA65131h
		lea	eax, [edx+eax]
		mov	edx, [ebp+var_28]
		imul	eax, 9E6F1249h
		not	edx
		lea	eax, [ecx+eax-1C23BDA5h]
		mov	[ebp+var_2C], eax
		mov	eax, [ebp+var_28]
		add	eax, 6DD873F4h
		mov	[ebp+var_14], eax
		add	eax, eax
		mov	[ebp+var_90], eax
		mov	ecx, [ebp+var_90]
		imul	eax, [ebp+var_5C], 0FCDEE53Fh
		imul	edi, [ebp+var_14], 1C7CAAD5h
		add	eax, 384D39D9h
		xor	eax, 0E6D4h
		sub	eax, 549A0000h
		xor	eax, edx
		xor	eax, 0FFFF192Bh
		or	eax, edx
		imul	edx, [ebp+var_5C], 0F9BDCA7Eh
		mov	[ebp+var_4C], edx
		lea	edx, [ecx+edx-144A7431h]
		lea	edx, [edx+eax*4]
		mov	[ebp+var_10], edx
		imul	edx, [ebp+var_5C], 5834936Bh
		add	edi, edx
		imul	edx, eax, 38F955AAh
		add	edi, edx
		mov	edx, [ebp+var_10]
		and	edx, 854FBA74h
		imul	edx, 0E383552Bh
		add	edi, edx
		imul	ecx, edi, 0ED3D3E7Dh
		lea	edx, [esi+23B423CDh]
		mov	[ebp+var_110], edx
		xor	edx, 4BF8h
		add	edx, 0D500000h
		add	ecx, 3882A321h
		xor	edx, 0FFFFB407h
		xor	edx, ecx
		or	edx, ecx
		sub	ecx, esi
		mov	esi, edx
		not	esi
		lea	esi, [ecx+esi*2+531A13A0h]
		mov	ecx, [ebp+var_DC]
		imul	edi, 25858306h
		mov	[ebp+var_24], esi
		lea	esi, [ecx+edi-0EFCFEA5h]
		lea	edi, [esi+edx*4]
		mov	esi, [ebp+var_94]
		and	edi, 19702C26h
		add	edi, [ebp+var_24]
		lea	ecx, [esi+esi-5E89E966h]
		and	ecx, 22BB3032h
		mov	edx, ecx
		sub	edx, esi
		lea	esi, [edx+edx+3BCEB933h]
		imul	edx, [ebp+var_54], 0A806CEE6h
		imul	ecx, 0BF53217Fh
		sub	edx, 3BA5C278h
		and	esi, edx
		lea	edx, [edi+edi-21AC9B00h]
		add	esi, [ebp+var_94]
		and	edx, 5E20E3BEh
		sub	edx, edi
		imul	edi, [ebp+var_54], 0F54F250Dh
		imul	esi, 40ACDE81h
		imul	edx, 2DA0850Fh
		lea	ecx, [edi+ecx+568A10A0h]
		lea	esi, [ecx+esi]
		imul	esi, 6D774471h
		lea	esi, [edx+esi+1356CFB1h]
		mov	[ebp+var_A4], esi
		mov	edx, [ebp+var_D8]
		mov	ecx, [ebp+var_E0]
		imul	edi, [ebp+var_70], 5DA685DDh
		sub	edx, 78E4C90Bh
		xor	edx, 0EEABh
		xor	ecx, 0EEABh
		sub	edx, 57840000h
		sub	ecx, 57840000h
		xor	edx, 7D1AFE63h
		xor	edx, ecx
		mov	ecx, [ebp+var_C8]
		mov	esi, edx
		not	esi
		xor	ecx, esi
		xor	ecx, 0FFFFDF31h
		or	ecx, esi
		imul	esi, [ebp+var_C4], 9C5421C9h
		lea	esi, [edi+esi-75ED4A9Dh]
		imul	edi, [ebp+var_C4], 20731672h
		add	edi, 61984731h
		or	edi, [ebp+var_B4]
		imul	edi, 87F604EFh
		add	esi, edi
		lea	edi, [edx-60B9D3C7h]
		imul	edi, 36AA8B4Dh
		imul	esi, 27AB1AB7h
		mov	[ebp+var_54], edi
		imul	edi, [ebp+var_58], 16D5C0E9h
		add	edi, [ebp+var_54]
		imul	eax, 1E516146h
		mov	[ebp+var_54], edi
		imul	edi, ecx, 6D55169Ah
		add	edi, [ebp+var_54]
		mov	[ebp+var_24], edi
		mov	edi, [ebp+var_6C]
		lea	edx, [edi+edx*2+44565BACh]
		mov	edi, [ebp+var_24]
		lea	edx, [edx+ecx*4]
		and	edx, 0FA35FCC6h
		imul	edx, 0C95574B3h
		imul	ecx, [ebp+var_14], 0F28B0A3h
		add	edi, edx
		imul	edx, [ebp+var_5C], 0C25F471Dh
		imul	edi, 0D49AB643h
		lea	edx, [edx+ecx-5379851Eh]
		add	edx, eax
		mov	eax, [ebp+var_10]
		lea	edi, [esi+edi+0FC9C974h]
		mov	[ebp+var_54], edi
		mov	edi, [ebp+var_B0]
		and	eax, 7DD84F9Ch
		imul	eax, 0F0D74F5Dh
		lea	eax, [edx+eax]
		imul	edx, [ebp+var_34], 51AB2979h
		imul	ecx, eax, 0E27F830Bh
		imul	esi, eax, 0C10FA865h
		imul	eax, 3B00F9EAh
		add	edx, 28E4F0BFh
		xor	edx, 0FF3h
		sub	ecx, 1
		add	edx, 38BA0000h
		xor	edx, ecx
		xor	edx, 0FFFFF00Ch
		or	edx, ecx
		imul	ecx, [ebp+var_34], 0DA19CBA9h
		lea	esi, [esi+ecx-2CF079CBh]
		imul	ecx, edx, 28F4AF62h
		lea	ecx, [esi+ecx]
		mov	esi, [ebp+var_10C]
		lea	eax, [esi+eax-3CC21E7Dh]
		lea	esi, [eax+edx*4]
		and	esi, 0DB531606h
		imul	esi, 0EB85A84Fh
		add	ecx, esi
		imul	eax, ecx, 6C47706Bh
		imul	ecx, 6B60DD5Eh
		and	ecx, 64942C76h
		imul	ecx, 139716FBh
		lea	edx, [eax+ecx-6A0834DCh]
		imul	ecx, [ebp+var_70], 0C47C24B7h
		imul	eax, [ebp+var_A0], 0C46A28D3h
		lea	esi, [ecx+eax+4EF66386h]
		mov	ecx, [ebp+var_8C]
		imul	eax, [ebp+var_8C], 3B95D72Dh
		sub	ecx, [ebp+var_A0]
		add	esi, eax
		lea	eax, [ecx+ecx-121BD25Bh]
		imul	ecx, [ebp+var_70], 0FD4733E6h
		sub	ecx, 44565BA8h
		and	eax, ecx
		imul	eax, 0C46A28D3h
		imul	ecx, [ebp+var_34], 1CD055E3h
		lea	eax, [esi+eax]
		imul	eax, 0F043FFC7h
		lea	eax, [edx+eax]
		imul	edx, [ebp+var_5C], 6FD85685h
		mov	[ebp+var_6C], eax
		mov	eax, [ebp+var_80]
		lea	edx, [edx+ecx-71507B30h]
		mov	ecx, [ebp+var_4C]
		imul	edx, 486941F3h
		xor	eax, 245h
		sub	eax, 48AE0000h
		sub	ecx, 38998C4Dh
		or	ecx, [ebp+var_BC]
		sub	edx, ecx
		sub	edx, 6CA3B6D8h
		xor	edx, 245h
		sub	edx, 48AE0000h
		xor	eax, edx
		xor	eax, 80F7A1E5h
		lea	edx, [eax-67FA46ADh]
		add	eax, eax
		and	eax, 1EF43CAh
		sub	edx, eax
		lea	ecx, [edi+edi+1C3790E4h]
		sub	edx, edi
		or	ecx, 0C36B35F0h
		lea	edx, [ecx+edx]
		imul	edx, 0ED06ACEBh
		sub	edx, 2053C139h
		mov	[ebp+var_4C], edx
		mov	esi, [ebp+var_90]
		mov	edx, 92278C0Ch
		mov	eax, [ebp+var_110]
		add	esi, 244F1818h
		xor	eax, 0D338h
		and	esi, 0C21F75ECh
		add	eax, 0D500000h
		imul	ecx, [ebp+var_68], 0BF148303h
		xor	eax, 5E3D66D5h
		sub	edx, [ebp+var_28]
		lea	edx, [ecx+edx]
		imul	ecx, [ebp+var_68], 7E290606h
		lea	edx, [esi+edx+4FE18207h]
		sub	esi, [ebp+var_28]
		sub	ecx, 5F2E6DECh
		lea	edi, [esi+esi+3DE08A13h]
		and	edi, ecx
		sub	edx, edi
		xor	edx, 0D338h
		add	edx, 0D500000h
		xor	eax, edx
		imul	edx, eax, 0EB0B0991h
		add	eax, eax
		and	eax, 0BC7ACDAAh
		imul	ecx, [ebp+var_70], 12FF09F3h
		imul	esi, [ebp+var_D0], 75E85959h
		imul	eax, 14F4F66Fh
		lea	edx, [edx+eax+577C4144h]
		lea	eax, [ecx+esi+613C0677h]
		imul	esi, [ebp+var_D0], 9D03ED4Eh
		sub	esi, 6CE16501h
		or	esi, [ebp+var_B4]
		imul	esi, 0B722D001h
		lea	esi, [eax+esi]
		imul	esi, 33991h
		lea	esi, [edx+esi]
		imul	eax, esi, 267288Fh
		imul	edx, [ebp+var_54], 5117BB87h
		mov	[ebp+var_70], esi
		imul	esi, [ebp+var_2C], 0A2FE5889h
		mov	[ebp+var_5C], eax
		mov	ecx, [ebp+var_5C]
		imul	eax, [ebp+var_A4], 9A578A5Fh
		mov	[ebp+var_140], esi
		lea	edx, [edx+eax+246AD10Ah]
		imul	eax, [ebp+var_6C], 35AD62E3h
		lea	eax, [edx+eax]
		imul	eax, 1A60A71h
		lea	edx, [ecx+eax-6338D3B5h]
		mov	eax, edx
		and	edx, 1F1864F4h
		or	eax, 1F1864F4h
		sub	eax, edx
		lea	edx, [eax+eax]
		and	edx, 0C1CF3616h
		sub	eax, edx
		imul	eax, 0E0DE7541h
		imul	edi, [ebp+var_54], 0D9570C97h
		lea	eax, [esi+eax-681A71BBh]
		mov	[ebp+var_28], eax
		imul	eax, [ebp+var_A4], 0A4A5C9EFh
		imul	esi, [ebp+var_4C], 0DA89BC3h
		mov	[ebp+var_14], edi
		mov	ecx, eax
		add	ecx, edi
		lea	edx, [ecx+0F89E52Ch]
		mov	[ebp+var_DC], eax
		mov	eax, edx
		mov	[ebp+var_58], edx
		or	eax, 0A8E008FCh
		and	edx, 0A8E008FCh
		sub	eax, edx
		mov	[ebp+var_13C], esi
		imul	esi, eax, 22379349h
		imul	edi, [ebp+var_4C], 136A639Bh
		lea	edx, [eax+eax]
		and	edx, 0AE3FEE06h
		lea	edi, [edi+esi-6EC4C9ACh]
		imul	esi, edx, 0DDC86CB7h
		lea	esi, [edi+esi]
		mov	edi, [ebp+var_13C]
		lea	eax, [edi+eax-278DD26Ah]
		sub	eax, edx
		and	eax, 0EB81421Eh
		imul	eax, 0BB90D96Eh
		imul	edx, [ebp+var_2C], 449856B7h
		lea	eax, [esi+eax]
		imul	edi, eax, 1AF80397h
		imul	esi, [ebp+var_70], 877D2A9Fh
		imul	eax, 4E0B9DF2h
		lea	esi, [edi+esi]
		mov	edi, [ebp+var_18]
		imul	esi, 0EDBC2C11h
		and	eax, 0D702843Ch
		lea	eax, [eax+esi-6A6BD441h]
		lea	eax, [edx+eax-3E2F8705h]
		mov	edx, [ebp+var_5C]
		mov	esi, eax
		and	eax, 1EF04509h
		or	esi, 1EF04509h
		add	esi, 6DD873F4h
		sub	esi, eax
		lea	eax, [ecx+edx-77C2C4DBh]
		mov	ecx, [ebp+var_18]
		mov	edx, eax
		and	eax, 2175254Ch
		or	edx, 2175254Ch
		sub	edx, eax
		mov	eax, 89E7BCA5h
		lea	ecx, [ecx+ecx-456B851Ah]
		mov	[ebp+var_C8], ecx
		and	ecx, 9C2548FEh
		sub	eax, ecx
		lea	edi, [edx+edi]
		add	edx, edx
		add	eax, edi
		and	edx, 0BD15B566h
		imul	edi, [ebp+var_4C], 0F257643Dh
		sub	eax, edx
		xor	eax, 0E74FC009h
		mov	[ebp+var_D0], edi
		imul	edx, [ebp+var_6C], 79978433h
		mov	[ebp+var_BC], edx
		add	edx, edi
		mov	edi, edx
		add	edi, 13AF0EA6h
		mov	[ebp+var_68], edx
		mov	edx, edi
		and	edi, 2DDCE440h
		or	edx, 2DDCE440h
		sub	edx, edi
		mov	edi, [ebp+var_60]
		lea	edi, [edi+edi-6C37FC9Ch]
		and	edi, 9F7B52BCh
		mov	[ebp+var_10], edi
		mov	edi, [ebp+var_18]
		sub	edi, ecx
		imul	ecx, [ebp+var_2C], 7ABCA5AFh
		mov	[ebp+var_B4], edi
		mov	[ebp+var_138], ecx
		lea	ecx, [edx+edx]
		or	ecx, 0A446377Eh
		sub	ecx, edx
		mov	edx, [ebp+var_60]
		sub	edx, [ebp+var_10]
		lea	edx, [ecx+edx+3BDD263Eh]
		mov	ecx, [ebp+var_D0]
		lea	edx, [edi+edx]
		mov	edi, [ebp+var_138]
		imul	edx, 0AC2C0F37h
		lea	edx, [edi+edx+544A2233h]
		mov	edi, [ebp+var_C8]
		mov	[ebp+var_8C], edx
		mov	edx, [ebp+var_BC]
		add	edx, [ebp+var_14]
		or	edi, 9C2548FEh
		mov	[ebp+var_134], edx
		lea	edx, [edx+ecx+70927B73h]
		mov	ecx, edx
		and	edx, 0D1F3C394h
		or	ecx, 0D1F3C394h
		sub	ecx, 4602EF02h
		sub	ecx, edx
		mov	edx, 0A5927FA3h
		sub	edx, [ebp+var_10]
		mov	[ebp+var_B0], edi
		sub	edx, ecx
		lea	ecx, [ecx+ecx-73FA21FCh]
		or	ecx, 5C1878D6h
		add	ecx, [ebp+var_60]
		lea	ecx, [edx+ecx]
		xor	ecx, 0C096289Ch
		lea	edx, [edi+ecx-720CD624h]
		add	ecx, ecx
		mov	edi, [ebp+var_58]
		and	ecx, 812C5138h
		sub	edx, ecx
		mov	ecx, [ebp+var_58]
		sub	edx, [ebp+var_18]
		or	edi, 72C15D36h
		and	ecx, 72C15D36h
		sub	edi, ecx
		mov	ecx, 8C630847h
		sub	ecx, [ebp+var_10]
		sub	ecx, edi
		add	edi, edi
		or	edi, 1A7D4592h
		add	edi, [ebp+var_60]
		lea	edi, [ecx+edi]
		mov	ecx, [ebp+var_68]
		xor	edi, 503BC39Dh
		mov	[ebp+var_34], edi
		mov	edi, [ebp+var_5C]
		lea	ecx, [edi+ecx-739D9B61h]
		mov	edi, ecx
		and	ecx, 0D7156826h
		or	edi, 0D7156826h
		add	edi, 88ECC1Dh
		sub	edi, ecx
		mov	[ebp+var_68], edi
		lea	ecx, [esi+esi+244F1818h]
		mov	edi, [ebp+var_10]
		sub	edi, [ebp+var_60]
		and	ecx, 0C21F75ECh
		sub	ecx, esi
		lea	esi, [ecx+0CC8B8FEh]
		sub	ecx, 73374703h
		mov	[ebp+var_C4], edi
		mov	edi, esi
		shl	esi, 5
		sub	esi, 1
		shl	edi, 4
		and	esi, 0A1C83648h
		shr	ecx, 1Ch
		imul	edi, 61A679C1h
		imul	esi, 9E59863Fh
		imul	ecx, 2787B9FFh
		lea	esi, [edi+esi-75DB85DCh]
		sub	ecx, 770A0372h
		mov	[ebp+var_94], esi
		imul	esi, 9A649641h
		mov	[ebp+var_14], ecx
		lea	ecx, [eax+eax]
		and	ecx, 0CE9F8012h
		sub	ecx, eax
		imul	eax, [ebp+var_2C], 449856B7h
		sub	esi, 1
		lea	ecx, [ecx+eax-1D1D2F2Ah]
		imul	eax, [ebp+var_14], 0FD5445FFh
		sub	eax, 0C31D782h
		xor	eax, 13FAh
		add	eax, 1D810000h
		imul	edi, [ebp+var_14], 2ABBA01h
		xor	eax, esi
		xor	eax, 0FFFFEC05h
		or	eax, esi
		lea	edi, [esi+edi+2A9DA9A4h]
		mov	esi, eax
		not	esi
		lea	esi, [edi+esi*2]
		mov	[ebp+var_A0], esi
		imul	edi, [ebp+var_14], 0FAA88BFEh
		imul	esi, [ebp+var_94], 0CB36D37Eh
		lea	esi, [edi+esi+229E5101h]
		lea	eax, [esi+eax*4]
		and	eax, 63D743A4h
		add	eax, [ebp+var_A0]
		imul	edi, ecx, 0E5805500h
		mov	[ebp+var_14], eax
		mov	eax, ecx
		shr	eax, 18h
		shl	ecx, 9
		imul	esi, eax, 9E58055h
		add	ecx, 1FFh
		lea	eax, [eax+eax-1FFh]
		or	eax, ecx
		imul	ecx, [ebp+var_8C], 51AB2979h
		imul	eax, 0F61A7FABh
		lea	esi, [edi+esi-38BE3FAEh]
		add	ecx, 619EF0BFh
		lea	eax, [esi+eax]
		mov	esi, [ebp+var_8C]
		shr	ecx, 13h
		mov	[ebp+var_80], eax
		mov	eax, ecx
		sub	ecx, 2000h
		not	ecx
		neg	eax
		or	ecx, 0AA29A546h
		sub	eax, 0E556CB2h
		add	ecx, ecx
		neg	esi
		sub	eax, ecx
		lea	ecx, [eax+eax+70FE63ECh]
		and	ecx, 0ABACB572h
		imul	edi, ecx, 53D3F0C9h
		sub	ecx, eax
		shl	esi, 0Dh
		lea	ecx, [ecx+ecx-1CAB195Fh]
		lea	esi, [esi+edi-5CE38C27h]
		imul	edi, [ebp+var_8C], 35A1C000h
		add	edi, 43D00000h
		and	ecx, edi
		add	ecx, eax
		mov	eax, 78B9E331h
		imul	ecx, 0AC2C0F37h
		sub	eax, edx
		shr	eax, 0Fh
		lea	edi, [edx-78B9E332h]
		sub	edx, 78B9E331h
		shl	edi, 12h
		lea	ecx, [esi+ecx]
		mov	[ebp+var_90], ecx
		mov	ecx, 88F3B48Ch
		sub	ecx, eax
		lea	eax, [eax+eax-3FFFFh]
		or	eax, 7A042695h
		add	ecx, eax
		lea	eax, [ecx+ecx+74187052h]
		and	eax, 85FBD96Ah
		mov	esi, eax
		sub	esi, ecx
		lea	esi, [esi+esi+5EBB643h]
		and	esi, edi
		add	esi, ecx
		mov	ecx, [ebp+var_D0]
		imul	edx, 0D48A0000h
		imul	eax, 29E2EA45h
		imul	esi, 0D61D15BBh
		lea	eax, [edx+eax+595B96FEh]
		lea	esi, [eax+esi]
		mov	eax, [ebp+var_DC]
		mov	[ebp+var_A0], esi
		mov	esi, [ebp+var_C4]
		lea	edx, [ecx+eax-39AA78FAh]
		add	edx, [ebp+var_BC]
		imul	ecx, [ebp+var_70], 267288Fh
		mov	eax, edx
		and	edx, 0B7A86E11h
		or	eax, 0B7A86E11h
		sub	eax, edx
		lea	edx, [eax+eax]
		sub	ecx, eax
		and	edx, 90AF23DCh
		lea	eax, [ecx+edx]
		lea	ecx, [eax+esi]
		lea	edi, [ecx+16BA18FAh]
		mov	edx, edi
		shr	edx, 0Ah
		mov	eax, edx
		sub	edx, 400000h
		not	edx
		neg	eax
		or	edx, 0D4C971DDh
		sub	eax, 5D4058A4h
		add	edx, edx
		sub	eax, edx
		imul	esi, eax, 0FA00E6CBh
		imul	edi, 0B2C00000h
		lea	edx, [eax+eax+649394FEh]
		and	edx, 566D1C44h
		lea	edi, [edi+esi+239A6605h]
		imul	esi, edx, 5FF1935h
		add	ecx, 16BA18FBh
		sub	edx, eax
		neg	ecx
		shl	ecx, 17h
		lea	esi, [edi+esi]
		lea	edi, [edx+edx+44FF4EBDh]
		mov	edx, [ebp+var_34]
		and	edi, ecx
		mov	ecx, [ebp+var_B0]
		imul	edi, 0FA00E6CBh
		lea	eax, [ecx+edx+2A3869E5h]
		lea	edi, [esi+edi]
		mov	[ebp+var_94], edi
		imul	edi, [ebp+var_2C], 61E89CF1h
		mov	[ebp+var_130], edi
		mov	edi, edx
		mov	ecx, [ebp+var_130]
		add	edi, edi
		and	edi, 0A077873Ah
		sub	eax, edi
		sub	eax, [ebp+var_18]
		imul	eax, 0AEC0BE69h
		lea	ecx, [eax+ecx]
		imul	edx, ecx, 53000000h
		imul	ecx, 2BC74E27h
		add	edx, 796B230Bh
		add	ecx, 4F8C1919h
		shr	ecx, 8
		imul	ecx, 5C4036C7h
		imul	esi, edx, 0B07880DBh
		imul	edx, 19B6B6BAh
		add	ecx, 4C9EC74Ch
		imul	eax, ecx, 3ED18EB1h
		imul	ecx, 23FB55EEh
		sub	edx, 2B9347FFh
		lea	esi, [esi+eax-11EAD269h]
		mov	eax, [ebp+var_68]
		add	ecx, 3EB27B59h
		or	ecx, edx
		imul	ecx, 0AEC0BE69h
		add	eax, [ebp+var_C4]
		lea	ecx, [esi+ecx]
		mov	esi, [ebp+var_68]
		mov	[ebp+var_34], ecx
		imul	ecx, [ebp+var_B4], 972AA73Bh
		lea	edx, [esi+esi-111D983Ah]
		or	edx, 51D52FB2h
		sub	eax, edx
		imul	eax, 68D558C5h
		lea	esi, [ecx+eax-474BEF02h]
		imul	esi, 15C660Dh
		lea	ecx, [esi+222B2DD3h]
		mov	edx, ecx
		shr	edx, 3
		mov	eax, edx
		sub	edx, 20000000h
		not	edx
		neg	eax
		or	edx, 0F4430A6h
		add	eax, 3F410E17h
		add	edx, edx
		sub	eax, edx
		imul	edi, eax, 972AA73Bh
		lea	edx, [eax+eax-1FF9BAE6h]
		lea	ecx, [ecx+ecx*2]
		and	edx, 0E1779EB2h
		shl	ecx, 1Dh
		lea	edi, [ecx+edi-4ED45A22h]
		imul	ecx, edx, 68D558C5h
		sub	edx, eax
		shl	esi, 1Eh
		neg	esi
		imul	eax, [ebp+var_94], 0CA16623Ah
		lea	ecx, [edi+ecx]
		lea	edi, [edx+edx+3E821C33h]
		and	edi, esi
		imul	edi, 972AA73Bh
		add	eax, 6208479Bh
		lea	edi, [ecx+edi]
		mov	[ebp+var_68], edi
		imul	ecx, [ebp+var_90], 0A35652F2h
		mov	[ebp+var_C4], eax
		imul	eax, [ebp+var_90], 0D98094CDh
		imul	edx, [ebp+var_94], 71B674C1h
		sub	ecx, 3CC21E81h
		imul	esi, [ebp+var_80], 5D592617h
		lea	edx, [edx+eax+31490865h]
		mov	eax, [ebp+var_C4]
		or	eax, ecx
		imul	eax, 9293FB0Bh
		lea	eax, [edx+eax]
		mov	[ebp+var_124], eax
		imul	eax, [ebp+var_34], 578E9C4Eh
		imul	edx, [ebp+var_80], 81D6F9FAh
		add	eax, 6214B57h
		mov	[ebp+var_120], eax
		add	edx, 5F2E6DEBh
		mov	edi, [ebp+var_120]
		imul	eax, [ebp+var_94], 39917677h
		lea	esi, [esi+eax-0D4B5E8Fh]
		mov	eax, [ebp+var_C4]
		or	eax, edx
		imul	eax, 8CC7DA5Dh
		lea	eax, [esi+eax]
		mov	[ebp+var_B4], eax
		imul	eax, 8E446C16h
		or	ecx, edx
		imul	edx, [ebp+var_80], 189547E9h
		mov	[ebp+var_11C], ecx
		add	eax, 219129CFh
		or	eax, edi
		mov	[ebp+var_8C], eax
		imul	eax, [ebp+var_90], 581D70F5h
		imul	edi, [ebp+var_28], 9783556Bh
		lea	edx, [edx+eax-33D700D2h]
		imul	eax, ecx, 0AE0D9FA3h
		imul	ecx, [ebp+var_28], 6423582h
		lea	eax, [edx+eax]
		mov	edx, [ebp+var_14]
		mov	[ebp+var_118], eax
		add	ecx, 38998C4Ch
		lea	eax, [edx+edx+244F1818h]
		and	eax, 0C21F75ECh
		mov	edx, eax
		sub	edx, [ebp+var_14]
		imul	esi, eax, 312C972Bh
		imul	eax, 32BD3785h
		lea	edx, [edx+edx+199171FBh]
		and	ecx, edx
		add	ecx, [ebp+var_14]
		lea	esi, [edi+esi-7541DA17h]
		imul	ecx, 0CED368D5h
		lea	ecx, [esi+ecx]
		mov	[ebp+var_114], ecx
		imul	ecx, [ebp+var_A0], 57F9311Ah
		imul	esi, [ebp+var_28], 3B518321h
		add	ecx, 3BA5C277h
		mov	[ebp+var_12C], ecx
		imul	ecx, [ebp+var_A0], 6EEF5293h
		lea	edi, [esi+ecx+76826A7Dh]
		imul	ecx, [ebp+var_28], 0F9BDCA7Eh
		sub	ecx, 38998C4Dh
		or	ecx, [ebp+var_12C]
		imul	ecx, 0E73E6061h
		lea	ecx, [edi+ecx]
		mov	[ebp+var_D8], ecx
		imul	ecx, [ebp+var_68], 2B8CC1Ah
		mov	[ebp+var_128], ecx
		add	ecx, 44565BA7h
		mov	[ebp+var_10C], ecx
		imul	ecx, [ebp+var_34], 0A87163B2h
		sub	ecx, 6214B58h
		and	ecx, edx
		add	ecx, [ebp+var_14]
		imul	edx, [ebp+var_34], 1EDF04BDh
		imul	ecx, 0CD42C87Bh
		lea	edx, [edx+eax+5A21A7AAh]
		lea	ecx, [edx+ecx]
		mov	edx, 6DD873F3h
		mov	[ebp+var_E0], ecx
		mov	edi, [ebp+var_30]
		sub	edx, [ebp+var_14]
		imul	ecx, [ebp+var_28], 0FCDEE53Fh
		imul	esi, [ebp+var_28], 7142E015h
		lea	eax, [ecx+384D39D9h]
		xor	eax, 0E6D4h
		sub	eax, 549A0000h
		xor	eax, edx
		xor	eax, 0FFFF192Bh
		or	eax, edx
		imul	edx, [ebp+var_14], 0FB6581ABh
		add	ecx, [ebp+var_14]
		lea	esi, [edx+esi+207613F3h]
		imul	edx, eax, 0F6CB0356h
		lea	eax, [ecx+eax*2]
		lea	edx, [esi+edx]
		lea	esi, [eax+eax-144A7431h]
		and	esi, 8FE171E2h
		imul	esi, 49A7E55h
		lea	esi, [edx+esi]
		imul	edx, [ebp+var_68], 15C660Dh
		imul	eax, esi, 0A1B97103h
		mov	[ebp+var_B0], esi
		mov	esi, [ebp+var_F0]
		sub	edx, 160ED22Dh
		xor	edx, 20CEh
		sub	eax, 1
		add	edx, 383A0000h
		and	esi, 0A50FF288h
		xor	edx, eax
		xor	edx, 0FFFFDF31h
		or	edx, eax
		mov	eax, [ebp+var_C]
		mov	[ebp+var_14], edx
		mov	edx, [ebp+var_48]
		mov	[ebp+var_110], esi
		lea	ecx, [eax+edi-33AF3115h]
		mov	eax, [ebp+var_1F4]
		xor	ecx, 5B1DD127h
		mov	edi, [ebp+var_148]
		lea	edx, [ecx+edx]
		add	ecx, ecx
		and	ecx, 0B63BA24Eh
		sub	edx, ecx
		add	eax, 7E44A898h
		sub	eax, [ebp+var_C0]
		add	edx, 169B8DF2h
		xor	edx, 64E03834h
		sub	eax, edx
		add	edx, edx
		or	edx, 0C9C07068h
		or	edi, 0A50FF288h
		add	eax, edx
		imul	ecx, eax, 53C33557h
		sub	eax, 27A72401h
		and	eax, 0C34F303Fh
		imul	eax, 58799552h
		lea	eax, [ecx+eax+1DDEFF12h]
		mov	ecx, [ebp+var_3C]
		imul	edx, eax, 0FE73327h
		imul	eax, 0B0D0CCEh
		and	eax, 869E607Eh
		sub	ecx, eax
		imul	eax, ecx, 0E0DE7541h
		mov	ecx, edi
		sub	ecx, [ebp+var_1EC]
		add	ecx, [ebp+var_C]
		lea	eax, [edx+eax-31F7EC1Ch]
		mov	[ebp+var_28], eax
		mov	eax, [ebp+var_7C]
		mov	edx, ecx
		sub	eax, [ebp+var_1F0]
		xor	edx, 0E3B74D44h
		xor	ecx, 87DE7AA3h
		lea	eax, [edx+eax+28399079h]
		add	edx, edx
		and	edx, 0C76E9A88h
		sub	eax, edx
		mov	edx, [ebp+var_78]
		sub	edx, [ebp+var_1E8]
		xor	eax, 0DC73761Ch
		lea	edx, [eax+edx+20E34FD4h]
		add	eax, eax
		and	eax, 0B8E6EC38h
		sub	edx, eax
		mov	eax, [ebp+var_38]
		lea	esi, [edx+eax-446FD9B8h]
		mov	eax, 0D13892B6h
		sub	eax, [ebp+var_38]
		add	esi, esi
		or	esi, 0C21F75ECh
		sub	eax, edx
		mov	edx, [ebp+var_48]
		add	esi, eax
		imul	eax, [ebp+var_A8], 0F61A7FABh
		sub	edx, ecx
		add	ecx, ecx
		or	ecx, 0FBCF546h
		lea	ecx, [edx+ecx]
		mov	edx, [ebp+var_20]
		lea	ecx, [edx+ecx]
		imul	edx, ecx, 0F61A7FABh
		imul	ecx, [ebp+var_3C], 0AC2C0F37h
		lea	edx, [eax+edx+250C6A3Ch]
		mov	[ebp+var_C0], edx
		mov	edx, [ebp+var_F0]
		or	edx, 0A50FF288h
		sub	edx, [ebp+var_1E0]
		mov	[ebp+var_24], ecx
		mov	eax, [ebp+var_20]
		mov	ecx, [ebp+var_1C]
		lea	eax, [edx+eax]
		add	eax, ecx
		mov	ecx, [ebp+var_38]
		lea	eax, [ecx+eax]
		mov	ecx, [ebp+var_24]
		imul	eax, 0AC2C0F37h
		lea	eax, [ecx+eax+21275717h]
		mov	ecx, [ebp+var_144]
		mov	[ebp+var_48], eax
		mov	eax, [ebp+var_1F0]
		or	ecx, 0A50FF288h
		sub	ecx, [ebp+var_1E4]
		add	eax, 5DA5CB0Fh
		add	ecx, [ebp+var_30]
		sub	eax, [ebp+var_F8]
		xor	ecx, 5DD7F1BCh
		sub	eax, ecx
		add	ecx, ecx
		or	ecx, 0BBAFE378h
		add	eax, ecx
		mov	ecx, [ebp+var_1C]
		xor	eax, 95CC891Bh
		sub	ecx, eax
		add	eax, eax
		or	eax, 2B991236h
		lea	eax, [ecx+eax+0F74E79Fh]
		imul	ecx, eax, 5B282DF1h
		add	eax, 163C4C11h
		and	eax, 1838B144h
		imul	eax, 49AFA41Eh
		lea	eax, [ecx+eax+18F26E05h]
		imul	ecx, eax, 0CD56026Bh
		imul	eax, 0F7BA4622h
		and	eax, 30716288h
		sub	eax, [ebp+var_A8]
		imul	eax, 29E2EA45h
		lea	eax, [ecx+eax+604D12C9h]
		mov	[ebp+var_7C], eax
		mov	eax, [ebp+var_1E0]
		sub	eax, [ebp+var_1E8]
		add	eax, [ebp+var_78]
		sub	eax, [ebp+var_110]
		xor	eax, 7FAF762Dh
		imul	ecx, [ebp+var_3C], 0FA00E6CBh
		add	edx, [ebp+var_C]
		sub	edi, [ebp+var_1EC]
		mov	[ebp+var_30], ecx
		mov	ecx, [ebp+var_64]
		sub	ecx, [ebp+var_1F4]
		add	ecx, eax
		add	eax, eax
		and	eax, 0FF5EEC5Ah
		sub	ecx, eax
		mov	eax, [ebp+var_38]
		lea	ecx, [eax+ecx]
		imul	eax, ecx, 0FA00E6CBh
		mov	ecx, [ebp+var_30]
		lea	eax, [ecx+eax+7B15B302h]
		imul	ecx, edx, 37F946F1h
		and	edx, 0A74CE71Ch
		imul	edx, 900D721Eh
		mov	[ebp+var_24], eax
		lea	edx, [ecx+edx+54D3395Ch]
		imul	eax, edx, 0B3AEA11h
		imul	edx, 1675D422h
		add	eax, [ebp+var_A8]
		imul	ecx, [ebp+var_3C], 0AEC0BE69h
		and	edx, 4E99CE38h
		sub	eax, edx
		imul	edx, eax, 0A81F7FB3h
		add	eax, 62CAA3E7h
		and	eax, 0FCFBE265h
		imul	eax, 0AFC1009Ah
		lea	edx, [edx+eax-685C64DCh]
		imul	eax, edx, 60828EF6h
		imul	edx, 6E58ED87h
		and	eax, 0F9F7C4CAh
		mov	[ebp+var_C], eax
		mov	eax, [ebp+var_38]
		sub	eax, [ebp+var_C]
		imul	eax, 0A15D0E65h
		lea	edx, [eax+edx]
		mov	eax, [ebp+var_38]
		imul	edx, 0E731BDB5h
		lea	edx, [ecx+edx-7D3D6081h]
		mov	[ebp+var_64], edx
		mov	edx, [ebp+var_1F0]
		lea	ecx, [edi+edx-44824335h]
		add	ecx, [ebp+var_1C]
		sub	ecx, [ebp+var_F8]
		lea	edi, [esi+esi+244F1818h]
		xor	ecx, 0ECB80859h
		lea	eax, [ecx+eax]
		add	ecx, ecx
		and	ecx, 0D97010B2h
		and	edi, 0C21F75ECh
		sub	eax, ecx
		sub	edi, esi
		imul	edx, eax, 9F54612Dh
		sub	eax, 57CA3ADCh
		and	eax, 0EBFA41C8h
		imul	eax, 0C1573DA6h
		lea	ecx, [edi+4C8B8FDh]
		sub	edi, 73374703h
		shr	edi, 1Bh
		imul	edi, 0AD22DDh
		lea	eax, [edx+eax+1880A37Ch]
		mov	[ebp+var_30], eax
		shl	ecx, 5
		mov	eax, 0FFFFFFE0h
		sub	eax, ecx
		mov	edx, ecx
		neg	edx
		or	eax, 8FE137EEh
		add	eax, eax
		add	edx, 6F717393h
		lea	esi, [edi-78D84E16h]
		sub	edx, eax
		imul	eax, esi, 0F507C575h
		mov	ecx, 0DF903BC5h
		sub	ecx, edx
		imul	esi, 7507C575h
		sub	eax, 47FA6212h
		xor	eax, 0EA84h
		add	eax, 27870000h
		xor	eax, 0FFFF157Bh
		xor	eax, ecx
		or	eax, ecx
		lea	ecx, [edi-78D84E15h]
		mov	edi, eax
		imul	ecx, 0F507C575h
		not	edi
		lea	esi, [edx+esi]
		lea	eax, [esi+eax*2]
		lea	eax, [eax+eax-73BABh]
		neg	ecx
		and	eax, 2222E5CEh
		sub	ecx, 2E2D9BA7h
		sub	ecx, edx
		lea	ecx, [ecx+edi*2]
		lea	eax, [ecx+eax]
		imul	ecx, [ebp+var_C0], 70FFD200h
		mov	[ebp+var_C], eax
		sub	ecx, 6FB3581Ah
		imul	eax, [ebp+var_C0], 40EB7CFDh
		add	eax, 2F9736F5h
		shr	eax, 17h
		imul	edx, eax, 1DFD8069h
		sub	eax, 200h
		not	eax
		or	eax, 71207CF6h
		imul	eax, 3BFB00D2h
		lea	edx, [edx+eax+3F0DEDECh]
		imul	eax, ecx, 0A7CF9BF5h
		imul	esi, edx, 39D80FD9h
		imul	edi, edx, 0AC6C30Dh
		imul	edx, 8C4FE04Eh
		add	eax, 3D5AFAE1h
		xor	eax, 369Fh
		sub	esi, 1
		sub	eax, 5EEC0000h
		xor	eax, 0FFFFC960h
		xor	eax, esi
		or	eax, esi
		imul	esi, ecx, 0A5124859h
		imul	ecx, 4F9F37EAh
		sub	esi, edi
		lea	edx, [ecx+edx-43220A39h]
		mov	ecx, [ebp+var_48]
		imul	edi, eax, 13CB00AAh
		lea	eax, [edx+eax*4]
		and	eax, 1DBF0612h
		imul	eax, 0F61A7FABh
		lea	esi, [esi+edi+4B491003h]
		shl	ecx, 0Bh
		lea	eax, [esi+eax]
		mov	[ebp+var_1C], eax
		imul	eax, [ebp+var_48], 51AB2979h
		add	eax, 619EF0BFh
		shr	eax, 15h
		imul	eax, 5B0BCAFFh
		sub	eax, 708D5356h
		imul	edx, eax, 3018AC37h
		imul	eax, 3DF669FEh
		lea	edx, [ecx+edx+155B60BAh]
		add	eax, 360AE555h
		imul	ecx, [ebp+var_48], 0B2979000h
		sub	ecx, 10F40001h
		or	eax, ecx
		imul	eax, 0AC2C0F37h
		imul	ecx, [ebp+var_24], 9FB00000h
		lea	eax, [edx+eax]
		mov	[ebp+var_20], eax
		sub	ecx, 1403340Bh
		imul	eax, [ebp+var_7C], 2BFC988Dh
		add	eax, 1DD2E13Bh
		shr	eax, 11h
		mov	[ebp+var_48], eax
		imul	eax, [ebp+var_24], 0E50B311Dh
		add	eax, 310423CDh
		shr	eax, 0Ch
		imul	edx, eax, 68B2786Fh
		lea	eax, [eax+eax-1FFFFFh]
		and	eax, 69BC6322h
		imul	eax, 974D8791h
		lea	edx, [edx+eax+5427EE4Eh]
		imul	eax, ecx, 70EE8DC7h
		imul	esi, edx, 0E515E68Fh
		imul	edi, edx, 47DB29Bh
		imul	edx, 35D432E2h
		sub	eax, 48F97C74h
		xor	eax, 5052h
		sub	esi, 1
		add	eax, 0A3B0000h
		xor	eax, 0FFFFAFADh
		xor	eax, esi
		or	eax, esi
		imul	esi, ecx, 0C974C933h
		imul	ecx, 0E1DD1B8Eh
		sub	esi, edi
		lea	edx, [ecx+edx-7D7CF8E3h]
		imul	edi, eax, 0BFE326Ah
		lea	eax, [edx+eax*4]
		and	eax, 69BC6322h
		imul	eax, 0FA00E6CBh
		lea	esi, [esi+edi-256BE806h]
		imul	ecx, [ebp+var_64], 0B6000000h
		lea	eax, [esi+eax]
		mov	[ebp+var_24], eax
		imul	eax, [ebp+var_64], 2BC74E27h
		add	ecx, 2ED6D6B6h
		add	eax, 310A5ABh
		shr	eax, 7
		imul	edx, eax, 188AED71h
		lea	eax, [eax+eax-3FFFFFFh]
		and	eax, 0C928B3B2h
		imul	eax, 0E775128Fh
		lea	edx, [edx+eax+3A2E7B3Ah]
		imul	eax, ecx, 0E0319425h
		imul	esi, edx, 93223391h
		imul	edi, edx, 9F33B87h
		imul	edx, 0D9BB98DEh
		add	eax, 3187BFB1h
		xor	eax, 25CAh
		sub	esi, 1
		sub	eax, 2B8C0000h
		xor	eax, 0FFFFDA35h
		xor	eax, esi
		or	eax, esi
		imul	esi, ecx, 0FDF6C6D3h
		imul	ecx, 0C063284Ah
		sub	esi, edi
		lea	edx, [ecx+edx+0BF77F67h]
		mov	ecx, [ebp+var_3C]
		imul	edi, eax, 0A27E832Eh
		lea	eax, [edx+eax*4]
		and	eax, 0C928B3B2h
		imul	edx, [ebp+var_30], 7D032D4Ah
		imul	eax, 0AEC0BE69h
		lea	esi, [esi+edi-62078549h]
		mov	edi, [ebp+var_48]
		and	edx, 0D7F48390h
		lea	eax, [esi+eax]
		sub	ecx, edx
		mov	[ebp+var_38], eax
		imul	edx, ecx, 972AA73Bh
		imul	eax, [ebp+var_30], 0FB355B07h
		lea	ecx, [eax+edx-0B879343h]
		mov	eax, 360CA804h
		imul	ecx, 15C660Dh
		add	ecx, 222B2DD3h
		mov	edx, ecx
		shr	edx, 5
		imul	edx, 6CE0C639h
		shl	ecx, 1Bh
		sub	eax, ecx
		imul	esi, eax, 5F1EA07Bh
		add	edx, 52B85413h
		imul	ecx, edx, 7CDC86EDh
		imul	eax, 5F66507Eh
		imul	edx, 3E429012h
		lea	ecx, [esi+ecx+915DA59h]
		add	eax, 13AC0E07h
		add	edx, 28D966ABh
		or	edx, eax
		imul	edx, 972AA73Bh
		imul	eax, [ebp+var_48], 29E2EA45h
		imul	esi, [ebp+var_20], 51AB2979h
		lea	edx, [ecx+edx]
		mov	[ebp+var_30], edx
		mov	edx, [ebp+var_7C]
		imul	ecx, [ebp+var_7C], 988D0000h
		mov	[ebp+var_88], esi
		shl	edx, 0Fh
		lea	edx, [edx+eax+12C3F2D4h]
		sub	ecx, 1EC40001h
		imul	edx, 2BFC988Dh
		lea	eax, [edi+edi-0FFFFh]
		mov	edi, [ebp+var_38]
		or	eax, ecx
		mov	ecx, esi
		add	ecx, 28E4F0BFh
		sub	edx, eax
		xor	ecx, 0F1D6h
		lea	eax, [edx-1AE71EC5h]
		add	ecx, 38BA0000h
		xor	eax, 0F1D6h
		xor	ecx, 4F802B4Ah
		add	eax, 38BA0000h
		not	edi
		xor	ecx, eax
		imul	eax, [ebp+var_38], 2BC74E27h
		mov	esi, ecx
		not	esi
		mov	[ebp+var_48], eax
		add	eax, 5A94A5ABh
		xor	eax, 0D749h
		sub	eax, 57840000h
		xor	eax, esi
		xor	eax, 0FFFF28B6h
		or	eax, esi
		imul	esi, [ebp+var_38], 578E9C4Eh
		imul	edi, 2BC74E27h
		mov	[ebp+var_7C], esi
		mov	esi, 0DA0CEFC0h
		sub	esi, ecx
		add	esi, edi
		mov	edi, eax
		not	edi
		lea	esi, [esi+edi*2]
		mov	edi, [ebp+var_7C]
		lea	ecx, [edi+ecx*2+6214B5Bh]
		lea	ecx, [ecx+eax*4]
		and	ecx, 23CAC870h
		lea	ecx, [esi+ecx]
		lea	eax, [ecx+ecx+7988A906h]
		and	eax, 0BCCA9EE4h
		imul	esi, [ebp+var_34], 5EF29997h
		sub	ecx, eax
		imul	eax, [ebp+var_124], 9A29D02Dh
		imul	ecx, 9098FB75h
		lea	esi, [esi+eax-2A16246Ch]
		imul	eax, [ebp+var_124], 2AE30EBAh
		add	eax, 543189B7h
		or	eax, [ebp+var_120]
		imul	eax, 0D2BF10EFh
		lea	eax, [esi+eax]
		imul	eax, 421471DBh
		lea	eax, [ecx+eax-7B7050F3h]
		mov	[ebp+var_64], eax
		imul	eax, [ebp+var_30], 15C660Dh
		imul	ecx, [ebp+var_24], 0CA16623Ah
		mov	[ebp+var_AC], eax
		sub	eax, 160ED22Dh
		mov	[ebp+var_50], eax
		imul	eax, [ebp+var_1C], 81D6F9FAh
		mov	[ebp+var_3C], ecx
		imul	ecx, [ebp+var_24], 0D0B0961Bh
		add	eax, 5F2E6DEBh
		mov	[ebp+var_78], eax
		imul	eax, [ebp+var_1C], 0E46E973Bh
		lea	eax, [ecx+eax+176854B5h]
		mov	ecx, [ebp+var_3C]
		imul	eax, 1FEE2927h
		add	ecx, 6208479Bh
		or	ecx, [ebp+var_78]
		sub	eax, ecx
		mov	ecx, [ebp+var_50]
		add	eax, 36A5762Fh
		xor	eax, 4EF1h
		add	eax, 383A0000h
		xor	ecx, 4EF1h
		add	ecx, 383A0000h
		xor	eax, ecx
		xor	eax, 0A31930BCh
		lea	ecx, [eax+eax]
		mov	esi, eax
		imul	edi, [ebp+var_34], 0D438B1D9h
		and	ecx, 46326178h
		sub	esi, ecx
		sub	ecx, eax
		imul	eax, [ebp+var_34], 2BC74E27h
		lea	esi, [esi+edi-70C009D7h]
		imul	edi, [ebp+var_B4], 0B8DDC9F5h
		lea	ecx, [ecx+eax+24C6A0E7h]
		imul	eax, [ebp+var_B4], 4722360Bh
		add	edi, esi
		mov	esi, [ebp+var_50]
		add	edi, [ebp+var_8C]
		add	ecx, eax
		sub	ecx, [ebp+var_8C]
		add	edi, edi
		xor	esi, 20CEh
		or	edi, 0A12CEDCAh
		add	esi, 383A0000h
		lea	ecx, [edi+ecx]
		mov	[ebp+var_A8], ecx
		mov	ecx, [ebp+var_48]
		lea	eax, [edx+6680E13Bh]
		xor	eax, 0D749h
		sub	eax, 48AE0000h
		xor	eax, 6BA56AAh
		add	ecx, 4BBEA5ABh
		xor	ecx, 0D749h
		sub	ecx, 48AE0000h
		xor	eax, ecx
		mov	ecx, eax
		imul	edi, [ebp+var_30], 2B8CC1Ah
		not	ecx
		xor	esi, ecx
		xor	esi, 0FFFFDF31h
		or	esi, ecx
		mov	ecx, 0EBDBFBA4h
		sub	ecx, eax
		lea	eax, [edi+eax*2+44565BABh]
		lea	eax, [eax+esi*4]
		and	eax, 1B4527E0h
		add	ecx, eax
		imul	esi, 3D6B1022h
		imul	eax, [ebp+var_30], 5A8AAEDDh
		imul	ecx, 614A77EFh
		lea	esi, [eax+esi+5AD7E40Ah]
		lea	ecx, [esi+ecx]
		imul	esi, ecx, 19C24883h
		imul	ecx, 62D72E1Eh
		imul	eax, [ebp+var_118], 0DD9B491Bh
		imul	edi, [ebp+var_28], 0F275E45Bh
		and	ecx, 16318AB4h
		imul	ecx, 0B0B68B3h
		lea	ecx, [esi+ecx+5A3115CEh]
		imul	esi, [ebp+var_94], 19836C73h
		lea	esi, [esi+eax+745E8183h]
		imul	eax, [ebp+var_118], 0B980E7EAh
		sub	eax, 4E4F72A3h
		or	eax, [ebp+var_C4]
		imul	eax, 9CA65131h
		lea	eax, [esi+eax]
		imul	eax, 0AB4880DDh
		imul	esi, [ebp+var_28], 0FCDEE53Fh
		lea	eax, [ecx+eax]
		mov	ecx, 6DD873F3h
		mov	[ebp+var_48], eax
		lea	eax, [esi+384D39D9h]
		sub	ecx, [ebp+var_C]
		xor	eax, 0E6D4h
		sub	eax, 549A0000h
		add	esi, [ebp+var_C]
		xor	eax, ecx
		xor	eax, 0FFFF192Bh
		or	eax, ecx
		imul	ecx, [ebp+var_C], 0E7C96DE5h
		lea	edi, [edi+ecx+7CE0510Bh]
		imul	ecx, eax, 0CF92DBCAh
		lea	eax, [esi+eax*2]
		add	edi, ecx
		lea	ecx, [eax+eax-144A7431h]
		and	ecx, 90871C8Eh
		imul	ecx, 1836921Bh
		lea	ecx, [edi+ecx]
		imul	edi, [ebp+var_24], 0E50B311Dh
		imul	esi, ecx, 0DE3407EDh
		mov	eax, edi
		add	eax, 23B423CDh
		sub	esi, 1
		xor	eax, 4BF8h
		add	eax, 0D500000h
		xor	eax, esi
		xor	eax, 0FFFFB407h
		mov	[ebp+var_30], edi
		or	eax, esi
		imul	esi, [ebp+var_24], 0DC7862CFh
		imul	edi, ecx, 85AAE941h
		imul	ecx, 4397F026h
		lea	edi, [esi+edi+3CA791EAh]
		imul	esi, eax, 0BB8757B6h
		lea	esi, [edi+esi]
		mov	edi, [ebp+var_3C]
		lea	ecx, [edi+ecx+6208479Fh]
		lea	edi, [ecx+eax*4]
		imul	ecx, [ebp+var_A0], 0F54F250Dh
		and	edi, 52986962h
		imul	eax, [ebp+var_114], 0CFD8CB03h
		imul	edi, 223C5425h
		lea	eax, [ecx+eax+6B9CFE26h]
		imul	ecx, [ebp+var_114], 0D2DF06h
		add	esi, edi
		imul	esi, 2D957F19h
		imul	edi, [ebp+var_68], 0FEA399F3h
		add	ecx, 558E23D1h
		or	ecx, [ebp+var_12C]
		imul	ecx, 0BF53217Fh
		lea	ecx, [eax+ecx]
		mov	eax, [ebp+var_AC]
		imul	ecx, 989CA1E3h
		add	eax, 5EF32DD3h
		lea	ecx, [esi+ecx-509A9F72h]
		xor	eax, 20CEh
		imul	esi, [ebp+var_38], 6640CE0Dh
		sub	eax, 3CC80000h
		mov	[ebp+var_C4], ecx
		xor	eax, 43FC5952h
		imul	ecx, [ebp+var_1C], 0BC90FAFFh
		lea	ecx, [ecx+esi+794D5549h]
		mov	esi, [ebp+var_7C]
		imul	ecx, 17837403h
		add	esi, 6214B57h
		or	esi, [ebp+var_78]
		sub	ecx, esi
		sub	ecx, 3A78373Bh
		imul	esi, [ebp+var_D8], 0FA0C43A1h
		xor	ecx, 20CEh
		sub	ecx, 3CC80000h
		xor	eax, ecx
		lea	ecx, [eax+eax]
		and	ecx, 87F8B2A4h
		lea	edi, [edi+esi+0F55B7B4h]
		imul	esi, [ebp+var_D8], 0BE778BEh
		add	esi, 768B9563h
		or	esi, [ebp+var_10C]
		add	edi, esi
		mov	esi, ecx
		sub	esi, eax
		sub	esi, edi
		sub	edi, ecx
		lea	eax, [edi+eax-28CA56E7h]
		add	eax, eax
		or	eax, 923191A0h
		lea	eax, [esi+eax-431BEAFFh]
		mov	[ebp+var_D8], eax
		mov	eax, [ebp+var_C]
		imul	esi, [ebp+var_28], 6423582h
		imul	ecx, [ebp+var_28], 3211AC1h
		sub	ecx, [ebp+var_C]
		lea	edi, [eax+eax+244F1818h]
		and	edi, 0C21F75ECh
		add	esi, 38998C4Ch
		mov	eax, edi
		sub	eax, [ebp+var_C]
		lea	ecx, [edi+ecx+26B17F23h]
		lea	eax, [eax+eax+199171FBh]
		mov	[ebp+var_38], eax
		mov	eax, [ebp+var_88]
		and	esi, [ebp+var_38]
		sub	eax, 20C50F41h
		sub	ecx, esi
		xor	eax, 0FF3h
		xor	ecx, 0FF3h
		sub	eax, 7D9C0000h
		sub	ecx, 7D9C0000h
		xor	eax, 0F073D0h
		xor	eax, ecx
		imul	ecx, eax, 907A8213h
		add	eax, eax
		and	eax, 1E0E7A0h
		imul	eax, 6F857DEDh
		imul	esi, [ebp+var_68], 3B83DB49h
		lea	ecx, [ecx+eax+51AC8FA9h]
		imul	eax, [ebp+var_E0], 0B749ED89h
		lea	esi, [esi+eax-3C9D4FC6h]
		imul	eax, [ebp+var_E0], 0E814529Ah
		sub	eax, 15CB29A1h
		or	eax, [ebp+var_10C]
		imul	eax, 0C46A28D3h
		add	edx, 420AE13Bh
		xor	edx, 0F1D6h
		sub	edx, 24380000h
		xor	edx, 3EEC3304h
		lea	eax, [esi+eax]
		imul	eax, 9C8279C1h
		imul	esi, [ebp+var_20], 0A35652F2h
		lea	eax, [ecx+eax]
		mov	[ebp+var_B4], eax
		sub	esi, 3CC21E81h
		imul	eax, [ebp+var_28], 0CC83BAB7h
		imul	ecx, [ebp+var_20], 1EFD85C1h
		lea	ecx, [ecx+eax-1677169Fh]
		imul	eax, [ebp+var_28], 0F9BDCA7Eh
		imul	ecx, 285FC1B9h
		sub	eax, 38998C4Dh
		or	eax, esi
		sub	ecx, eax
		sub	ecx, 55579D81h
		xor	ecx, 0F1D6h
		sub	ecx, 24380000h
		imul	esi, [ebp+var_80], 821B00BDh
		xor	edx, ecx
		imul	ecx, [ebp+var_90], 9A081239h
		lea	eax, [esi+ecx-0E7B6C1Ch]
		imul	eax, 1CAED141h
		sub	eax, [ebp+var_11C]
		imul	ecx, [ebp+var_A0], 2BFC988Dh
		add	eax, 326676D0h
		xor	eax, 0F1D6h
		sub	ecx, 3C9E1EC5h
		add	eax, 5A710000h
		xor	ecx, 0F1D6h
		xor	eax, 61B59AF8h
		add	ecx, 5A710000h
		xor	eax, ecx
		mov	ecx, 22C967F4h
		sub	ecx, edx
		add	edx, edx
		or	edx, 7DD86608h
		lea	edx, [ecx+edx]
		add	edx, eax
		add	eax, eax
		and	eax, 0C36B35F0h
		sub	edx, eax
		xor	edx, 4E803381h
		add	edx, 7A93C2B6h
		mov	[ebp+var_A0], edx
		mov	edx, [ebp+var_30]
		imul	eax, [ebp+var_1C], 0BF148303h
		sub	eax, [ebp+var_C]
		mov	esi, [ebp+var_128]
		sub	edx, 0B9DC33h
		lea	ecx, [edi+eax+2B738207h]
		xor	edx, 4BF8h
		imul	eax, [ebp+var_1C], 7E290606h
		add	edx, 31BE0000h
		xor	edx, 546E0A1Fh
		imul	edi, [ebp+var_68], 12FF09F3h
		sub	eax, 5F2E6DECh
		and	eax, [ebp+var_38]
		sub	ecx, eax
		xor	ecx, 4BF8h
		add	ecx, 31BE0000h
		xor	edx, ecx
		imul	eax, edx, 0F6A9505Dh
		add	edx, edx
		and	edx, 0A8DC143Eh
		imul	edx, 956AFA3h
		lea	eax, [eax+edx+3A0CEC80h]
		imul	edx, [ebp+var_B0], 74F1E103h
		lea	ecx, [edi+edx+20C831EDh]
		mov	edi, [ebp+var_14]
		imul	edx, [ebp+var_14], 91BA5FFEh
		add	ecx, edx
		imul	edx, [ebp+var_B0], 0BC8D1DFAh
		lea	edx, [esi+edx+44565BABh]
		mov	esi, [ebp+arg_4]
		lea	edx, [edx+edi*4]
		mov	edi, [ebp+arg_4]
		and	edx, 4DFE040Eh
		imul	edx, 0B722D001h
		mov	esi, [esi+3Ch]
		mov	edi, [edi+28h]
		lea	edx, [ecx+edx]
		imul	edx, 0E303C05Dh
		mov	[ebp+var_1B8], esi
		mov	esi, [ebp+arg_4]
		mov	[ebp+var_1B4], edi
		lea	edx, [eax+edx]
		mov	eax, [ebp+arg_4]
		mov	[ebp+var_120], edx
		mov	edx, [ebp+arg_4]
		mov	eax, [eax+20h]
		mov	edx, [edx+24h]
		mov	[ebp+var_1C0], eax
		mov	[ebp+var_1BC], edx
		add	edx, eax
		mov	[ebp+var_34], edx
		imul	edx, 6193D4F1h
		add	edi, [ebp+var_1B8]
		lea	eax, [edx-6B9DD3Bh]
		sub	edx, 5C0F3291h
		mov	ecx, eax
		and	eax, 0E7963A2h
		or	ecx, 0E7963A2h
		add	ecx, 0F330BE1h
		sub	ecx, eax
		mov	eax, [esi+30h]
		lea	esi, [ecx+ecx-1E6617C2h]
		and	esi, 0E30D38BAh
		sub	ecx, esi
		mov	esi, edx
		add	edi, eax
		and	esi, 0E25FD462h
		imul	edi, 2026C9CFh
		imul	ecx, 0E0DE7541h
		mov	[ebp+var_38], edx
		lea	ecx, [edi+ecx-26F5D852h]
		mov	edi, [ebp+arg_4]
		mov	[ebp+var_1C], ecx
		mov	ecx, edx
		or	ecx, 0E25FD462h
		add	ecx, 1578437Dh
		mov	edi, [edi+2Ch]
		sub	ecx, esi
		lea	esi, [ecx+ecx-2AF086FAh]
		and	esi, 3B40573Ah
		sub	ecx, esi
		mov	[ebp+var_1B0], edi
		imul	edi, 9E6C2B0Fh
		imul	edx, [ebp+var_1B8], 6193D4F1h
		lea	ecx, [edi+ecx-49D07E98h]
		imul	edi, eax, 6193D4F1h
		xor	ecx, 0D22D3AE7h
		lea	esi, [ecx+ecx]
		and	esi, 0A45A75CEh
		mov	[ebp+var_28], edx
		sub	edi, ecx
		lea	ecx, [edi+esi]
		mov	edi, [ebp+arg_4]
		lea	esi, [edx+ecx-2E3C6D78h]
		mov	ecx, esi
		and	esi, 1EF04509h
		or	ecx, 1EF04509h
		add	ecx, 6DD873F4h
		sub	ecx, esi
		mov	esi, [edi+38h]
		mov	edi, [edi+34h]
		lea	edx, [esi+eax]
		mov	[ebp+var_1AC], edi
		add	edi, esi
		mov	[ebp+var_24], edi
		mov	edi, [ebp+var_1B4]
		add	edi, [ebp+var_1BC]
		add	edi, [ebp+var_1B0]
		mov	[ebp+var_AC], edx
		add	edi, esi
		add	edi, [ebp+var_1AC]
		imul	edx, [ebp+var_1B8], 0BF92CB27h
		imul	edi, 33EAEF5h
		add	edi, 3EB7D0CCh
		mov	[ebp+var_20], edi
		mov	edi, [ebp+var_1B4]
		add	edi, [ebp+var_1C0]
		add	edi, [ebp+var_1B0]
		imul	edi, 6193D4F1h
		sub	edi, 0A16CBD9h
		mov	esi, edi
		and	edi, 0E447473h
		or	esi, 0E447473h
		add	esi, 721EABDEh
		sub	esi, edi
		imul	edi, eax, 9E6C2B0Fh
		lea	edi, [esi+edi+2DA478F6h]
		lea	esi, [esi+esi+1BC2A844h]
		and	esi, 0E3771718h
		sub	edi, esi
		xor	edi, 387015ACh
		mov	[ebp+var_C], edi
		mov	edi, [ebp+var_24]
		add	edi, [ebp+var_34]
		imul	edi, 6193D4F1h
		add	edi, 47E19ADFh
		mov	esi, edi
		and	edi, 86E530CDh
		or	esi, 86E530CDh
		sub	esi, edi
		imul	edi, esi, 0AEC0BE69h
		add	esi, esi
		and	esi, 0F2359E64h
		imul	esi, 513F4197h
		lea	edx, [edx+edi-5C0EFE6Ah]
		add	esi, edx
		mov	edx, [ebp+var_38]
		mov	[ebp+var_30], esi
		mov	esi, [ebp+var_1B0]
		add	esi, [ebp+var_1B4]
		add	eax, esi
		imul	eax, 6193D4F1h
		mov	[ebp+var_34], esi
		sub	eax, 0A16CBD9h
		mov	esi, eax
		and	eax, 0B16BB1E9h
		or	esi, 0B16BB1E9h
		sub	esi, eax
		and	edx, 8DA03996h
		imul	eax, esi, 972AA73Bh
		add	esi, esi
		imul	edi, [ebp+var_24], 0FC7AB575h
		and	esi, 9D289C2Ch
		imul	esi, 68D558C5h
		lea	eax, [edi+eax-628833E2h]
		lea	esi, [eax+esi]
		mov	eax, 8CC8B8FDh
		mov	[ebp+var_14], esi
		lea	esi, [ecx+ecx+244F1818h]
		sub	eax, ecx
		and	esi, 0C21F75ECh
		lea	esi, [eax+esi]
		mov	eax, esi
		neg	eax
		lea	ecx, ds:7488D19Ch[eax*8]
		mov	eax, esi
		not	eax
		shl	eax, 4
		or	eax, 0D1F452E4h
		sub	ecx, eax
		mov	eax, [ebp+var_38]
		imul	edi, [ebp+var_AC], 6193D4F1h
		add	ecx, ecx
		shr	esi, 1Ch
		sub	esi, 10h
		or	eax, 8DA03996h
		sub	eax, edx
		lea	edx, [eax+eax]
		sub	edi, eax
		and	edx, 0E4BF8CD2h
		lea	eax, [edi+edx]
		mov	edi, [ebp+var_28]
		lea	edx, [edi+eax-7C769242h]
		lea	eax, [esi+esi+1]
		or	eax, 0C184FC77h
		sub	eax, esi
		mov	esi, 10h
		lea	edi, [eax+ecx+8203160h]
		sub	esi, ecx
		neg	eax
		lea	ecx, [esi+esi+2E3AA0A9h]
		lea	eax, [eax+eax-3E7B0389h]
		or	ecx, eax
		lea	ecx, [edi+ecx]
		xor	ecx, 0D0399629h
		mov	[ebp+var_38], ecx
		mov	eax, ecx
		mov	ecx, edx
		shr	ecx, 18h
		add	eax, 6DD873F4h
		imul	edi, edx, 0E5805500h
		imul	esi, ecx, 9E58055h
		shl	edx, 9
		add	edx, 1FFh
		lea	esi, [edi+esi-38BE3FAEh]
		lea	edi, [ecx+ecx-1FFh]
		mov	ecx, [ebp+var_28]
		or	edi, edx
		imul	edi, 0F61A7FABh
		lea	edi, [esi+edi]
		mov	esi, [ebp+var_34]
		add	esi, [ebp+var_24]
		mov	[ebp+var_94], edi
		imul	esi, 6193D4F1h
		add	esi, 47E19ADFh
		mov	edx, esi
		and	esi, 0F77D6340h
		or	edx, 0F77D6340h
		lea	ecx, [esi+ecx]
		sub	ecx, edx
		sub	edx, esi
		add	edx, edx
		and	edx, 1105397Eh
		lea	edx, [ecx+edx]
		lea	ecx, [edx+4975C9F8h]
		shr	ecx, 13h
		imul	ecx, 23BA937Bh
		imul	edx, 0DCAC2000h
		sub	ecx, 31BEABC7h
		add	edx, 4392187Bh
		imul	esi, edx, 69A15C69h
		imul	edi, ecx, 9140878Bh
		imul	edx, 7068FD42h
		imul	ecx, 41CA766h
		lea	edi, [edi+esi+5481F0DAh]
		sub	edx, 1D559EB7h
		add	ecx, 19CB024Bh
		or	ecx, edx
		imul	ecx, 0AC2C0F37h
		lea	ecx, [edi+ecx]
		mov	[ebp+var_7C], ecx
		mov	ecx, [ebp+var_C]
		imul	edx, [ebp+var_20], 2BFC988Dh
		imul	esi, [ebp+var_C], 0FA00E6CBh
		mov	edi, [ebp+var_20]
		add	ecx, ecx
		add	edx, 1DD2E13Bh
		and	ecx, 70E02B58h
		shr	edx, 0Fh
		imul	edx, 51B6E2C1h
		imul	ecx, 5FF1935h
		add	edx, 6ABD364Dh
		add	ecx, esi
		imul	esi, [ebp+var_1AC], 74759EE5h
		shl	edi, 11h
		add	ecx, esi
		imul	ecx, 0E50B311Dh
		mov	[ebp+var_C], ecx
		mov	esi, ecx
		imul	ecx, edx, 23921C85h
		add	esi, 1988510Bh
		imul	edx, 84A95A82h
		lea	ecx, [edi+ecx+61F6D0D3h]
		imul	edi, [ebp+var_20], 62340000h
		sub	edx, 4605A519h
		sub	edi, 7B100001h
		or	edx, edi
		imul	edx, 0D61D15BBh
		lea	edx, [ecx+edx]
		mov	ecx, esi
		shr	ecx, 0Ah
		mov	[ebp+var_AC], edx
		mov	edx, ecx
		sub	ecx, 400000h
		not	ecx
		neg	edx
		or	ecx, 5D8F39C7h
		sub	edx, 4FFC08F9h
		add	ecx, ecx
		sub	edx, ecx
		imul	esi, 0B2C00000h
		imul	edi, edx, 0FA00E6CBh
		lea	ecx, [edx+edx+5B96857Ch]
		and	ecx, 44E18C70h
		lea	edi, [esi+edi+40DB976Ch]
		imul	esi, ecx, 5FF1935h
		sub	ecx, edx
		mov	edx, [ebp+var_C]
		add	edi, esi
		add	edx, 1988510Ch
		lea	esi, [ecx+ecx+5F87EE13h]
		neg	edx
		imul	ecx, [ebp+var_30], 2BC74E27h
		shl	edx, 17h
		and	esi, edx
		mov	edx, 684E19ADh
		imul	esi, 0FA00E6CBh
		add	ecx, 310A5ABh
		shr	ecx, 8
		sub	edx, ecx
		lea	ecx, [ecx+ecx-1FFFFFFh]
		or	ecx, 196BC64Bh
		add	edx, ecx
		lea	esi, [edi+esi]
		mov	[ebp+var_34], esi
		lea	ecx, [edx+edx+17F8065Ah]
		mov	esi, [ebp+var_30]
		and	ecx, 0E69439B4h
		imul	edi, ecx, 513F4197h
		sub	ecx, edx
		lea	ecx, [ecx+ecx+173BFF1h]
		neg	esi
		shl	esi, 18h
		lea	edi, [esi+edi+5891F06Bh]
		imul	esi, [ebp+var_30], 0B2000000h
		sub	esi, 58000000h
		and	ecx, esi
		mov	esi, [ebp+var_14]
		lea	edx, [ecx+edx]
		imul	edx, 0AEC0BE69h
		sub	esi, 1
		lea	edx, [edi+edx]
		mov	edi, esi
		mov	[ebp+var_28], edx
		shl	esi, 1Eh
		imul	edx, [ebp+var_14], 15C660Dh
		add	esi, 3FFFFFFFh
		shl	edi, 1Dh
		add	edx, 222B2DD3h
		shr	edx, 3
		imul	edx, 2134DCB1h
		sub	edx, 35E89FCFh
		imul	ecx, edx, 3F65B255h
		imul	edx, 5187D8A2h
		lea	ecx, [edi+ecx+3EA6D997h]
		sub	edx, 16CB3701h
		or	edx, esi
		imul	edx, 972AA73Bh
		lea	edx, [ecx+edx]
		mov	[ebp+var_3C], edx
		imul	edx, [ebp+var_7C], 0A35652F2h
		imul	ecx, [ebp+var_7C], 28202C57h
		sub	edx, 3CC21E81h
		mov	[ebp+var_F8], edx
		imul	edx, [ebp+var_34], 0CA16623Ah
		mov	[ebp+var_F4], edx
		imul	edx, [ebp+var_34], 486407F3h
		lea	esi, [ecx+edx+486D21C1h]
		mov	ecx, [ebp+var_F4]
		add	ecx, 6208479Bh
		or	ecx, [ebp+var_F8]
		imul	edi, [ebp+var_94], 40EB7CFDh
		imul	ecx, 94769FB1h
		sub	edi, 1670C90Bh
		lea	ecx, [esi+ecx]
		imul	esi, [ebp+var_34], 0E50B311Dh
		mov	[ebp+var_F0], ecx
		mov	ecx, edi
		xor	edi, 0FF3h
		xor	ecx, 4BF8h
		add	edi, 46080000h
		add	ecx, 46080000h
		xor	edi, 560E2DF5h
		lea	edx, [esi-1503DC33h]
		add	esi, 23B423CDh
		xor	edx, 4BF8h
		xor	esi, 4BF8h
		add	edx, 46080000h
		add	esi, 0D500000h
		xor	edx, ecx
		mov	ecx, edx
		xor	edx, 0D879124Eh
		xor	ecx, 2786EDB1h
		mov	[ebp+var_B0], ecx
		imul	ecx, [ebp+var_28], 2BC74E27h
		mov	[ebp+var_68], ecx
		add	ecx, 5A94A5ABh
		xor	ecx, 0D749h
		sub	ecx, 57840000h
		mov	[ebp+var_20], ecx
		xor	ecx, edx
		xor	ecx, 0FFFF28B6h
		or	ecx, edx
		imul	edx, [ebp+var_7C], 51AB2979h
		mov	[ebp+var_24], ecx
		add	edx, 1B96F0BFh
		xor	edx, 0FF3h
		add	edx, 46080000h
		xor	edi, edx
		mov	edx, edi
		mov	[ebp+var_14], edi
		not	edx
		mov	edi, [ebp+var_38]
		xor	esi, edx
		mov	ecx, [ebp+var_20]
		xor	esi, 0FFFFB407h
		or	esi, edx
		mov	[ebp+var_C], esi
		add	edi, edi
		imul	esi, [ebp+var_1C], 0CC4F2211h
		and	edi, 0C21F75ECh
		imul	edx, eax, 8A9894AFh
		lea	esi, [esi+edx-6272E7B0h]
		imul	edx, edi, 75676B51h
		sub	edi, eax
		add	esi, edx
		lea	edx, [edi+edi+199171FBh]
		imul	edi, [ebp+var_1C], 6423582h
		add	edi, 38998C4Ch
		and	edx, edi
		imul	edx, 8A9894AFh
		lea	edx, [esi+edx]
		mov	[ebp+var_C0], edx
		imul	edx, [ebp+var_AC], 57F9311Ah
		imul	esi, [ebp+var_1C], 661C0131h
		add	edx, 3BA5C277h
		mov	[ebp+var_D4], edx
		imul	edx, [ebp+var_AC], 0AD0D9FC3h
		lea	edi, [esi+edx-2C9DC6CBh]
		mov	esi, 6DD873F3h
		imul	edx, [ebp+var_1C], 0F9BDCA7Eh
		sub	esi, eax
		xor	ecx, esi
		xor	ecx, 0FFFF28B6h
		or	ecx, esi
		sub	edx, 38998C4Dh
		or	edx, [ebp+var_D4]
		imul	edx, 0A225B271h
		lea	edx, [edi+edx]
		mov	edi, ecx
		mov	[ebp+var_80], edx
		mov	edx, [ebp+var_28]
		not	edi
		not	edx
		imul	edx, 2BC74E27h
		sub	edx, 4B508EBFh
		sub	edx, eax
		lea	edx, [edx+edi*2]
		mov	edi, [ebp+var_68]
		lea	edi, [eax+edi]
		lea	ecx, [edi+ecx*2]
		lea	edi, [ecx+ecx+2A706373h]
		imul	ecx, [ebp+var_3C], 0FD4733E6h
		and	edi, 3138579Ch
		add	edx, edi
		lea	edi, [edx+edx-6D790140h]
		and	edi, 0F3272270h
		sub	ecx, 44565BA8h
		mov	[ebp+var_90], ecx
		mov	ecx, edi
		sub	ecx, edx
		mov	[ebp+var_78], edi
		lea	edi, [ecx+ecx+7A51DECFh]
		mov	ecx, [ebp+var_1C]
		and	edi, [ebp+var_90]
		add	edi, edx
		add	ecx, 1
		mov	[ebp+var_E0], edi
		imul	ecx, 3211AC1h
		imul	edi, [ebp+var_1C], 0FCDEE53Fh
		sub	ecx, eax
		lea	edx, [edi+384D39D9h]
		add	eax, edi
		xor	edx, 0E6D4h
		sub	edx, 549A0000h
		xor	edx, esi
		xor	edx, 0FFFF192Bh
		or	edx, esi
		mov	esi, edx
		lea	eax, [eax+edx*2]
		not	esi
		lea	eax, [eax+eax-144A7431h]
		lea	ecx, [ecx+esi*2-895535Bh]
		and	eax, 0D06C29CCh
		lea	eax, [ecx+eax]
		mov	[ebp+var_8C], eax
		lea	eax, [eax+eax+4EC6BB9Ch]
		and	eax, 12735C20h
		mov	[ebp+var_88], eax
		mov	eax, [ebp+var_DC]
		imul	esi, [ebp+var_54], 1CE3258Fh
		imul	edi, [ebp+var_6C], 5DAD73B5h
		add	eax, 5D51230Ah
		mov	edx, eax
		and	eax, 0FFCBFA76h
		or	edx, 0FFCBFA76h
		sub	edx, eax
		imul	eax, edx, 796CA37h
		lea	ecx, [edx+edx]
		and	ecx, 680B12h
		lea	esi, [esi+eax-6CE669C2h]
		imul	eax, ecx, 0F86935C9h
		add	esi, eax
		imul	eax, [ebp+var_54], 26A8F369h
		lea	eax, [edx+eax-5CAF6744h]
		sub	eax, ecx
		mov	ecx, [ebp+var_140]
		and	eax, 29C84BF6h
		imul	eax, 0F0D26B92h
		lea	eax, [esi+eax]
		mov	esi, [ebp+var_60]
		sub	esi, [ebp+var_10]
		imul	edx, esi, 0E0DE7541h
		lea	edx, [ecx+edx-18E4483Dh]
		imul	ecx, eax, 520CA43Fh
		imul	eax, 801A170Eh
		lea	ecx, [edi+ecx+0B5EB75Bh]
		mov	edi, [ebp+var_5C]
		and	eax, 539097ECh
		imul	eax, 6FC50077h
		lea	eax, [ecx+eax]
		imul	eax, 0EC2161F9h
		lea	eax, [edx+eax]
		mov	[ebp+var_60], eax
		imul	edx, [ebp+var_54], 0BC995BC5h
		imul	eax, [ebp+var_4C], 2F39FEB7h
		lea	edx, [edx+eax-120A8F79h]
		imul	eax, [ebp+var_A4], 58FB83CDh
		lea	eax, [edx+eax]
		mov	edx, [ebp+var_C8]
		imul	eax, 3F7C0ABh
		and	edx, 9C2548FEh
		lea	eax, [edi+eax-27AD659Bh]
		mov	ecx, eax
		and	eax, 0F2C0F0C2h
		or	ecx, 0F2C0F0C2h
		add	ecx, 4F2B458Ah
		sub	ecx, eax
		mov	eax, [ebp+var_18]
		sub	eax, 12B6E7C1h
		sub	eax, edx
		sub	eax, ecx
		lea	ecx, [ecx+ecx+61A974ECh]
		or	ecx, 1A7E1E7Ah
		lea	ecx, [eax+ecx]
		xor	ecx, 0E10FBAF6h
		mov	[ebp+var_1C], ecx
		add	ecx, 6DD873F4h
		imul	eax, [ebp+var_A4], 7E34EF9Fh
		mov	[ebp+var_20], ecx
		imul	ecx, [ebp+var_54], 72594EC7h
		lea	ecx, [ecx+eax+2E665D4Ah]
		imul	eax, [ebp+var_6C], 8F5AB323h
		lea	eax, [ecx+eax]
		mov	ecx, [ebp+var_D0]
		imul	eax, 4ABAC3B1h
		lea	edi, [ecx+eax-1660EA57h]
		mov	ecx, edi
		or	edi, 95D5C785h
		and	ecx, 95D5C785h
		lea	eax, [ecx+esi-64572E0Bh]
		sub	eax, edi
		sub	edi, ecx
		add	edi, edi
		or	edi, 0D45470F4h
		lea	edi, [eax+edi]
		mov	eax, [ebp+var_18]
		mov	[ebp+var_30], edi
		mov	edi, [ebp+var_138]
		imul	ecx, [ebp+var_4C], 4D8C6D09h
		sub	eax, edx
		sub	edx, [ebp+var_18]
		imul	edx, 53D3F0C9h
		lea	edx, [edi+edx-7468537Ch]
		imul	edi, [ebp+var_70], 0BAD4D593h
		lea	edi, [edi+ecx-33D9F5BEh]
		imul	ecx, [ebp+var_6C], 5F256DA7h
		lea	ecx, [edi+ecx]
		mov	edi, [ebp+var_13C]
		imul	ecx, 116F92FDh
		lea	ecx, [edx+ecx]
		mov	edx, [ebp+var_58]
		mov	[ebp+var_54], ecx
		mov	ecx, [ebp+var_58]
		or	ecx, 1363A95Fh
		and	edx, 1363A95Fh
		sub	ecx, edx
		lea	edx, [ecx+edi+6DEE8D33h]
		mov	edi, [ebp+var_5C]
		add	ecx, ecx
		and	ecx, 0D938AD40h
		sub	edx, ecx
		xor	edx, 4E527FECh
		lea	ecx, [edx-6ADF4C50h]
		add	edi, 0CEF91A1h
		add	edx, edx
		sub	edi, ecx
		and	edx, 9CA4FFD8h
		add	edi, edx
		mov	[ebp+var_18], edi
		imul	edi, [ebp+var_70], 0FD98D771h
		lea	ecx, [ecx+edi+407E7643h]
		mov	edi, esi
		sub	ecx, edx
		add	ecx, ecx
		or	ecx, 0BDE41D28h
		add	ecx, [ebp+var_18]
		lea	edx, [ecx+ecx-58C02CF0h]
		sub	edi, ecx
		or	edx, 0BDE41D28h
		lea	ecx, [edx+edi]
		mov	edi, [ebp+var_5C]
		mov	edx, [ebp+var_BC]
		mov	[ebp+var_10], ecx
		lea	ecx, [edi+edx+0DB49B32h]
		mov	edx, ecx
		and	ecx, 0C8882C52h
		or	edx, 0C8882C52h
		sub	edx, ecx
		lea	ecx, [edx+esi]
		add	edx, edx
		and	edx, 6EEFA75Ah
		sub	ecx, edx
		lea	edx, [eax+ecx]
		mov	ecx, [ebp+var_134]
		imul	edi, [ebp+var_2C], 74AD2E3h
		imul	edx, 0FA00E6CBh
		sub	ecx, 0E1B4DFAh
		lea	edx, [edi+edx-4F12C481h]
		mov	[ebp+var_38], edx
		mov	edx, ecx
		and	ecx, 29C4AEA0h
		or	edx, 29C4AEA0h
		sub	edx, ecx
		lea	ecx, [edx+esi-10230391h]
		add	edx, edx
		mov	esi, [ebp+var_130]
		and	edx, 0AC76A2BEh
		sub	ecx, edx
		mov	edx, eax
		xor	ecx, 0D645D734h
		sub	edx, ecx
		add	ecx, ecx
		or	ecx, 0AC8BAE68h
		lea	edx, [edx+ecx-69CFF0CAh]
		imul	ecx, edx, 0F842FEDBh
		add	edx, 3EE6FB88h
		and	edx, 45534ECFh
		imul	edx, 0F7A024Ah
		lea	edx, [ecx+edx+660DEA6Dh]
		imul	ecx, edx, 491DD10Bh
		imul	edx, 0DC6D9AA6h
		lea	ecx, [esi+ecx+786EE493h]
		mov	esi, 2B13FC2Eh
		and	edx, 8AA69D9Eh
		imul	edx, 513F4197h
		lea	edx, [ecx+edx]
		mov	[ebp+var_18], edx
		imul	ecx, [ebp+var_70], 728FF537h
		imul	edx, [ebp+var_4C], 0A46073B5h
		lea	edx, [ecx+edx+1726E273h]
		imul	ecx, [ebp+var_A4], 0E5233F97h
		lea	ecx, [edx+ecx]
		mov	edx, 17D63837h
		imul	ecx, 28A46C97h
		sub	edx, eax
		sub	edx, ecx
		lea	eax, [ecx+eax-17CECBA9h]
		mov	ecx, [ebp+var_1C]
		add	eax, eax
		or	eax, 218FC680h
		lea	eax, [edx+eax]
		add	ecx, ecx
		and	ecx, 0C21F75ECh
		sub	ecx, [ebp+var_20]
		mov	[ebp+var_70], eax
		mov	eax, 0FFFFFFE0h
		lea	edx, [ecx+4C8B8FDh]
		sub	ecx, 73374703h
		shl	edx, 5
		sub	eax, edx
		sub	esi, edx
		shr	ecx, 1Bh
		or	eax, 0DFB96CAh
		lea	edi, [ecx-5604C7F1h]
		neg	eax
		lea	esi, [esi+eax*2]
		mov	edx, 1D186584h
		lea	eax, [edi+7230C7D1h]
		sub	edx, esi
		xor	eax, 0E56Bh
		sub	eax, 1C2C0000h
		xor	eax, 0FFFF1A94h
		xor	eax, edx
		or	eax, edx
		mov	edx, 77E505D5h
		sub	edx, ecx
		mov	ecx, eax
		sub	edx, esi
		add	esi, edi
		lea	eax, [esi+eax*2]
		not	ecx
		lea	eax, [eax+eax+71D8C49Dh]
		lea	edx, [edx+ecx*2]
		and	eax, 2617A786h
		lea	eax, [edx+eax]
		mov	ecx, 0EC315F5Eh
		mov	[ebp+var_1C], eax
		sub	ecx, [ebp+var_30]
		mov	eax, ecx
		shr	eax, 17h
		imul	edx, eax, 9E58055h
		imul	ecx, 0CB00AA00h
		lea	ecx, [ecx+edx-38BE3FAEh]
		lea	edx, [eax+eax-3FFh]
		mov	eax, [ebp+var_30]
		add	eax, 13CEA0A2h
		neg	eax
		shl	eax, 0Ah
		add	eax, 3FFh
		or	edx, eax
		mov	eax, 98F04D0Bh
		imul	edx, 0F61A7FABh
		sub	eax, [ebp+var_10]
		lea	edx, [ecx+edx]
		mov	ecx, [ebp+var_10]
		mov	[ebp+var_20], edx
		shr	eax, 11h
		imul	edx, [ebp+var_54], 51AB2979h
		imul	esi, eax, 29E2EA45h
		add	ecx, 670FB2F5h
		imul	edi, ecx, 8ADD8000h
		neg	ecx
		shl	ecx, 10h
		add	edx, 619EF0BFh
		add	ecx, 0FFFFh
		lea	eax, [eax+eax-0FFFFh]
		or	eax, ecx
		shr	edx, 15h
		imul	eax, 0D61D15BBh
		imul	edx, 73B9F5E3h
		lea	esi, [edi+esi-3EAF8D2Ch]
		mov	edi, [ebp+var_70]
		lea	eax, [esi+eax]
		mov	esi, [ebp+var_38]
		mov	[ebp+var_30], eax
		add	edx, 4F87DAAFh
		imul	eax, [ebp+var_38], 0E50B311Dh
		shl	esi, 14h
		add	eax, 310423CDh
		shr	eax, 0Ch
		imul	ecx, eax, 5FF1935h
		lea	eax, [eax+eax-1FFFFFh]
		lea	ecx, [esi+ecx-567C87A6h]
		imul	esi, [ebp+var_38], 23A00000h
		add	esi, 79BFFFFFh
		or	eax, esi
		imul	eax, 0FA00E6CBh
		imul	esi, [ebp+var_18], 2BC74E27h
		lea	eax, [ecx+eax]
		mov	[ebp+var_10], eax
		mov	eax, [ebp+var_54]
		imul	ecx, edx, 8C5DE63h
		imul	edx, 6A89EF96h
		add	esi, 310A5ABh
		shr	esi, 7
		imul	esi, 4BF66411h
		shl	eax, 0Bh
		add	ecx, eax
		lea	eax, [edx+13956C77h]
		imul	edx, [ebp+var_54], 0B2979000h
		sub	esi, 42C940DDh
		imul	ecx, 51AB2979h
		sub	edx, 10F40001h
		or	eax, edx
		sub	ecx, eax
		lea	eax, [edi+edi-219E9F9Ch]
		and	eax, 218FC680h
		sub	eax, edi
		imul	edx, [ebp+var_2C], 0A54CA2D3h
		imul	eax, 68D558C5h
		mov	[ebp+var_5C], ecx
		mov	ecx, [ebp+var_18]
		lea	eax, [edx+eax-4A1B4E7Eh]
		imul	eax, 15C660Dh
		imul	edx, esi, 127CD327h
		imul	esi, 135619E2h
		shl	ecx, 19h
		add	eax, 222B2DD3h
		lea	edx, [ecx+edx-7E0B5BC9h]
		sub	esi, 35C127E5h
		imul	ecx, [ebp+var_18], 9C000000h
		imul	edi, [ebp+var_28], 578E9C4Eh
		sub	ecx, 50000001h
		or	esi, ecx
		mov	ecx, eax
		imul	esi, 0AEC0BE69h
		add	edi, 6214B57h
		shr	ecx, 5
		lea	esi, [edx+esi]
		lea	edx, [eax+eax*4]
		shl	eax, 1Ch
		mov	[ebp+var_18], esi
		add	eax, 0FFFFFFFh
		imul	esi, ecx, 68D558C5h
		lea	ecx, [ecx+ecx-0FFFFFFFh]
		or	ecx, eax
		mov	eax, [ebp+var_5C]
		imul	ecx, 972AA73Bh
		shl	edx, 1Bh
		lea	edx, [edx+esi-645F2424h]
		add	eax, 49FEB63Ah
		lea	ecx, [edx+ecx]
		xor	eax, 0FF3h
		imul	edx, [ebp+var_30], 2BFC988Dh
		sub	eax, 48AE0000h
		xor	eax, 0C6A48F8Fh
		imul	esi, [ebp+var_28], 5EF29997h
		mov	[ebp+var_2C], ecx
		add	edx, 6680E13Bh
		xor	edx, 0FF3h
		sub	edx, 48AE0000h
		xor	eax, edx
		imul	edx, [ebp+var_F0], 0A81A829Fh
		lea	ecx, [eax+66994DE9h]
		add	eax, eax
		and	eax, 8D491F1Eh
		lea	esi, [esi+edx+74396C76h]
		imul	edx, [ebp+var_F0], 9636D5Eh
		imul	esi, 79B1E1F1h
		add	edx, 3F31973Bh
		or	edx, edi
		sub	esi, edx
		imul	edx, [ebp+var_18], 0D438B1D9h
		sub	edx, ecx
		add	edx, eax
		sub	eax, ecx
		imul	ecx, [ebp+var_18], 0A87163B2h
		lea	eax, [eax+eax+3FE97CB3h]
		lea	edx, [esi+edx+1994B8E0h]
		sub	ecx, 6214B58h
		and	eax, ecx
		sub	edx, eax
		imul	eax, [ebp+var_10], 0E50B311Dh
		mov	ecx, edx
		or	ecx, 304256A1h
		and	edx, 304256A1h
		sub	ecx, 49E401B2h
		sub	ecx, edx
		add	eax, 23B423CDh
		mov	[ebp+var_58], eax
		mov	edx, eax
		imul	eax, [ebp+var_20], 40EB7CFDh
		xor	edx, 0EEABh
		add	edx, 0D500000h
		mov	[ebp+var_38], ecx
		add	eax, 224736F5h
		xor	eax, 0EEABh
		add	eax, 0D500000h
		xor	edx, eax
		imul	eax, [ebp+var_2C], 15C660Dh
		mov	ecx, edx
		xor	edx, 62514FACh
		xor	ecx, 9DAEB053h
		mov	[ebp+var_54], eax
		sub	eax, 160ED22Dh
		mov	esi, [ebp+var_B0]
		xor	eax, 20CEh
		mov	edi, [ebp+var_B0]
		add	eax, 383A0000h
		xor	eax, edx
		xor	eax, 0FFFFDF31h
		add	esi, 2A97935Fh
		or	eax, edx
		imul	edx, [ebp+var_2C], 2B8CC1Ah
		imul	esi, 74744C9h
		mov	[ebp+var_4C], edx
		imul	edx, [ebp+var_28], 0E0FB89Fh
		lea	edx, [esi+edx-344970B0h]
		imul	esi, [ebp+var_24], 0F171766Eh
		sub	edx, esi
		mov	esi, [ebp+var_68]
		imul	edx, 734C1579h
		lea	esi, [edi+esi+310A5AEh]
		mov	edi, [ebp+var_24]
		lea	edi, [esi+edi*2]
		lea	esi, [edi+edi-1]
		and	esi, 4F0DDB62h
		sub	edx, esi
		lea	esi, [ecx-402621D7h]
		imul	edi, [ebp+var_2C], 2227DF35h
		imul	esi, 3C81FBC9h
		lea	edi, [edi+esi-4077E310h]
		imul	esi, eax, 7903F792h
		lea	esi, [edi+esi]
		imul	esi, 73F30E79h
		lea	edx, [edx+esi+79E5BFh]
		mov	esi, [ebp+var_4C]
		lea	ecx, [esi+ecx*2+44565BABh]
		lea	eax, [ecx+eax*4]
		and	eax, 3B5D60A6h
		sub	edx, eax
		imul	eax, [ebp+var_18], 578E9C4Eh
		mov	edi, edx
		or	edi, 31ED5B80h
		and	edx, 31ED5B80h
		sub	edi, edx
		imul	edx, [ebp+var_30], 9D1E7CFFh
		add	eax, 6214B57h
		mov	[ebp+var_70], eax
		imul	eax, [ebp+var_18], 9CE2407Dh
		imul	esi, [ebp+var_34], 19836C73h
		mov	[ebp+var_24], edi
		add	edi, 22B5C28Dh
		mov	[ebp+var_B0], edi
		mov	edi, [ebp+var_F4]
		lea	ecx, [edx+eax-77296D7Ch]
		imul	eax, [ebp+var_30], 57F9311Ah
		add	eax, 3BA5C277h
		or	eax, [ebp+var_70]
		imul	edx, eax, 98693945h
		mov	eax, [ebp+var_14]
		sub	eax, 78EDAE3Bh
		imul	eax, 6359AECFh
		lea	edx, [ecx+edx]
		lea	ecx, [esi+eax-4E57E0C1h]
		mov	esi, [ebp+var_14]
		imul	eax, [ebp+var_C], 0C6B35D9Eh
		add	ecx, eax
		lea	eax, [edi+esi*2+6208479Fh]
		mov	esi, [ebp+var_C]
		lea	eax, [eax+esi*4]
		and	eax, 0AC1C5BEAh
		imul	eax, 9CA65131h
		imul	esi, [ebp+var_2C], 221ED6D1h
		lea	eax, [ecx+eax]
		imul	ecx, edx, 0D8AA97AFh
		imul	edx, 62171CE6h
		imul	eax, 9E6F1249h
		lea	ecx, [esi+ecx+16A8A490h]
		mov	esi, [ebp+var_4C]
		add	edx, 271CFB35h
		add	esi, 44565BA7h
		or	edx, esi
		imul	edx, 8087D92Bh
		lea	edx, [ecx+edx]
		mov	ecx, 6DD873F3h
		imul	edx, 75BB7C6Bh
		sub	ecx, [ebp+var_1C]
		lea	edx, [eax+edx+392DFCBBh]
		mov	[ebp+var_C], edx
		imul	edx, [ebp+var_60], 0FCDEE53Fh
		lea	eax, [edx+384D39D9h]
		xor	eax, 0E6D4h
		sub	eax, 549A0000h
		xor	eax, ecx
		xor	eax, 0FFFF192Bh
		or	eax, ecx
		mov	ecx, [ebp+var_60]
		mov	esi, eax
		not	esi
		add	ecx, 1
		imul	ecx, 3211AC1h
		sub	ecx, [ebp+var_1C]
		lea	ecx, [ecx+esi*2-5776EF46h]
		mov	esi, [ebp+var_1C]
		add	esi, edx
		lea	eax, [esi+eax*2]
		mov	esi, 201AAD52h
		lea	eax, [eax+eax-144A7431h]
		and	eax, 0FD2B77E4h
		add	ecx, eax
		mov	eax, [ebp+var_58]
		sub	esi, ecx
		xor	eax, 4BF8h
		add	eax, 0D500000h
		xor	eax, 0FFFFB407h
		xor	eax, esi
		or	eax, esi
		mov	esi, [ebp+var_10]
		mov	edi, eax
		not	edi
		not	esi
		imul	esi, 0E50B311Dh
		add	esi, 4E1A1271h
		sub	esi, ecx
		lea	esi, [esi+edi*2]
		imul	edi, [ebp+var_10], 650B311Dh
		add	ecx, edi
		lea	eax, [ecx+eax*2]
		lea	eax, [eax+eax+21D2ECF9h]
		and	eax, 8BD1CB60h
		add	esi, eax
		imul	ecx, [ebp+var_AC], 0F54F250Dh
		imul	eax, [ebp+var_C0], 0DDCF1431h
		lea	eax, [ecx+eax+50E74B91h]
		imul	ecx, [ebp+var_C0], 18097B62h
		sub	ecx, 2356C059h
		or	ecx, [ebp+var_D4]
		imul	ecx, 0BF53217Fh
		lea	ecx, [eax+ecx]
		lea	eax, [esi+esi-7FC27AFEh]
		and	eax, 0B4E5C968h
		sub	esi, eax
		imul	ecx, 9288BB8Fh
		imul	esi, 0D25F7AF1h
		lea	esi, [ecx+esi+6F7CF727h]
		mov	[ebp+var_28], esi
		mov	eax, [ebp+var_54]
		imul	esi, [ebp+var_18], 0E1EAFB61h
		imul	ecx, [ebp+var_20], 207C255Bh
		mov	edi, [ebp+var_1C]
		add	eax, 499E2DD3h
		xor	eax, 20CEh
		add	esi, ecx
		sub	eax, 27730000h
		imul	ecx, [ebp+var_20], 81D6F9FAh
		xor	eax, 31C81C5Eh
		imul	esi, 0CF037E87h
		add	ecx, 5F2E6DEBh
		or	ecx, [ebp+var_70]
		sub	esi, ecx
		add	esi, 5A1ADCA0h
		xor	esi, 20CEh
		sub	esi, 27730000h
		xor	eax, esi
		lea	ecx, [edi+edi+244F1818h]
		imul	esi, [ebp+var_80], 0FFE21D5Fh
		and	ecx, 0C21F75ECh
		imul	edi, [ebp+var_3C], 5DA685DDh
		lea	esi, [edi+esi+31B67CF4h]
		mov	[ebp+var_14], esi
		imul	edi, [ebp+var_3C], 2B8CC1Ah
		imul	esi, [ebp+var_80], 0C50062DEh
		add	edi, 44565BA7h
		add	esi, 50F85033h
		or	esi, edi
		imul	esi, 87F604EFh
		add	esi, [ebp+var_14]
		imul	edi, eax, 0E202CCD9h
		add	eax, eax
		and	eax, 639038BCh
		imul	esi, 27AB1AB7h
		imul	eax, 1DFD3327h
		lea	esi, [esi+edi-123F42DEh]
		lea	eax, [esi+eax]
		mov	[ebp+var_34], eax
		mov	eax, ecx
		sub	eax, [ebp+var_1C]
		imul	esi, [ebp+var_60], 0A51EC7E9h
		imul	edi, [ebp+var_3C], 0C47C24B7h
		lea	eax, [eax+eax+199171FBh]
		mov	[ebp+var_18], eax
		imul	eax, [ebp+var_1C], 0C5C3C0D7h
		lea	eax, [esi+eax+5AF993Fh]
		imul	esi, [ebp+var_60], 6423582h
		imul	eax, 387ACD19h
		add	esi, 38998C4Ch
		and	esi, [ebp+var_18]
		lea	eax, [ecx+eax-0AEAEB04h]
		sub	eax, esi
		mov	esi, [ebp+var_5C]
		xor	eax, 0FF3h
		sub	eax, 47E30000h
		add	esi, 4933B63Ah
		xor	esi, 0FF3h
		sub	esi, 47E30000h
		xor	eax, esi
		xor	eax, 0F1869C5Dh
		lea	esi, [eax+0F330BE1h]
		add	eax, eax
		mov	[ebp+var_44], esi
		and	eax, 0E30D38BAh
		imul	esi, [ebp+var_78], 3B95D72Dh
		sub	[ebp+var_44], eax
		mov	eax, [ebp+var_5C]
		lea	edi, [edi+esi-63C76749h]
		mov	[ebp+var_14], edi
		imul	edi, [ebp+var_E0], 0C46A28D3h
		sub	eax, 376949C6h
		add	edi, [ebp+var_14]
		xor	eax, 0E6D4h
		imul	esi, [ebp+var_44], 0EC68E905h
		add	eax, 38BA0000h
		imul	edi, 0F043FFC7h
		sub	edx, 5506C627h
		xor	edx, 0E6D4h
		add	edx, 38BA0000h
		xor	eax, edx
		lea	esi, [edi+esi+3CD45769h]
		xor	eax, 155A790Dh
		imul	edi, [ebp+var_94], 0DF751153h
		mov	[ebp+var_68], esi
		lea	edx, [eax-84530B7h]
		imul	esi, [ebp+var_7C], 0AA096A97h
		mov	[ebp+var_14], edx
		lea	edx, [eax+eax]
		imul	eax, [ebp+var_AC], 2BFC988Dh
		and	edx, 2AB4F21Ah
		lea	esi, [edi+esi-10C1223Eh]
		imul	edi, [ebp+var_94], 81D6F9FAh
		imul	esi, 33F1DE6Fh
		add	eax, 3F9E13Bh
		xor	eax, 0F1D6h
		add	eax, 19D90000h
		add	edi, 5F2E6DEBh
		xor	eax, 61B59AF8h
		or	edi, [ebp+var_F8]
		sub	esi, edi
		mov	edi, edx
		sub	esi, 32D53B6Ah
		xor	esi, 0F1D6h
		add	esi, 19D90000h
		xor	eax, esi
		lea	esi, [eax-0E1BC872h]
		add	eax, eax
		and	eax, 0C36B35F0h
		sub	esi, eax
		imul	eax, [ebp+var_30], 0A806CEE6h
		sub	edi, [ebp+var_14]
		imul	edx, 6712624Bh
		imul	esi, 0ED06ACEBh
		sub	eax, 3BA5C278h
		lea	edi, [edi+edi-3B3F5389h]
		and	eax, edi
		imul	edi, [ebp+var_14], 98ED9DB5h
		imul	eax, 98ED9DB5h
		lea	edi, [edi+edx-3389BDFDh]
		imul	edx, [ebp+var_30], 0F5AF54B1h
		lea	edx, [edi+edx]
		add	eax, edx
		imul	eax, 0EBAC41Fh
		lea	edx, [esi+eax-2A981400h]
		imul	esi, [ebp+var_20], 0F12C9EB5h
		imul	eax, [ebp+var_1C], 0B8143219h
		lea	eax, [esi+eax+0EA47DFEh]
		imul	esi, ecx, 47EBCDE7h
		imul	ecx, [ebp+var_3C], 0ED00F60Dh
		lea	esi, [eax+esi]
		imul	eax, [ebp+var_20], 7E290606h
		sub	eax, 5F2E6DECh
		and	eax, [ebp+var_18]
		imul	eax, 0B8143219h
		add	esi, eax
		imul	eax, [ebp+var_88], 48DD2FFFh
		lea	eax, [ecx+eax-0F833484h]
		mov	ecx, [ebp+var_88]
		sub	ecx, [ebp+var_8C]
		lea	ecx, [ecx+ecx-613A17BDh]
		and	ecx, [ebp+var_90]
		add	ecx, [ebp+var_8C]
		imul	ecx, 0B722D001h
		lea	edi, [eax+ecx]
		imul	ecx, esi, 785C3F8Bh
		imul	eax, [ebp+var_10], 58439A59h
		imul	esi, 0FDB1EBAEh
		imul	edi, 33991h
		lea	eax, [ecx+eax]
		imul	ecx, [ebp+var_10], 0CA16623Ah
		sub	esi, 5BB0C895h
		add	ecx, 6208479Bh
		or	esi, ecx
		imul	esi, 0A4475A93h
		lea	esi, [eax+esi]
		imul	esi, 59E84DCBh
		lea	esi, [edi+esi-75338E94h]
		mov	[ebp+var_14], esi
		imul	ecx, [ebp+var_28], 5B5A3611h
		mov	[ebp+var_170], ecx
		sub	ecx, 7FBCDB6h
		xor	ecx, 75569696h
		lea	eax, [ecx+301D7727h]
		add	ecx, ecx
		and	ecx, 0EAAD2D2Ch
		sub	eax, ecx
		imul	esi, [ebp+var_34], 26A8F369h
		imul	edi, [ebp+var_34], 0D9570C97h
		mov	[ebp+var_16C], esi
		mov	ecx, edi
		sub	ecx, eax
		lea	eax, [eax+esi-17AA4D5Eh]
		add	eax, eax
		or	eax, 7FB57C24h
		lea	ecx, [ecx+eax+47A3997Eh]
		imul	eax, [ebp+var_68], 86687BCDh
		imul	esi, [ebp+var_14], 0D371CA4Dh
		mov	[ebp+var_F8], edi
		imul	edi, [ebp+var_14], 267288Fh
		mov	[ebp+var_168], eax
		lea	eax, [ecx+eax+3B056EA6h]
		lea	ecx, [ecx+ecx+2057EB9Ch]
		and	ecx, 7FB57C24h
		sub	eax, ecx
		imul	ecx, [ebp+var_C], 0A2FE5889h
		xor	eax, 80EF5B15h
		mov	[ebp+var_AC], edi
		mov	[ebp+var_148], ecx
		imul	ecx, eax, 23DF4A9Dh
		add	eax, eax
		and	eax, 1DEB62Ah
		imul	eax, 0DC20B563h
		lea	ecx, [esi+ecx+2B182A43h]
		mov	esi, [ebp+var_148]
		lea	eax, [ecx+eax]
		imul	eax, 133431F5h
		imul	ecx, edx, 0AF99E449h
		lea	eax, [esi+eax-69470389h]
		mov	[ebp+var_2C], eax
		imul	eax, [ebp+var_34], 3BAE6D3Bh
		lea	ecx, [ecx+eax-286E6C7Dh]
		imul	eax, [ebp+var_28], 0CED5ED33h
		lea	eax, [ecx+eax]
		imul	eax, 7C99D855h
		lea	ecx, [edi+eax+1D38213h]
		mov	eax, ecx
		and	ecx, 54FD90D6h
		or	eax, 54FD90D6h
		imul	edi, [ebp+var_C], 0BB67A949h
		sub	eax, ecx
		imul	ecx, [ebp+var_C], 449856B7h
		lea	esi, [eax-2B3B1928h]
		add	eax, eax
		and	eax, 5604DE52h
		mov	[ebp+var_140], edi
		mov	[ebp+var_144], ecx
		lea	ecx, [esi+edi+0C0AF771h]
		mov	edi, [ebp+var_144]
		sub	ecx, eax
		add	ecx, ecx
		or	ecx, 0C21F75ECh
		sub	edi, esi
		lea	eax, [edi+eax-7F423E73h]
		mov	edi, [ebp+var_AC]
		add	ecx, eax
		imul	eax, [ebp+var_28], 0A4A5C9EFh
		mov	[ebp+var_F4], eax
		add	eax, [ebp+var_F8]
		lea	esi, [edi+eax-77C2C4DBh]
		mov	edi, [ebp+var_B0]
		mov	[ebp+var_F0], eax
		mov	eax, [ebp+var_24]
		add	eax, eax
		mov	[ebp+var_70], eax
		and	eax, 9C2548FEh
		sub	edi, eax
		mov	[ebp+var_28], edi
		mov	edi, esi
		and	esi, 7CA612C2h
		mov	[ebp+var_10], esi
		mov	esi, [ebp+var_28]
		or	edi, 7CA612C2h
		mov	[ebp+var_1C], eax
		lea	eax, [esi+edi+2EB6CF2Fh]
		sub	edi, [ebp+var_10]
		sub	eax, [ebp+var_10]
		add	edi, edi
		and	edi, 6B3DA7Ah
		sub	eax, edi
		xor	eax, 0EA09F828h
		lea	esi, [eax-5DFFF28h]
		add	eax, eax
		and	eax, 0D413F050h
		sub	esi, eax
		imul	edi, [ebp+var_C], 0F2A34AC3h
		imul	esi, 0F61A7FABh
		mov	[ebp+var_13C], edi
		lea	esi, [edi+esi-40B42DEh]
		mov	edi, [ebp+var_38]
		imul	eax, [ebp+var_68], 79978433h
		mov	[ebp+var_5C], esi
		imul	esi, edx, 0F257643Dh
		lea	edi, [edi+edi-6C37FC9Ch]
		mov	[ebp+var_DC], eax
		add	eax, esi
		mov	[ebp+var_4C], eax
		mov	eax, [ebp+var_38]
		mov	[ebp+var_C8], esi
		mov	esi, [ebp+var_4C]
		mov	[ebp+var_138], edi
		and	edi, 9F7B52BCh
		mov	[ebp+var_44], edi
		sub	eax, edi
		add	esi, 13AF0EA6h
		mov	[ebp+var_94], esi
		mov	edi, [ebp+var_94]
		or	esi, 69A6222Fh
		mov	[ebp+var_18], eax
		lea	eax, [esi+eax-50047720h]
		and	edi, 69A6222Fh
		mov	[ebp+var_10], edi
		sub	eax, edi
		mov	edi, esi
		sub	edi, [ebp+var_10]
		mov	esi, [ebp+var_18]
		add	edi, edi
		and	edi, 2CB3BBA0h
		sub	eax, edi
		mov	edi, [ebp+var_24]
		xor	eax, 0E36A744Ah
		add	edi, 7F325320h
		sub	edi, [ebp+var_1C]
		sub	edi, eax
		add	eax, eax
		or	eax, 0C6D4E894h
		lea	eax, [edi+eax+6B75DD15h]
		xor	eax, 52D5A8CAh
		mov	[ebp+var_30], eax
		imul	edi, edx, 0F6EBD101h
		imul	eax, [ebp+var_34], 3BD6D063h
		imul	edx, 0DA89BC3h
		lea	edi, [edi+eax-71914C02h]
		imul	eax, [ebp+var_68], 0E961C02Fh
		mov	[ebp+var_88], edx
		lea	eax, [edi+eax]
		mov	edi, [ebp+var_F4]
		imul	eax, 0B2068C3h
		lea	eax, [esi+eax-38231ADEh]
		xor	eax, 4A0F81A2h
		mov	[ebp+var_10], eax
		mov	eax, [ebp+var_DC]
		lea	edi, [eax+edi+47A7BD99h]
		mov	[ebp+var_8C], edi
		mov	eax, [ebp+var_8C]
		or	edi, 9688E2FFh
		and	eax, 9688E2FFh
		sub	edi, eax
		lea	eax, [edx+edi-1536AC6Dh]
		add	edi, edi
		and	edi, 0D2EE3A00h
		sub	eax, edi
		mov	edi, [ebp+var_44]
		xor	eax, 78949D35h
		lea	edx, [eax-276FDBAh]
		add	eax, eax
		and	eax, 0F1293A6Ah
		sub	edx, eax
		imul	edx, 0EC8F7671h
		imul	eax, [ebp+var_14], 0E7E42EE1h
		sub	edi, [ebp+var_38]
		add	edx, eax
		mov	eax, [ebp+var_F0]
		imul	edi, 5FF1935h
		imul	edx, 997326FBh
		add	eax, 0F89E52Ch
		mov	[ebp+var_7C], eax
		lea	edx, [edi+edx+5B4A311Ch]
		mov	[ebp+var_3C], edx
		mov	edx, eax
		and	eax, 1AB1906Eh
		or	edx, 1AB1906Eh
		sub	edx, 43185E12h
		sub	edx, eax
		mov	eax, [ebp+var_38]
		sub	eax, 0EC52293h
		sub	eax, [ebp+var_44]
		sub	eax, edx
		lea	edx, [edx+edx-79CF43DCh]
		or	edx, 0CA9CDF22h
		add	eax, edx
		imul	edx, [ebp+var_C], 61E89CF1h
		xor	eax, 53C7EE12h
		mov	[ebp+var_134], edx
		mov	edx, [ebp+var_28]
		mov	esi, [ebp+var_134]
		mov	edi, [ebp+var_70]
		sub	edx, eax
		add	eax, eax
		or	eax, 0A78FDC24h
		lea	eax, [edx+eax+1D5B0C09h]
		mov	edx, [ebp+var_AC]
		or	edi, 9C2548FEh
		imul	eax, 0AEC0BE69h
		mov	[ebp+var_70], edi
		mov	edi, [ebp+var_18]
		lea	eax, [esi+eax+469798DBh]
		mov	esi, [ebp+var_4C]
		mov	[ebp+var_20], eax
		lea	eax, [esi+edx-739D9B61h]
		mov	esi, eax
		and	eax, 7EBB2CF7h
		or	esi, 7EBB2CF7h
		lea	edx, [esi+edi-651981E8h]
		sub	esi, eax
		sub	edx, eax
		add	esi, esi
		lea	eax, [ecx-6DD873F4h]
		and	esi, 289A610h
		xor	eax, 1EF04509h
		sub	edx, esi
		add	eax, 1
		xor	edx, 81BD3F7Ah
		imul	esi, eax, 0D23D3C30h
		shl	eax, 5
		sub	eax, 1
		and	eax, 0C256E350h
		imul	eax, 82DC2C3Dh
		lea	eax, [esi+eax+64BD0AF8h]
		mov	[ebp+var_4C], eax
		mov	eax, 8CC8B8FDh
		sub	eax, ecx
		lea	ecx, [ecx+ecx+244F1818h]
		and	ecx, 0C21F75ECh
		add	eax, ecx
		shr	eax, 1Ch
		mov	edi, eax
		mov	ecx, eax
		not	edi
		add	edi, 10h
		or	edi, 2D0A4E79h
		add	edi, edi
		neg	ecx
		add	ecx, 0E11678Bh
		sub	ecx, edi
		imul	esi, [ebp+var_4C], 0A20CCB15h
		lea	edi, [eax+edi-2D0A4E88h]
		imul	eax, [ebp+var_4C], 0DDF334EBh
		or	edi, esi
		sub	esi, 3F1EDE2h
		sub	esi, ecx
		lea	eax, [ecx+eax]
		lea	eax, [eax+edi*2]
		neg	edi
		lea	eax, [eax+eax+3DF1CDFBh]
		lea	ecx, [esi+edi*2]
		and	eax, 0A5A2F5B0h
		mov	edi, [ebp+var_5C]
		add	eax, ecx
		imul	ecx, [ebp+var_5C], 40EB7CFDh
		shl	edi, 8
		add	ecx, 2F9736F5h
		shr	ecx, 18h
		imul	esi, ecx, 9E58055h
		lea	ecx, [ecx+ecx-1FFh]
		lea	esi, [edi+esi-5FFEE6AEh]
		imul	edi, [ebp+var_5C], 0D6F9FA00h
		add	edi, 2E6DEBFFh
		or	ecx, edi
		imul	ecx, 0F61A7FABh
		lea	ecx, [esi+ecx]
		mov	[ebp+var_78], ecx
		mov	ecx, [ebp+var_30]
		imul	esi, [ebp+var_C], 449856B7h
		add	ecx, ecx
		and	ecx, 0A5AB5194h
		sub	ecx, [ebp+var_30]
		lea	ecx, [ecx+esi+775CE815h]
		mov	esi, ecx
		shr	ecx, 13h
		imul	ecx, 30F43A79h
		shl	esi, 0Dh
		sub	ecx, 7B2C3254h
		mov	[ebp+var_44], ecx
		imul	ecx, esi, 53D3F0C9h
		imul	edi, [ebp+var_44], 3B24D4D1h
		lea	esi, [esi+esi+3FFFh]
		lea	ecx, [ecx+edi+42D39FD4h]
		mov	[ebp+var_C], ecx
		imul	ecx, [ebp+var_44], 46321F92h
		add	ecx, 65B49FE9h
		or	esi, ecx
		mov	ecx, [ebp+var_10]
		imul	esi, 0AC2C0F37h
		add	esi, [ebp+var_C]
		add	ecx, [ebp+var_28]
		mov	[ebp+var_60], esi
		mov	esi, [ebp+var_10]
		add	esi, esi
		and	esi, 941F0344h
		sub	esi, ecx
		lea	ecx, [esi+0A939C6Bh]
		mov	esi, ecx
		shr	esi, 0Fh
		mov	[ebp+var_30], esi
		imul	edi, ecx, 0D48A0000h
		imul	esi, 29E2EA45h
		shl	ecx, 12h
		add	ecx, 3FFFFh
		lea	edi, [edi+esi-3EAF8D2Ch]
		mov	[ebp+var_C], edi
		mov	edi, [ebp+var_30]
		lea	esi, [edi+edi-3FFFFh]
		mov	edi, [ebp+var_3C]
		or	esi, ecx
		imul	ecx, [ebp+var_3C], 0E50B311Dh
		imul	esi, 0D61D15BBh
		add	esi, [ebp+var_C]
		shl	edi, 16h
		add	ecx, 310423CDh
		shr	ecx, 0Ah
		imul	ecx, 6497B6A1h
		mov	[ebp+var_C0], esi
		add	ecx, 5DDEC2BFh
		imul	esi, ecx, 65BE5E15h
		imul	ecx, 94F35AC2h
		lea	esi, [edi+esi-4D6A351h]
		imul	edi, [ebp+var_3C], 8E800000h
		add	ecx, 44EC4543h
		sub	edi, 19000001h
		or	ecx, edi
		imul	ecx, 0FA00E6CBh
		lea	ecx, [esi+ecx]
		mov	[ebp+var_54], ecx
		mov	edi, [ebp+var_20]
		imul	ecx, [ebp+var_20], 2BC74E27h
		shl	edi, 18h
		add	ecx, 310A5ABh
		shr	ecx, 8
		imul	ecx, 0A13DEC3h
		add	ecx, 0B59B446h
		imul	esi, ecx, 0BFF8C9Dh
		imul	ecx, 0BBA283D6h
		lea	edi, [edi+esi+0A75C49Eh]
		imul	esi, [ebp+var_20], 4E000000h
		add	ecx, 63777B7Dh
		add	esi, 57FFFFFFh
		or	ecx, esi
		mov	esi, [ebp+var_70]
		imul	ecx, 0AEC0BE69h
		lea	ecx, [edi+ecx]
		mov	edi, [ebp+var_24]
		mov	[ebp+var_30], ecx
		lea	ecx, [edx+edx]
		lea	edx, [esi+edx+59453420h]
		and	ecx, 37A7EF4h
		sub	edi, edx
		lea	ecx, [edi+ecx-5A6566DCh]
		mov	edx, ecx
		shr	ecx, 3
		imul	ecx, 53EC5609h
		shl	edx, 1Dh
		sub	edx, 22C53392h
		imul	edi, edx, 221666E5h
		sub	ecx, 277DF924h
		imul	esi, ecx, 94E33BDDh
		imul	edx, 0EDCEF42h
		imul	ecx, 0F3A03072h
		lea	esi, [edi+esi-9C87676h]
		sub	edx, 608B665Dh
		sub	ecx, 28B04DF7h
		or	ecx, edx
		imul	edx, [ebp+var_54], 0CA16623Ah
		imul	ecx, 972AA73Bh
		add	edx, 6208479Bh
		mov	[ebp+var_D4], edx
		mov	edi, [ebp+var_D4]
		lea	ecx, [esi+ecx]
		imul	edx, [ebp+var_60], 0A35652F2h
		imul	esi, [ebp+var_60], 86DDC4A1h
		mov	[ebp+var_24], ecx
		imul	ecx, [ebp+var_54], 34F76EE5h
		sub	edx, 3CC21E81h
		or	edi, edx
		imul	edi, 0EFD6AD97h
		lea	ecx, [esi+ecx+4D4924A7h]
		lea	edi, [ecx+edi]
		imul	ecx, [ebp+var_30], 578E9C4Eh
		mov	[ebp+var_BC], edi
		mov	[ebp+var_10], ecx
		add	ecx, 6214B57h
		mov	[ebp+var_11C], ecx
		imul	ecx, [ebp+var_78], 81D6F9FAh
		add	ecx, 5F2E6DEBh
		imul	esi, [ebp+var_54], 0CC9365D5h
		imul	edi, [ebp+var_78], 54768EB5h
		lea	edi, [edi+esi+648D2701h]
		mov	esi, [ebp+var_D4]
		or	esi, ecx
		or	ecx, edx
		imul	esi, 0A85F1DE7h
		imul	edx, ecx, 0FC2A2ED9h
		mov	[ebp+var_184], ecx
		lea	esi, [edi+esi]
		mov	[ebp+var_118], esi
		imul	edi, [ebp+var_60], 1A9C1A6Fh
		imul	esi, [ebp+var_78], 1A6B978Bh
		lea	esi, [edi+esi+3C06E79Fh]
		mov	edi, [ebp+var_2C]
		lea	edx, [esi+edx]
		mov	esi, 6DD873F3h
		sub	esi, eax
		mov	[ebp+var_3C], esi
		imul	esi, [ebp+var_2C], 0FCDEE53Fh
		add	edi, 1
		mov	[ebp+var_114], edx
		imul	edi, 3211AC1h
		lea	edx, [esi+384D39D9h]
		xor	edx, 0E6D4h
		add	edi, 57A75505h
		sub	edx, 549A0000h
		sub	edi, eax
		xor	edx, [ebp+var_3C]
		mov	[ebp+var_C], edi
		mov	ecx, [ebp+var_C]
		xor	edx, 0FFFF192Bh
		or	edx, [ebp+var_3C]
		mov	edi, edx
		not	edi
		lea	ecx, [ecx+edi*2]
		lea	edi, [eax+esi]
		add	esi, 2C6139D9h
		lea	edx, [edi+edx*2]
		xor	esi, 0E6D4h
		lea	edx, [edx+edx-144A7431h]
		sub	esi, 48AE0000h
		and	edx, 7B27DCFCh
		add	edx, ecx
		mov	[ebp+var_D0], edx
		imul	edi, [ebp+var_C0], 2BFC988Dh
		imul	edx, [ebp+var_30], 2BC74E27h
		add	edi, 6680E13Bh
		mov	[ebp+var_130], edi
		xor	edi, 0E6D4h
		sub	edi, 48AE0000h
		xor	esi, edi
		mov	edi, esi
		xor	esi, 0D1CB9596h
		xor	edi, 2E346A69h
		mov	[ebp+var_10C], edi
		imul	edi, [ebp+var_24], 15C660Dh
		imul	ecx, [ebp+var_24], 2B8CC1Ah
		sub	edi, 160ED22Dh
		xor	edi, 20CEh
		add	edi, 383A0000h
		xor	edi, esi
		xor	edi, 0FFFFDF31h
		or	edi, esi
		lea	esi, [edx+5A94A5ABh]
		add	edx, 2BC74E27h
		xor	esi, 0D749h
		neg	edx
		sub	esi, 57840000h
		sub	edx, eax
		xor	esi, [ebp+var_3C]
		mov	[ebp+var_12C], ecx
		mov	[ebp+var_C], edi
		xor	esi, 0FFFF28B6h
		or	esi, [ebp+var_3C]
		mov	ecx, esi
		not	ecx
		lea	edx, [edx+ecx*2+1056C066h]
		lea	ecx, [eax+esi*2]
		mov	esi, [ebp+var_10]
		lea	ecx, [esi+ecx*2+2A706373h]
		and	ecx, 0BED8BCE4h
		lea	ecx, [edx+ecx]
		imul	esi, [ebp+var_24], 0FD4733E6h
		lea	edi, [ecx+ecx+4D97FB2Eh]
		and	edi, 7CC7C908h
		mov	edx, edi
		sub	edx, ecx
		sub	esi, 44565BA8h
		lea	edx, [edx+edx+35A03BC9h]
		and	edx, esi
		add	edx, ecx
		imul	esi, [ebp+var_2C], 0C4F5A987h
		imul	ecx, eax, 941341B9h
		mov	[ebp+var_188], edx
		lea	edx, [eax+eax+244F1818h]
		and	edx, 0C21F75ECh
		mov	[ebp+var_A4], edi
		lea	esi, [esi+ecx-49FB30B7h]
		imul	ecx, edx, 6BECBE47h
		sub	edx, eax
		imul	eax, [ebp+var_2C], 6423582h
		lea	ecx, [esi+ecx]
		add	eax, 38998C4Ch
		lea	esi, [edx+edx+199171FBh]
		and	esi, eax
		mov	eax, [ebp+var_D8]
		imul	esi, 941341B9h
		lea	esi, [ecx+esi]
		lea	ecx, [eax+eax+459AF22Ch]
		and	ecx, 923191A0h
		sub	eax, ecx
		imul	edx, [ebp+var_C4], 0B86783B5h
		mov	[ebp+var_20], eax
		mov	edi, [ebp+var_20]
		mov	[ebp+var_E0], esi
		imul	esi, [ebp+var_64], 0F16E4323h
		mov	[ebp+var_58], edx
		add	edx, 31BE514Eh
		xor	edx, 3ED0A3D7h
		lea	eax, [edx+edx]
		or	eax, 7DA147AEh
		add	eax, [ebp+var_D8]
		mov	[ebp+var_128], esi
		sub	eax, ecx
		sub	eax, edx
		imul	edx, [ebp+var_B4], 8A1C67E5h
		imul	ecx, [ebp+var_48], 2D90A3C5h
		sub	edx, eax
		lea	eax, [esi+edx-68C88F5h]
		mov	edx, eax
		and	eax, 0E019E137h
		or	edx, 0E019E137h
		add	edx, 7BE70BD3h
		sub	edx, eax
		lea	eax, [edx+edx+831E85Ah]
		and	eax, 3FCC3D90h
		sub	eax, edx
		imul	eax, 1F218ABFh
		imul	edx, [ebp+var_C4], 47987C4Bh
		lea	eax, [ecx+eax+0DA8F5B4h]
		mov	[ebp+var_3C], eax
		mov	eax, [ebp+var_58]
		mov	[ebp+var_124], edx
		sub	edx, edi
		lea	ecx, [eax+edi-37B0C221h]
		mov	edi, [ebp+var_A0]
		lea	eax, [ecx+ecx]
		or	eax, 0DD460996h
		lea	esi, [edx+eax-318C5583h]
		mov	edx, [ebp+var_A0]
		lea	edi, [edi+edi+0AD87A94h]
		mov	[ebp+var_D8], edi
		mov	eax, edi
		imul	edi, [ebp+var_120], 6836FC0Bh
		and	eax, 9D006702h
		sub	edx, eax
		mov	[ebp+var_2C], edi
		sub	eax, [ebp+var_A0]
		lea	eax, [esi+eax+106E4503h]
		lea	esi, [esi+esi-0ACBDA4Eh]
		or	esi, 0DD460996h
		sub	eax, esi
		lea	esi, [eax+edi]
		mov	eax, esi
		and	esi, 55201F9Bh
		or	eax, 55201F9Bh
		sub	eax, esi
		mov	esi, [ebp+var_A8]
		lea	esi, [esi+esi-93A1BEAh]
		mov	[ebp+var_44], esi
		or	esi, 0A12CEDCAh
		mov	[ebp+var_90], esi
		mov	esi, eax
		sub	esi, [ebp+var_A8]
		add	esi, 5EE67774h
		add	eax, eax
		and	eax, 55BFC0C8h
		xor	ecx, 77DA0D4Bh
		sub	esi, eax
		add	esi, [ebp+var_90]
		imul	edi, [ebp+var_B4], 8A1C67E5h
		xor	esi, 0E10FBAF6h
		mov	[ebp+var_5C], esi
		add	esi, 6DD873F4h
		mov	[ebp+var_18C], esi
		imul	esi, [ebp+var_B4], 75E3981Bh
		mov	[ebp+var_6C], edi
		sub	edi, edx
		lea	eax, [esi+ecx-7C336159h]
		add	ecx, ecx
		and	ecx, 0EFB41A96h
		sub	eax, ecx
		lea	ecx, [edx+esi-2020FDD9h]
		xor	eax, 0CC72DC64h
		add	ecx, ecx
		or	ecx, 20C7F176h
		lea	ecx, [edi+ecx-4B07D15Dh]
		mov	edi, [ebp+var_44]
		and	edi, 0A12CEDCAh
		mov	[ebp+var_10], edi
		mov	edi, [ebp+var_A8]
		sub	edi, [ebp+var_10]
		mov	[ebp+var_4C], edi
		imul	edi, [ebp+var_120], 97C903F5h
		mov	[ebp+var_B4], edi
		lea	edi, [ecx-0FF4CEF5h]
		lea	ecx, [ecx+ecx-4A76530Ah]
		and	ecx, 20C7F176h
		sub	edi, ecx
		add	edi, [ebp+var_B4]
		imul	ecx, [ebp+var_20], 21D4363Dh
		xor	edi, 0E905EE14h
		mov	[ebp+var_10], edi
		imul	edi, edx, 21D4363Dh
		lea	edi, [edi+ecx-4E88C46Ch]
		imul	ecx, [ebp+var_C4], 2D569021h
		lea	ecx, [edi+ecx]
		mov	edi, [ebp+var_2C]
		imul	ecx, 20B46EEBh
		lea	ecx, [edi+ecx+56C4A6A4h]
		mov	edi, ecx
		and	ecx, 0EEF84687h
		or	edi, 0EEF84687h
		sub	edi, 0CBB8982h
		sub	edi, ecx
		imul	ecx, [ebp+var_64], 0BBFC166Fh
		mov	[ebp+var_80], ecx
		lea	ecx, [edi+edi+19771304h]
		and	ecx, 220F72F0h
		sub	ecx, edi
		mov	edi, [ebp+var_80]
		imul	ecx, 29E2EA45h
		lea	ecx, [edi+ecx+3B4D8585h]
		mov	edi, [ebp+var_6C]
		mov	[ebp+var_80], ecx
		mov	ecx, [ebp+var_2C]
		lea	ecx, [edi+ecx+6F2B0CCEh]
		mov	[ebp+var_44], ecx
		mov	edi, [ebp+var_44]
		or	ecx, 7F2495A6h
		and	edi, 7F2495A6h
		sub	ecx, edi
		lea	edi, [ecx-9321DF9h]
		add	ecx, ecx
		and	ecx, 1B6D4B2h
		mov	[ebp+var_6C], edi
		mov	[ebp+var_50], ecx
		sub	ecx, edi
		mov	edi, [ebp+var_128]
		lea	edi, [ecx+edi-734701ECh]
		mov	[ebp+var_C4], edi
		mov	edi, [ebp+var_6C]
		imul	ecx, [ebp+var_64], 0E91BCDDh
		lea	edi, [edi+ecx-286E1E25h]
		mov	ecx, [ebp+var_50]
		sub	edi, ecx
		mov	ecx, [ebp+var_90]
		add	edi, edi
		sub	ecx, [ebp+var_A8]
		or	edi, 4EEA890Ah
		add	edi, [ebp+var_C4]
		lea	ecx, [edi+ecx+4FBBB721h]
		lea	edi, [edi+edi-178048E8h]
		and	edi, 4EEA890Ah
		sub	ecx, edi
		xor	ecx, 4D105504h
		lea	edi, [ecx+ecx]
		and	edi, 9A20AA08h
		sub	ecx, edi
		mov	edi, [ebp+var_20]
		imul	ecx, 0FA00E6CBh
		sub	ecx, 57FA304Ch
		mov	[ebp+var_A8], ecx
		lea	ecx, [esi+edi-8272CBEh]
		xor	ecx, 705E4B0Ch
		imul	edi, ecx, 0BF00BC31h
		add	ecx, ecx
		and	ecx, 0E0BC9618h
		imul	ecx, 40FF43CFh
		imul	esi, [ebp+var_48], 0AD848D8Dh
		mov	[ebp+var_20], edi
		imul	edi, [ebp+var_64], 0B397724Dh
		add	edi, [ebp+var_20]
		add	edi, ecx
		imul	edi, 0BBE6FA1Bh
		imul	ecx, [ebp+var_4C], 0BBE1B32Bh
		add	edi, ecx
		mov	ecx, [ebp+var_124]
		imul	edi, 0AFD19ABBh
		sub	ecx, edx
		lea	edi, [esi+edi-70AA3FFAh]
		mov	esi, [ebp+var_58]
		mov	[ebp+var_90], edi
		mov	edi, [ebp+var_2C]
		lea	edx, [edx+esi-4FAA933Ch]
		add	edx, edx
		or	edx, 68C9F892h
		lea	ecx, [ecx+edx-27A44EA8h]
		lea	edx, [ecx+ecx-7A2C34CAh]
		and	edx, 68C9F892h
		mov	esi, edx
		sub	esi, ecx
		sub	ecx, edx
		mov	edx, [ebp+var_B4]
		lea	esi, [edi+esi+5B0EC346h]
		imul	edi, [ebp+var_64], 947CCA9Fh
		lea	ecx, [ecx+edx-3CEBC47h]
		add	ecx, ecx
		or	ecx, 22939B34h
		lea	ecx, [esi+ecx]
		mov	edx, ecx
		sub	edx, [ebp+var_4C]
		lea	ecx, [ecx+ecx+2EEC56CEh]
		or	ecx, 22939B34h
		sub	edx, ecx
		mov	ecx, [ebp+var_5C]
		imul	esi, [ebp+var_48], 0A659C4A7h
		imul	edx, 68D558C5h
		add	ecx, ecx
		and	ecx, 0C21F75ECh
		lea	edx, [esi+edx-6B452A48h]
		mov	[ebp+var_6C], edx
		mov	edx, [ebp+var_D8]
		sub	ecx, [ebp+var_18C]
		or	edx, 9D006702h
		sub	edx, [ebp+var_A0]
		lea	esi, [ecx+4C8B8FDh]
		sub	ecx, 73374703h
		shl	esi, 5
		lea	edx, [eax+edx+2BA6F92Eh]
		add	eax, eax
		and	eax, 98E5B8C8h
		sub	edx, eax
		mov	eax, 0FFFFFFE0h
		imul	edx, 0F61A7FABh
		sub	eax, esi
		shr	ecx, 1Bh
		lea	edx, [edi+edx+18E1084Eh]
		mov	edi, esi
		imul	edx, 40EB7CFDh
		neg	edi
		add	edi, 33C7E521h
		add	edx, 2F9736F5h
		or	eax, 0B8E1AA78h
		add	eax, eax
		sub	edi, eax
		mov	eax, ecx
		not	ecx
		neg	eax
		add	ecx, 20h
		add	eax, 12B945B6h
		or	ecx, 545209B2h
		add	ecx, ecx
		sub	eax, ecx
		lea	ecx, [eax+edi-394D76AFh]
		neg	edi
		neg	eax
		lea	esi, [edi+edi-0A338A6Dh]
		lea	eax, [eax+eax+7CCE77CBh]
		or	esi, eax
		lea	esi, [ecx+esi]
		mov	ecx, [ebp+var_4C]
		xor	esi, 0DBC193Ch
		mov	[ebp+var_64], esi
		add	esi, 6DD873F4h
		mov	[ebp+var_58], esi
		mov	esi, [ebp+var_10]
		mov	edi, esi
		add	edi, edi
		lea	eax, [esi+ecx+34FF5704h]
		and	edi, 0D20BDC28h
		sub	eax, edi
		mov	esi, edx
		xor	eax, 0E7938AE4h
		lea	ecx, [eax+eax]
		and	ecx, 0CF2715C8h
		sub	eax, ecx
		mov	ecx, eax
		imul	eax, [ebp+var_48], 89ED867Bh
		shr	esi, 17h
		sub	eax, ecx
		lea	edi, [eax+62953D36h]
		imul	ecx, edx, 0CB00AA00h
		shl	edx, 0Ah
		mov	[ebp+var_2C], edi
		add	edx, 3FFh
		imul	edi, esi, 9E58055h
		lea	esi, [esi+esi-3FFh]
		or	esi, edx
		mov	edx, [ebp+var_2C]
		imul	esi, 0F61A7FABh
		lea	ecx, [ecx+edi-38BE3FAEh]
		shr	edx, 15h
		add	esi, ecx
		mov	[ebp+var_20], esi
		mov	esi, 0EA1BE385h
		sub	esi, edx
		lea	edx, [edx+edx-0FFFh]
		or	edx, 8D6795CBh
		add	esi, edx
		add	eax, 62953D37h
		imul	ecx, [ebp+var_2C], 6079B800h
		neg	eax
		imul	edi, esi, 0AC2C0F37h
		lea	edx, [esi+esi-619F4CD6h]
		and	edx, 72986A34h
		shl	eax, 0Ch
		lea	edi, [ecx+edi-3C126627h]
		imul	ecx, edx, 53D3F0C9h
		sub	edx, esi
		lea	ecx, [edi+ecx]
		lea	edi, [edx+edx-10F91D5Fh]
		and	edi, eax
		imul	edi, 0AC2C0F37h
		lea	edi, [ecx+edi]
		mov	[ebp+var_4C], edi
		mov	ecx, [ebp+var_80]
		imul	eax, [ebp+var_80], 2BFC988Dh
		mov	edi, [ebp+var_A8]
		shl	ecx, 0Fh
		add	eax, 1DD2E13Bh
		shr	eax, 11h
		imul	eax, 54EE3DE3h
		add	eax, 1BB43FACh
		imul	edx, eax, 0C6682FB7h
		imul	eax, 0B1B5DF96h
		lea	edx, [ecx+edx+4759DAE0h]
		imul	ecx, [ebp+var_80], 988D0000h
		sub	eax, 2FB122C7h
		sub	ecx, 1EC40001h
		or	eax, ecx
		imul	eax, 0D61D15BBh
		lea	eax, [edx+eax]
		mov	[ebp+var_A0], eax
		imul	eax, [ebp+var_48], 1BD3DA77h
		lea	esi, [edi+eax-55C4497h]
		imul	eax, [ebp+var_48], 0E42C2589h
		imul	esi, 4BB00000h
		add	eax, 55C4497h
		sub	eax, edi
		imul	eax, 1AF4CEE3h
		lea	ecx, [esi-23816A81h]
		lea	edx, [eax+310423CDh]
		shr	edx, 0Ch
		imul	edx, 61F902DBh
		add	edx, 394D72h
		imul	ecx, 79801073h
		imul	eax, edx, 1FBFA92Fh
		imul	edx, 303A52A6h
		lea	eax, [ecx+eax+781AE65Fh]
		mov	ecx, 23816A81h
		sub	ecx, esi
		sub	edx, 6BEABBEBh
		imul	ecx, 4ACE3FF2h
		add	ecx, 1265930Dh
		or	edx, ecx
		mov	ecx, [ebp+var_90]
		imul	edx, 0FA00E6CBh
		shl	ecx, 19h
		lea	edx, [eax+edx]
		imul	eax, [ebp+var_90], 2BC74E27h
		mov	[ebp+var_48], edx
		add	eax, 310A5ABh
		shr	eax, 7
		imul	edx, eax, 513F4197h
		lea	eax, [eax+eax-3FFFFFFh]
		lea	edx, [ecx+edx+7FC99B8Ch]
		imul	ecx, [ebp+var_90], 9C000000h
		sub	ecx, 50000001h
		or	eax, ecx
		mov	ecx, [ebp+var_6C]
		imul	eax, 0AEC0BE69h
		shl	ecx, 1Bh
		lea	eax, [edx+eax]
		mov	[ebp+var_2C], eax
		imul	eax, [ebp+var_6C], 15C660Dh
		add	eax, 222B2DD3h
		shr	eax, 5
		imul	edx, eax, 68D558C5h
		lea	eax, [eax+eax-0FFFFFFFh]
		lea	edx, [ecx+edx-6C5F2424h]
		imul	ecx, [ebp+var_6C], 0D0000000h
		add	ecx, 3FFFFFFFh
		or	eax, ecx
		imul	eax, 972AA73Bh
		lea	eax, [edx+eax]
		mov	[ebp+var_10], eax
		imul	edx, [ebp+var_A0], 2BFC988Dh
		imul	eax, [ebp+var_4C], 51AB2979h
		lea	ecx, [edx-1AE71EC5h]
		add	eax, 28E4F0BFh
		xor	ecx, 0F1D6h
		xor	eax, 0F1D6h
		add	eax, 38BA0000h
		add	ecx, 38BA0000h
		imul	edi, [ebp+var_30], 5EF29997h
		xor	eax, ecx
		imul	esi, [ebp+var_BC], 0B294D269h
		xor	eax, 89235C61h
		lea	ecx, [eax-17DB36E3h]
		add	eax, eax
		and	eax, 1246B8C2h
		lea	esi, [edi+esi-10DDA12Ah]
		imul	edi, [ebp+var_BC], 0D42BBB2h
		add	edi, 0C96AFFBh
		or	edi, [ebp+var_11C]
		imul	edi, 0D2BF10EFh
		add	esi, edi
		imul	edi, ecx, 89E46805h
		imul	esi, 421471DBh
		mov	[ebp+var_5C], edi
		imul	edi, [ebp+var_2C], 4C605EC3h
		add	edi, [ebp+var_5C]
		mov	[ebp+var_5C], edi
		imul	edi, eax, 761B97FBh
		sub	eax, ecx
		imul	ecx, [ebp+var_2C], 0A87163B2h
		lea	eax, [eax+eax-41FD2689h]
		add	edi, [ebp+var_5C]
		sub	ecx, 6214B58h
		and	eax, ecx
		imul	eax, 89E46805h
		imul	ecx, [ebp+var_20], 999D3AE7h
		add	edi, eax
		imul	eax, [ebp+var_48], 0CA16623Ah
		imul	edi, 5D5D0B1h
		add	eax, 6208479Bh
		mov	[ebp+var_80], eax
		lea	edi, [esi+edi+5396DEC4h]
		imul	eax, [ebp+var_20], 81D6F9FAh
		mov	[ebp+var_BC], edi
		add	eax, 5F2E6DEBh
		mov	[ebp+var_90], eax
		imul	eax, [ebp+var_48], 9D01ED47h
		lea	eax, [ecx+eax+5BD071F5h]
		mov	ecx, [ebp+var_80]
		or	ecx, [ebp+var_90]
		imul	ecx, 91B4F14Dh
		lea	ecx, [eax+ecx]
		imul	eax, [ebp+var_10], 2B8CC1Ah
		add	edx, 7556E13Bh
		imul	edi, ecx, 0D6DCD5DBh
		xor	edx, 0F1D6h
		imul	ecx, 0D290A0F6h
		sub	edx, 57840000h
		add	eax, 44565BA7h
		mov	[ebp+var_6C], eax
		imul	esi, [ebp+var_30], 0E0FB89Fh
		add	ecx, 2BE01417h
		imul	eax, [ebp+var_118], 0E627AE31h
		or	ecx, [ebp+var_6C]
		lea	eax, [esi+eax-284C0783h]
		imul	esi, [ebp+var_118], 872EB452h
		imul	eax, 734C1579h
		sub	esi, 3C9A7CCDh
		or	esi, [ebp+var_11C]
		sub	eax, esi
		imul	esi, [ebp+var_10], 112FC1ADh
		lea	esi, [edi+esi]
		imul	esi, 945781E1h
		sub	esi, ecx
		lea	eax, [eax+esi-6B014F2h]
		mov	ecx, eax
		and	eax, 2F69891Ah
		or	ecx, 2F69891Ah
		sub	ecx, 7B62F20Bh
		sub	ecx, eax
		imul	eax, [ebp+var_2C], 2BC74E27h
		mov	[ebp+var_5C], ecx
		imul	ecx, [ebp+var_10], 15C660Dh
		add	eax, 5A94A5ABh
		xor	eax, 0F1D6h
		sub	eax, 57840000h
		xor	edx, eax
		lea	eax, [ecx-160ED22Dh]
		mov	esi, edx
		xor	eax, 20CEh
		xor	esi, 4A32EF56h
		add	eax, 383A0000h
		xor	eax, 0FFFFDF31h
		xor	eax, esi
		xor	edx, 0B5CD10A9h
		or	eax, esi
		imul	edi, [ebp+var_10], 0B5138B1h
		imul	esi, edx, 0B4427835h
		lea	edx, [edx+ecx+222B2DD6h]
		imul	ecx, [ebp+var_54], 19836C73h
		lea	edi, [edi+esi-0E4D9B51h]
		imul	esi, eax, 6884F06Ah
		lea	eax, [edx+eax*2]
		lea	esi, [edi+esi]
		lea	edi, [eax+eax-1]
		imul	eax, [ebp+var_114], 248AEE19h
		and	edi, 2EF9FFFAh
		imul	edi, 4BBD87CBh
		lea	edx, [ecx+eax+649718D6h]
		imul	eax, [ebp+var_114], 69E51D2Eh
		add	esi, edi
		imul	ecx, [ebp+var_3C], 6423582h
		add	eax, 28B6ADD7h
		or	eax, [ebp+var_D4]
		add	ecx, 38998C4Ch
		imul	eax, 9CA65131h
		lea	eax, [edx+eax]
		imul	eax, 0AB4880DDh
		imul	edx, esi, 0E5820A47h
		imul	esi, 4CD1CBC6h
		lea	eax, [eax+edx-6AB2D400h]
		mov	edx, [ebp+var_64]
		and	esi, 4563DEA8h
		imul	esi, 0B0B68B3h
		add	edx, edx
		and	edx, 0C21F75ECh
		lea	esi, [eax+esi]
		mov	eax, edx
		sub	eax, [ebp+var_58]
		mov	[ebp+var_30], esi
		imul	esi, [ebp+var_3C], 0AEE59817h
		lea	eax, [eax+eax+199171FBh]
		and	ecx, eax
		mov	[ebp+var_64], eax
		imul	eax, [ebp+var_58], 0A53FDF29h
		lea	esi, [esi+eax+45767FC6h]
		imul	eax, edx, 5AC020D7h
		add	esi, eax
		imul	eax, ecx, 0A53FDF29h
		lea	eax, [esi+eax]
		mov	esi, [ebp+var_D0]
		mov	[ebp+var_54], eax
		lea	eax, [esi+esi-1C6E4854h]
		and	eax, 0B938A910h
		imul	edi, esi, 0BF53217Fh
		imul	esi, [ebp+var_C0], 0AB0DAF3h
		lea	esi, [edi+esi]
		imul	edi, eax, 40ACDE81h
		sub	eax, [ebp+var_D0]
		add	esi, edi
		imul	edi, [ebp+var_C0], 0A806CEE6h
		lea	eax, [eax+eax+63359F43h]
		sub	edi, 3BA5C278h
		and	eax, edi
		imul	eax, 0BF53217Fh
		imul	edi, [ebp+var_48], 0DBE5A105h
		lea	eax, [esi+eax]
		imul	esi, [ebp+var_54], 745BCF1Fh
		imul	eax, 989CA1E3h
		lea	esi, [edi+esi-1EC5B2E8h]
		imul	edi, [ebp+var_54], 173DA5CEh
		sub	edi, 2FB8710Dh
		or	edi, [ebp+var_80]
		imul	edi, 8FC12CF7h
		lea	edi, [esi+edi]
		imul	edi, 64E17C0Bh
		imul	esi, [ebp+var_2C], 0E0C31D4Fh
		lea	edi, [eax+edi-5526A2D6h]
		imul	eax, [ebp+var_20], 0DECCAB35h
		mov	[ebp+var_54], edi
		imul	edi, [ebp+var_10], 0A6766077h
		lea	eax, [esi+eax+0BE1F399h]
		imul	esi, [ebp+var_2C], 578E9C4Eh
		add	esi, 6214B57h
		or	esi, [ebp+var_90]
		imul	esi, 0AD07A767h
		lea	esi, [eax+esi]
		imul	eax, esi, 95671D0Bh
		imul	esi, 0C9B8F752h
		add	eax, edi
		imul	eax, 16DD729Bh
		add	esi, 5DEF133Fh
		or	esi, [ebp+var_6C]
		imul	edi, [ebp+var_24], 5DA685DDh
		sub	eax, esi
		mov	esi, [ebp+var_10C]
		add	esi, 505F983Fh
		imul	esi, 7809FB11h
		lea	edi, [edi+esi-71FA96C9h]
		imul	esi, [ebp+var_C], 0F013F622h
		imul	ecx, 0ACFAF015h
		lea	esi, [edi+esi]
		mov	edi, [ebp+var_10C]
		imul	esi, 9E5E55F1h
		lea	esi, [eax+esi-42169855h]
		mov	eax, [ebp+var_12C]
		lea	edi, [eax+edi*2+44565BABh]
		mov	eax, [ebp+var_C]
		lea	eax, [edi+eax*4]
		and	eax, 5C68D4D2h
		sub	esi, eax
		mov	eax, esi
		and	esi, 0B6E7372Fh
		or	eax, 0B6E7372Fh
		add	eax, 5D3286EAh
		sub	eax, esi
		mov	[ebp+var_6C], eax
		imul	eax, [ebp+var_58], 0ACFAF015h
		imul	esi, [ebp+var_3C], 0E8B9DE2Bh
		imul	edi, [ebp+var_4C], 0A35652F2h
		lea	esi, [esi+eax+7A8A2210h]
		imul	eax, edx, 53050FEBh
		sub	edi, 3CC21E81h
		lea	eax, [esi+eax]
		lea	ecx, [eax+ecx]
		imul	eax, ecx, 6013F53Fh
		imul	ecx, 0E22D4186h
		imul	esi, [ebp+var_4C], 0B6584AADh
		sub	ecx, 198E619h
		or	ecx, edi
		imul	ecx, 6B142E2Bh
		lea	esi, [esi+eax+5861253Fh]
		lea	ecx, [esi+ecx]
		imul	eax, ecx, 4CE1EFB9h
		imul	esi, [ebp+var_24], 0C47C24B7h
		imul	ecx, [ebp+var_A4], 3B95D72Dh
		lea	esi, [esi+ecx-27984050h]
		imul	ecx, [ebp+var_188], 0C46A28D3h
		lea	ecx, [esi+ecx]
		imul	ecx, 9C8279C1h
		lea	ecx, [eax+ecx+48C96169h]
		mov	[ebp+var_A8], ecx
		imul	eax, [ebp+var_3C], 9AB41F25h
		imul	ecx, [ebp+var_4C], 0D377DA43h
		lea	eax, [eax+ecx+53249FA1h]
		imul	ecx, [ebp+var_3C], 0F9BDCA7Eh
		sub	ecx, 38998C4Dh
		or	ecx, edi
		mov	edi, [ebp+var_130]
		imul	esi, ecx, 0FC0DD165h
		xor	edi, 0CB3Ch
		lea	esi, [eax+esi]
		lea	eax, [edi-48AE0000h]
		xor	eax, 61B59AF8h
		imul	ecx, [ebp+var_78], 0A1F9C421h
		imul	edi, [ebp+var_60], 29525ECDh
		add	ecx, edi
		imul	ecx, 0FF079D5Dh
		sub	ecx, [ebp+var_184]
		imul	edi, [ebp+var_A0], 0D4036773h
		sub	ecx, 261BD84Ch
		xor	ecx, 0CB3Ch
		sub	ecx, 48AE0000h
		xor	eax, ecx
		lea	ecx, [eax-0E1BC872h]
		add	eax, eax
		and	eax, 0C36B35F0h
		sub	ecx, eax
		imul	eax, esi, 0EBF4F86Dh
		lea	edi, [edi+eax+221ACCB3h]
		imul	eax, esi, 28160F26h
		imul	esi, [ebp+var_A0], 57F9311Ah
		add	eax, 2E04344Bh
		add	esi, 3BA5C277h
		or	eax, esi
		add	edi, eax
		mov	eax, 1331F3DFh
		lea	esi, [edi+ecx+18E19B56h]
		sub	eax, ecx
		add	esi, esi
		sub	eax, edi
		or	esi, 9D006702h
		imul	ecx, [ebp+var_58], 2B30D563h
		lea	eax, [esi+eax]
		imul	esi, [ebp+var_20], 0F87FD6D7h
		mov	[ebp+var_D4], eax
		imul	eax, [ebp+var_48], 0E50B311Dh
		lea	ecx, [esi+ecx-76A3C006h]
		imul	esi, [ebp+var_20], 7E290606h
		add	eax, 23B423CDh
		imul	ecx, 350ABB5h
		xor	eax, 0B76Ch
		add	eax, 0D500000h
		xor	eax, 0D963D8B7h
		sub	esi, 5F2E6DECh
		and	esi, [ebp+var_64]
		lea	edx, [edx+ecx-5933B7BBh]
		imul	edi, [ebp+var_E0], 2C1BC489h
		sub	edx, esi
		mov	esi, [ebp+var_F4]
		xor	edx, 0B76Ch
		add	edx, 0D500000h
		xor	eax, edx
		add	esi, 7FBCDB5h
		mov	edx, esi
		and	esi, 0CE6BB228h
		or	edx, 0CE6BB228h
		sub	edx, 558B72F7h
		sub	edx, esi
		imul	esi, [ebp+var_24], 12FF09F3h
		lea	ecx, [eax+58E0D40h]
		add	eax, eax
		and	eax, 0B2C7B16Eh
		sub	ecx, eax
		lea	edi, [esi+edi+259EC2C2h]
		mov	[ebp+var_10], edi
		mov	edi, [ebp+var_12C]
		imul	ecx, 0F6A9505Dh
		imul	esi, [ebp+var_E0], 778B16EEh
		imul	eax, [ebp+var_34], 3E0367C9h
		add	edi, 44565BA7h
		add	esi, 343F0269h
		or	esi, edi
		imul	esi, 0B722D001h
		add	esi, [ebp+var_10]
		imul	esi, 0E303C05Dh
		lea	ecx, [esi+ecx+2241A978h]
		mov	esi, [ebp+var_148]
		mov	[ebp+var_80], ecx
		imul	ecx, [ebp+var_68], 905089ADh
		lea	ecx, [eax+ecx-568CA7D3h]
		imul	ecx, 12ADC15Fh
		lea	eax, [edx+edx-54E91A12h]
		and	eax, 63289BAEh
		sub	eax, edx
		lea	eax, [ecx+eax]
		mov	ecx, [ebp+var_AC]
		lea	edx, [ecx+eax+4BC7A17Eh]
		mov	eax, edx
		and	edx, 0DAC1BF28h
		or	eax, 0DAC1BF28h
		sub	eax, edx
		imul	edx, eax, 0E0DE7541h
		add	eax, eax
		and	eax, 4A7C81AEh
		imul	eax, 1F218ABFh
		lea	edx, [esi+edx-2D6C1CEFh]
		lea	eax, [edx+eax]
		mov	[ebp+var_58], eax
		mov	eax, [ebp+var_C8]
		mov	edi, [ebp+var_F0]
		mov	ecx, [ebp+var_140]
		imul	esi, [ebp+var_14], 0FD98D771h
		lea	edx, [eax+edi-71C85167h]
		mov	edi, [ebp+var_28]
		mov	eax, edx
		and	edx, 0F68F98A1h
		or	eax, 0F68F98A1h
		sub	eax, edx
		imul	edx, [ebp+var_14], 0FD98D771h
		lea	edx, [eax+edx-6F42EE9Bh]
		add	eax, eax
		and	eax, 12E0CEBCh
		sub	edx, eax
		xor	edx, 0F052BE1Ch
		lea	eax, [edx+ecx+26202D3Ch]
		add	edx, edx
		mov	ecx, [ebp+var_7C]
		and	edx, 0E0A57C38h
		sub	eax, edx
		mov	edx, [ebp+var_7C]
		xor	eax, 0E10FBAF6h
		and	ecx, 0D8C702C1h
		or	edx, 0D8C702C1h
		sub	edx, ecx
		lea	ecx, [edx+edx]
		add	esi, edx
		and	ecx, 4E71FA7Ch
		sub	esi, ecx
		mov	ecx, [ebp+var_1C]
		sub	ecx, [ebp+var_B0]
		add	esi, 43CD1EA4h
		lea	edx, [esi+edi+16156A93h]
		add	edx, edx
		mov	[ebp+var_1C], ecx
		lea	ecx, [esi+edi+363853Eh]
		mov	edi, [ebp+var_1C]
		or	edx, 57EF7644h
		sub	ecx, edx
		sub	edi, esi
		lea	edx, [edi+edx-420D25B5h]
		mov	edi, [ebp+var_18]
		add	edx, edx
		and	edx, 57EF7644h
		lea	edx, [ecx+edx]
		mov	ecx, [ebp+var_13C]
		imul	edx, 9E58055h
		lea	edx, [ecx+edx-0B5F8015h]
		mov	ecx, [ebp+var_F8]
		mov	[ebp+var_48], edx
		mov	edx, [ebp+var_88]
		lea	esi, [edx+edi+5F29C69h]
		mov	edi, [ebp+var_DC]
		add	esi, [ebp+var_168]
		lea	edx, [edi+ecx-0E1B4DFAh]
		mov	edi, [ebp+var_88]
		xor	esi, 0E46FC00h
		mov	ecx, edx
		or	ecx, 0EDDCB042h
		and	edx, 0EDDCB042h
		sub	ecx, edx
		lea	edx, [ecx+edi-6C8A79B0h]
		add	ecx, ecx
		and	ecx, 24469F7Ah
		sub	edx, ecx
		xor	edx, 975F1400h
		mov	ecx, edx
		add	edx, edx
		sub	ecx, [ebp+var_38]
		and	edx, 2EBE2800h
		sub	ecx, edx
		mov	edx, [ebp+var_138]
		or	edx, 9F7B52BCh
		lea	edx, [ecx+edx+7DBD68F0h]
		mov	ecx, [ebp+var_70]
		sub	ecx, [ebp+var_B0]
		xor	edx, 4AC65370h
		lea	ecx, [edx+ecx+63944B0Dh]
		add	edx, edx
		and	edx, 958CA6E0h
		sub	ecx, edx
		mov	edx, [ebp+var_8C]
		mov	[ebp+var_C], ecx
		mov	ecx, [ebp+var_8C]
		or	edx, 0EEC9E13h
		and	ecx, 0EEC9E13h
		sub	edx, ecx
		lea	ecx, [edx+34EA2196h]
		add	edx, edx
		and	edx, 0E226C3D8h
		mov	edi, edx
		mov	[ebp+var_20], ecx
		sub	edi, ecx
		mov	ecx, [ebp+var_C8]
		lea	ecx, [edi+ecx-4760D0E4h]
		mov	edi, [ebp+var_88]
		mov	[ebp+var_10], ecx
		mov	ecx, [ebp+var_20]
		lea	edi, [ecx+edi+3D7B76E9h]
		sub	edi, edx
		mov	ecx, edi
		imul	edx, [ebp+var_18], 0FA00E6CBh
		add	ecx, ecx
		imul	edi, [ebp+var_14], 0C3C25C9Bh
		or	ecx, 45D12BC2h
		add	ecx, [ebp+var_10]
		lea	edi, [edi+edx-4668860h]
		lea	edx, [ecx+ecx-320677CCh]
		and	edx, 45D12BC2h
		sub	edx, ecx
		imul	edx, 5FF1935h
		lea	edx, [edi+edx]
		mov	[ebp+var_2C], edx
		mov	edi, [ebp+var_18]
		mov	ecx, [ebp+var_16C]
		lea	edx, [edi+ecx+0A17C5E3h]
		mov	ecx, [ebp+var_1C]
		add	edx, [ebp+var_170]
		mov	edi, [ebp+var_94]
		xor	edx, 8EFC7A6Ch
		sub	ecx, edx
		add	edx, edx
		and	edx, 1DF8F4D8h
		or	edi, 0CE91C047h
		lea	edx, [ecx+edx]
		mov	ecx, [ebp+var_134]
		imul	edx, 513F4197h
		lea	edx, [ecx+edx-2CC569C6h]
		mov	ecx, 5C245A65h
		mov	[ebp+var_3C], edx
		mov	edx, [ebp+var_94]
		and	edx, 0CE91C047h
		sub	edi, edx
		mov	edx, 1EF04509h
		sub	edx, eax
		add	eax, eax
		and	eax, 0C21F75ECh
		lea	eax, [edx+eax]
		mov	edx, eax
		shr	edx, 1Ch
		mov	[ebp+var_38], edx
		mov	edx, eax
		not	eax
		shl	edx, 4
		neg	edx
		shl	eax, 5
		sub	edx, 6973256Bh
		or	eax, 74D10080h
		sub	edx, eax
		mov	eax, [ebp+var_38]
		sub	ecx, edx
		mov	[ebp+var_10], edi
		sub	eax, 350C0010h
		xor	eax, 7F7h
		add	eax, 350C0000h
		xor	eax, ecx
		xor	eax, 0FFFFF808h
		or	eax, ecx
		mov	ecx, 7F7CB04h
		sub	ecx, [ebp+var_38]
		mov	edi, eax
		not	edi
		sub	ecx, edx
		lea	ecx, [ecx+edi*2-6293C1E4h]
		mov	edi, [ebp+var_38]
		lea	edx, [edi+edx+7F8E147Dh]
		lea	eax, [edx+eax*2]
		mov	edx, 14CEF302h
		lea	eax, [eax+eax+489B221Fh]
		and	eax, 49318A92h
		lea	eax, [ecx+eax]
		mov	[ebp+var_24], eax
		imul	eax, [ebp+var_48], 40EB7CFDh
		imul	edi, [ebp+var_48], 0D2A5FD00h
		add	eax, 2F9736F5h
		shr	eax, 18h
		sub	edi, 4BB8D8F6h
		sub	edx, eax
		lea	eax, [eax+eax-1FFh]
		or	eax, 92CF72D5h
		mov	[ebp+var_34], edi
		lea	eax, [edx+eax]
		mov	edi, [ebp+var_1C]
		mov	edx, [ebp+var_144]
		mov	[ebp+var_28], eax
		lea	eax, [eax+eax+4392A926h]
		and	eax, 6D308D2Ah
		lea	ecx, [edi+edx+108EB2EDh]
		sub	ecx, esi
		add	esi, esi
		and	esi, 1C8DF800h
		lea	esi, [ecx+esi]
		mov	ecx, eax
		mov	[ebp+var_20], esi
		imul	eax, 9E58055h
		imul	esi, [ebp+var_34], 59EF39FEh
		sub	ecx, [ebp+var_28]
		imul	edi, [ebp+var_34], 23D1A0ABh
		imul	edx, [ebp+var_28], 0F61A7FABh
		add	esi, 2EF21E14h
		lea	ecx, [ecx+ecx+4F3CC9AFh]
		and	ecx, esi
		mov	esi, [ebp+var_C]
		imul	ecx, 0F61A7FABh
		lea	edx, [edi+edx-70D9C5A4h]
		mov	edi, [ebp+var_20]
		lea	eax, [edx+eax]
		add	esi, 3BD52672h
		lea	eax, [ecx+eax]
		mov	[ebp+var_48], eax
		mov	eax, 0C42AD98Eh
		sub	eax, [ebp+var_C]
		imul	esi, 2B760000h
		shr	edi, 13h
		mov	edx, eax
		shr	edx, 0Fh
		imul	ecx, edx, 29E2EA45h
		shl	eax, 12h
		add	eax, 3FFFFh
		lea	ecx, [esi+ecx-3EAF8D2Ch]
		lea	esi, [edx+edx-3FFFFh]
		or	esi, eax
		imul	eax, [ebp+var_2C], 0E50B311Dh
		imul	esi, 0D61D15BBh
		add	eax, 310423CDh
		shr	eax, 0Ah
		imul	eax, 691576Dh
		lea	esi, [ecx+esi]
		mov	ecx, [ebp+var_2C]
		mov	[ebp+var_4C], esi
		add	eax, 1E4B4238h
		imul	edx, eax, 4B0943E9h
		imul	eax, 3C1E94CAh
		shl	ecx, 16h
		lea	ecx, [ecx+edx+5DE78B62h]
		sub	eax, 4CBAA02Fh
		imul	edx, [ebp+var_2C], 8E800000h
		sub	edx, 19000001h
		or	eax, edx
		imul	eax, 0FA00E6CBh
		lea	eax, [ecx+eax]
		mov	[ebp+var_2C], eax
		mov	ecx, [ebp+var_3C]
		imul	eax, [ebp+var_3C], 2BC74E27h
		imul	esi, [ebp+var_18], 0B2FD6F5Dh
		shl	ecx, 18h
		add	eax, 310A5ABh
		shr	eax, 8
		imul	eax, 1F630F57h
		sub	eax, 59DA6BD3h
		imul	edx, eax, 0D0C337C1h
		imul	eax, 158298CEh
		lea	edx, [ecx+edx-20A7C561h]
		imul	ecx, [ebp+var_3C], 4E000000h
		add	eax, 0BEE0BCBh
		add	ecx, 57FFFFFFh
		or	eax, ecx
		imul	eax, 0AEC0BE69h
		imul	ecx, [ebp+var_10], 0B4ABB849h
		lea	eax, [edx+eax]
		imul	edx, [ebp+var_14], 87E9A739h
		mov	[ebp+var_38], eax
		imul	eax, [ebp+var_1C], 68D558C5h
		lea	edx, [ecx+edx]
		mov	ecx, [ebp+var_10]
		add	ecx, ecx
		and	ecx, 62DC7F70h
		imul	ecx, 4B5447B7h
		add	edx, ecx
		imul	edx, 5AC8675h
		add	edx, esi
		imul	edx, 6D843F77h
		lea	ecx, [eax+edx-1B7EDEA9h]
		imul	ecx, 15C660Dh
		add	ecx, 222B2DD3h
		mov	eax, ecx
		shr	eax, 3
		imul	eax, 4D933471h
		add	eax, 2A32E58Dh
		shl	ecx, 1Dh
		lea	esi, [ecx-215E8A2h]
		imul	edx, eax, 0D4728395h
		imul	esi, 6F65CE65h
		imul	eax, 91941922h
		lea	esi, [esi+edx+7D813DB5h]
		mov	edx, 215E8A2h
		sub	edx, ecx
		sub	eax, 65B141B9h
		imul	edx, 6C988DBEh
		add	edx, 2A6C1DC3h
		or	eax, edx
		imul	eax, 972AA73Bh
		imul	edx, [ebp+var_20], 7E192000h
		lea	eax, [esi+eax]
		mov	esi, [ebp+var_20]
		mov	[ebp+var_70], eax
		imul	eax, edi, 53D3F0C9h
		shl	esi, 0Eh
		lea	ecx, [edx+eax-55BF06C0h]
		add	esi, 3FFFh
		imul	ecx, 51AB2979h
		imul	edx, [ebp+var_2C], 0E50B311Dh
		lea	eax, [edi+edi-3FFFh]
		or	eax, esi
		sub	ecx, eax
		add	edx, 23B423CDh
		lea	eax, [ecx+544EF0BFh]
		xor	edx, 0FF3h
		xor	eax, 0FF3h
		add	edx, 0D500000h
		imul	esi, [ebp+var_38], 2BC74E27h
		add	eax, 0D500000h
		xor	edx, eax
		mov	eax, edx
		xor	edx, 0D224181Ch
		xor	eax, 2DDBE7E3h
		mov	[ebp+var_90], eax
		mov	eax, esi
		add	eax, 5A94A5ABh
		xor	eax, 0D749h
		sub	eax, 57840000h
		mov	[ebp+var_20], eax
		xor	eax, edx
		xor	eax, 0FFFF28B6h
		or	eax, edx
		mov	[ebp+var_1C], eax
		imul	edi, [ebp+var_38], 578E9C4Eh
		imul	eax, [ebp+var_48], 1A9AE81h
		imul	edx, [ebp+var_2C], 7E588D21h
		mov	[ebp+var_28], esi
		imul	esi, [ebp+var_2C], 0CA16623Ah
		mov	[ebp+var_C8], edi
		lea	edx, [edx+eax+3F875F91h]
		imul	eax, [ebp+var_48], 81D6F9FAh
		add	esi, 6208479Bh
		add	eax, 5F2E6DEBh
		or	eax, esi
		imul	eax, 0F9038F2Bh
		imul	esi, [ebp+var_38], 0D438B1D9h
		add	edx, eax
		imul	eax, edx, 6FA90FAh
		imul	edx, 0FC82B783h
		sub	eax, 28582E15h
		mov	[ebp+var_34], eax
		mov	eax, edi
		add	eax, 6214B57h
		or	[ebp+var_34], eax
		imul	eax, [ebp+var_48], 40EB7CFDh
		lea	esi, [edx+esi]
		lea	edx, [ecx+1B96F0BFh]
		xor	edx, 0FF3h
		mov	[ebp+var_3C], eax
		sub	eax, 1670C90Bh
		add	edx, 46080000h
		xor	eax, 0FF3h
		add	eax, 46080000h
		mov	[ebp+var_A0], esi
		xor	eax, edx
		imul	esi, [ebp+var_58], 0FCDEE53Fh
		xor	eax, 0CE0FBB5Eh
		lea	edx, [eax+17E6C89Bh]
		add	eax, eax
		and	eax, 9C1F76BCh
		mov	[ebp+var_78], eax
		mov	eax, esi
		mov	[ebp+var_C4], edx
		add	eax, 384D39D9h
		mov	edx, 6DD873F3h
		sub	edx, [ebp+var_24]
		xor	eax, 0E6D4h
		mov	[ebp+var_44], esi
		mov	edi, [ebp+var_58]
		sub	eax, 549A0000h
		mov	esi, [ebp+var_24]
		xor	eax, edx
		xor	eax, 0FFFF192Bh
		or	eax, edx
		add	edi, 1
		imul	edi, 3211AC1h
		add	ecx, 28E4F0BFh
		xor	ecx, 0EEABh
		sub	edi, esi
		mov	[ebp+var_C], edi
		mov	esi, [ebp+var_C]
		mov	edi, eax
		not	edi
		lea	esi, [esi+edi*2]
		mov	edi, [ebp+var_24]
		add	edi, [ebp+var_44]
		mov	[ebp+var_10], esi
		lea	eax, [edi+eax*2]
		lea	eax, [eax+eax-144A7431h]
		mov	[ebp+var_18], eax
		and	eax, 794C96DCh
		add	eax, esi
		mov	esi, [ebp+var_44]
		lea	edi, [eax+eax-6B44582Ah]
		and	edi, 0BB53E330h
		sub	edi, eax
		mov	[ebp+var_14], edi
		add	esi, 2C6139D9h
		imul	edi, [ebp+var_4C], 2BFC988Dh
		xor	esi, 0E6D4h
		sub	esi, 48AE0000h
		xor	esi, 62FFA47Fh
		lea	eax, [edi+6680E13Bh]
		mov	[ebp+var_48], eax
		xor	eax, 0E6D4h
		sub	eax, 48AE0000h
		xor	esi, eax
		imul	eax, [ebp+var_70], 0FD4733E6h
		mov	[ebp+var_C], esi
		sub	esi, 17553996h
		mov	[ebp+var_DC], esi
		mov	esi, [ebp+var_C]
		sub	eax, 44565BA8h
		mov	[ebp+var_D0], eax
		mov	eax, [ebp+var_20]
		add	esi, esi
		and	esi, 0C5FF48FEh
		mov	[ebp+var_60], esi
		xor	eax, edx
		xor	eax, 0FFFF28B6h
		or	eax, edx
		mov	edx, [ebp+var_38]
		mov	esi, eax
		not	esi
		not	edx
		imul	edx, 2BC74E27h
		add	edx, 255BBC3Dh
		sub	edx, [ebp+var_24]
		lea	edx, [edx+esi*2]
		mov	esi, [ebp+var_24]
		add	esi, [ebp+var_28]
		lea	eax, [esi+eax*2]
		mov	esi, [ebp+var_4C]
		lea	eax, [eax+eax+2A706373h]
		and	eax, 7F3696Eh
		lea	eax, [edx+eax]
		mov	[ebp+var_A4], eax
		lea	eax, [eax+eax-258CA90Ah]
		and	eax, 0C5EC1C82h
		add	ecx, 38BA0000h
		mov	[ebp+var_64], eax
		mov	eax, [ebp+var_3C]
		xor	ecx, 5CBD6F4Fh
		add	esi, 1
		imul	esi, 2BFC988Dh
		sub	eax, 922C90Bh
		xor	eax, 0EEABh
		add	eax, 38BA0000h
		xor	ecx, eax
		mov	eax, [ebp+var_48]
		mov	edx, ecx
		not	edx
		xor	eax, 0F1D6h
		sub	eax, 48AE0000h
		xor	eax, 0FFFF0E29h
		xor	eax, edx
		or	eax, edx
		mov	edx, 0C304F928h
		sub	edx, esi
		mov	esi, eax
		sub	edx, ecx
		not	esi
		lea	ecx, [ecx+edi+22D3CB8Ah]
		lea	eax, [ecx+eax*2]
		mov	ecx, [ebp+arg_4]
		lea	edx, [edx+esi*2]
		lea	esi, [eax+eax-0A01D499h]
		mov	eax, [ebp+var_18]
		and	esi, 7A11EB6Eh
		mov	ecx, [ecx]
		lea	esi, [edx+esi]
		mov	[ebp+var_B4], esi
		and	eax, 0F409E368h
		add	eax, [ebp+var_10]
		mov	[ebp+var_8C], eax
		lea	edx, [eax+eax+19FE5B4Ah]
		imul	eax, ecx, 6193D4F1h
		and	edx, 36169684h
		mov	[ebp+var_58], edx
		mov	[ebp+var_1A8], ecx
		mov	esi, [ebp+arg_4]
		mov	edi, [ebp+arg_4]
		sub	eax, 35CEE9Eh
		mov	edx, eax
		and	eax, 720D657Ah
		or	edx, 720D657Ah
		mov	esi, [esi+14h]
		sub	edx, 3B3E1C08h
		mov	edi, [edi+4]
		sub	edx, eax
		mov	eax, [ebp+arg_4]
		mov	[ebp+var_1A4], esi
		mov	[ebp+var_1A0], edi
		mov	eax, [eax+8]
		mov	[ebp+var_19C], eax
		add	eax, esi
		mov	esi, [ebp+arg_4]
		mov	[ebp+var_94], eax
		imul	ecx, eax, 6193D4F1h
		lea	eax, [edx+edx+767C3810h]
		and	eax, 1BE5350Ah
		sub	eax, edx
		mov	esi, [esi+1Ch]
		imul	edx, edi, 6193D4F1h
		mov	[ebp+var_198], esi
		imul	esi, 2026C9CFh
		lea	eax, [edx+eax]
		lea	ecx, [ecx+eax+2CB87D9Ah]
		mov	edx, ecx
		and	ecx, 371462B7h
		or	edx, 371462B7h
		mov	eax, edx
		sub	eax, ecx
		sub	ecx, edx
		add	eax, eax
		add	edi, [ebp+var_1A8]
		and	eax, 91D73A90h
		lea	ecx, [eax+ecx]
		mov	eax, [ebp+arg_4]
		imul	ecx, 1F218ABFh
		mov	[ebp+var_7C], edi
		mov	edi, [ebp+arg_4]
		mov	edx, [ebp+var_7C]
		lea	ecx, [esi+ecx+518EFCEAh]
		mov	[ebp+var_28], ecx
		mov	edi, [edi+0Ch]
		mov	ecx, [eax+10h]
		mov	[ebp+var_194], edi
		add	edi, ecx
		add	edx, edi
		imul	edx, 6193D4F1h
		mov	[ebp+var_B0], edi
		imul	edi, [ebp+var_198], 0DA572139h
		add	edx, 47E19ADFh
		mov	eax, edx
		and	edx, 0C752A37Ah
		or	eax, 0C752A37Ah
		sub	eax, edx
		mov	edx, [ebp+arg_4]
		lea	esi, [eax-7143FC5Eh]
		add	eax, eax
		and	eax, 715AB90Ah
		sub	esi, eax
		mov	edx, [edx+18h]
		imul	eax, edx, 9E6C2B0Fh
		mov	[ebp+var_190], edx
		mov	edx, 34CFC6D3h
		sub	edx, eax
		sub	edx, esi
		lea	esi, [eax+esi+57F8F22Bh]
		add	esi, esi
		or	esi, 0C21F75ECh
		lea	esi, [edx+esi]
		mov	edx, [ebp+var_194]
		add	edx, [ebp+var_19C]
		mov	[ebp+var_C0], esi
		add	edx, ecx
		imul	edx, 6193D4F1h
		sub	edx, 0A16CBD9h
		mov	esi, edx
		and	edx, 7E129DA8h
		or	esi, 7E129DA8h
		sub	esi, 39D2E929h
		sub	esi, edx
		lea	edx, [esi+esi+73A5D252h]
		and	edx, 3DAC4AEh
		sub	edx, esi
		imul	edx, 0C70A4C3h
		imul	esi, [ebp+var_190], 7D759793h
		add	edx, esi
		imul	edx, 21C3CB83h
		lea	edx, [edi+edx+5AF7FEB0h]
		mov	[ebp+var_68], edx
		imul	edx, [ebp+var_7C], 6193D4F1h
		sub	edx, 5C0F3291h
		mov	esi, edx
		and	edx, 832284E9h
		or	esi, 832284E9h
		sub	esi, edx
		imul	edx, [ebp+var_194], 9E6C2B0Fh
		lea	edx, [esi+edx+2AE5145Eh]
		add	esi, esi
		and	esi, 0F9BAF62Ch
		sub	edx, esi
		xor	edx, 0CA6C65Dh
		lea	edi, [edx+5ACBE50Fh]
		add	edx, edx
		and	edx, 194D8CBAh
		sub	edx, edi
		imul	edx, 5FC33AF9h
		imul	edi, ecx, 99BB869h
		imul	esi, [ebp+var_1A4], 33EAEF5h
		add	edx, edi
		imul	edx, 9A0890ADh
		lea	edx, [esi+edx-0CEBD402h]
		mov	[ebp+var_3C], edx
		add	ecx, [ebp+var_19C]
		imul	edi, [ebp+var_1A4], 26C40E3h
		imul	ecx, 6193D4F1h
		sub	ecx, 5C0F3291h
		mov	edx, ecx
		and	ecx, 19E3D40Dh
		or	edx, 19E3D40Dh
		sub	edx, ecx
		imul	esi, edx, 0D6415CEDh
		lea	ecx, [edx+edx]
		and	ecx, 0CC3857E4h
		lea	edi, [edi+esi+2175C0D3h]
		imul	esi, ecx, 29BEA313h
		lea	esi, [edi+esi]
		imul	edi, [ebp+var_1A4], 9E6C2B0Fh
		lea	edx, [edx+edi-6BDC3AC6h]
		sub	edx, ecx
		mov	ecx, [ebp+var_1A0]
		and	edx, 0D511D785h
		imul	edx, 537D4626h
		add	ecx, [ebp+var_1A4]
		add	ecx, [ebp+var_19C]
		add	esi, edx
		imul	edx, esi, 0E08B60E5h
		imul	esi, 0C116C1CAh
		imul	ecx, 6193D4F1h
		lea	edx, [eax+edx-7CE68F33h]
		and	esi, 0AA23AF0Ah
		sub	edx, esi
		sub	ecx, 0A16CBD9h
		xor	edx, 4C5D7F46h
		mov	esi, 41F63672h
		mov	[ebp+var_18], edx
		mov	edx, ecx
		and	ecx, 57B41494h
		or	edx, 57B41494h
		sub	esi, eax
		add	edx, 4E789316h
		sub	edx, ecx
		lea	ecx, [edx+edx+630ED9D4h]
		and	ecx, 5097D6D6h
		mov	edi, ecx
		sub	edi, edx
		sub	edx, ecx
		lea	edi, [esi+edi]
		lea	esi, [eax+edx+7DAF19Dh]
		add	esi, esi
		or	esi, 0B7BD1544h
		lea	esi, [edi+esi]
		lea	edx, [esi+esi-4B5F6562h]
		and	edx, 0B7BD1544h
		sub	esi, edx
		mov	edx, [ebp+var_B0]
		add	edx, [ebp+var_1A8]
		imul	ecx, [ebp+var_198], 0BF92CB27h
		imul	esi, 0AEC0BE69h
		imul	edx, 6193D4F1h
		lea	esi, [ecx+esi-0F19A613h]
		sub	edx, 0A16CBD9h
		mov	ecx, edx
		and	edx, 9E8EA13h
		or	ecx, 9E8EA13h
		sub	ecx, edx
		lea	edx, [ecx+eax-5BE150CCh]
		add	ecx, ecx
		and	ecx, 0EC2E2BD8h
		sub	edx, ecx
		mov	ecx, [ebp+var_C0]
		mov	[ebp+var_88], esi
		xor	edx, 0A8D10D45h
		lea	eax, [ecx+ecx+244F1818h]
		and	eax, 0C21F75ECh
		sub	eax, ecx
		lea	ecx, [eax+4C8B8FEh]
		sub	eax, 73374703h
		mov	esi, ecx
		shl	ecx, 6
		sub	ecx, 1
		shl	esi, 5
		and	ecx, 0E1BBEDCCh
		shr	eax, 1Bh
		imul	esi, 0EF98F42Bh
		imul	ecx, 10670BD5h
		imul	eax, 77A34AFBh
		lea	ecx, [esi+ecx+572BB0A2h]
		add	eax, 4D1B7B7Dh
		mov	[ebp+var_20], ecx
		imul	esi, ecx, 74042A83h
		imul	ecx, eax, 0A8EB3033h
		mov	[ebp+var_24], eax
		lea	edi, [esi-1]
		lea	eax, [ecx-219A0A07h]
		sub	esi, ecx
		xor	eax, 6FB4h
		add	eax, 3A3A0000h
		xor	eax, 0FFFF904Bh
		xor	eax, edi
		or	eax, edi
		mov	ecx, eax
		not	ecx
		imul	edi, [ebp+var_20], 17F7AAFAh
		lea	ecx, [esi+ecx*2+436631EAh]
		imul	esi, [ebp+var_24], 51D66066h
		lea	esi, [esi+edi+313FEBF7h]
		lea	eax, [esi+eax*4]
		and	eax, 23A49820h
		lea	eax, [ecx+eax]
		mov	ecx, [ebp+var_94]
		add	ecx, [ebp+var_7C]
		add	ecx, [ebp+var_194]
		mov	[ebp+var_20], eax
		imul	eax, ecx, 3A7B1A00h
		imul	ecx, 6193D4F1h
		add	eax, 17BF0E63h
		sub	ecx, 6625FE69h
		shr	ecx, 17h
		imul	ecx, 61652893h
		imul	edi, eax, 0C9858659h
		imul	eax, 0D377C3EAh
		add	ecx, 2E88BDA1h
		imul	esi, ecx, 9D5C4C77h
		imul	ecx, 54FC6B36h
		sub	eax, 1D972F7Fh
		lea	esi, [edi+esi-4ACABDF0h]
		sub	ecx, 76964EF5h
		or	ecx, eax
		imul	ecx, 0F61A7FABh
		lea	ecx, [esi+ecx]
		mov	[ebp+var_10], ecx
		imul	ecx, [ebp+var_68], 51AB2979h
		add	ecx, 619EF0BFh
		shr	ecx, 15h
		mov	eax, ecx
		sub	ecx, 800h
		not	ecx
		neg	eax
		or	ecx, 0B7E470Fh
		sub	eax, 85A9B8Fh
		add	ecx, ecx
		sub	eax, ecx
		mov	ecx, [ebp+var_68]
		lea	esi, [eax+eax+27B1D538h]
		and	esi, 0E90371E0h
		imul	edi, esi, 53D3F0C9h
		sub	esi, eax
		neg	ecx
		shl	ecx, 0Bh
		lea	esi, [esi+esi-10B54719h]
		lea	edi, [ecx+edi-6D6AFACh]
		imul	ecx, [ebp+var_68], 4D687000h
		add	ecx, 10F40000h
		and	esi, ecx
		lea	eax, [esi+eax]
		mov	esi, [ebp+var_3C]
		imul	eax, 0AC2C0F37h
		lea	eax, [edi+eax]
		mov	[ebp+var_68], eax
		imul	eax, [ebp+var_3C], 2BFC988Dh
		add	eax, 1DD2E13Bh
		shr	eax, 11h
		imul	eax, 6A223C9Bh
		add	eax, 8054B40h
		shl	esi, 0Fh
		imul	ecx, eax, 4E6B329Fh
		imul	eax, 0C13A9326h
		lea	ecx, [esi+ecx+1B07B614h]
		imul	esi, [ebp+var_3C], 988D0000h
		add	eax, 78801481h
		sub	esi, 1EC40001h
		or	eax, esi
		imul	eax, 0D61D15BBh
		lea	eax, [ecx+eax]
		mov	ecx, [ebp+var_18]
		mov	[ebp+var_24], eax
		imul	eax, [ebp+var_198], 6193D4F1h
		sub	eax, [ebp+var_18]
		add	ecx, ecx
		and	ecx, 98BAFE8Ch
		lea	eax, [eax+ecx+127B27C9h]
		imul	ecx, eax, 0F8B00000h
		sub	eax, 0CE04058h
		shr	eax, 0Ch
		imul	eax, 0AAB7BC3h
		add	ecx, 2A9A8136h
		imul	edi, ecx, 33A9E23Fh
		add	eax, 3065E4B1h
		imul	esi, eax, 0AEBC5FA7h
		imul	ecx, 0E4836046h
		imul	eax, 0B1A599D6h
		lea	esi, [edi+esi-741BDE67h]
		add	ecx, 27CA6B3Bh
		sub	eax, 220FF4F5h
		or	ecx, eax
		imul	ecx, 0FA00E6CBh
		imul	eax, [ebp+var_88], 1A000000h
		lea	ecx, [esi+ecx]
		mov	[ebp+var_3C], ecx
		add	eax, 71576AE3h
		imul	ecx, [ebp+var_88], 2BC74E27h
		mov	[ebp+var_18], eax
		lea	eax, [edx+edx]
		add	ecx, 310A5ABh
		shr	ecx, 7
		imul	ecx, 1CF9C2F3h
		sub	ecx, 318B95ADh
		and	eax, 51A21A8Ah
		imul	esi, [ebp+var_18], 1CFFDB45h
		sub	eax, edx
		imul	edi, ecx, 76D087CDh
		imul	edx, [ebp+var_198], 6193D4F1h
		imul	ecx, 45004C76h
		lea	edi, [edi+esi-7E0E4E1Ah]
		imul	esi, [ebp+var_18], 0D2D8DB06h
		lea	edx, [eax+edx-56D8A68Eh]
		sub	ecx, 1C39A641h
		mov	eax, edx
		shr	edx, 5
		sub	esi, 2604B253h
		or	ecx, esi
		imul	edx, 6ACFC137h
		imul	ecx, 0AEC0BE69h
		shl	eax, 1Bh
		sub	edx, 6192CF54h
		lea	esi, [edi+ecx]
		imul	edi, eax, 68D558C5h
		imul	ecx, edx, 0D1A1A3E3h
		imul	edx, 0AA2B890Eh
		lea	ecx, [edi+ecx-6D5AD0A8h]
		add	edx, 72174A99h
		lea	edi, [eax+eax+0FFFFFFFh]
		or	edi, edx
		imul	eax, [ebp+var_68], 0C9D75509h
		imul	edx, [ebp+var_24], 0EEF3C55Dh
		imul	edi, 972AA73Bh
		lea	eax, [edx+eax+0A79DA16h]
		lea	edi, [ecx+edi]
		imul	edx, [ebp+var_68], 0A35652F2h
		imul	ecx, [ebp+var_24], 57F9311Ah
		mov	[ebp+var_44], edi
		sub	edx, 3CC21E81h
		add	ecx, 3BA5C277h
		or	edx, ecx
		imul	edx, 0A4CACBEFh
		imul	ecx, esi, 0A3D886EDh
		add	eax, edx
		imul	edx, eax, 451CF51Bh
		imul	eax, 0BAAC79E2h
		lea	ecx, [ecx+edx+6FD2216Ah]
		sub	eax, 5B8B4977h
		imul	edx, esi, 578E9C4Eh
		imul	ecx, 721712E3h
		imul	esi, 2BC74E27h
		add	edx, 6214B57h
		or	eax, edx
		mov	edx, [ebp+var_90]
		sub	ecx, eax
		add	esi, 5A94A5ABh
		imul	eax, [ebp+var_38], 5EF29997h
		mov	[ebp+var_94], esi
		add	edx, 30EC8D91h
		imul	edx, 2D40EF11h
		imul	esi, [ebp+var_44], 15C660Dh
		lea	edx, [eax+edx-310A4063h]
		imul	eax, [ebp+var_1C], 5A81DE22h
		mov	[ebp+var_18], esi
		lea	eax, [edx+eax]
		mov	edx, [ebp+var_90]
		imul	eax, 79B1E1F1h
		lea	eax, [ecx+eax+2FC88C24h]
		mov	ecx, [ebp+var_C8]
		lea	edi, [ecx+edx*2+6214B5Bh]
		mov	ecx, [ebp+var_1C]
		lea	edx, [edi+ecx*4]
		mov	edi, [ebp+var_34]
		and	edx, 5BB7CFC6h
		sub	eax, edx
		mov	ecx, eax
		and	eax, 304256A1h
		or	ecx, 304256A1h
		sub	ecx, 49E401B2h
		sub	ecx, eax
		imul	edx, [ebp+var_3C], 0E0EAF6DFh
		mov	[ebp+var_48], ecx
		mov	ecx, esi
		imul	esi, [ebp+var_10], 42BF557Fh
		sub	ecx, 160ED22Dh
		imul	eax, [ebp+var_3C], 0CA16623Ah
		lea	edx, [esi+edx+15BF320Bh]
		imul	esi, [ebp+var_10], 81D6F9FAh
		add	eax, 6208479Bh
		imul	edx, 149DC383h
		mov	[ebp+var_7C], eax
		mov	eax, ecx
		xor	eax, 2485h
		add	esi, 5F2E6DEBh
		add	eax, 383A0000h
		or	esi, [ebp+var_7C]
		xor	eax, 6E96379Bh
		sub	edx, esi
		sub	edx, 2852A1DFh
		xor	ecx, 20CEh
		xor	edx, 2485h
		add	ecx, 383A0000h
		add	edx, 383A0000h
		xor	eax, edx
		lea	edx, [eax+eax]
		add	edi, [ebp+var_A0]
		and	edx, 0DD2C6F36h
		mov	esi, edx
		sub	esi, eax
		sub	esi, edi
		mov	edi, [ebp+var_A0]
		mov	[ebp+var_88], ecx
		sub	edi, edx
		lea	eax, [edi+eax-4E5706h]
		add	eax, [ebp+var_34]
		imul	edx, [ebp+var_24], 2BFC988Dh
		imul	edi, [ebp+var_44], 0E6EA563Dh
		add	eax, eax
		or	eax, 9C2548FEh
		lea	eax, [esi+eax-2B0E8AECh]
		add	edx, 7556E13Bh
		mov	esi, [ebp+var_18]
		mov	[ebp+var_38], eax
		mov	eax, [ebp+var_94]
		xor	edx, 0F1D6h
		sub	edx, 57840000h
		xor	eax, 0F1D6h
		sub	eax, 57840000h
		xor	eax, edx
		mov	edx, [ebp+var_88]
		xor	eax, 0A825C297h
		mov	ecx, eax
		not	ecx
		xor	edx, ecx
		xor	edx, 0FFFFDF31h
		or	edx, ecx
		mov	ecx, 5A3DDFA8h
		sub	ecx, eax
		lea	eax, [esi+eax-5A3DDFA8h]
		lea	eax, [eax+edx*2]
		lea	eax, [eax+eax-72DE505h]
		and	eax, 290228D8h
		add	ecx, eax
		imul	edx, 9174A9E2h
		imul	ecx, 3745AB0Fh
		lea	edx, [edi+edx-4C714AB6h]
		lea	ecx, [edx+ecx]
		imul	edx, ecx, 2DC39B77h
		imul	ecx, 5093C7DEh
		and	ecx, 7949ADF6h
		imul	ecx, 309E6707h
		imul	eax, [ebp+var_C4], 9CA65131h
		lea	esi, [edx+ecx-6D4B4AF4h]
		imul	edx, [ebp+var_2C], 0E67C938Dh
		imul	ecx, [ebp+var_2C], 35E99DC6h
		lea	edi, [edx+eax+33735200h]
		imul	eax, [ebp+var_78], 6359AECFh
		sub	ecx, 6208479Ch
		add	edi, eax
		mov	eax, [ebp+var_78]
		sub	eax, [ebp+var_C4]
		lea	edx, [eax+eax-6C51E587h]
		and	edx, ecx
		imul	edx, 9CA65131h
		lea	edx, [edi+edx]
		imul	edx, 9E6F1249h
		lea	edx, [esi+edx]
		mov	[ebp+var_2C], edx
		mov	edi, [ebp+var_20]
		imul	eax, [ebp+var_28], 6C052ABBh
		imul	ecx, edi, 87FEAF85h
		lea	edx, [edi+edi+244F1818h]
		and	edx, 0C21F75ECh
		lea	esi, [ecx+eax-130079F4h]
		imul	eax, edx, 7801507Bh
		add	esi, eax
		mov	eax, edx
		sub	eax, edi
		lea	eax, [eax+eax+199171FBh]
		mov	[ebp+var_34], eax
		mov	ecx, [ebp+var_34]
		imul	eax, [ebp+var_28], 6423582h
		add	eax, 38998C4Ch
		and	eax, ecx
		mov	[ebp+var_1C], eax
		imul	eax, 87FEAF85h
		imul	ecx, [ebp+var_3C], 298A3F7Fh
		add	eax, esi
		imul	eax, 14E53271h
		lea	edi, [ecx+eax+265202B3h]
		imul	eax, [ebp+var_1C], 7801507Bh
		sub	eax, esi
		imul	eax, 6CABE29Ah
		imul	esi, [ebp+var_4C], 0AB0DAF3h
		add	eax, 123C397Fh
		or	eax, [ebp+var_7C]
		imul	eax, 2BAC73B5h
		lea	eax, [edi+eax]
		imul	ecx, eax, 617567CDh
		imul	eax, [ebp+var_14], 40ACDE81h
		lea	edi, [esi+eax+60E498C3h]
		mov	esi, [ebp+var_14]
		lea	eax, [esi+esi-500F8B07h]
		imul	esi, [ebp+var_4C], 0A806CEE6h
		sub	esi, 3BA5C278h
		and	eax, esi
		imul	eax, 0BF53217Fh
		lea	eax, [edi+eax]
		imul	eax, 9288BB8Fh
		lea	eax, [ecx+eax+131E272Eh]
		mov	ecx, [ebp+var_94]
		mov	[ebp+var_90], eax
		imul	eax, [ebp+var_10], 40EB7CFDh
		xor	ecx, 0EEABh
		sub	ecx, 57840000h
		sub	eax, 78E4C90Bh
		xor	eax, 0EEABh
		sub	eax, 57840000h
		xor	eax, 42FBDA61h
		xor	eax, ecx
		mov	ecx, [ebp+var_88]
		mov	esi, eax
		not	esi
		xor	ecx, esi
		xor	ecx, 0FFFFDF31h
		or	ecx, esi
		mov	esi, 68A77AFBh
		sub	esi, [ebp+var_18]
		mov	edi, ecx
		not	edi
		sub	esi, eax
		lea	esi, [esi+edi*2]
		mov	edi, [ebp+var_18]
		lea	eax, [edi+eax+419D233Bh]
		lea	eax, [eax+ecx*2]
		lea	ecx, [eax+eax-3EE3EACBh]
		and	ecx, 5FA2D9E8h
		lea	ecx, [esi+ecx]
		lea	eax, [ecx+ecx-75482B86h]
		and	eax, 0DA556D2Ah
		imul	esi, [ebp+var_70], 0A2597A23h
		sub	ecx, eax
		imul	eax, [ebp+var_DC], 87F604EFh
		imul	ecx, 0E202CCD9h
		lea	edi, [esi+eax-559D442h]
		mov	esi, [ebp+var_60]
		imul	eax, [ebp+var_60], 7809FB11h
		sub	esi, [ebp+var_C]
		add	edi, eax
		lea	eax, [esi+esi+3A00B701h]
		and	eax, [ebp+var_D0]
		imul	eax, 87F604EFh
		lea	eax, [edi+eax]
		imul	eax, 27AB1AB7h
		lea	eax, [ecx+eax+51B37376h]
		imul	ecx, [ebp+var_68], 51AB2979h
		mov	[ebp+var_60], eax
		lea	eax, [ecx+4C19F0BFh]
		xor	eax, 0FF3h
		add	eax, 15850000h
		add	ecx, 28E4F0BFh
		imul	edi, [ebp+var_28], 7849ABF3h
		xor	eax, 7AFF31FAh
		imul	esi, [ebp+var_20], 0CFB484Dh
		xor	ecx, 0E6D4h
		add	ecx, 38BA0000h
		lea	esi, [edi+esi+36500979h]
		imul	esi, 6A06CF7Bh
		imul	edi, [ebp+var_70], 0C47C24B7h
		lea	esi, [edx+esi+709D1B00h]
		sub	esi, [ebp+var_1C]
		xor	esi, 0FF3h
		add	esi, 15850000h
		xor	eax, esi
		lea	esi, [eax-1310348Fh]
		add	eax, eax
		and	eax, 0F5FE63F4h
		sub	esi, eax
		imul	eax, [ebp+var_A4], 0C46A28D3h
		imul	esi, 0EC68E905h
		lea	edi, [edi+eax-705E5E9Dh]
		imul	eax, [ebp+var_64], 3B95D72Dh
		add	edi, eax
		mov	eax, [ebp+var_64]
		sub	eax, [ebp+var_A4]
		lea	eax, [eax+eax+5FA08C87h]
		and	eax, [ebp+var_D0]
		imul	eax, 0C46A28D3h
		lea	eax, [edi+eax]
		imul	eax, 0F043FFC7h
		lea	eax, [esi+eax+7E995AAAh]
		mov	[ebp+var_A0], eax
		imul	esi, [ebp+var_28], 0FCDEE53Fh
		sub	esi, 5506C627h
		xor	esi, 0E6D4h
		add	esi, 38BA0000h
		xor	esi, 0F55BA6Ch
		xor	esi, ecx
		lea	ecx, [esi-75955A4Fh]
		add	esi, esi
		and	esi, 1EAB74D8h
		mov	eax, esi
		sub	eax, ecx
		imul	edi, [ebp+var_24], 0A806CEE6h
		lea	eax, [eax+eax-9D62977h]
		imul	esi, 0C77929B5h
		imul	edx, 7D3E8553h
		sub	edi, 3BA5C278h
		and	eax, edi
		add	eax, ecx
		imul	ecx, [ebp+var_24], 0BC548F4Fh
		imul	eax, 3886D64Bh
		lea	esi, [ecx+esi+7D817E66h]
		mov	ecx, [ebp+var_B4]
		lea	eax, [esi+eax]
		imul	eax, 59EBDFE1h
		lea	esi, [ecx+ecx+1C3790E4h]
		and	esi, 0C36B35F0h
		sub	ecx, esi
		imul	esi, ecx, 0ED06ACEBh
		imul	ecx, [ebp+var_10], 0CD7108F9h
		lea	esi, [eax+esi+53C86974h]
		imul	eax, [ebp+var_10], 7E290606h
		lea	edx, [ecx+edx+49A827E3h]
		imul	ecx, [ebp+var_3C], 20C4BE03h
		mov	[ebp+var_94], esi
		mov	esi, [ebp+var_6C]
		sub	eax, 5F2E6DECh
		and	eax, [ebp+var_34]
		add	eax, [ebp+var_20]
		imul	eax, 82C17AADh
		lea	eax, [edx+eax]
		imul	edx, eax, 0AF29FD05h
		imul	eax, 73180DB6h
		lea	edx, [ecx+edx+14728A30h]
		add	eax, 1C8821ADh
		or	eax, [ebp+var_7C]
		imul	ecx, [ebp+var_58], 48DD2FFFh
		imul	eax, 0ACB95E61h
		add	edx, eax
		imul	eax, [ebp+var_70], 0ED00F60Dh
		imul	edx, 33289931h
		lea	ecx, [eax+ecx-454C777Bh]
		mov	eax, [ebp+var_58]
		sub	eax, [ebp+var_8C]
		lea	eax, [eax+eax-5014F1CFh]
		and	eax, [ebp+var_D0]
		add	eax, [ebp+var_8C]
		imul	eax, 0B722D001h
		lea	eax, [ecx+eax]
		imul	eax, 33991h
		lea	eax, [edx+eax+2521CD8Bh]
		mov	[ebp+var_70], eax
		lea	eax, [esi+esi+459AF22Ch]
		and	eax, 923191A0h
		sub	esi, eax
		imul	edx, [ebp+var_A8], 68580CFh
		mov	eax, esi
		imul	ecx, esi, 19F7AD5Dh
		imul	edi, [ebp+var_80], 6836FC0Bh
		imul	esi, [ebp+var_30], 2D90A3C5h
		lea	ecx, [ecx+edx-0D0AB080h]
		imul	edx, [ebp+var_54], 0B23F29C1h
		mov	[ebp+var_28], edi
		lea	edx, [ecx+edx]
		imul	edx, 5F53F10Bh
		lea	edx, [edi+edx+554F39C5h]
		mov	ecx, edx
		and	edx, 0F6D89671h
		or	ecx, 0F6D89671h
		add	ecx, 339CE12Eh
		sub	ecx, edx
		lea	edx, [ecx+ecx-6739C25Ch]
		and	edx, 124ED31Ch
		sub	edx, ecx
		imul	edx, 1F218ABFh
		imul	ecx, [ebp+var_30], 89ED867Bh
		lea	edx, [esi+edx-2E7A5321h]
		mov	[ebp+var_C], edx
		mov	edx, [ebp+var_D4]
		mov	[ebp+var_64], ecx
		imul	ecx, eax, 0F063B509h
		mov	edi, [ebp+var_64]
		lea	esi, [edx+edx+0AD87A94h]
		and	esi, 9D006702h
		sub	edx, esi
		mov	[ebp+var_24], edx
		imul	edx, 0F063B509h
		lea	ecx, [ecx+edx+4846A1A5h]
		imul	edx, [ebp+var_54], 4AC19A5Dh
		lea	edx, [ecx+edx]
		imul	edx, 80D396C7h
		lea	edx, [edi+edx-23929DA8h]
		add	edx, [ebp+var_28]
		imul	edi, eax, 9745C0ABh
		mov	ecx, edx
		and	edx, 1EF04509h
		or	ecx, 1EF04509h
		add	ecx, 6DD873F4h
		sub	ecx, edx
		mov	edx, [ebp+var_5C]
		mov	[ebp+var_14], ecx
		lea	edx, [edx+edx-93A1BEAh]
		mov	[ebp+var_58], edx
		mov	ecx, [ebp+var_5C]
		and	edx, 0A12CEDCAh
		sub	ecx, edx
		mov	[ebp+var_1C], ecx
		imul	ecx, [ebp+var_30], 2E2226D7h
		imul	edx, [ebp+var_1C], 0F61A7FABh
		lea	edx, [ecx+edx-589098BEh]
		imul	ecx, [ebp+var_54], 12B5B9E7h
		lea	edi, [edi+ecx-3B419B6Dh]
		imul	ecx, [ebp+var_80], 0BA4664A7h
		sub	esi, [ebp+var_D4]
		lea	ecx, [edi+ecx]
		imul	ecx, 0B7C43D01h
		imul	edi, [ebp+var_BC], 0F16E4323h
		mov	[ebp+var_44], esi
		lea	ecx, [edx+ecx]
		imul	edx, [ebp+var_A8], 8A1C67E5h
		mov	[ebp+var_10], ecx
		mov	ecx, edi
		sub	ecx, [ebp+var_24]
		mov	[ebp+var_18], edi
		imul	edi, [ebp+var_30], 0B1F2E693h
		lea	edx, [ecx+edx-2D635BB1h]
		mov	ecx, edx
		or	edx, 3C811096h
		and	ecx, 3C811096h
		sub	ecx, edx
		mov	edx, [ebp+var_1C]
		sub	edx, ecx
		imul	ecx, -2
		and	ecx, 86FDDED2h
		sub	edx, ecx
		imul	ecx, edx, 3E0AB2D1h
		add	edx, 0F785859h
		and	edx, 8B96DD55h
		imul	edx, 83EA9A5Eh
		lea	edx, [ecx+edx+6789CF0Eh]
		imul	ecx, edx, 6B2E5387h
		imul	edx, 0D319CC62h
		lea	ecx, [edi+ecx-35E2114Ah]
		mov	edi, [ebp+var_18]
		and	edx, 172DBAAAh
		imul	edx, 53D3F0C9h
		lea	edx, [ecx+edx]
		imul	ecx, [ebp+var_A8], 75E3981Bh
		mov	[ebp+var_20], edx
		lea	edx, [eax+ecx-8272CBEh]
		xor	edx, 14733974h
		sub	esi, edx
		add	edx, edx
		and	edx, 28E672E8h
		lea	edi, [esi+edi-35E403C9h]
		mov	esi, [ebp+var_44]
		add	edi, edx
		mov	edx, edi
		and	edi, 27E5A3D5h
		or	edx, 27E5A3D5h
		sub	edx, edi
		mov	edi, [ebp+var_1C]
		lea	edi, [edx+edi]
		add	edx, edx
		and	edx, 0B034B854h
		sub	edi, edx
		imul	edi, 0D61D15BBh
		imul	edx, [ebp+var_54], 0B86783B5h
		sub	edi, 3521712Eh
		mov	[ebp+var_3C], edi
		mov	edi, [ebp+var_24]
		mov	[ebp+var_4C], edx
		lea	edx, [edx+ecx+35670E12h]
		sub	esi, edx
		lea	edx, [edx+edi+6E0F00Eh]
		add	edx, edx
		or	edx, 0D3C03E14h
		lea	edx, [esi+edx-132C5B53h]
		imul	esi, [ebp+var_80], 97C903F5h
		mov	[ebp+var_50], edx
		lea	edx, [edx+edx+44D69876h]
		and	edx, 0D3C03E14h
		mov	edi, edx
		mov	[ebp+var_34], esi
		mov	esi, [ebp+var_28]
		sub	edi, [ebp+var_50]
		lea	esi, [edi+esi+6AB69421h]
		mov	edi, [ebp+var_50]
		mov	[ebp+var_28], esi
		mov	esi, [ebp+var_34]
		lea	edi, [esi+edi+112DCD1Ah]
		sub	edi, edx
		mov	esi, edi
		add	esi, esi
		or	esi, 31CF0558h
		add	esi, [ebp+var_28]
		mov	[ebp+var_28], esi
		mov	edx, [ebp+var_4C]
		imul	esi, [ebp+var_BC], 0E91BCDDh
		mov	edi, [ebp+var_24]
		lea	eax, [eax+edx-37B0C221h]
		xor	eax, 6AA8DA54h
		lea	edx, [eax+eax]
		and	edx, 0D551B4A8h
		lea	eax, [esi+eax]
		mov	esi, [ebp+var_1C]
		sub	eax, edx
		lea	edx, [eax+5B3189CBh]
		mov	eax, 0F885A740h
		sub	eax, [ebp+var_1C]
		sub	eax, edx
		lea	edx, [edx+esi-570AECFEh]
		mov	esi, [ebp+var_18]
		add	edx, edx
		or	edx, 20B83BF8h
		lea	edx, [eax+edx]
		mov	[ebp+var_1C], edx
		lea	edx, [ecx+edi-2020FDD9h]
		mov	ecx, [ebp+var_34]
		xor	edx, 0B327302h
		mov	edi, [ebp+var_14]
		lea	eax, [edx+ecx-6FEB2B29h]
		add	edx, edx
		and	edx, 1664E604h
		sub	eax, edx
		xor	eax, 0DF442F63h
		lea	edx, [eax-699E6BB7h]
		add	eax, eax
		and	eax, 0BE885EC6h
		mov	ecx, eax
		sub	ecx, edx
		lea	ecx, [ecx+esi+17942DBCh]
		imul	esi, [ebp+var_BC], 0E91BCDDh
		lea	edx, [edx+esi+1666F4A3h]
		sub	edx, eax
		add	edx, edx
		or	edx, 59DE8C16h
		lea	edx, [ecx+edx]
		mov	[ebp+var_34], edx
		lea	edx, [edi+edi+244F1818h]
		and	edx, 0C21F75ECh
		sub	edx, edi
		lea	eax, [edx+0CC8B8FEh]
		sub	edx, 73374703h
		mov	esi, eax
		shl	eax, 5
		sub	eax, 1
		shl	esi, 4
		and	eax, 0CA24DA62h
		imul	esi, 1FBF9DC3h
		imul	eax, 0E040623Dh
		shr	edx, 1Ch
		lea	ecx, [edx-10h]
		add	edx, 18CC08D3h
		lea	edi, [esi+eax+308F3953h]
		lea	eax, [ecx+ecx+1]
		or	eax, 319811C7h
		mov	esi, eax
		sub	edx, eax
		sub	esi, ecx
		mov	ecx, esi
		imul	esi, edi, 188BC515h
		sub	ecx, 681FF32Ah
		imul	edi, 0E7743AEBh
		or	edx, esi
		sub	esi, ecx
		add	edi, ecx
		mov	ecx, [ebp+var_10]
		lea	eax, [edi+edx*2]
		neg	edx
		lea	edx, [esi+edx*2+3B5668D1h]
		imul	esi, [ebp+var_10], 40EB7CFDh
		lea	eax, [eax+eax-61582B71h]
		and	eax, 0C65C41B6h
		add	eax, edx
		add	esi, 2F9736F5h
		shr	esi, 18h
		imul	esi, 65D568ABh
		shl	ecx, 8
		add	esi, 522DB473h
		imul	edx, esi, 10D2BAFFh
		imul	esi, 35D6A406h
		lea	edi, [ecx+edx+5908CCC5h]
		add	esi, 2432174Fh
		imul	edx, [ebp+var_10], 0D6F9FA00h
		add	edx, 2E6DEBFFh
		or	esi, edx
		mov	edx, [ebp+var_18]
		imul	esi, 0F61A7FABh
		sub	edx, [ebp+var_28]
		lea	esi, [edi+esi]
		mov	edi, [ebp+var_28]
		mov	[ebp+var_10], esi
		imul	esi, [ebp+var_20], 51AB2979h
		lea	ecx, [edi+edi-2997C7CEh]
		mov	edi, [ebp+var_20]
		and	ecx, 31CF0558h
		add	esi, 619EF0BFh
		shr	esi, 13h
		imul	esi, 4D26BF83h
		lea	ecx, [edx+ecx+2E6007B1h]
		shl	edi, 0Dh
		add	esi, 28C14739h
		imul	edx, esi, 9EE2B0C3h
		imul	esi, 596B8E56h
		lea	edi, [edi+edx+127D68D5h]
		imul	edx, [ebp+var_20], 0CA5E4000h
		sub	esi, 7C42CB25h
		sub	edx, 43D00001h
		or	esi, edx
		imul	edx, [ebp+var_3C], 2BFC988Dh
		imul	esi, 0AC2C0F37h
		add	edx, 1DD2E13Bh
		shr	edx, 0Fh
		imul	edx, 42193FA3h
		lea	esi, [edi+esi]
		mov	edi, [ebp+var_3C]
		mov	[ebp+var_20], esi
		sub	edx, 772DD4C6h
		imul	esi, edx, 4877ACF7h
		shl	edi, 11h
		imul	edx, 7181D816h
		lea	esi, [edi+esi+6755C5DEh]
		imul	edi, [ebp+var_3C], 62340000h
		sub	edx, 78C6A6FBh
		sub	edi, 7B100001h
		or	edx, edi
		imul	edx, 0D61D15BBh
		lea	edx, [esi+edx]
		mov	[ebp+var_8C], edx
		mov	edx, ecx
		shr	edx, 0Ah
		imul	edi, ecx, 4D400000h
		shl	ecx, 17h
		imul	esi, edx, 5FF1935h
		add	ecx, 7FFFFFh
		lea	edx, [edx+edx-7FFFFFh]
		or	edx, ecx
		mov	ecx, [ebp+var_1C]
		imul	edx, 0FA00E6CBh
		lea	esi, [edi+esi-3D8C87A6h]
		lea	edx, [esi+edx]
		mov	[ebp+var_88], edx
		lea	edx, [ecx+ecx-63ADB07Ch]
		mov	ecx, [ebp+var_64]
		sub	ecx, [ebp+var_1C]
		and	edx, 20B83BF8h
		imul	esi, [ebp+var_30], 89ED867Bh
		lea	ecx, [ecx+edx-145C7DA4h]
		sub	edx, [ebp+var_1C]
		imul	ecx, 15000000h
		lea	edx, [edx+esi-145C7DA4h]
		shr	edx, 8
		imul	edx, 4559C09Bh
		sub	ecx, 23FDAF3Ah
		imul	edi, ecx, 0AF7337FBh
		imul	ecx, 572027Ah
		sub	edx, 74C3CEC4h
		imul	esi, edx, 80ED7CB5h
		imul	edx, 0AFC04B26h
		add	ecx, 4E17F5A3h
		lea	edi, [edi+esi-40BC0002h]
		mov	esi, [ebp+var_34]
		sub	edx, 405BE2E7h
		or	edx, ecx
		imul	edx, 0AEC0BE69h
		lea	ecx, [esi+esi+4A2B2F2Ch]
		and	ecx, 59DE8C16h
		lea	edx, [edi+edx]
		mov	[ebp+var_24], edx
		mov	edx, [ebp+var_58]
		or	edx, 0A12CEDCAh
		sub	edx, [ebp+var_5C]
		add	edx, [ebp+var_34]
		sub	ecx, edx
		mov	edx, 8ED1F38h
		lea	esi, [ecx-60B74B2h]
		mov	ecx, esi
		shl	esi, 1Dh
		shr	ecx, 3
		sub	edx, esi
		imul	edi, ecx, 68D558C5h
		imul	esi, edx, 7522DF0Bh
		imul	edx, 152F6B1Eh
		lea	ecx, [ecx+ecx-3FFFFFFFh]
		lea	esi, [edi+esi-1231438Ch]
		sub	edx, 3B1E1091h
		or	edx, ecx
		imul	edx, 972AA73Bh
		lea	edx, [esi+edx]
		mov	[ebp+var_58], edx
		imul	edx, [ebp+var_88], 0E50B311Dh
		imul	ecx, [ebp+var_20], 51AB2979h
		add	edx, 23B423CDh
		lea	esi, [ecx+544EF0BFh]
		mov	edi, edx
		xor	esi, 0FF3h
		xor	edi, 0FF3h
		add	edi, 0D500000h
		add	esi, 0D500000h
		xor	esi, edi
		add	ecx, 1B96F0BFh
		xor	esi, 0FD749066h
		xor	ecx, 0FF3h
		lea	edi, [esi+6615DAEDh]
		add	esi, esi
		and	esi, 0FAE920CCh
		mov	[ebp+var_78], esi
		imul	esi, [ebp+var_10], 81D6F9FAh
		mov	[ebp+var_D8], edi
		imul	edi, [ebp+var_10], 0E5DA850Fh
		add	esi, 5F2E6DEBh
		mov	[ebp+var_30], esi
		imul	esi, [ebp+var_88], 0CA16623Ah
		mov	[ebp+var_140], esi
		imul	esi, [ebp+var_88], 6DA9C06Fh
		lea	esi, [edi+esi+1CEE546Bh]
		mov	edi, [ebp+var_140]
		add	edi, 6208479Bh
		or	edi, [ebp+var_30]
		imul	edi, 0DE7F5205h
		add	esi, edi
		imul	edi, [ebp+var_24], 578E9C4Eh
		mov	[ebp+var_18], edi
		imul	edi, esi, 0CCF6AA66h
		imul	esi, 9984AACDh
		sub	edi, 6C9FFB1Dh
		mov	[ebp+var_64], edi
		mov	edi, [ebp+var_18]
		add	edi, 6214B57h
		or	[ebp+var_64], edi
		imul	edi, [ebp+var_24], 0D438B1D9h
		add	ecx, 46080000h
		mov	[ebp+var_14], ecx
		xor	edx, 4BF8h
		imul	ecx, [ebp+var_10], 40EB7CFDh
		add	edx, 0D500000h
		lea	edi, [esi+edi]
		imul	esi, [ebp+var_C], 1609A287h
		sub	ecx, 1670C90Bh
		xor	ecx, 0FF3h
		add	ecx, 46080000h
		xor	[ebp+var_14], ecx
		xor	[ebp+var_14], 0FAB895EAh
		mov	ecx, [ebp+var_14]
		mov	[ebp+var_F8], edi
		not	ecx
		xor	edx, ecx
		xor	edx, 0FFFFB407h
		or	edx, ecx
		imul	ecx, eax, 0EF3408B9h
		mov	[ebp+var_1C], edx
		lea	edx, [eax+eax+244F1818h]
		and	edx, 0C21F75ECh
		lea	esi, [esi+ecx-665067C8h]
		imul	ecx, edx, 10CBF747h
		sub	edx, eax
		lea	edx, [edx+edx+199171FBh]
		add	esi, ecx
		imul	ecx, [ebp+var_C], 6423582h
		add	ecx, 38998C4Ch
		and	edx, ecx
		imul	edx, 0EF3408B9h
		imul	ecx, [ebp+var_C], 23560C19h
		lea	edx, [esi+edx]
		mov	esi, 6DD873F3h
		mov	[ebp+var_F4], edx
		sub	esi, eax
		imul	edx, [ebp+var_8C], 57F9311Ah
		add	edx, 3BA5C277h
		mov	[ebp+var_F0], edx
		imul	edx, [ebp+var_8C], 6BCB03FBh
		lea	ecx, [ecx+edx+6A2757DDh]
		imul	edx, [ebp+var_C], 0F9BDCA7Eh
		sub	edx, 38998C4Dh
		or	edx, [ebp+var_F0]
		imul	edx, 0AA0E7F59h
		lea	edx, [ecx+edx]
		mov	[ebp+var_DC], edx
		imul	ecx, [ebp+var_24], 2BC74E27h
		lea	edx, [ecx+5A94A5ABh]
		xor	edx, 0D749h
		sub	edx, 57840000h
		add	ecx, 2BC74E27h
		xor	edx, esi
		neg	ecx
		xor	edx, 0FFFF28B6h
		sub	ecx, eax
		or	edx, esi
		mov	edi, edx
		not	edi
		lea	edi, [ecx+edi*2+30A2D802h]
		mov	ecx, [ebp+var_18]
		lea	edx, [eax+edx*2]
		mov	[ebp+var_28], edi
		lea	edi, [ecx+edx*2+2A706373h]
		mov	ecx, [ebp+var_28]
		imul	edx, [ebp+var_58], 0FD4733E6h
		and	edi, 0AF7D2486h
		add	ecx, edi
		lea	edi, [ecx+ecx+1C5B6454h]
		sub	edx, 44565BA8h
		and	edi, 6D62516Ah
		mov	[ebp+var_13C], edx
		mov	edx, edi
		sub	edx, ecx
		mov	[ebp+var_7C], edi
		lea	edi, [edx+edx+76424A41h]
		imul	edx, [ebp+var_8C], 2BFC988Dh
		and	edi, [ebp+var_13C]
		add	edx, 6680E13Bh
		add	edi, ecx
		mov	ecx, [ebp+var_C]
		xor	edx, 1488h
		sub	edx, 48AE0000h
		xor	edx, 61B59AF8h
		mov	[ebp+var_18], edx
		mov	[ebp+var_144], edi
		imul	edx, [ebp+var_20], 6DC596A3h
		imul	edi, [ebp+var_10], 0D054D0Fh
		lea	edx, [edi+edx-6D2C5F86h]
		imul	edi, [ebp+var_20], 0A35652F2h
		imul	edx, 4396AD33h
		sub	edi, 3CC21E81h
		or	edi, [ebp+var_30]
		sub	edx, edi
		imul	edi, [ebp+var_C], 0FCDEE53Fh
		sub	edx, 5F33429Ah
		xor	edx, 1488h
		sub	edx, 48AE0000h
		xor	[ebp+var_18], edx
		lea	edx, [edi+384D39D9h]
		xor	edx, 0E6D4h
		sub	edx, 549A0000h
		add	ecx, 1
		imul	ecx, 3211AC1h
		xor	edx, esi
		xor	edx, 0FFFF192Bh
		or	edx, esi
		mov	esi, edx
		sub	ecx, 754DFA7Fh
		not	esi
		sub	ecx, eax
		add	eax, edi
		mov	edi, [ebp+var_48]
		lea	eax, [eax+edx*2]
		lea	eax, [eax+eax-144A7431h]
		lea	ecx, [ecx+esi*2]
		and	eax, 1AA09F7Ch
		lea	eax, [ecx+eax]
		imul	edx, [ebp+var_90], 0B6B46C22h
		mov	[ebp+var_B4], eax
		lea	eax, [eax+eax-21FC6BCCh]
		and	eax, 0D8BFEA90h
		mov	[ebp+var_D4], eax
		lea	edi, [edi+edi-6C37FC9Ch]
		imul	eax, [ebp+var_90], 0A4A5C9EFh
		add	edx, 455DB9EAh
		or	edx, 0D076EE22h
		mov	[ebp+var_20], edi
		and	edi, 9F7B52BCh
		mov	[ebp+var_138], edi
		lea	ecx, [eax+edx+33CC4EB3h]
		imul	edx, [ebp+var_A0], 79978433h
		mov	[ebp+var_D0], edx
		lea	edx, [ecx+ecx-7D6D4572h]
		and	edx, 0D076EE22h
		sub	ecx, edx
		imul	edx, [ebp+var_60], 0D9570C97h
		sub	edx, ecx
		mov	ecx, [ebp+var_D0]
		lea	esi, [ecx+edx-37A02252h]
		mov	edx, [ebp+var_48]
		mov	ecx, esi
		or	esi, 0E95F2233h
		and	ecx, 0E95F2233h
		sub	edx, edi
		mov	[ebp+var_C], edx
		lea	edx, [ecx+edx]
		imul	edi, [ebp+var_2C], 0A2FE5889h
		sub	edx, esi
		sub	esi, ecx
		add	esi, esi
		or	esi, 2D41BB98h
		lea	esi, [edx+esi]
		mov	[ebp+var_134], edi
		imul	esi, 0E0DE7541h
		imul	edx, [ebp+var_94], 0F257643Dh
		lea	esi, [edi+esi+31AD5BBEh]
		mov	[ebp+var_10], edx
		imul	edx, [ebp+var_60], 0D9570C97h
		mov	[ebp+var_A4], esi
		mov	esi, [ebp+var_10]
		lea	edx, [eax+edx]
		lea	ecx, [esi+edx-71C85167h]
		mov	esi, [ebp+var_38]
		mov	[ebp+var_C4], edx
		mov	edx, ecx
		or	edx, 0CD25FE17h
		add	edx, 4CD0B10Fh
		and	ecx, 0CD25FE17h
		imul	edi, [ebp+var_70], 0FD98D771h
		sub	edx, ecx
		lea	ecx, [edx+edi+0B6E0691h]
		lea	edx, [edx+edx+665E9DE2h]
		and	edx, 65B403D0h
		sub	ecx, edx
		mov	edx, [ebp+var_38]
		mov	[ebp+var_BC], edi
		lea	edx, [edx+edx-456B851Ah]
		mov	[ebp+var_30], edx
		and	edx, 9C2548FEh
		sub	esi, edx
		mov	edi, edx
		sub	edi, [ebp+var_38]
		mov	[ebp+var_6C], esi
		lea	esi, [esi+ecx+0D44D641h]
		add	esi, esi
		mov	[ebp+var_68], edi
		or	esi, 0C21F75ECh
		sub	edi, ecx
		lea	ecx, [edi+esi+7F83E2BDh]
		mov	[ebp+var_54], ecx
		mov	ecx, [ebp+var_C4]
		imul	edi, [ebp+var_A0], 79978433h
		add	ecx, 0F89E52Ch
		mov	[ebp+var_28], ecx
		mov	esi, [ebp+var_28]
		or	ecx, 0AF9A7F1Bh
		and	esi, 0AF9A7F1Bh
		sub	ecx, esi
		lea	esi, [ecx+ecx]
		sub	edi, ecx
		and	esi, 0A0CB01C8h
		lea	ecx, [edi+esi]
		mov	esi, [ebp+var_10]
		mov	edi, [ebp+var_D0]
		lea	ecx, [esi+ecx-3CB6723Eh]
		mov	esi, ecx
		and	ecx, 0C900474Dh
		or	esi, 0C900474Dh
		sub	esi, 1C55B0FCh
		sub	esi, ecx
		mov	ecx, [ebp+var_10]
		mov	[ebp+var_5C], esi
		imul	esi, [ebp+var_60], 5B79F709h
		lea	edi, [ecx+edi+13AF0EA6h]
		mov	ecx, edi
		or	ecx, 0DF078B09h
		add	ecx, 4B38A8DEh
		mov	[ebp+var_34], ecx
		mov	ecx, edi
		and	ecx, 0DF078B09h
		sub	[ebp+var_34], ecx
		imul	ecx, [ebp+var_70], 267288Fh
		mov	[ebp+var_A8], edi
		mov	[ebp+var_3C], ecx
		imul	ecx, [ebp+var_94], 0E20C2BA3h
		lea	esi, [esi+ecx-5DD101C7h]
		imul	ecx, [ebp+var_90], 0E0D0B2B1h
		lea	ecx, [esi+ecx]
		mov	esi, [ebp+var_3C]
		imul	ecx, 5E5B2E9Fh
		lea	ecx, [esi+ecx-72361ED5h]
		mov	esi, ecx
		or	esi, 13C58308h
		and	ecx, 13C58308h
		mov	edi, ecx
		sub	edi, esi
		sub	esi, ecx
		mov	ecx, [ebp+var_C]
		add	esi, esi
		and	esi, 0D874F9EEh
		imul	edi, 29E2EA45h
		sub	ecx, esi
		imul	esi, ecx, 0D61D15BBh
		lea	esi, [edi+esi+7B3542F1h]
		mov	[ebp+var_4C], esi
		mov	ecx, [ebp+var_3C]
		mov	esi, [ebp+var_D0]
		lea	edi, [ecx+esi+0DB49B32h]
		mov	ecx, 865E693Ch
		mov	esi, edi
		and	edi, 5FFFEBB3h
		or	esi, 5FFFEBB3h
		mov	[ebp+var_44], esi
		mov	esi, [ebp+var_20]
		sub	ecx, [ebp+var_48]
		or	esi, 9F7B52BCh
		add	ecx, esi
		mov	esi, [ebp+var_44]
		add	ecx, [ebp+var_44]
		sub	esi, edi
		sub	ecx, edi
		add	esi, esi
		and	esi, 40002898h
		sub	ecx, esi
		mov	esi, [ebp+var_38]
		xor	ecx, 0FAF11887h
		sub	esi, 1E5A81BCh
		sub	esi, edx
		sub	esi, ecx
		add	ecx, ecx
		or	ecx, 0F5E2310Eh
		lea	edx, [esi+ecx-3139B4D9h]
		imul	ecx, [ebp+var_2C], 74AD2E3h
		xor	edx, 0B15F0D59h
		imul	esi, [ebp+var_A0], 86687BCDh
		lea	edi, [edx+276229EEh]
		mov	[ebp+var_E0], edi
		mov	edi, [ebp+var_C]
		mov	[ebp+var_130], ecx
		imul	ecx, [ebp+var_60], 26A8F369h
		mov	[ebp+var_12C], esi
		add	ecx, esi
		mov	[ebp+var_128], ecx
		mov	esi, ecx
		mov	ecx, 77621804h
		sub	ecx, [ebp+var_C]
		add	esi, 690A884Eh
		sub	ecx, esi
		lea	esi, [esi+edi-414D8F45h]
		add	esi, esi
		or	esi, 21167624h
		add	ecx, esi
		imul	esi, [ebp+var_2C], 61E89CF1h
		mov	[ebp+var_124], esi
		mov	esi, [ebp+var_68]
		mov	edi, [ebp+var_124]
		lea	esi, [ecx+esi]
		lea	ecx, [ecx+ecx+72C0785Eh]
		or	ecx, 21167624h
		sub	esi, ecx
		mov	ecx, [ebp+var_10]
		imul	esi, 513F4197h
		lea	eax, [ecx+eax+315441CCh]
		mov	[ebp+var_80], eax
		mov	ecx, [ebp+var_80]
		lea	esi, [edi+esi+5EFA1045h]
		mov	[ebp+var_C8], esi
		or	eax, 0FBCE7BA0h
		imul	esi, [ebp+var_2C], 0A54CA2D3h
		imul	edi, [ebp+var_6C], 0F3B41D79h
		and	ecx, 0FBCE7BA0h
		sub	eax, ecx
		mov	[ebp+var_120], esi
		imul	esi, eax, 0EF8FCC1Fh
		add	eax, eax
		imul	ecx, [ebp+var_70], 584F22AFh
		and	eax, 86308BEh
		imul	eax, 107033E1h
		lea	ecx, [esi+ecx]
		add	ecx, eax
		mov	eax, [ebp+var_54]
		imul	ecx, 9DF76367h
		add	ecx, edi
		mov	edi, [ebp+var_120]
		imul	ecx, 0B41CA153h
		lea	ecx, [edi+ecx+434D8484h]
		lea	edi, [eax+eax+244F1818h]
		and	edi, 0C21F75ECh
		mov	[ebp+var_B0], ecx
		mov	ecx, edi
		sub	ecx, eax
		add	eax, 3374702h
		lea	esi, [ecx-73374703h]
		add	ecx, 4C8B8FDh
		sub	eax, edi
		shl	ecx, 5
		neg	ecx
		shl	eax, 6
		sub	ecx, 5D4F246Dh
		shr	esi, 1Bh
		or	eax, 0FB001FB8h
		sub	ecx, eax
		mov	eax, esi
		not	esi
		neg	eax
		add	esi, 20h
		add	eax, 5476071h
		or	esi, 85331EE6h
		add	esi, esi
		sub	eax, esi
		lea	esi, [eax+ecx-25450D44h]
		neg	eax
		neg	ecx
		lea	ecx, [ecx+ecx+4A6197AFh]
		lea	eax, [eax+eax+2882D9h]
		or	eax, ecx
		lea	eax, [esi+eax]
		xor	eax, 99BCABCCh
		mov	[ebp+var_C0], eax
		add	eax, 6DD873F4h
		mov	[ebp+var_20], eax
		mov	esi, [ebp+var_34]
		imul	ecx, [ebp+var_2C], 7ABCA5AFh
		imul	eax, [ebp+var_70], 0B5B8907h
		mov	[ebp+var_11C], ecx
		mov	edi, [ebp+var_11C]
		imul	ecx, [ebp+var_68], 9092409h
		lea	ecx, [ecx+eax+0CF78C92h]
		lea	eax, [esi+esi+698EAE44h]
		and	eax, 41F0E9ECh
		sub	eax, esi
		imul	eax, 9092409h
		lea	eax, [ecx+eax]
		imul	eax, 5FDF16C1h
		lea	ecx, [edi+eax-47C5E24Bh]
		mov	edi, [ebp+var_5C]
		mov	eax, [ebp+var_5C]
		imul	ecx, 51AB2979h
		sub	eax, [ebp+var_C]
		lea	esi, [edi+edi+38AB61F8h]
		or	esi, 6DFF7164h
		add	eax, 39B3BE9Dh
		sub	eax, esi
		add	ecx, 619EF0BFh
		mov	esi, eax
		shr	esi, 17h
		mov	[ebp+var_50], esi
		imul	edi, eax, 0CB00AA00h
		imul	esi, 9E58055h
		shl	eax, 0Ah
		add	eax, 3FFh
		lea	edi, [edi+esi-38BE3FAEh]
		mov	[ebp+var_34], edi
		mov	edi, [ebp+var_50]
		lea	esi, [edi+edi-3FFh]
		or	esi, eax
		mov	eax, ecx
		imul	esi, 0F61A7FABh
		add	esi, [ebp+var_34]
		shr	eax, 15h
		imul	edi, ecx, 9F864800h
		add	edx, edx
		shl	ecx, 0Ch
		and	edx, 62BE1AB2h
		mov	[ebp+var_54], esi
		add	ecx, 0FFFh
		imul	esi, eax, 53D3F0C9h
		lea	eax, [eax+eax-0FFFh]
		or	eax, ecx
		imul	eax, 0AC2C0F37h
		lea	esi, [edi+esi-55BF06C0h]
		sub	edx, [ebp+var_E0]
		lea	eax, [esi+eax]
		mov	esi, [ebp+var_4C]
		mov	[ebp+var_68], eax
		imul	edx, 5FF1935h
		imul	eax, [ebp+var_4C], 2BFC988Dh
		shl	esi, 0Fh
		add	eax, 1DD2E13Bh
		shr	eax, 11h
		imul	eax, 632C63C5h
		sub	eax, 1875CFFh
		imul	ecx, eax, 75285481h
		imul	eax, 0A6BE461Ah
		lea	ecx, [esi+ecx+55557B53h]
		imul	esi, [ebp+var_4C], 988D0000h
		sub	eax, 7591D419h
		sub	esi, 1EC40001h
		or	eax, esi
		imul	eax, 0D61D15BBh
		lea	eax, [ecx+eax]
		mov	[ebp+var_34], eax
		mov	eax, [ebp+var_130]
		lea	edx, [eax+edx+5C0BCE93h]
		imul	edx, 0E50B311Dh
		add	edx, 310423CDh
		mov	eax, edx
		shr	edx, 0Ch
		imul	edx, 632F1A17h
		shl	eax, 14h
		imul	esi, eax, 5FF1935h
		lea	eax, [eax+eax+1FFFFFh]
		add	edx, 478F1364h
		imul	ecx, edx, 0E8BE9293h
		imul	edx, 45EB7B4Eh
		lea	ecx, [esi+ecx+0E044DEEh]
		sub	edx, 4CD4F477h
		or	edx, eax
		imul	edx, 0FA00E6CBh
		imul	eax, [ebp+var_C8], 52000000h
		lea	edx, [ecx+edx]
		mov	[ebp+var_4C], edx
		sub	eax, 3B2F5E91h
		imul	edx, [ebp+var_C8], 2BC74E27h
		imul	esi, eax, 46258999h
		imul	eax, 9127289Eh
		add	edx, 310A5ABh
		shr	edx, 7
		imul	edx, 41CE7A8Fh
		add	eax, 271A057Dh
		sub	edx, 209A26AAh
		imul	ecx, edx, 9B5D6C79h
		imul	edx, 8EAEC8DEh
		lea	esi, [esi+ecx-0B684871h]
		add	edx, 436E576Dh
		or	edx, eax
		imul	eax, [ebp+var_B0], 15C660Dh
		imul	edx, 0AEC0BE69h
		add	eax, 222B2DD3h
		shr	eax, 5
		imul	eax, 52206F9Fh
		lea	ecx, [esi+edx]
		mov	esi, [ebp+var_B0]
		sub	eax, 15C4AA91h
		imul	edx, eax, 2BB18D1Bh
		shl	esi, 1Bh
		imul	eax, 8DE1D8BEh
		lea	edx, [esi+edx+7A91B627h]
		imul	esi, [ebp+var_B0], 0D0000000h
		sub	eax, 31AE1061h
		add	esi, 3FFFFFFFh
		or	eax, esi
		imul	eax, 972AA73Bh
		lea	eax, [edx+eax]
		mov	[ebp+var_5C], eax
		imul	edx, [ebp+var_34], 57F9311Ah
		imul	eax, [ebp+var_68], 0A35652F2h
		mov	[ebp+var_118], edx
		sub	eax, 3CC21E81h
		add	edx, 3BA5C277h
		imul	esi, ecx, 2BC74E27h
		mov	[ebp+var_C8], eax
		mov	[ebp+var_B0], edx
		mov	[ebp+var_114], esi
		imul	eax, [ebp+var_68], 2D9DFBBDh
		imul	edx, [ebp+var_34], 92709AA1h
		lea	edx, [edx+eax-3CD32A83h]
		mov	eax, [ebp+var_B0]
		imul	edx, 6265826Dh
		or	eax, [ebp+var_C8]
		sub	edx, eax
		mov	eax, esi
		sub	edx, 1BDB8E3Fh
		add	eax, 5A94A5ABh
		xor	edx, 0EF05h
		xor	eax, 0EF05h
		sub	eax, 57840000h
		sub	edx, 57840000h
		xor	edx, eax
		xor	edx, 8DD5B089h
		lea	eax, [edx+5687FFA8h]
		add	edx, edx
		and	edx, 1BAB6112h
		imul	esi, [ebp+var_24], 0A10D6669h
		sub	edx, eax
		imul	eax, [ebp+var_D8], 0D2BF10EFh
		imul	edx, 6F67048Bh
		lea	edi, [esi+eax+4D392728h]
		imul	eax, [ebp+var_78], 2D40EF11h
		imul	esi, [ebp+var_24], 0A87163B2h
		add	edi, eax
		mov	eax, [ebp+var_78]
		sub	eax, [ebp+var_D8]
		sub	esi, 6214B58h
		lea	eax, [eax+eax-2EBD6AF3h]
		and	eax, esi
		imul	eax, 0D2BF10EFh
		lea	eax, [edi+eax]
		imul	eax, 421471DBh
		imul	edi, [ebp+var_4C], 0CA16623Ah
		lea	eax, [edx+eax-5A2B0517h]
		mov	[ebp+var_70], eax
		imul	eax, [ebp+var_5C], 15C660Dh
		mov	[ebp+var_E0], edi
		add	edi, 6208479Bh
		mov	[ebp+var_D8], edi
		sub	eax, 160ED22Dh
		mov	edx, eax
		xor	edx, 565Eh
		mov	[ebp+var_10C], eax
		add	edx, 383A0000h
		imul	esi, [ebp+var_4C], 5F01FF41h
		xor	edx, 0B1A1553Bh
		imul	eax, [ebp+var_54], 504A8CA1h
		lea	eax, [esi+eax]
		imul	esi, [ebp+var_54], 81D6F9FAh
		imul	eax, 0C21256DDh
		add	esi, 5F2E6DEBh
		or	esi, edi
		sub	eax, esi
		mov	esi, [ebp+var_F8]
		add	eax, 28615AC2h
		xor	eax, 565Eh
		add	eax, 383A0000h
		xor	edx, eax
		mov	eax, [ebp+var_64]
		lea	edi, [edx+512027B0h]
		add	edx, edx
		and	edx, 6342AA76h
		lea	eax, [esi+eax+13C0856Eh]
		mov	esi, eax
		mov	eax, 0A04611A2h
		sub	eax, [ebp+var_F8]
		add	esi, edi
		sub	eax, [ebp+var_64]
		sub	esi, edx
		add	esi, esi
		or	esi, 0A12CEDCAh
		sub	eax, edi
		mov	edi, [ebp+var_140]
		add	eax, edx
		lea	eax, [esi+eax]
		mov	esi, [ebp+var_14]
		mov	[ebp+var_78], eax
		imul	edx, ecx, 7C208EADh
		imul	eax, [ebp+var_34], 5EB1F0Fh
		lea	edx, [edx+eax-21F59A2Eh]
		imul	eax, ecx, 578E9C4Eh
		imul	ecx, [ebp+var_5C], 448FD66Fh
		add	eax, 6214B57h
		or	eax, [ebp+var_B0]
		imul	eax, 0AAFEEAF5h
		lea	eax, [edx+eax]
		imul	edx, [ebp+var_5C], 2B8CC1Ah
		mov	[ebp+var_64], edx
		imul	edx, eax, 3AA77F21h
		imul	eax, 0D6361D46h
		lea	edx, [ecx+edx-55EF8C82h]
		mov	ecx, [ebp+var_64]
		add	eax, 571A6C61h
		add	ecx, 44565BA7h
		or	eax, ecx
		imul	eax, 493ED495h
		imul	ecx, [ebp+var_88], 19836C73h
		add	edx, eax
		mov	eax, [ebp+var_14]
		imul	edx, 3AA291D9h
		add	eax, 2BBCB9BAh
		imul	eax, 6359AECFh
		lea	ecx, [ecx+eax-4E57E0C1h]
		imul	eax, [ebp+var_1C], 0C6B35D9Eh
		add	ecx, eax
		lea	eax, [edi+esi*2+6208479Fh]
		mov	esi, [ebp+var_1C]
		lea	eax, [eax+esi*4]
		and	eax, 0F5712BD4h
		imul	eax, 9CA65131h
		lea	eax, [ecx+eax]
		imul	eax, 0AB4880DDh
		lea	eax, [edx+eax-5CCF1146h]
		mov	edx, 6DD873F3h
		mov	[ebp+var_24], eax
		imul	edi, [ebp+var_A4], 0FCDEE53Fh
		sub	edx, [ebp+var_20]
		imul	ecx, [ebp+var_A4], 0BEB66213h
		mov	eax, edi
		add	eax, 384D39D9h
		xor	eax, 0E6D4h
		sub	eax, 549A0000h
		xor	eax, edx
		xor	eax, 0FFFF192Bh
		or	eax, edx
		imul	edx, [ebp+var_20], 8C646A2Dh
		mov	[ebp+var_1C], edi
		lea	ecx, [ecx+edx-7BD2C22Dh]
		imul	edx, eax, 18C8D45Ah
		add	ecx, edx
		mov	edx, [ebp+var_20]
		add	edx, edi
		lea	eax, [edx+eax*2]
		lea	edx, [eax+eax-144A7431h]
		and	edx, 239D042Eh
		imul	edx, 739B95D3h
		imul	eax, [ebp+var_4C], 0E50B311Dh
		lea	edx, [ecx+edx]
		imul	ecx, edx, 876575A5h
		sub	ecx, 1
		add	eax, 23B423CDh
		xor	eax, 4BF8h
		add	eax, 0D500000h
		xor	eax, ecx
		xor	eax, 0FFFFB407h
		imul	esi, [ebp+var_8C], 0F54F250Dh
		or	eax, ecx
		imul	ecx, [ebp+var_F4], 6ECAEFF7h
		lea	edi, [esi+ecx-2C38F327h]
		imul	esi, [ebp+var_F4], 0E504EEh
		sub	esi, 778D65C9h
		or	esi, [ebp+var_F0]
		imul	esi, 0BF53217Fh
		lea	esi, [edi+esi]
		imul	ecx, esi, 989CA1E3h
		imul	esi, eax, 0AD44FD56h
		imul	edi, edx, 0BEE934C9h
		imul	edx, 0F13514B6h
		mov	[ebp+var_14], esi
		imul	esi, [ebp+var_4C], 5300145Fh
		lea	esi, [edi+esi]
		mov	edi, [ebp+var_E0]
		add	esi, [ebp+var_14]
		lea	edx, [edi+edx+6208479Fh]
		lea	eax, [edx+eax*4]
		mov	edx, [ebp+var_114]
		and	eax, 0E18271C2h
		imul	eax, 0A95D8155h
		sub	edx, 42F75A55h
		xor	edx, 0D749h
		add	esi, eax
		add	edx, 46080000h
		imul	eax, [ebp+var_54], 40EB7CFDh
		imul	esi, 0DF1A6C29h
		sub	eax, 1670C90Bh
		xor	eax, 0D749h
		add	eax, 46080000h
		xor	edx, eax
		mov	eax, [ebp+var_10C]
		lea	esi, [ecx+esi-76DF3B08h]
		mov	[ebp+var_88], esi
		mov	esi, edx
		xor	edx, 1ACFD3EDh
		xor	esi, 0E5302C12h
		xor	eax, 20CEh
		add	eax, 383A0000h
		xor	eax, edx
		xor	eax, 0FFFFDF31h
		imul	ecx, [ebp+var_DC], 15112587h
		or	eax, edx
		imul	edx, [ebp+var_58], 5DA685DDh
		imul	edi, [ebp+var_DC], 40584E2Eh
		lea	edx, [ecx+edx+6E4F7214h]
		imul	ecx, [ebp+var_58], 2B8CC1Ah
		add	edi, 7F3D1673h
		imul	edx, 9E5E55F1h
		add	ecx, 44565BA7h
		or	ecx, edi
		sub	edx, ecx
		lea	ecx, [esi+75B59E8h]
		imul	edi, [ebp+var_5C], 4767FC31h
		imul	ecx, 6E7AE9B5h
		lea	edi, [edi+ecx-2BD647D0h]
		imul	ecx, eax, 0DCF5D36Ah
		lea	ecx, [edi+ecx]
		mov	edi, [ebp+var_64]
		imul	ecx, 169F7C9Dh
		lea	ecx, [edx+ecx+14297AC8h]
		lea	edx, [edi+esi*2+44565BABh]
		lea	eax, [edx+eax*4]
		and	eax, 0CA605824h
		sub	ecx, eax
		mov	edx, ecx
		and	ecx, 0B6E7372Fh
		or	edx, 0B6E7372Fh
		add	edx, 5D3286EAh
		sub	edx, ecx
		mov	[ebp+var_64], edx
		mov	edx, [ebp+var_C0]
		imul	esi, [ebp+var_A4], 6423582h
		imul	ecx, [ebp+var_20], 81968421h
		add	edx, edx
		and	edx, 0C21F75ECh
		add	esi, 38998C4Ch
		mov	eax, edx
		sub	eax, [ebp+var_20]
		lea	eax, [eax+eax+199171FBh]
		mov	[ebp+var_14], eax
		imul	eax, edx, 7E697BDFh
		and	esi, [ebp+var_14]
		lea	ecx, [ecx+eax+2E3ADA4Dh]
		imul	esi, 81968421h
		imul	eax, [ebp+var_A4], 98DA091Fh
		lea	eax, [esi+eax]
		lea	eax, [ecx+eax]
		imul	ecx, [ebp+var_58], 0C47C24B7h
		imul	edi, [ebp+var_144], 0C46A28D3h
		imul	esi, [ebp+var_7C], 3B95D72Dh
		lea	esi, [edi+esi]
		lea	ecx, [ecx+esi-625A96C4h]
		imul	esi, eax, 27B1B3EFh
		imul	eax, 0EC0C003Eh
		imul	edi, [ebp+var_68], 0DA7FF229h
		imul	ecx, 9C8279C1h
		sub	eax, 17B1E05Fh
		or	eax, [ebp+var_C8]
		lea	esi, [edi+esi-664F83Ch]
		imul	eax, 9BB96DCFh
		lea	eax, [esi+eax]
		imul	eax, 30CEDC7Dh
		lea	eax, [ecx+eax+2A31F1D5h]
		mov	[ebp+var_5C], eax
		mov	ecx, [ebp+var_1C]
		imul	eax, [ebp+var_68], 51AB2979h
		sub	ecx, 5506C627h
		add	eax, 28E4F0BFh
		xor	ecx, 0E6D4h
		xor	eax, 0E6D4h
		add	ecx, 38BA0000h
		add	eax, 38BA0000h
		xor	eax, ecx
		mov	edi, eax
		mov	esi, eax
		imul	eax, [ebp+var_34], 2BFC988Dh
		xor	esi, 4195746h
		xor	edi, 0FBE6A8B9h
		add	eax, 6680E13Bh
		xor	eax, 0F1D6h
		sub	eax, 48AE0000h
		xor	eax, esi
		xor	eax, 0FFFF0E29h
		or	eax, esi
		mov	esi, [ebp+var_118]
		lea	ecx, [esi+edi*2+3BA5C27Bh]
		imul	esi, [ebp+var_34], 0E733415Dh
		lea	ecx, [ecx+eax*4]
		imul	eax, 87534022h
		and	ecx, 0F7CD5172h
		mov	[ebp+var_1C], esi
		mov	esi, 0E6467609h
		sub	esi, edi
		mov	edi, [ebp+var_1C]
		imul	esi, 3C565FEFh
		lea	esi, [edi+esi+67E5ECB7h]
		lea	eax, [esi+eax]
		mov	esi, [ebp+var_18]
		imul	eax, 2E64AF0Fh
		imul	edx, 5DE29EDDh
		add	esi, esi
		and	esi, 0C36B35F0h
		add	ecx, eax
		mov	edi, esi
		sub	edi, [ebp+var_18]
		sub	edi, ecx
		sub	ecx, esi
		mov	esi, [ebp+var_18]
		lea	eax, [ecx+esi+44EFA33Fh]
		imul	esi, [ebp+var_54], 7E290606h
		add	eax, eax
		or	eax, 9D006702h
		lea	eax, [edi+eax+6723EBF6h]
		imul	ecx, [ebp+var_20], 0A21D6123h
		sub	esi, 5F2E6DECh
		and	esi, [ebp+var_14]
		mov	[ebp+var_34], eax
		imul	eax, [ebp+var_54], 5D36F397h
		imul	esi, 0A21D6123h
		lea	eax, [eax+ecx-54F63996h]
		lea	edx, [eax+edx]
		add	edx, esi
		imul	eax, [ebp+var_B4], 0B722D001h
		imul	esi, [ebp+var_58], 0ED00F60Dh
		lea	edi, [esi+eax+20A4BF00h]
		mov	esi, [ebp+var_1C4]
		imul	eax, [ebp+var_D4], 48DD2FFFh
		add	edi, eax
		mov	eax, [ebp+var_D4]
		sub	eax, [ebp+var_B4]
		lea	ecx, [eax+eax+493C813Bh]
		and	ecx, [ebp+var_13C]
		imul	eax, edx, 94FE7321h
		imul	edx, 2C5852EAh
		imul	ecx, 0B722D001h
		sub	edx, 2A8A4CD5h
		or	edx, [ebp+var_D8]
		add	edi, ecx
		imul	ecx, [ebp+var_4C], 4A12D829h
		imul	edi, 0E303C05Dh
		imul	edx, 0B5263E83h
		lea	ecx, [ecx+eax-0B3E6A85h]
		lea	edx, [ecx+edx]
		mov	ecx, [ebp+var_178]
		imul	edx, 648CFF9Fh
		lea	edx, [edi+edx+632135E1h]
		mov	edi, [ebp+var_1C8]
		mov	[ebp+var_A4], edx
		mov	edx, [ebp+var_14C]
		add	edx, 66286775h
		xor	edx, 8BBD9D04h
		mov	eax, edx
		add	edx, edx
		sub	eax, [ebp+var_E8]
		and	edx, 177B3A08h
		sub	esi, [ebp+var_FC]
		lea	eax, [eax+edi-44C280D8h]
		sub	eax, edx
		mov	edx, [ebp+var_174]
		mov	[ebp+var_4C], esi
		sub	edx, eax
		lea	eax, [eax+ecx+477B9772h]
		mov	ecx, esi
		add	eax, eax
		or	eax, 0CC698178h
		lea	eax, [edx+eax+324B19ADh]
		sub	ecx, eax
		lea	eax, [eax+eax+40091C4Ah]
		or	eax, 0CC698178h
		lea	eax, [ecx+eax]
		imul	edx, [ebp+var_98], 0E0DE7541h
		imul	eax, 0E0DE7541h
		lea	eax, [edx+eax-133A1CB1h]
		mov	edx, edi
		mov	[ebp+var_14], eax
		mov	edi, [ebp+var_40]
		sub	edx, [ebp+var_1D4]
		add	edx, [ebp+var_CC]
		sub	edx, [ebp+var_E8]
		lea	ecx, [esi+edi+76FB7996h]
		mov	esi, [ebp+var_98]
		mov	edi, [ebp+var_1C4]
		add	ecx, edx
		xor	ecx, 1DDDE931h
		lea	eax, [ecx+esi-26A45A04h]
		add	ecx, ecx
		and	ecx, 3BBBD262h
		sub	eax, ecx
		mov	ecx, [ebp+var_160]
		xor	eax, 0E10FBAF6h
		and	ecx, 0A50FF288h
		sub	edi, ecx
		sub	ecx, [ebp+var_1C4]
		mov	[ebp+var_58], edi
		mov	[ebp+var_54], ecx
		mov	esi, ecx
		lea	ecx, [edi+edx+3B7DBCCBh]
		sub	esi, edx
		add	ecx, ecx
		or	ecx, 9414934h
		lea	esi, [esi+ecx+5AA8FEDFh]
		mov	ecx, [ebp+var_100]
		lea	ecx, [esi+ecx]
		lea	esi, [esi+esi-358EC088h]
		and	esi, 9414934h
		sub	ecx, esi
		sub	ecx, [ebp+var_1D8]
		imul	esi, ecx, 0A50DDE1Fh
		add	ecx, 2E5B878Bh
		and	ecx, 0A1EAE077h
		imul	ecx, 0B5E443C2h
		lea	ecx, [esi+ecx-272DABC2h]
		imul	esi, ecx, 213594F5h
		imul	ecx, 79FC3BBEh
		and	ecx, 43D5C0EEh
		sub	ecx, [ebp+var_98]
		imul	ecx, 9E58055h
		lea	ecx, [esi+ecx+76DA8968h]
		mov	esi, [ebp+var_40]
		mov	[ebp+var_20], ecx
		mov	ecx, [ebp+var_9C]
		sub	ecx, [ebp+var_1CC]
		add	esi, ecx
		mov	edi, esi
		and	edi, 5C9BB021h
		mov	[ebp+var_1C], esi
		imul	edi, 5642156h
		imul	esi, 0FD4DEF55h
		mov	[ebp+var_50], ecx
		lea	edi, [edi+esi-4FF2B60Bh]
		imul	esi, edi, 0AF695FDh
		imul	edi, 15ED2BFAh
		add	esi, [ebp+var_108]
		and	edi, 0B9376042h
		sub	esi, edi
		imul	edi, esi, 0F980F20Bh
		add	esi, 18196CECh
		and	esi, 0D0499D2h
		imul	esi, 0CFE1BEAh
		lea	esi, [edi+esi+27A9E62Ah]
		imul	ecx, esi, 3D081F05h
		imul	edi, [ebp+var_98], 0AC2C0F37h
		imul	esi, 19B51346h
		lea	edi, [edi+ecx+3D483C98h]
		mov	ecx, [ebp+var_154]
		and	esi, 1A0933A4h
		sub	ecx, esi
		imul	esi, ecx, 0AC2C0F37h
		mov	ecx, [ebp+var_50]
		add	ecx, [ebp+var_E4]
		add	esi, edi
		mov	edi, [ebp+var_40]
		xor	ecx, 463D7D3h
		mov	[ebp+var_18], esi
		mov	esi, [ebp+var_108]
		lea	esi, [edi+esi+9A1B364h]
		mov	edi, [ebp+var_154]
		sub	esi, ecx
		add	ecx, ecx
		or	ecx, 8C7AFA6h
		lea	ecx, [esi+ecx+68F5EE5Fh]
		xor	ecx, 173855E2h
		add	edi, ecx
		add	ecx, ecx
		and	ecx, 2E70ABC4h
		sub	edi, ecx
		mov	ecx, [ebp+var_1CC]
		sub	ecx, [ebp+var_1D4]
		add	ecx, [ebp+var_CC]
		sub	ecx, [ebp+var_158]
		mov	[ebp+var_44], edi
		imul	esi, ecx, 0EAD41F21h
		and	ecx, 7433C450h
		imul	ecx, 2A57C1BEh
		lea	esi, [esi+ecx-0E4E01B0h]
		imul	ecx, esi, 0D13024E1h
		imul	esi, 0A26049C2h
		add	ecx, [ebp+var_40]
		and	esi, 0E86788A0h
		sub	ecx, esi
		imul	edi, ecx, 75F7D017h
		add	ecx, 2FB1811Bh
		and	ecx, 8ADC806Fh
		imul	ecx, 14105FD2h
		lea	ecx, [edi+ecx-4DD7BC9Ah]
		mov	edi, [ebp+var_108]
		imul	esi, ecx, 131267A7h
		imul	ecx, 2624CF4Eh
		add	esi, [ebp+var_4C]
		and	ecx, 15B900DEh
		sub	esi, ecx
		imul	ecx, esi, 0FCB8151Dh
		add	esi, 465A3D3Ah
		and	esi, 0F0D74A3Fh
		imul	esi, 68FD5C6h
		lea	ecx, [ecx+esi-344EBA4Bh]
		imul	esi, ecx, 45F82F07h
		imul	ecx, 932AAA6Ah
		and	ecx, 0E1AE947Eh
		sub	edi, ecx
		xor	edx, 0BBA021A6h
		imul	ecx, edi, 0FA00E6CBh
		lea	ecx, [esi+ecx-6DCCF6B8h]
		mov	[ebp+var_74], ecx
		mov	ecx, [ebp+var_1D0]
		mov	esi, [ebp+var_17C]
		mov	edi, [ebp+var_1C]
		sub	ecx, 2264DBh
		sub	ecx, [ebp+var_150]
		or	esi, 0A50FF288h
		sub	esi, [ebp+var_1DC]
		sub	ecx, edx
		add	edx, edx
		or	edx, 7740434Ch
		lea	edx, [ecx+edx]
		mov	ecx, [ebp+var_100]
		sub	ecx, [ebp+var_1D8]
		xor	edx, 560D48DEh
		lea	ecx, [edx+ecx-657073EDh]
		add	edx, edx
		and	edx, 0AC1A91BCh
		sub	ecx, edx
		xor	ecx, 9B79BA26h
		lea	edx, [ecx+58D6F2B2h]
		add	ecx, ecx
		and	ecx, 36F3744Ch
		sub	edx, ecx
		lea	edx, [esi+edx]
		mov	esi, [ebp+var_58]
		mov	[ebp+var_9C], edx
		mov	edx, [ebp+var_54]
		sub	edx, [ebp+var_1C]
		lea	ecx, [edi+esi+3B7DBCCBh]
		add	ecx, ecx
		or	ecx, 0E63E74CCh
		lea	ecx, [edx+ecx-3E81DF03h]
		mov	edx, [ebp+var_84]
		sub	edx, [ebp+var_1D0]
		add	edx, ecx
		lea	ecx, [ecx+ecx+1FC9CFA4h]
		and	ecx, 0E63E74CCh
		sub	edx, ecx
		imul	ecx, edx, 648529BDh
		sub	edx, 38799A93h
		and	edx, 0AA6D9DFBh
		imul	edx, 36F5AC86h
		lea	edx, [ecx+edx-6545D438h]
		mov	[ebp+var_84], edx
		mov	edx, 1EF04509h
		sub	edx, eax
		add	eax, eax
		and	eax, 0C21F75ECh
		lea	edi, [edx+eax]
		mov	edx, edi
		shr	edx, 1Ch
		imul	eax, edx, 0CFE3B27Fh
		sub	edx, 10h
		not	edx
		or	edx, 1D454384h
		imul	edi, 0F3FD93D0h
		imul	edx, 9FC764FEh
		sub	edi, 2F6B0374h
		lea	esi, [eax+edx+5931F692h]
		imul	eax, edi, 0F496C615h
		imul	ecx, esi, 61060D7Fh
		imul	edi, 0E92D8C2Ah
		imul	esi, 3DF3E502h
		lea	edx, [eax+78E90093h]
		xor	edx, 49D4h
		sub	ecx, 1
		sub	edx, 3A7E0000h
		xor	edx, ecx
		xor	edx, 0FFFFB62Bh
		or	edx, ecx
		sub	ecx, eax
		mov	eax, edx
		not	eax
		lea	eax, [ecx+eax*2+2BB86CD4h]
		lea	ecx, [edi+esi+7CD6012Bh]
		lea	edx, [ecx+edx*4]
		and	edx, 76A0D1Ah
		add	eax, edx
		imul	edx, [ebp+var_20], 40EB7CFDh
		add	edx, 2F9736F5h
		shr	edx, 18h
		mov	[ebp+var_40], edx
		imul	edx, [ebp+var_18], 51AB2979h
		add	edx, 619EF0BFh
		shr	edx, 13h
		mov	ecx, edx
		sub	edx, 2000h
		not	edx
		neg	ecx
		or	edx, 56545CBEh
		sub	ecx, 4602D69h
		add	edx, edx
		sub	ecx, edx
		mov	edx, [ebp+var_18]
		lea	esi, [ecx+ecx-4A96ABB6h]
		and	esi, 53574682h
		neg	edx
		imul	edi, esi, 53D3F0C9h
		sub	esi, ecx
		shl	edx, 0Dh
		lea	esi, [esi+esi-8C09ACDh]
		lea	edx, [edx+edi+342A942Ah]
		imul	edi, [ebp+var_18], 35A1C000h
		add	edi, 43D00000h
		and	esi, edi
		mov	edi, [ebp+var_44]
		lea	ecx, [esi+ecx]
		imul	ecx, 0AC2C0F37h
		sub	edi, 2D49ED52h
		imul	edi, 0D48A0000h
		lea	ecx, [edx+ecx]
		mov	[ebp+var_50], ecx
		mov	ecx, 2D49ED52h
		sub	ecx, [ebp+var_44]
		shr	ecx, 0Fh
		mov	edx, ecx
		sub	ecx, 20000h
		not	ecx
		neg	edx
		or	ecx, 0E85C7578h
		sub	edx, 2BFDBA87h
		add	ecx, ecx
		sub	edx, ecx
		lea	ecx, [edx+edx+28B85FFAh]
		and	ecx, 2F47150Eh
		imul	esi, ecx, 29E2EA45h
		sub	ecx, edx
		lea	esi, [edi+esi-7C2B7AC0h]
		lea	edi, [ecx+ecx-57FF7509h]
		mov	ecx, [ebp+var_44]
		sub	ecx, 2D49ED53h
		shl	ecx, 12h
		and	edi, ecx
		add	edi, edx
		imul	edx, [ebp+var_74], 0E50B311Dh
		imul	edi, 0D61D15BBh
		add	edx, 310423CDh
		shr	edx, 0Ah
		imul	edx, 0B853B3Bh
		lea	edi, [esi+edi]
		mov	esi, [ebp+var_74]
		mov	[ebp+var_98], edi
		sub	edx, 71B55B4h
		imul	ecx, edx, 2A34564Fh
		shl	esi, 16h
		imul	edx, 59AFCBE6h
		lea	ecx, [esi+ecx-50829D1Ah]
		imul	esi, [ebp+var_74], 8E800000h
		add	edx, 3910BBB9h
		sub	esi, 19000001h
		or	edx, esi
		mov	esi, 78DAF556h
		imul	edx, 0FA00E6CBh
		sub	esi, [ebp+var_9C]
		lea	edx, [ecx+edx]
		mov	[ebp+var_18], edx
		mov	edx, esi
		shr	edx, 8
		imul	ecx, edx, 513F4197h
		imul	esi, 97000000h
		lea	edi, [esi+ecx-3A366474h]
		lea	ecx, [edx+edx-1FFFFFFh]
		mov	edx, [ebp+var_9C]
		sub	edx, 78DAF556h
		neg	edx
		shl	edx, 19h
		add	edx, 1FFFFFFh
		or	ecx, edx
		imul	ecx, 0AEC0BE69h
		imul	edx, [ebp+var_84], 0C39AD857h
		lea	ecx, [edi+ecx]
		mov	[ebp+var_1C], ecx
		imul	ecx, [ebp+var_84], 9158B32Ah
		and	ecx, 54DB3BF6h
		sub	ecx, [ebp+var_154]
		imul	ecx, 68D558C5h
		lea	ecx, [edx+ecx+4F91F17Eh]
		imul	ecx, 15C660Dh
		add	ecx, 222B2DD3h
		mov	edx, ecx
		shr	ecx, 3
		imul	ecx, 119A0797h
		shl	edx, 1Dh
		imul	edi, edx, 68D558C5h
		lea	edx, [edx+edx+3FFFFFFFh]
		sub	ecx, 81A039Dh
		imul	esi, ecx, 0B0EB0E03h
		imul	ecx, 5F31D04Eh
		lea	esi, [edi+esi+61407CB3h]
		add	ecx, 4EE9A9D7h
		or	ecx, edx
		imul	ecx, 972AA73Bh
		lea	ecx, [esi+ecx]
		mov	[ebp+var_74], ecx
		imul	ecx, [ebp+var_50], 14974651h
		imul	edx, [ebp+var_18], 0D80A8B55h
		imul	esi, [ebp+var_50], 0A35652F2h
		lea	ecx, [ecx+edx-37B289B1h]
		imul	edx, [ebp+var_18], 0CA16623Ah
		sub	esi, 3CC21E81h
		add	edx, 6208479Bh
		or	edx, esi
		imul	edx, 0CB8ADA67h
		add	ecx, edx
		imul	esi, ecx, 8678BD52h
		imul	edx, [ebp+var_1C], 578E9C4Eh
		imul	ecx, 0B2A21039h
		sub	esi, 2EA0F35h
		add	edx, 6214B57h
		or	esi, edx
		mov	[ebp+var_58], esi
		imul	esi, [ebp+var_1C], 5EF29997h
		imul	edx, [ebp+var_40], 9E58055h
		add	ecx, esi
		mov	esi, [ebp+var_40]
		imul	ecx, 864E1E0Fh
		mov	[ebp+var_8C], ecx
		mov	ecx, [ebp+var_20]
		shl	ecx, 8
		lea	edx, [ecx+edx-5FFEE6AEh]
		lea	ecx, [esi+esi-1FFh]
		imul	esi, [ebp+var_20], 0D6F9FA00h
		imul	edi, edx, 40EB7CFDh
		imul	edx, [ebp+var_18], 0E50B311Dh
		add	esi, 2E6DEBFFh
		or	ecx, esi
		sub	edi, ecx
		add	edx, 23B423CDh
		lea	esi, [edi+224736F5h]
		xor	edx, 0EEABh
		xor	esi, 0EEABh
		add	edx, 0D500000h
		add	esi, 0D500000h
		xor	esi, 19E0C7BEh
		xor	esi, edx
		lea	edx, [esi-8C8A359h]
		add	esi, esi
		mov	[ebp+var_68], edx
		sub	edi, 1670C90Bh
		and	esi, 33C18F7Ch
		imul	edx, [ebp+var_1C], 0A87163B2h
		xor	edi, 0FF3h
		add	edi, 46080000h
		mov	[ebp+var_84], esi
		sub	edx, 6214B58h
		mov	[ebp+var_108], edx
		imul	edx, [ebp+var_50], 51AB2979h
		add	edx, 1B96F0BFh
		xor	edx, 0FF3h
		add	edx, 46080000h
		xor	edx, edi
		mov	ecx, edx
		xor	ecx, 77B62215h
		lea	esi, [ecx+5DB6F796h]
		add	ecx, ecx
		and	ecx, 0EF6C442Ah
		mov	[ebp+var_4C], ecx
		lea	ecx, [eax+eax+244F1818h]
		and	ecx, 0C21F75ECh
		mov	[ebp+var_104], esi
		mov	esi, ecx
		sub	esi, eax
		lea	esi, [esi+esi+199171FBh]
		mov	[ebp+var_9C], esi
		imul	esi, [ebp+var_14], 6423582h
		imul	edi, [ebp+var_14], 21E34E51h
		add	esi, 38998C4Ch
		and	esi, [ebp+var_9C]
		add	esi, eax
		mov	[ebp+var_40], esi
		imul	esi, ecx, 47BFE791h
		lea	esi, [edi+esi-23811B1Eh]
		imul	edi, [ebp+var_40], 0B840186Fh
		lea	edi, [esi+edi]
		mov	[ebp+var_EC], edi
		imul	edi, [ebp+var_14], 0FCDEE53Fh
		imul	esi, [ebp+var_98], 2BFC988Dh
		mov	[ebp+var_50], edi
		add	edi, 384D39D9h
		mov	[ebp+var_40], edi
		mov	edi, esi
		add	edi, 726CE13Bh
		xor	edi, 0F1D6h
		sub	edi, 549A0000h
		mov	[ebp+var_44], edi
		mov	edi, [ebp+var_40]
		mov	[ebp+var_AC], esi
		xor	edi, 0F1D6h
		sub	edi, 549A0000h
		xor	[ebp+var_44], edi
		xor	[ebp+var_44], 0B812CCE2h
		mov	edi, [ebp+var_44]
		imul	ecx, 11FCF1FBh
		mov	esi, [ebp+var_44]
		sub	edi, 71AD8A87h
		mov	[ebp+var_7C], edi
		add	esi, esi
		imul	edi, [ebp+var_74], 0FD4733E6h
		mov	[ebp+var_54], esi
		imul	esi, eax, 0EE030E05h
		sub	edi, 44565BA8h
		mov	[ebp+var_E8], edi
		imul	edi, [ebp+var_1C], 0ED9FA8C3h
		lea	edi, [edi+esi-79B7AE00h]
		add	ecx, edi
		mov	edi, [ebp+var_9C]
		and	edi, [ebp+var_108]
		imul	esi, [ebp+var_98], 0D4036773h
		imul	edi, 0EE030E05h
		lea	edi, [ecx+edi]
		mov	ecx, [ebp+var_AC]
		mov	[ebp+var_E4], edi
		mov	edi, edx
		xor	edx, 75383AF8h
		xor	edi, 8AC7C507h
		add	edx, [ebp+var_AC]
		add	ecx, 6680E13Bh
		xor	ecx, 0F1D6h
		sub	ecx, 48AE0000h
		xor	ecx, edi
		xor	ecx, 0FFFF0E29h
		or	ecx, edi
		lea	edx, [edx+ecx*2]
		not	ecx
		lea	esi, [edi+esi-407C49ADh]
		lea	edx, [edx+edx+3BA5C27Bh]
		and	edx, 291B4000h
		lea	ecx, [esi+ecx*2]
		lea	ecx, [edx+ecx]
		mov	edx, [ebp+var_40]
		mov	[ebp+var_100], ecx
		mov	ecx, 6DD873F3h
		sub	ecx, eax
		xor	edx, 0E6D4h
		sub	edx, 549A0000h
		xor	edx, ecx
		xor	edx, 0FFFF192Bh
		or	edx, ecx
		mov	ecx, [ebp+var_14]
		mov	esi, edx
		not	esi
		add	ecx, 1
		imul	ecx, 3211AC1h
		sub	ecx, eax
		add	eax, [ebp+var_50]
		lea	ecx, [ecx+esi*2+6455F7E1h]
		lea	eax, [eax+edx*2]
		lea	eax, [eax+eax-144A7431h]
		and	eax, 0EBE89DD6h
		lea	eax, [ecx+eax]
		mov	[ebp+var_CC], eax
		lea	eax, [eax+eax+5973B11Ah]
		and	eax, 29F7E83Ah
		mov	[ebp+var_20], eax
		imul	eax, [ebp+var_90], 5B5A3611h
		imul	ecx, [ebp+var_C], 0BF2CD92Bh
		imul	edx, [ebp+var_A0], 5EB9906Fh
		imul	esi, [ebp+var_60], 25047FB1h
		sub	eax, 5D51230Bh
		xor	eax, 2A2EF24Ch
		lea	edx, [ecx+edx+2EA014A7h]
		imul	ecx, eax, 37F34909h
		add	eax, eax
		and	eax, 545DE498h
		imul	eax, 0C80CB6F7h
		lea	ecx, [esi+ecx-2EAF045Dh]
		mov	esi, [ebp+var_30]
		lea	eax, [ecx+eax]
		mov	ecx, [ebp+var_3C]
		imul	eax, 4041E193h
		or	esi, 9C2548FEh
		lea	eax, [edx+eax]
		mov	edx, [ebp+var_134]
		imul	eax, 2F375D43h
		lea	eax, [edx+eax-4C388FB1h]
		mov	edx, [ebp+var_28]
		mov	[ebp+var_50], eax
		mov	eax, [ebp+var_28]
		and	edx, 9C26EDECh
		or	eax, 9C26EDECh
		add	eax, 372B6E7Ah
		sub	eax, edx
		lea	edx, [eax+eax-6E56DCF4h]
		and	edx, 0C7B22426h
		sub	eax, edx
		imul	edx, [ebp+var_94], 0F257643Dh
		mov	[ebp+var_30], esi
		sub	edx, eax
		mov	eax, esi
		mov	esi, [ebp+var_C4]
		sub	eax, [ebp+var_38]
		lea	edx, [ecx+edx-354C8434h]
		mov	ecx, edx
		and	edx, 0FBF6F441h
		or	ecx, 0FBF6F441h
		lea	eax, [ecx+eax+58AC29CCh]
		sub	ecx, edx
		sub	eax, edx
		mov	edx, [ebp+var_D0]
		add	ecx, ecx
		and	ecx, 812177Ch
		sub	eax, ecx
		mov	edi, eax
		lea	ecx, [esi+edx-5B74D59Ah]
		xor	edi, 0E10FBAF6h
		mov	esi, [ebp+var_10]
		mov	edx, ecx
		and	ecx, 585CDFE5h
		or	edx, 585CDFE5h
		sub	edx, ecx
		mov	[ebp+var_40], edi
		lea	ecx, [edx+3E933916h]
		add	edx, edx
		imul	edi, [ebp+var_94], 0DA89BC3h
		and	edx, 4F464034h
		sub	esi, ecx
		lea	esi, [esi+edx+7C3DD74Ch]
		lea	ecx, [ecx+edi-159DE269h]
		mov	edi, [ebp+var_C]
		sub	ecx, edx
		add	ecx, ecx
		or	ecx, 43379012h
		lea	ecx, [esi+ecx]
		lea	edx, [ecx+ecx-107779D8h]
		sub	edi, ecx
		mov	ecx, [ebp+var_A8]
		or	edx, 43379012h
		lea	edx, [edi+edx]
		mov	edi, [ebp+var_3C]
		mov	[ebp+var_9C], edx
		mov	edx, [ebp+var_A8]
		and	ecx, 0EB352E4Ah
		or	edx, 0EB352E4Ah
		add	edx, 444273BAh
		sub	edx, ecx
		lea	ecx, [edx+edx+777B188Ch]
		and	ecx, 2995A36Ah
		mov	esi, ecx
		sub	esi, edx
		lea	esi, [edi+esi+53CF4858h]
		mov	edi, [ebp+var_BC]
		lea	edx, [edx+edi+57D50802h]
		mov	edi, [ebp+var_11C]
		sub	edx, ecx
		add	edx, edx
		or	edx, 0F6DD0BECh
		lea	edx, [esi+edx]
		mov	esi, [ebp+var_6C]
		lea	ecx, [edx+edx-4E25ACA0h]
		or	ecx, 0F6DD0BECh
		sub	esi, edx
		lea	edx, [ecx+esi]
		mov	ecx, [ebp+var_28]
		imul	edx, 0AC2C0F37h
		mov	esi, [ebp+var_3C]
		and	ecx, 732710BFh
		lea	edx, [edi+edx+54AAFB74h]
		mov	edi, [ebp+var_10]
		mov	[ebp+var_14], edx
		mov	edx, [ebp+var_28]
		or	edx, 732710BFh
		sub	edx, 5E3A381Ch
		sub	edx, ecx
		lea	ecx, [edi+esi+0C4DF809h]
		mov	edi, [ebp+var_C]
		lea	esi, [edx+edx-438B8FC8h]
		sub	ecx, edx
		and	esi, 19B1DE80h
		lea	esi, [ecx+esi]
		mov	ecx, esi
		or	esi, 0D3881781h
		and	ecx, 0D3881781h
		lea	edx, [ecx+edi+6F9DA7Dh]
		sub	edx, esi
		sub	esi, ecx
		mov	ecx, [ebp+var_BC]
		add	esi, esi
		or	esi, 58EFD0FCh
		neg	eax
		lea	esi, [edx+esi]
		mov	[ebp+var_10], esi
		mov	esi, [ebp+var_12C]
		lea	edx, [esi+ecx-497A17EFh]
		mov	ecx, [ebp+var_138]
		sub	ecx, [ebp+var_48]
		sub	ecx, edx
		lea	edx, [edx+edi+556727CCh]
		add	edx, edx
		or	edx, 5A4B6E7Ch
		lea	ecx, [ecx+edx+6D6C284Eh]
		mov	edx, [ebp+var_30]
		sub	edx, [ebp+var_38]
		lea	edx, [ecx+edx-6E30320Ch]
		lea	ecx, [ecx+ecx+200DF150h]
		and	ecx, 5A4B6E7Ch
		sub	edx, ecx
		mov	ecx, [ebp+var_C]
		xor	edx, 9A8E3098h
		lea	edi, [edx+4F93892Dh]
		mov	[ebp+var_60], edi
		mov	edi, [ebp+var_128]
		lea	esi, [edi+ecx+27BCF909h]
		mov	ecx, [ebp+var_6C]
		xor	esi, 3E3AF353h
		mov	edi, [ebp+var_124]
		lea	ecx, [esi+ecx]
		add	esi, esi
		and	esi, 7C75E6A6h
		sub	ecx, esi
		imul	esi, ecx, 0A286967h
		sub	ecx, 16682ABBh
		and	ecx, 844EC216h
		imul	ecx, 0EBAF2D32h
		lea	ecx, [esi+ecx+13389Dh]
		imul	esi, ecx, 0D1E27AFh
		imul	ecx, 248F44AEh
		lea	esi, [edi+esi-5BA0214Eh]
		and	ecx, 89D842Ch
		imul	ecx, 513F4197h
		lea	ecx, [esi+ecx]
		mov	esi, [ebp+var_80]
		mov	[ebp+var_B8], ecx
		mov	ecx, [ebp+var_80]
		and	esi, 5355D288h
		or	ecx, 5355D288h
		sub	ecx, 5B632036h
		sub	ecx, esi
		lea	esi, [ecx+ecx-4939BF94h]
		and	esi, 59545AEEh
		mov	[ebp+var_28], esi
		mov	edi, [ebp+var_3C]
		sub	esi, ecx
		lea	edi, [esi+edi-830E706h]
		mov	esi, [ebp+var_BC]
		lea	ecx, [ecx+esi-70A6084Ch]
		mov	esi, [ebp+var_40]
		sub	ecx, [ebp+var_28]
		add	ecx, ecx
		or	ecx, 65B5BC44h
		add	ecx, edi
		mov	[ebp+var_28], ecx
		imul	ecx, eax, 6BEB6CA0h
		shl	eax, 6
		add	esi, esi
		sub	eax, 1
		and	esi, 0C21F75ECh
		and	eax, 358EC088h
		imul	eax, 84A0A49Bh
		lea	eax, [ecx+eax+551D26D4h]
		mov	ecx, 1EF04509h
		sub	ecx, [ebp+var_40]
		add	ecx, esi
		shr	ecx, 1Bh
		sub	ecx, 20h
		imul	edi, ecx, 0C54FACBh
		not	ecx
		or	ecx, 0BA190433h
		imul	ecx, 18A9F596h
		imul	esi, eax, 4E74A193h
		imul	eax, 6316BCDAh
		lea	ecx, [edi+ecx+53FDD325h]
		imul	edi, ecx, 26E71AE3h
		imul	ecx, 0B231CA3Ah
		sub	eax, 1
		lea	esi, [edi+esi]
		and	ecx, eax
		mov	eax, 7FBE600Ch
		lea	ecx, [esi+ecx]
		xor	ecx, 3E2E217Eh
		mov	[ebp+var_48], ecx
		add	ecx, 6DD873F4h
		mov	[ebp+var_40], ecx
		mov	ecx, [ebp+var_9C]
		sub	eax, [ebp+var_9C]
		sub	ecx, 7FBE600Ch
		imul	edi, ecx, 34FF5600h
		neg	ecx
		shr	eax, 17h
		shl	ecx, 0Ah
		imul	esi, eax, 9E58055h
		add	ecx, 3FFh
		lea	eax, [eax+eax-3FFh]
		or	eax, ecx
		imul	eax, 0F61A7FABh
		lea	esi, [edi+esi-38BE3FAEh]
		lea	eax, [esi+eax]
		mov	[ebp+var_9C], eax
		imul	eax, [ebp+var_14], 447FF800h
		add	eax, 53EA958h
		mov	[ebp+var_C], eax
		imul	eax, [ebp+var_14], 51AB2979h
		add	eax, 619EF0BFh
		shr	eax, 15h
		imul	ecx, eax, 2A0ED40Bh
		lea	eax, [eax+eax-0FFFh]
		and	eax, 0DEEC6920h
		imul	eax, 0D5F12BF5h
		lea	ecx, [ecx+eax+60E9FE3Bh]
		imul	eax, [ebp+var_C], 0C1B8C687h
		imul	esi, ecx, 89C617A3h
		imul	edi, ecx, 370A5EFBh
		imul	ecx, 0EC73D0BAh
		sub	eax, 76AF5D69h
		xor	eax, 0EB87h
		sub	esi, 1
		add	eax, 23F00000h
		xor	eax, 0FFFF1478h
		xor	eax, esi
		or	eax, esi
		imul	esi, [ebp+var_C], 0BA776FFFh
		sub	esi, edi
		imul	edi, eax, 0A7A7E192h
		lea	esi, [esi+edi+1525493Ah]
		imul	edi, [ebp+var_C], 83718D0Eh
		lea	ecx, [edi+ecx+5A814533h]
		lea	eax, [ecx+eax*4]
		and	eax, 0DEEC6920h
		imul	eax, 0AC2C0F37h
		lea	eax, [esi+eax]
		mov	[ebp+var_C], eax
		mov	eax, [ebp+var_10]
		sub	eax, 19D017EAh
		imul	eax, 30928000h
		sub	eax, 69D7D148h
		mov	[ebp+var_14], eax
		mov	eax, 19D017EAh
		sub	eax, [ebp+var_10]
		shr	eax, 11h
		imul	ecx, eax, 0A8E2920Bh
		sub	eax, 8000h
		not	eax
		or	eax, 9C83CD8Ah
		imul	eax, 51C52416h
		lea	ecx, [ecx+eax+20091B28h]
		imul	esi, ecx, 7E13E9A3h
		sub	esi, 1
		add	edx, edx
		imul	eax, [ebp+var_14], 9AFD2D53h
		and	edx, 351C6130h
		imul	edi, ecx, 8BD2F6EFh
		imul	ecx, 3D82CBAh
		add	eax, 39EF0257h
		xor	eax, 0C9EDh
		add	eax, 2AFC0000h
		xor	eax, 0FFFF3612h
		xor	eax, esi
		or	eax, esi
		imul	esi, [ebp+var_14], 7FF1155Fh
		sub	esi, edi
		imul	edi, eax, 53C5D48Ah
		lea	esi, [esi+edi-1EDB1B61h]
		imul	edi, [ebp+var_14], 35FA5AA6h
		lea	ecx, [edi+ecx-3629FB4Dh]
		lea	edi, [ecx+eax*4]
		and	edi, 0C6F864EAh
		imul	edi, 0D61D15BBh
		imul	ecx, [ebp+var_130], 0E50B311Dh
		lea	edi, [esi+edi]
		imul	esi, [ebp+var_2C], 449856B7h
		sub	esi, [ebp+var_60]
		mov	[ebp+var_10], edi
		lea	eax, [esi+edx+7F37E974h]
		sub	edx, [ebp+var_60]
		shl	eax, 14h
		imul	esi, eax, 5FF1935h
		lea	edx, [edx+ecx+7F37E974h]
		shr	edx, 0Ch
		imul	edx, 7355D925h
		lea	eax, [eax+eax+1FFFFFh]
		add	edx, 76A1EECCh
		imul	ecx, edx, 6FA9EAD1h
		imul	edx, 7059355Ah
		lea	ecx, [esi+ecx-34B2F432h]
		add	edx, 7F95D049h
		or	edx, eax
		imul	eax, [ebp+var_B8], 2BC74E27h
		imul	edx, 0FA00E6CBh
		add	eax, 310A5ABh
		shr	eax, 7
		imul	eax, 2ACC0045h
		lea	edx, [ecx+edx]
		mov	ecx, [ebp+var_B8]
		mov	[ebp+var_3C], edx
		add	eax, 4F3EAD1Dh
		imul	edx, eax, 0D628BE2Bh
		shl	ecx, 19h
		imul	eax, 2D26251Ah
		lea	edx, [ecx+edx+613F01ADh]
		imul	ecx, [ebp+var_B8], 9C000000h
		add	eax, 154F3A0Fh
		sub	ecx, 50000001h
		or	eax, ecx
		imul	eax, 0AEC0BE69h
		lea	eax, [edx+eax]
		mov	[ebp+var_2C], eax
		mov	edi, [ebp+var_28]
		mov	edx, [ebp+var_30]
		sub	edx, [ebp+var_38]
		add	edx, [ebp+var_28]
		lea	eax, [edi+edi-7407DDA0h]
		and	eax, 65B5BC44h
		sub	edx, eax
		imul	edx, 972AA73Bh
		add	edx, [ebp+var_120]
		lea	eax, [edx+edx*2]
		imul	edx, 15C660Dh
		shl	eax, 1Bh
		sub	eax, 1760B48Bh
		imul	esi, eax, 0DBEB3D0Bh
		sub	edx, 3477C81h
		shr	edx, 5
		imul	edx, 7B5C50BDh
		imul	eax, 0C070F71Eh
		add	edx, 39B86663h
		imul	ecx, edx, 2EB2FCA9h
		add	eax, 48574549h
		imul	edx, 4AFC552Ah
		lea	esi, [esi+ecx-75F44E86h]
		sub	edx, 29B3AB3Dh
		or	edx, eax
		imul	edx, 972AA73Bh
		lea	ecx, [esi+edx]
		imul	edx, [ebp+var_2C], 2BC74E27h
		imul	eax, [ebp+var_10], 57F9311Ah
		imul	esi, [ebp+var_10], 269F64D1h
		add	edx, 5A94A5ABh
		add	eax, 3BA5C277h
		mov	[ebp+var_FC], eax
		imul	eax, [ebp+var_C], 0A35652F2h
		mov	[ebp+var_6C], edx
		sub	eax, 3CC21E81h
		mov	[ebp+var_60], eax
		mov	eax, edx
		imul	edx, [ebp+var_C], 0EEBB4B2Dh
		xor	eax, 793Dh
		sub	eax, 57840000h
		xor	eax, 7FFCC14Ah
		lea	edx, [esi+edx+39385334h]
		mov	esi, [ebp+var_60]
		imul	edx, 540C16FDh
		or	esi, [ebp+var_FC]
		sub	edx, esi
		mov	esi, [ebp+var_8C]
		add	edx, 7CB51F96h
		xor	edx, 793Dh
		sub	edx, 57840000h
		xor	eax, edx
		lea	edi, [eax+3B5BA7A8h]
		add	eax, eax
		add	esi, [ebp+var_58]
		and	eax, 0FFF98294h
		mov	edx, eax
		sub	edx, edi
		sub	edx, esi
		lea	esi, [edi+esi+43057B91h]
		sub	esi, eax
		add	esi, esi
		imul	eax, [ebp+var_3C], 0E50B311Dh
		or	esi, 9F7B52BCh
		lea	esi, [edx+esi-5CA726A1h]
		imul	edx, [ebp+var_9C], 40EB7CFDh
		mov	[ebp+var_14], esi
		mov	[ebp+var_28], eax
		add	eax, 23B423CDh
		mov	[ebp+var_38], eax
		mov	[ebp+var_30], edx
		mov	eax, edx
		mov	edx, [ebp+var_38]
		add	eax, 224736F5h
		xor	eax, 0EEABh
		add	eax, 0D500000h
		xor	eax, 0E3288AF0h
		xor	edx, 0EEABh
		add	edx, 0D500000h
		imul	esi, [ebp+var_1C], 0F1F04761h
		xor	eax, edx
		imul	edx, [ebp+var_68], 0F8B8BB37h
		lea	edi, [eax-17ACED5Ah]
		add	eax, eax
		and	eax, 0C65115E0h
		lea	edx, [esi+edx-3AE965CBh]
		mov	esi, [ebp+var_84]
		imul	edx, 734C1579h
		add	edx, esi
		sub	esi, [ebp+var_68]
		lea	esi, [esi+esi-4552D62Fh]
		and	esi, [ebp+var_108]
		sub	edx, esi
		imul	esi, ecx, 0FEA399F3h
		sub	esi, edi
		add	esi, eax
		sub	eax, edi
		lea	edx, [edx+esi+24340D11h]
		imul	esi, ecx, 0FD4733E6h
		lea	eax, [eax+eax+0A550F6Bh]
		sub	esi, 44565BA8h
		and	eax, esi
		sub	edx, eax
		mov	edi, edx
		and	edx, 31ED5B80h
		or	edi, 31ED5B80h
		sub	edi, edx
		mov	edx, [ebp+var_6C]
		imul	eax, [ebp+var_10], 2BFC988Dh
		mov	[ebp+var_84], edi
		add	edi, 22B5C28Dh
		mov	[ebp+var_B8], edi
		xor	edx, 0F1D6h
		add	eax, 7556E13Bh
		sub	edx, 57840000h
		xor	eax, 0F1D6h
		xor	edx, 75890DCAh
		sub	eax, 57840000h
		xor	edx, eax
		imul	eax, ecx, 15C660Dh
		mov	esi, edx
		not	esi
		mov	[ebp+var_1C], eax
		sub	eax, 160ED22Dh
		xor	eax, 20CEh
		add	eax, 383A0000h
		xor	eax, esi
		xor	eax, 0FFFFDF31h
		or	eax, esi
		mov	esi, ecx
		not	esi
		mov	edi, eax
		imul	esi, 15C660Dh
		not	edi
		add	esi, 11B9233Eh
		sub	esi, edx
		lea	esi, [esi+edi*2]
		mov	edi, [ebp+var_1C]
		lea	edx, [edx+edi-6A0D0019h]
		lea	eax, [edx+eax*2]
		lea	eax, [eax+eax+18705BDDh]
		and	eax, 7956407Ch
		imul	edx, [ebp+var_18], 0E67C938Dh
		add	esi, eax
		imul	eax, [ebp+var_104], 9CA65131h
		lea	edi, [edx+eax-35018704h]
		imul	eax, [ebp+var_4C], 6359AECFh
		imul	edx, [ebp+var_18], 35E99DC6h
		add	edi, eax
		mov	eax, [ebp+var_4C]
		sub	eax, [ebp+var_104]
		sub	edx, 6208479Ch
		lea	eax, [eax+eax-33FE54FFh]
		and	eax, edx
		imul	eax, 9CA65131h
		lea	edx, [esi+esi+2199E97Ah]
		and	edx, 92445BE8h
		sub	esi, edx
		add	edi, eax
		mov	eax, [ebp+var_38]
		imul	edi, 9E6F1249h
		imul	esi, 0CF6198F9h
		imul	edx, [ebp+var_50], 3211AC1h
		sub	edx, [ebp+var_40]
		xor	eax, 7ACFh
		add	eax, 0D500000h
		lea	esi, [edi+esi+6E26912h]
		xor	eax, 0FF9D1A56h
		mov	[ebp+var_1C], esi
		mov	esi, [ebp+var_48]
		add	esi, esi
		and	esi, 0C21F75ECh
		lea	edx, [esi+edx-643A80DDh]
		sub	esi, [ebp+var_40]
		imul	edi, [ebp+var_50], 6423582h
		and	[ebp+var_54], 702599C4h
		lea	esi, [esi+esi+199171FBh]
		add	edi, 38998C4Ch
		and	esi, edi
		sub	edx, esi
		imul	edi, [ebp+var_98], 0F54F250Dh
		xor	edx, 7ACFh
		imul	esi, [ebp+var_EC], 0FDC6FF1h
		add	edx, 0D500000h
		xor	eax, edx
		lea	edx, [eax+71BB868Ah]
		add	eax, eax
		and	eax, 0FF3A34ACh
		lea	esi, [edi+esi-516C43E1h]
		sub	edx, eax
		mov	[ebp+var_18], esi
		imul	edx, 0D25F7AF1h
		imul	esi, [ebp+var_EC], 0B68772E2h
		imul	edi, [ebp+var_98], 57F9311Ah
		imul	eax, [ebp+var_2C], 6E9C9F4Fh
		sub	esi, 36F5B53Dh
		add	edi, 3BA5C277h
		or	esi, edi
		mov	edi, [ebp+var_54]
		imul	esi, 0BF53217Fh
		add	esi, [ebp+var_18]
		imul	esi, 9288BB8Fh
		lea	edx, [esi+edx+3E83A74Eh]
		mov	[ebp+var_6C], edx
		imul	edx, [ebp+var_9C], 0DCD9A135h
		lea	esi, [edx+eax+4158731h]
		imul	edx, [ebp+var_2C], 578E9C4Eh
		imul	eax, [ebp+var_9C], 81D6F9FAh
		add	edx, 6214B57h
		add	eax, 5F2E6DEBh
		or	edx, eax
		imul	eax, edx, 0C9B9F967h
		imul	edx, [ebp+var_74], 0A2597A23h
		lea	eax, [esi+eax]
		imul	esi, [ebp+var_7C], 87F604EFh
		add	esi, edx
		imul	edx, [ebp+var_54], 7809FB11h
		sub	edi, [ebp+var_44]
		lea	edx, [esi+edx+5099C12Ah]
		lea	esi, [edi+edi-702599C5h]
		and	esi, [ebp+var_E8]
		imul	edi, ecx, 0A434D62Fh
		imul	ecx, 2B8CC1Ah
		imul	esi, 87F604EFh
		add	ecx, 44565BA7h
		add	edx, esi
		imul	esi, eax, 0B457F563h
		imul	eax, 8275DB52h
		imul	edx, 27AB1AB7h
		lea	esi, [edi+esi-4FB4EEEDh]
		add	eax, 5E808Fh
		or	eax, ecx
		imul	eax, 2C9C05D5h
		lea	eax, [esi+eax]
		mov	esi, 6DD873F3h
		imul	eax, 3BF058F5h
		lea	eax, [edx+eax-3956EE9Eh]
		mov	[ebp+var_80], eax
		mov	edx, [ebp+var_50]
		imul	ecx, [ebp+var_50], 0FCDEE53Fh
		sub	esi, [ebp+var_40]
		add	edx, 1
		lea	eax, [ecx+384D39D9h]
		xor	eax, 0E6D4h
		imul	edx, 3211AC1h
		sub	eax, 549A0000h
		add	ecx, [ebp+var_40]
		xor	eax, esi
		xor	eax, 0FFFF192Bh
		or	eax, esi
		sub	edx, 15552FB5h
		mov	edi, eax
		sub	edx, [ebp+var_40]
		not	edi
		lea	eax, [ecx+eax*2]
		mov	ecx, 0F3CAA08h
		lea	eax, [eax+eax-144A7431h]
		and	eax, 572BF22Eh
		lea	edx, [edx+edi*2]
		add	edx, eax
		imul	eax, [ebp+var_C], 51AB2979h
		sub	ecx, edx
		add	eax, 28E4F0BFh
		xor	eax, 0FF3h
		add	eax, 38BA0000h
		xor	eax, ecx
		xor	eax, 0FFFFF00Ch
		or	eax, ecx
		mov	ecx, [ebp+var_C]
		mov	edi, eax
		not	edi
		not	ecx
		imul	ecx, 51AB2979h
		sub	ecx, edx
		lea	ecx, [ecx+edi*2+62791BDDh]
		imul	edi, [ebp+var_C], 0D1AB2979h
		add	edx, edi
		lea	eax, [edx+eax*2]
		lea	eax, [eax+eax-5B3B728Fh]
		and	eax, 0FFFBEA52h
		lea	eax, [ecx+eax]
		imul	edx, [ebp+var_E4], 24A8BAF7h
		imul	ecx, [ebp+var_74], 3B83DB49h
		imul	edi, [ebp+var_74], 2B8CC1Ah
		lea	edx, [ecx+edx-6E4351CCh]
		imul	ecx, [ebp+var_E4], 1B48E266h
		add	edi, 44565BA7h
		sub	ecx, 55C4855Dh
		or	ecx, edi
		imul	ecx, 0C46A28D3h
		lea	edi, [eax+eax+39A3A378h]
		and	edi, 6ACF6D90h
		sub	edi, eax
		add	edx, ecx
		imul	edx, 0F043FFC7h
		imul	edi, 139716FBh
		imul	eax, [ebp+var_50], 363B5A3Bh
		lea	edi, [edx+edi-21AE886Fh]
		imul	edx, [ebp+var_C], 0BF55EF5Dh
		mov	[ebp+var_58], edi
		imul	edi, [ebp+var_10], 0C180BE19h
		lea	ecx, [eax+edx-589BA29h]
		imul	edx, [ebp+var_50], 0F9BDCA7Eh
		sub	edx, 38998C4Dh
		or	edx, [ebp+var_60]
		imul	eax, edx, 0C478DFFBh
		lea	eax, [ecx+eax]
		mov	ecx, [ebp+var_100]
		lea	edx, [ecx+ecx+1C3790E4h]
		and	edx, 0C36B35F0h
		sub	ecx, edx
		imul	edx, ecx, 0ED06ACEBh
		imul	ecx, eax, 98493159h
		imul	eax, 0D151599Ah
		lea	ecx, [edi+ecx-5A98709Ch]
		add	eax, 212F92DBh
		or	eax, [ebp+var_FC]
		imul	eax, 5777E943h
		lea	eax, [ecx+eax]
		imul	eax, 517EFF39h
		lea	eax, [edx+eax+0A42DEF6h]
		mov	edx, [ebp+var_30]
		mov	[ebp+var_54], eax
		mov	eax, [ebp+var_9C]
		sub	edx, 1670C90Bh
		not	eax
		xor	edx, 0EEABh
		imul	eax, 40EB7CFDh
		add	edx, 46080000h
		xor	edx, 0FFFF1154h
		xor	edx, esi
		or	edx, esi
		mov	esi, [ebp+var_38]
		add	eax, 53C6B096h
		mov	ecx, edx
		sub	eax, [ebp+var_40]
		not	ecx
		xor	esi, 4BF8h
		lea	eax, [eax+ecx*2]
		mov	ecx, [ebp+var_40]
		add	esi, 0D500000h
		add	ecx, [ebp+var_30]
		lea	edx, [ecx+edx*2]
		lea	edx, [edx+edx-7C8279F9h]
		and	edx, 1524EB3Eh
		add	eax, edx
		mov	edx, 0DF2C6C39h
		sub	edx, eax
		xor	esi, edx
		xor	esi, 0FFFFB407h
		or	esi, edx
		mov	edx, [ebp+var_3C]
		mov	ecx, esi
		not	ecx
		add	edx, 1
		imul	edx, 1AF4CEE3h
		sub	edx, 52D2D1B9h
		sub	edx, eax
		add	eax, [ebp+var_28]
		lea	edx, [edx+ecx*2]
		imul	ecx, [ebp+var_74], 0ED00F60Dh
		lea	eax, [eax+esi*2]
		lea	eax, [eax+eax-5C5090D5h]
		and	eax, 58528778h
		imul	esi, [ebp+var_80], 0D9570C97h
		add	edx, eax
		imul	eax, [ebp+var_20], 48DD2FFFh
		mov	[ebp+var_4C], esi
		lea	esi, [ecx+eax+0D534C48h]
		mov	eax, [ebp+var_20]
		sub	eax, [ebp+var_CC]
		lea	ecx, [eax+eax+7C9466ABh]
		and	ecx, [ebp+var_E8]
		add	ecx, [ebp+var_CC]
		lea	eax, [edx+edx+73BA0F0Ch]
		and	eax, 8F6919AAh
		imul	ecx, 0B722D001h
		sub	edx, eax
		imul	edx, 0EB0B0991h
		lea	ecx, [esi+ecx]
		imul	ecx, 33991h
		lea	edx, [ecx+edx+4685C02Ah]
		mov	[ebp+var_68], edx
		mov	edx, [ebp+var_4C]
		imul	edi, [ebp+var_6C], 0A4A5C9EFh
		imul	esi, [ebp+var_58], 86687BCDh
		add	edx, edi
		lea	ecx, [edx+64DF3A82h]
		mov	eax, ecx
		and	ecx, 18C75920h
		or	eax, 18C75920h
		sub	eax, ecx
		lea	ecx, [eax+eax]
		and	ecx, 0CE714DBEh
		sub	eax, ecx
		lea	ecx, [eax+esi+523761A5h]
		imul	eax, [ebp+var_68], 0FD98D771h
		xor	ecx, 34270577h
		imul	esi, [ebp+var_1C], 0A2FE5889h
		mov	[ebp+var_3C], edi
		imul	edi, [ebp+var_54], 9635E67h
		mov	[ebp+var_38], eax
		lea	eax, [eax+ecx-448C5082h]
		add	ecx, ecx
		and	ecx, 684E0AEEh
		sub	eax, ecx
		xor	eax, 9D771FC7h
		imul	ecx, eax, 0E0DE7541h
		add	eax, eax
		and	eax, 3AEE3F8Eh
		imul	eax, 1F218ABFh
		lea	ecx, [esi+ecx-54F7D1FFh]
		imul	esi, [ebp+var_68], 267288Fh
		lea	eax, [ecx+eax]
		lea	ecx, [edx+0F89E52Ch]
		mov	[ebp+var_50], eax
		mov	eax, ecx
		mov	[ebp+var_44], ecx
		and	eax, 4FF50DC6h
		or	ecx, 4FF50DC6h
		sub	eax, ecx
		imul	ecx, [ebp+var_1C], 449856B7h
		mov	[ebp+var_48], esi
		lea	ecx, [esi+ecx+66E03118h]
		imul	esi, eax, 0CF12373h
		imul	eax, -2
		lea	esi, [edi+esi-294F5264h]
		mov	edi, [ebp+var_48]
		imul	esi, 948FB9BBh
		and	eax, 6015E472h
		lea	edx, [edi+edx-77C2C4DBh]
		mov	edi, [ebp+var_14]
		lea	eax, [esi+eax]
		mov	esi, [ebp+var_84]
		add	ecx, eax
		mov	eax, ecx
		and	ecx, 1EF04509h
		or	eax, 1EF04509h
		add	eax, 6DD873F4h
		add	esi, esi
		sub	eax, ecx
		mov	ecx, edx
		mov	[ebp+var_40], eax
		mov	eax, esi
		and	edx, 803C9F04h
		or	eax, 9C2548FEh
		or	ecx, 803C9F04h
		sub	eax, [ebp+var_B8]
		and	esi, 9C2548FEh
		lea	edi, [edi+edi-6C37FC9Ch]
		and	edi, 9F7B52BCh
		lea	eax, [ecx+eax-2B9980F7h]
		sub	ecx, edx
		add	ecx, ecx
		sub	eax, edx
		and	ecx, 0FF86C1F6h
		sub	eax, ecx
		xor	eax, 4EC03E7Bh
		lea	edx, [eax+7F4B22D6h]
		imul	ecx, [ebp+var_54], 0F257643Dh
		mov	[ebp+var_2C], edx
		imul	edx, [ebp+var_58], 79978433h
		mov	[ebp+var_C], edi
		mov	[ebp+var_9C], ecx
		mov	[ebp+var_98], esi
		mov	[ebp+var_18], edx
		lea	edx, [ecx+edx+13AF0EA6h]
		mov	ecx, edx
		mov	edi, edx
		or	ecx, 0A4DF3F32h
		and	edi, 0A4DF3F32h
		sub	ecx, 3BA21FFDh
		sub	ecx, edi
		mov	edi, [ebp+var_14]
		sub	edi, [ebp+var_C]
		sub	esi, [ebp+var_B8]
		mov	[ebp+var_10], edi
		sub	edi, ecx
		lea	ecx, [ecx+ecx+77443FFAh]
		or	ecx, 0B641819Ah
		mov	[ebp+var_74], esi
		imul	esi, [ebp+var_1C], 7ABCA5AFh
		add	edi, ecx
		imul	edi, 0C9DE5A51h
		imul	ecx, [ebp+var_74], 3621A5AFh
		lea	ecx, [edi+ecx]
		mov	edi, [ebp+var_4C]
		imul	ecx, 0E3716707h
		lea	ecx, [esi+ecx-7C0FFED8h]
		mov	[ebp+var_20], ecx
		mov	ecx, [ebp+var_18]
		lea	esi, [edi+ecx-0E1B4DFAh]
		mov	ecx, esi
		and	esi, 7C410BA7h
		or	ecx, 7C410BA7h
		sub	ecx, esi
		lea	esi, [ecx+262500BBh]
		add	ecx, ecx
		and	ecx, 77DE8B0h
		mov	edi, ecx
		mov	[ebp+var_60], esi
		sub	edi, esi
		mov	esi, [ebp+var_9C]
		lea	esi, [esi+edi+4FDC2949h]
		mov	edi, [ebp+var_60]
		mov	[ebp+var_30], esi
		imul	esi, [ebp+var_54], 0DA89BC3h
		lea	esi, [edi+esi-2113D5D0h]
		sub	esi, ecx
		mov	ecx, [ebp+var_14]
		add	esi, esi
		or	esi, 0C31CF6BCh
		add	esi, [ebp+var_30]
		add	ecx, 4869FE89h
		sub	ecx, [ebp+var_C]
		sub	ecx, esi
		lea	esi, [esi+esi-20AD9DAEh]
		or	esi, 0C31CF6BCh
		lea	esi, [ecx+esi]
		mov	ecx, [ebp+var_84]
		xor	esi, 68AE8246h
		lea	edi, [esi+esi]
		or	edi, 0D15D048Ch
		add	ecx, 50C204A0h
		sub	ecx, [ebp+var_98]
		sub	ecx, esi
		mov	esi, [ebp+var_3C]
		lea	ecx, [edi+ecx]
		mov	edi, [ebp+var_9C]
		mov	[ebp+var_30], ecx
		lea	ecx, [edi+esi-39AA78FAh]
		mov	edi, [ebp+var_38]
		add	ecx, [ebp+var_18]
		mov	esi, ecx
		and	ecx, 0E7862870h
		or	esi, 0E7862870h
		sub	esi, ecx
		lea	ecx, [esi+edi-60397E6Ah]
		add	esi, esi
		mov	edi, [ebp+var_10]
		and	esi, 30F3AF1Eh
		sub	ecx, esi
		mov	esi, [ebp+var_10]
		xor	ecx, 0BAC30AA3h
		sub	esi, ecx
		add	ecx, ecx
		or	ecx, 75861546h
		lea	ecx, [esi+ecx+77227A2Ah]
		mov	esi, [ebp+var_44]
		mov	[ebp+var_98], ecx
		mov	ecx, [ebp+var_44]
		and	esi, 0A33BAB63h
		or	ecx, 0A33BAB63h
		sub	ecx, esi
		lea	edi, [ecx+edi]
		add	ecx, ecx
		and	ecx, 0B988A938h
		sub	edi, ecx
		imul	edi, 0F3A6C7D5h
		imul	ecx, [ebp+var_74], 0C59382Bh
		imul	esi, [ebp+var_1C], 61E89CF1h
		add	edi, ecx
		mov	ecx, edx
		imul	edi, 505C5A45h
		or	ecx, 16CA619Dh
		and	edx, 16CA619Dh
		add	ecx, 6C7F5E34h
		sub	ecx, edx
		lea	edx, [ecx+ecx+27014398h]
		lea	edi, [esi+edi+7E67BD7Ah]
		and	edx, 0D26B3CC4h
		mov	[ebp+var_44], edi
		mov	edi, [ebp+var_48]
		mov	esi, edx
		sub	esi, ecx
		lea	esi, [esi+edi-2ABA1ECh]
		mov	edi, [ebp+var_38]
		lea	ecx, [ecx+edi+402EA35h]
		sub	ecx, edx
		mov	edx, [ebp+var_40]
		add	ecx, ecx
		or	ecx, 6C466F28h
		lea	ecx, [esi+ecx]
		mov	[ebp+var_84], ecx
		lea	ecx, [edx+edx+244F1818h]
		and	ecx, 0C21F75ECh
		sub	ecx, edx
		lea	edx, [ecx-73374703h]
		imul	ecx, 2459F990h
		shr	edx, 1Ch
		mov	esi, edx
		not	esi
		add	ecx, 468F02B8h
		add	esi, 10h
		mov	[ebp+var_40], ecx
		mov	ecx, edx
		or	esi, 0FFD1B9C8h
		neg	ecx
		add	esi, esi
		sub	ecx, 225DDD89h
		sub	ecx, esi
		lea	esi, [edx+esi+2E4629h]
		imul	edx, [ebp+var_40], 79ED44A9h
		add	eax, eax
		and	eax, 9D807CF6h
		sub	[ebp+var_2C], eax
		imul	eax, [ebp+var_2C], 0F61A7FABh
		add	edx, 5ECFE467h
		xor	edx, 4524h
		add	edx, 60420000h
		xor	edx, esi
		xor	edx, 0FFFFBADBh
		or	edx, esi
		mov	esi, [ebp+var_40]
		mov	edi, edx
		not	edi
		not	esi
		imul	esi, 79ED44A9h
		sub	esi, ecx
		lea	esi, [esi+edi*2+25624015h]
		imul	edi, [ebp+var_40], 0F9ED44A9h
		add	ecx, edi
		lea	edx, [ecx+edx*2]
		lea	edx, [edx+edx-3D7D086Fh]
		and	edx, 0C243F982h
		lea	edx, [esi+edx]
		mov	esi, 5C31E8F3h
		mov	[ebp+var_40], edx
		imul	edx, [ebp+var_1C], 0F2A34AC3h
		lea	ecx, [edx+eax-4C71D317h]
		imul	ecx, 40EB7CFDh
		add	ecx, 2F9736F5h
		mov	[ebp+var_18], ecx
		shr	ecx, 18h
		imul	eax, [ebp+var_20], 0E121A000h
		mov	[ebp+var_3C], ecx
		mov	ecx, 0EB5DE266h
		sub	ecx, [ebp+var_30]
		sub	eax, 266C2DAh
		mov	[ebp+var_2C], eax
		imul	eax, [ebp+var_20], 51AB2979h
		add	eax, 619EF0BFh
		shr	eax, 13h
		imul	eax, 4A78E187h
		add	eax, 30E2F6Bh
		mov	[ebp+var_10], eax
		mov	eax, ecx
		shr	eax, 0Fh
		sub	esi, eax
		lea	eax, [eax+eax-3FFFFh]
		or	eax, 0B6F04E93h
		add	esi, eax
		lea	edx, [esi+esi-6F50207Ah]
		and	edx, 490FB16Ch
		imul	ecx, 2B760000h
		imul	eax, edx, 29E2EA45h
		sub	edx, esi
		lea	edx, [edx+edx+26406F0Dh]
		lea	eax, [ecx+eax+2B64D037h]
		mov	ecx, [ebp+var_30]
		add	ecx, 14A21D99h
		shl	ecx, 12h
		and	edx, ecx
		mov	ecx, [ebp+var_98]
		add	edx, esi
		imul	edx, 0D61D15BBh
		sub	ecx, 1843D9BCh
		imul	ecx, 10400000h
		lea	edx, [eax+edx]
		mov	eax, 1843D9BCh
		sub	eax, [ebp+var_98]
		mov	[ebp+var_28], edx
		sub	ecx, 1529B5FBh
		shr	eax, 0Ah
		imul	edx, eax, 0DF8FE65Bh
		lea	eax, [eax+eax-7FFFFFh]
		and	eax, 0BAE0049Ch
		imul	eax, 207019A5h
		lea	edx, [edx+eax+5D44CC15h]
		imul	eax, ecx, 261A303Fh
		imul	esi, edx, 0D406D9D3h
		imul	edi, edx, 0A8DDB3AFh
		imul	edx, 57F24C5Ah
		add	eax, 6DA5D8C4h
		xor	eax, 9F06h
		sub	esi, 1
		add	eax, 577B0000h
		xor	eax, 0FFFF60F9h
		xor	eax, esi
		or	eax, esi
		imul	esi, ecx, 0BBE3240Bh
		imul	ecx, 4C34607Eh
		sub	esi, edi
		lea	edx, [ecx+edx-75BE4E73h]
		mov	ecx, [ebp+var_44]
		imul	edi, eax, 0BFE326Ah
		lea	eax, [edx+eax*4]
		and	eax, 0BAE0049Ch
		imul	eax, 0FA00E6CBh
		lea	esi, [esi+edi-4D3F1F4Dh]
		lea	eax, [esi+eax]
		mov	[ebp+var_EC], eax
		imul	eax, [ebp+var_44], 2BC74E27h
		shl	ecx, 18h
		add	eax, 310A5ABh
		shr	eax, 8
		imul	eax, 0E15A203h
		sub	eax, 6DEABAF4h
		imul	edx, eax, 52C177DDh
		imul	eax, 0B3933156h
		lea	edx, [ecx+edx-42B793D0h]
		imul	ecx, [ebp+var_44], 4E000000h
		sub	eax, 31407E07h
		add	ecx, 57FFFFFFh
		or	eax, ecx
		mov	ecx, [ebp+var_84]
		imul	eax, 0AEC0BE69h
		lea	eax, [edx+eax]
		mov	[ebp+var_38], eax
		mov	eax, [ebp+var_74]
		lea	edx, [ecx+ecx-6EF4FFBAh]
		or	edx, 6C466F28h
		mov	ecx, 74DB6F11h
		add	eax, 39AA2AB4h
		sub	eax, [ebp+var_14]
		add	eax, [ebp+var_C]
		add	eax, [ebp+var_84]
		sub	eax, edx
		mov	edx, eax
		shr	edx, 3
		sub	ecx, edx
		lea	edx, [edx+edx-3FFFFFFFh]
		or	edx, 2E99433Fh
		add	ecx, edx
		imul	edi, ecx, 972AA73Bh
		lea	edx, [ecx+ecx+27AFDE9Eh]
		lea	esi, [eax+eax*2]
		and	edx, 0D166BCC0h
		shl	esi, 1Dh
		not	eax
		lea	edi, [esi+edi-78E113CFh]
		imul	esi, edx, 68D558C5h
		sub	edx, ecx
		shl	eax, 1Eh
		lea	esi, [edi+esi]
		lea	edi, [edx+edx+6E964A1h]
		and	edi, eax
		imul	edx, [ebp+var_2C], 0E801EDC5h
		imul	eax, [ebp+var_10], 3D9F6F2Fh
		imul	edi, 972AA73Bh
		lea	ecx, [edx+eax-4D4D7CA3h]
		imul	edx, [ebp+var_10], 991E286Eh
		imul	eax, [ebp+var_2C], 3F29DE3Ah
		imul	ecx, 51AB2979h
		lea	edi, [esi+edi]
		sub	edx, 90B57F9h
		add	eax, 3F5B3163h
		or	edx, eax
		sub	ecx, edx
		add	ecx, 28E4F0BFh
		imul	edx, [ebp+var_EC], 0E50B311Dh
		mov	eax, ecx
		xor	eax, 4BF8h
		xor	ecx, 0EEABh
		add	eax, 38BA0000h
		xor	eax, 11578D5Eh
		mov	[ebp+var_74], eax
		lea	eax, [edx-7B5DC33h]
		add	edx, 23B423CDh
		xor	eax, 4BF8h
		add	eax, 38BA0000h
		xor	[ebp+var_74], eax
		imul	eax, [ebp+var_38], 2BC74E27h
		mov	esi, [ebp+var_74]
		mov	[ebp+var_84], edi
		mov	[ebp+var_10], ecx
		add	eax, 5A94A5ABh
		xor	eax, 0D749h
		not	esi
		sub	eax, 57840000h
		xor	eax, esi
		xor	eax, 0FFFF28B6h
		or	eax, esi
		mov	[ebp+var_44], eax
		mov	[ebp+var_C], edx
		mov	ecx, [ebp+var_18]
		imul	eax, [ebp+var_3C], 9E58055h
		imul	edx, [ebp+var_18], 0E5805500h
		mov	esi, [ebp+var_3C]
		shl	ecx, 9
		add	ecx, 1FFh
		lea	edx, [edx+eax-38BE3FAEh]
		imul	edx, 40EB7CFDh
		lea	eax, [esi+esi-1FFh]
		or	eax, ecx
		mov	ecx, [ebp+var_C]
		sub	edx, eax
		lea	eax, [edx+224736F5h]
		xor	eax, 0EEABh
		add	eax, 0D500000h
		xor	eax, 21C050E9h
		xor	ecx, 0EEABh
		add	ecx, 0D500000h
		sub	edx, 922C90Bh
		xor	eax, ecx
		xor	edx, 0EEABh
		lea	ecx, [eax-19BCD664h]
		add	eax, eax
		imul	edi, [ebp+var_38], 0E0FB89Fh
		and	eax, 4380A1D2h
		imul	esi, ecx, 74744C9h
		add	edx, 38BA0000h
		lea	esi, [edi+esi-5BDF7BCFh]
		imul	esi, 734C1579h
		sub	esi, eax
		sub	eax, ecx
		mov	ecx, [ebp+var_C]
		mov	[ebp+var_3C], esi
		lea	eax, [eax+eax-76FA4E9Bh]
		imul	esi, [ebp+var_38], 0A87163B2h
		xor	ecx, 4BF8h
		add	ecx, 0D500000h
		sub	esi, 6214B58h
		and	eax, esi
		mov	[ebp+var_20], eax
		mov	eax, [ebp+var_10]
		mov	[ebp+var_98], esi
		imul	esi, [ebp+var_50], 0A5C72B9h
		add	eax, 38BA0000h
		xor	edx, eax
		mov	edi, edx
		xor	edi, 629B31E4h
		mov	eax, edi
		not	eax
		xor	ecx, eax
		xor	ecx, 0FFFFB407h
		or	ecx, eax
		mov	eax, [ebp+var_40]
		mov	[ebp+var_C], ecx
		mov	[ebp+var_E8], edi
		imul	edi, [ebp+var_50], 6423582h
		lea	ecx, [eax+eax+244F1818h]
		and	ecx, 0C21F75ECh
		mov	eax, ecx
		sub	eax, [ebp+var_40]
		add	edi, 38998C4Ch
		lea	eax, [eax+eax+199171FBh]
		mov	[ebp+var_2C], eax
		and	edi, eax
		imul	eax, ecx, 3E55ADF9h
		add	edi, [ebp+var_40]
		lea	eax, [esi+eax-32D7E6BDh]
		imul	edi, 0C1AA5207h
		imul	esi, [ebp+var_50], 0FCDEE53Fh
		imul	ecx, 29EF7059h
		lea	edi, [eax+edi]
		mov	[ebp+var_10], esi
		add	esi, 384D39D9h
		mov	[ebp+var_18], esi
		mov	eax, [ebp+var_18]
		imul	esi, [ebp+var_28], 2BFC988Dh
		mov	[ebp+var_90], edi
		xor	eax, 0F1D6h
		lea	edi, [esi+726CE13Bh]
		sub	eax, 549A0000h
		xor	edi, 0F1D6h
		xor	eax, 1D8EF8B2h
		sub	edi, 549A0000h
		xor	eax, edi
		lea	edi, [eax-7EA1805Bh]
		add	eax, eax
		and	eax, 3B1DF164h
		mov	[ebp+var_30], eax
		mov	eax, [ebp+var_2C]
		and	eax, [ebp+var_98]
		add	eax, [ebp+var_40]
		mov	[ebp+var_A0], edi
		imul	edi, [ebp+var_38], 601BC471h
		imul	eax, 0D6108FA7h
		lea	ecx, [edi+ecx+2399FF52h]
		lea	eax, [ecx+eax]
		mov	ecx, edx
		mov	[ebp+var_94], eax
		xor	ecx, 579F0601h
		xor	edx, 0A860F9FEh
		imul	eax, [ebp+var_84], 2B8CC1Ah
		lea	edx, [esi+edx]
		mov	[ebp+var_BC], eax
		lea	eax, [esi+6680E13Bh]
		xor	eax, 0F1D6h
		sub	eax, 48AE0000h
		imul	esi, [ebp+var_28], 0D4036773h
		xor	eax, ecx
		xor	eax, 0FFFF0E29h
		or	eax, ecx
		lea	edx, [edx+eax*2]
		not	eax
		lea	ecx, [ecx+esi+0A3BF34Dh]
		lea	edx, [edx+edx+3BA5C27Bh]
		and	edx, 93AAC60Ch
		lea	eax, [ecx+eax*2]
		lea	eax, [edx+eax]
		mov	edx, [ebp+var_18]
		mov	[ebp+var_8C], eax
		mov	eax, 6DD873F3h
		sub	eax, [ebp+var_40]
		xor	edx, 0E6D4h
		sub	edx, 549A0000h
		xor	edx, eax
		xor	edx, 0FFFF192Bh
		or	edx, eax
		imul	eax, [ebp+var_50], 0E1C7825h
		imul	esi, [ebp+var_40], 0D7C6959Bh
		lea	ecx, [eax+esi+8629031h]
		imul	eax, edx, 0AF8D2B36h
		imul	esi, [ebp+var_88], 47987C4Bh
		lea	eax, [ecx+eax]
		mov	ecx, [ebp+var_40]
		add	ecx, [ebp+var_10]
		mov	[ebp+var_50], esi
		lea	edx, [ecx+edx*2]
		lea	ecx, [edx+edx-144A7431h]
		and	ecx, 0D129C76h
		imul	ecx, 28396A65h
		imul	edx, [ebp+var_84], 15C660Dh
		lea	ecx, [eax+ecx]
		imul	eax, ecx, 2135C893h
		sub	edx, 160ED22Dh
		xor	edx, 20CEh
		add	edx, 383A0000h
		mov	[ebp+var_E4], ecx
		mov	ecx, [ebp+var_64]
		sub	eax, 1
		xor	edx, eax
		xor	edx, 0FFFFDF31h
		or	edx, eax
		mov	[ebp+var_40], edx
		mov	edx, [ebp+var_64]
		lea	edx, [edx+edx+459AF22Ch]
		and	edx, 923191A0h
		sub	ecx, edx
		mov	[ebp+var_98], ecx
		imul	ecx, [ebp+var_5C], 8A1C67E5h
		mov	[ebp+var_10], edx
		mov	eax, ecx
		sub	eax, [ebp+var_98]
		lea	eax, [esi+eax-29972491h]
		mov	edx, eax
		and	eax, 32161F26h
		or	edx, 32161F26h
		sub	edx, eax
		imul	eax, [ebp+var_70], 0E91BCDDh
		imul	esi, [ebp+var_24], 2D90A3C5h
		lea	eax, [edx+eax+1B6E3A62h]
		add	edx, edx
		and	edx, 9BD3C1B2h
		sub	eax, edx
		xor	eax, 68EE0648h
		lea	edx, [eax+2C80E72Eh]
		add	eax, eax
		and	eax, 0D1DC0C90h
		sub	edx, eax
		imul	edx, 0E0DE7541h
		imul	edi, [ebp+var_88], 0B86783B5h
		lea	edx, [esi+edx-0AC30BE7h]
		mov	esi, [ebp+var_34]
		mov	[ebp+var_18], edx
		mov	edx, [ebp+var_98]
		mov	[ebp+var_A8], edi
		lea	eax, [edi+edx-37B0C221h]
		mov	edx, [ebp+var_50]
		sub	edx, [ebp+var_98]
		add	eax, eax
		mov	[ebp+var_7C], eax
		or	eax, 8AAC1F42h
		lea	edi, [edx+eax+4D70487Fh]
		mov	edx, [ebp+var_34]
		lea	eax, [esi+esi+0AD87A94h]
		and	eax, 9D006702h
		lea	esi, [edi+edi+49D4D402h]
		sub	edx, 165408D7h
		or	esi, 8AAC1F42h
		sub	edx, eax
		sub	edx, edi
		mov	edi, [ebp+var_78]
		lea	edx, [esi+edx]
		xor	edx, 0EEA83E82h
		imul	esi, [ebp+var_A4], 97C903F5h
		lea	edi, [edi+edi-93A1BEAh]
		mov	[ebp+var_2C], edx
		mov	[ebp+var_60], edi
		mov	edx, [ebp+var_78]
		and	edi, 0A12CEDCAh
		mov	[ebp+var_104], edi
		sub	edx, edi
		mov	[ebp+var_100], edx
		imul	edi, [ebp+var_98], 0B345AF4Bh
		imul	edx, [ebp+var_5C], 0FEEF04E9h
		lea	edi, [edi+edx-2D6B11DCh]
		imul	edx, [ebp+var_88], 0D8255107h
		lea	edx, [edi+edx]
		mov	edi, [ebp+var_34]
		imul	edx, 2CC7E263h
		sub	edi, eax
		mov	[ebp+var_FC], edi
		mov	edi, eax
		sub	edi, [ebp+var_34]
		mov	[ebp+var_CC], edi
		sub	edi, edx
		mov	[ebp+var_88], edi
		mov	edi, [ebp+var_FC]
		lea	edx, [edx+edi+705E601Ah]
		mov	edi, [ebp+var_88]
		add	edx, edx
		or	edx, 106C4880h
		lea	edx, [edi+edx-1694E03Fh]
		mov	[ebp+var_108], edx
		mov	edx, [ebp+var_CC]
		lea	ecx, [edx+ecx+4C6AF8ADh]
		mov	edx, [ebp+var_FC]
		mov	[ebp+var_88], ecx
		imul	ecx, [ebp+var_5C], 75E3981Bh
		lea	edi, [edx+ecx-2020FDD9h]
		mov	edx, 142C82B5h
		add	edi, edi
		sub	edx, esi
		or	edi, 0D577DB4Eh
		add	edi, [ebp+var_88]
		lea	ecx, [edi+edi-2E0BD0F6h]
		sub	edx, edi
		and	ecx, 0D577DB4Eh
		lea	edi, [esi+edi+58986701h]
		add	edx, ecx
		sub	edi, ecx
		mov	ecx, [ebp+var_60]
		add	edi, edi
		or	edi, 253A2AACh
		add	edx, edi
		or	ecx, 0A12CEDCAh
		sub	ecx, [ebp+var_78]
		imul	edi, [ebp+var_24], 0B1F2E693h
		add	ecx, edx
		lea	edx, [edx+edx+13C01E8h]
		and	edx, 253A2AACh
		sub	ecx, edx
		imul	edx, ecx, 5892D869h
		add	ecx, 4741AD5Ah
		and	ecx, 7ABD0D3Bh
		imul	ecx, 4EDA4F2Eh
		lea	edx, [edx+ecx+1FE23F1Dh]
		imul	ecx, edx, 1E95B69Fh
		imul	edx, 8B906FB2h
		lea	ecx, [edi+ecx+2BA8B320h]
		and	edx, 0F57A1A76h
		imul	edx, 53D3F0C9h
		lea	edx, [ecx+edx]
		mov	ecx, [ebp+var_50]
		mov	[ebp+var_60], edx
		mov	edx, [ebp+var_10]
		sub	edx, [ebp+var_64]
		lea	edx, [ecx+edx-4CE172CEh]
		mov	ecx, [ebp+var_7C]
		or	ecx, 29974D9Ah
		lea	ecx, [edx+ecx]
		mov	edx, [ebp+var_34]
		add	edx, 4F5A3BDCh
		sub	edx, eax
		lea	eax, [ecx+ecx-2072E3BCh]
		sub	edx, ecx
		or	eax, 29974D9Ah
		lea	eax, [edx+eax]
		mov	edx, 0E0A7C349h
		xor	eax, 17DC968Dh
		sub	edx, esi
		lea	ecx, [eax+3D31D3C5h]
		add	eax, eax
		and	eax, 2FB92D1Ah
		mov	edi, eax
		sub	edi, ecx
		add	edx, edi
		lea	edi, [ecx+esi+5F8D249Dh]
		sub	edi, eax
		add	edi, edi
		or	edi, 0B194F69Ch
		add	edx, edi
		mov	edi, [ebp+var_100]
		lea	eax, [edx+edx-31FEC668h]
		and	eax, 0B194F69Ch
		imul	ecx, [ebp+var_70], 0BBFC166Fh
		sub	edx, eax
		imul	edx, 0D61D15BBh
		imul	eax, [ebp+var_A4], 70648FBDh
		lea	edx, [ecx+edx+2021D3E5h]
		mov	[ebp+var_34], edx
		imul	edx, [ebp+var_70], 0B0EEF8E5h
		lea	edx, [edx+eax+1F6DAD4h]
		imul	eax, [ebp+var_5C], 0C956E6D3h
		lea	eax, [edx+eax]
		mov	edx, [ebp+var_104]
		imul	eax, 4FBF4C99h
		sub	edx, eax
		lea	eax, [eax+edi+4A6FCF6h]
		sub	edx, [ebp+var_78]
		add	eax, eax
		or	eax, 37A3042Ch
		lea	eax, [edx+eax+79FDA1EFh]
		mov	[ebp+var_64], eax
		mov	edx, [ebp+var_50]
		mov	ecx, [ebp+var_CC]
		mov	edi, [ebp+var_A8]
		lea	eax, [ecx+edx-75B4CFCCh]
		mov	edx, [ebp+var_FC]
		lea	ecx, [edx+edi-4FAA933Ch]
		add	ecx, ecx
		or	ecx, 1F10FEA4h
		lea	ecx, [eax+ecx]
		mov	eax, [ebp+var_2C]
		mov	edx, eax
		add	edx, edx
		lea	edi, [esi+eax+738AA057h]
		and	edx, 0DD507D04h
		sub	edi, edx
		mov	edx, [ebp+var_78]
		xor	edi, 0A6967CAFh
		mov	eax, edi
		add	edi, edi
		sub	eax, [ebp+var_104]
		and	edi, 4D2CF95Eh
		lea	eax, [eax+edx-0D701A61h]
		sub	eax, edi
		imul	edx, [ebp+var_100], 0F6C4078Dh
		xor	eax, 0E10FBAF6h
		imul	edi, [ebp+var_A4], 8E66E0F1h
		lea	esi, [eax+6DD873F4h]
		add	eax, eax
		mov	[ebp+var_50], esi
		and	eax, 0C21F75ECh
		sub	eax, [ebp+var_50]
		lea	edi, [edi+edx+38140441h]
		lea	edx, [ecx+ecx+6BADC76Ch]
		and	edx, 1F10FEA4h
		sub	ecx, edx
		imul	ecx, 0F6C4078Dh
		imul	esi, [ebp+var_24], 0A659C4A7h
		lea	ecx, [edi+ecx]
		imul	edi, eax, 8E1944A0h
		sub	eax, 73374703h
		imul	ecx, 2BD1F3E7h
		shr	eax, 1Bh
		mov	edx, eax
		not	eax
		add	eax, 20h
		neg	edx
		or	eax, 0B4EB049Eh
		sub	edx, 539CD688h
		lea	ecx, [esi+ecx-2CC11FC5h]
		add	eax, eax
		lea	esi, [edi+3A5B8CFCh]
		sub	edx, eax
		imul	eax, esi, 866441ADh
		mov	[ebp+var_CC], ecx
		mov	ecx, 0F77824BBh
		sub	ecx, edx
		imul	esi, 66441ADh
		sub	eax, 743D228Dh
		xor	eax, 6998h
		add	eax, 643A0000h
		xor	eax, ecx
		xor	eax, 0FFFF9667h
		or	eax, ecx
		lea	ecx, [edi+3A5B8CFDh]
		mov	edi, eax
		imul	ecx, 799BBE53h
		not	edi
		lea	esi, [edx+esi]
		lea	eax, [esi+eax*2]
		lea	eax, [eax+eax-0EF68E8Dh]
		add	ecx, 519CBB52h
		and	eax, 5436832Eh
		sub	ecx, edx
		lea	ecx, [ecx+edi*2]
		mov	edi, [ebp+var_108]
		lea	eax, [ecx+eax]
		mov	[ebp+var_50], eax
		imul	edx, [ebp+var_70], 947CCA9Fh
		lea	eax, [edi+edi+3C00B7CAh]
		and	eax, 106C4880h
		sub	eax, edi
		imul	eax, 9E58055h
		lea	edx, [edx+eax-69458674h]
		imul	edx, 40EB7CFDh
		add	edx, 2F9736F5h
		mov	eax, edx
		shr	edx, 17h
		imul	edx, 4161456Dh
		shl	eax, 9
		imul	esi, eax, 9E58055h
		lea	eax, [eax+eax+3FFh]
		sub	edx, 409D6h
		imul	ecx, edx, 0DDA21D89h
		imul	edx, 0D89118CAh
		lea	ecx, [esi+ecx+35F441D8h]
		sub	edx, 79AE3123h
		or	edx, eax
		imul	eax, [ebp+var_60], 51AB2979h
		imul	edx, 0F61A7FABh
		add	eax, 619EF0BFh
		shr	eax, 15h
		imul	eax, 53B9E695h
		lea	edx, [ecx+edx]
		mov	ecx, [ebp+var_60]
		mov	[ebp+var_2C], edx
		add	eax, 69D1E5Ah
		imul	edx, eax, 0E4E61865h
		shl	ecx, 0Bh
		imul	eax, 9641697Ah
		lea	esi, [ecx+edx+3F3F47BEh]
		mov	ecx, [ebp+var_34]
		imul	edx, [ebp+var_60], 0B2979000h
		sub	eax, 92D70E3h
		shl	ecx, 0Fh
		sub	edx, 10F40001h
		or	eax, edx
		imul	eax, 0AC2C0F37h
		lea	eax, [esi+eax]
		mov	[ebp+var_10], eax
		imul	eax, [ebp+var_34], 2BFC988Dh
		add	eax, 1DD2E13Bh
		shr	eax, 11h
		imul	eax, 5023CF9Dh
		add	eax, 40E96B98h
		imul	edx, eax, 0DE808C9h
		imul	eax, 0ADC05D6Ah
		lea	edx, [ecx+edx-699E4784h]
		imul	ecx, [ebp+var_34], 988D0000h
		sub	eax, 16BDC4EFh
		sub	ecx, 1EC40001h
		or	eax, ecx
		mov	ecx, [ebp+var_64]
		imul	eax, 0D61D15BBh
		lea	eax, [edx+eax]
		mov	edx, [ebp+var_64]
		mov	[ebp+var_60], eax
		lea	eax, [edx+edx-34EC41F6h]
		imul	edx, [ebp+var_24], 76127985h
		and	eax, 37A3042Ch
		lea	edx, [ecx+edx+37329901h]
		sub	edx, eax
		imul	edx, 57500000h
		add	edx, 6A3CAD1Fh
		imul	ecx, [ebp+var_24], 89ED867Bh
		sub	eax, [ebp+var_64]
		imul	esi, edx, 5598933Fh
		imul	edx, 2A597A46h
		lea	eax, [eax+ecx-37329901h]
		shr	eax, 0Ch
		imul	eax, 3EFCDE03h
		sub	edx, 3CBF1C7Bh
		sub	eax, 10439DB6h
		imul	ecx, eax, 0AE574267h
		imul	eax, 0E20A7956h
		lea	esi, [esi+ecx-8948F0Dh]
		add	eax, 413E0125h
		imul	ecx, [ebp+var_98], 0EBC549E3h
		or	eax, edx
		imul	edx, [ebp+var_70], 0AF267CF7h
		imul	eax, 0FA00E6CBh
		lea	ecx, [edx+ecx+7C87CB21h]
		imul	edx, [ebp+var_5C], 44F692F1h
		lea	eax, [esi+eax]
		mov	[ebp+var_34], eax
		imul	eax, [ebp+var_24], 0AD848D8Dh
		lea	edx, [ecx+edx]
		imul	edx, 8B547843h
		lea	edx, [eax+edx+1D9A1089h]
		imul	edx, 2BC74E27h
		sub	edx, [ebp+var_100]
		lea	edi, [edx+310A5ABh]
		mov	ecx, edi
		shr	ecx, 7
		mov	eax, ecx
		sub	ecx, 2000000h
		not	ecx
		neg	eax
		or	ecx, 86D13A5Fh
		add	eax, 7C5DED0Ah
		add	ecx, ecx
		sub	eax, ecx
		imul	esi, eax, 0AEC0BE69h
		imul	edi, 0D2000000h
		lea	ecx, [eax+eax+18E69AA6h]
		and	ecx, 0F25D8B40h
		lea	edi, [edi+esi+1193BB37h]
		imul	esi, ecx, 513F4197h
		sub	ecx, eax
		add	edx, 310A5ACh
		neg	edx
		shl	edx, 1Ah
		lea	esi, [edi+esi]
		lea	edi, [ecx+ecx-0B4425E7h]
		and	edi, edx
		imul	edi, 0AEC0BE69h
		lea	edi, [esi+edi]
		mov	[ebp+var_98], edi
		mov	ecx, [ebp+var_CC]
		imul	eax, [ebp+var_CC], 15C660Dh
		imul	esi, [ebp+var_10], 0A35652F2h
		shl	ecx, 1Bh
		add	eax, 222B2DD3h
		shr	eax, 5
		imul	eax, 11CAB4DFh
		mov	[ebp+var_78], esi
		sub	esi, 3CC21E81h
		mov	[ebp+var_64], esi
		add	eax, 13C40356h
		imul	edx, eax, 197922DBh
		imul	eax, 0E17C0E3Eh
		lea	edx, [ecx+edx-57256AB6h]
		imul	ecx, [ebp+var_CC], 0D0000000h
		add	eax, 3AB07D2Dh
		add	ecx, 3FFFFFFFh
		or	eax, ecx
		imul	eax, 972AA73Bh
		lea	eax, [edx+eax]
		mov	[ebp+var_24], eax
		imul	edx, [ebp+var_10], 0D5A0F10Fh
		imul	eax, [ebp+var_60], 4DC0D99Bh
		lea	ecx, [edx+eax+32B54950h]
		imul	edx, [ebp+var_60], 57F9311Ah
		add	edx, 3BA5C277h
		or	edx, esi
		mov	esi, [ebp+var_44]
		imul	eax, edx, 0D647AB39h
		imul	edx, edi, 578E9C4Eh
		lea	eax, [ecx+eax]
		add	edx, 6214B57h
		mov	[ebp+var_CC], edx
		imul	edx, eax, 0C26C02E3h
		imul	eax, 0DD9859EEh
		imul	ecx, edi, 0DA4F0DD3h
		mov	edi, [ebp+var_74]
		add	eax, 3C5CAB95h
		or	eax, [ebp+var_CC]
		lea	ecx, [ecx+edx-61B7C05Bh]
		imul	eax, 0FEEF458Bh
		lea	eax, [ecx+eax]
		imul	edx, eax, 165AE2FFh
		mov	eax, [ebp+var_74]
		imul	ecx, [ebp+var_38], 5EF29997h
		add	eax, 1468330Ch
		imul	eax, 2D40EF11h
		lea	ecx, [ecx+eax-310A4063h]
		imul	eax, [ebp+var_44], 5A81DE22h
		add	ecx, eax
		imul	eax, [ebp+var_38], 578E9C4Eh
		lea	eax, [eax+edi*2+6214B5Bh]
		lea	eax, [eax+esi*4]
		and	eax, 22AF1ABCh
		imul	eax, 0D2BF10EFh
		imul	esi, [ebp+var_24], 15C660Dh
		imul	edi, [ebp+var_24], 0FEA399F3h
		lea	eax, [ecx+eax]
		imul	eax, 421471DBh
		lea	eax, [edx+eax+7CBFDACBh]
		mov	[ebp+var_70], eax
		imul	edx, [ebp+var_2C], 40EB7CFDh
		imul	eax, [ebp+var_34], 0E50B311Dh
		add	edx, 224736F5h
		add	eax, 23B423CDh
		xor	edx, 0EEABh
		mov	[ebp+var_5C], eax
		xor	eax, 0EEABh
		add	edx, 0D500000h
		add	eax, 0D500000h
		xor	edx, eax
		lea	eax, [esi-160ED22Dh]
		mov	ecx, edx
		xor	eax, 20CEh
		xor	ecx, 47A3E6D6h
		add	eax, 383A0000h
		xor	edx, 0B85C1929h
		mov	[ebp+var_44], eax
		xor	eax, ecx
		add	edx, esi
		xor	eax, 0FFFFDF31h
		or	eax, ecx
		lea	ecx, [ecx+edi-4BACAE6h]
		mov	edi, eax
		lea	eax, [edx+eax*2]
		not	edi
		lea	edx, [eax+eax+44565BABh]
		lea	ecx, [ecx+edi*2]
		and	edx, 0ABF060BAh
		mov	edi, [ebp+var_3C]
		lea	edx, [ecx+edx]
		mov	ecx, [ebp+var_20]
		lea	esi, [edx+edx+192ED96Ch]
		and	esi, 0DB4852E8h
		mov	eax, esi
		sub	eax, edx
		add	ecx, [ebp+var_3C]
		sub	edi, esi
		lea	edx, [edi+edx+3906E2FAh]
		add	edx, [ebp+var_20]
		sub	eax, ecx
		add	edx, edx
		or	edx, 0A12CEDCAh
		lea	edx, [eax+edx+7AFFB416h]
		mov	[ebp+var_38], edx
		imul	eax, [ebp+var_60], 2BFC988Dh
		imul	edx, [ebp+var_98], 2BC74E27h
		mov	[ebp+var_60], eax
		add	eax, 6680E13Bh
		add	edx, 4BBEA5ABh
		xor	eax, 0D749h
		xor	edx, 0D749h
		sub	eax, 48AE0000h
		sub	edx, 48AE0000h
		xor	eax, edx
		mov	edx, [ebp+var_44]
		xor	eax, 0F0C43636h
		mov	ecx, eax
		not	ecx
		xor	edx, ecx
		xor	edx, 0FFFFDF31h
		or	edx, ecx
		imul	ecx, [ebp+var_24], 2B8CC1Ah
		mov	[ebp+var_44], ecx
		mov	ecx, [ebp+var_E8]
		imul	esi, [ebp+var_EC], 19836C73h
		mov	edi, [ebp+var_E8]
		sub	ecx, 6C60AA4Ch
		imul	ecx, 6359AECFh
		lea	esi, [esi+ecx-4E57E0C1h]
		imul	ecx, [ebp+var_C], 0C6B35D9Eh
		lea	ecx, [esi+ecx]
		imul	esi, [ebp+var_EC], 0CA16623Ah
		lea	esi, [esi+edi*2+6208479Fh]
		mov	edi, [ebp+var_C]
		lea	esi, [esi+edi*4]
		and	esi, 0C53663C8h
		imul	esi, 9CA65131h
		lea	edi, [eax+12EF640Ch]
		imul	edi, 3ABB40D5h
		add	ecx, esi
		imul	esi, [ebp+var_24], 0B8E328D1h
		imul	ecx, 0AB4880DDh
		add	edi, esi
		imul	esi, edx, 757681AAh
		lea	esi, [edi+esi]
		mov	edi, [ebp+var_44]
		lea	eax, [edi+eax*2+44565BABh]
		lea	edi, [eax+edx*4]
		mov	eax, [ebp+var_50]
		and	edi, 0E1886C6Ch
		imul	edi, 0C544BF2Bh
		lea	edx, [eax+eax+244F1818h]
		and	edx, 0C21F75ECh
		lea	edi, [esi+edi]
		mov	eax, edx
		imul	edi, 22748767h
		sub	eax, [ebp+var_50]
		imul	esi, [ebp+var_18], 6423582h
		lea	eax, [eax+eax+199171FBh]
		mov	[ebp+var_3C], eax
		lea	edi, [ecx+edi-7A725C44h]
		imul	eax, [ebp+var_50], 8DAC3175h
		add	esi, 38998C4Ch
		imul	ecx, [ebp+var_18], 0F513D4CBh
		and	esi, [ebp+var_3C]
		mov	[ebp+var_20], edi
		imul	edi, [ebp+var_90], 0AC0B0892h
		lea	ecx, [ecx+eax-0A0818Ah]
		imul	eax, edx, 7253CE8Bh
		sub	edi, 95E81EFh
		lea	eax, [ecx+eax]
		imul	ecx, esi, 8DAC3175h
		imul	esi, [ebp+var_28], 0F54F250Dh
		lea	ecx, [eax+ecx]
		imul	eax, [ebp+var_90], 428AF6C9h
		lea	esi, [esi+eax-496104BAh]
		imul	eax, [ebp+var_28], 57F9311Ah
		add	eax, 3BA5C277h
		or	edi, eax
		imul	edi, 0BF53217Fh
		imul	eax, ecx, 6305BACDh
		lea	edi, [esi+edi]
		imul	esi, [ebp+var_34], 52465EF3h
		imul	edi, 989CA1E3h
		lea	esi, [esi+eax-678D6E58h]
		imul	eax, ecx, 0C1675246h
		imul	ecx, [ebp+var_34], 0CA16623Ah
		add	eax, 10129E03h
		add	ecx, 6208479Bh
		or	eax, ecx
		imul	eax, 0C51B9CB1h
		lea	eax, [esi+eax]
		imul	eax, 766D5FADh
		imul	esi, [ebp+var_98], 0CE47F063h
		lea	eax, [edi+eax-0FBDADF6h]
		mov	[ebp+var_74], eax
		imul	eax, [ebp+var_2C], 0E02288D1h
		lea	ecx, [esi+eax+5A5F127h]
		imul	eax, [ebp+var_2C], 81D6F9FAh
		add	eax, 5F2E6DEBh
		or	eax, [ebp+var_CC]
		imul	esi, [ebp+var_24], 51303C87h
		imul	eax, 942B129Bh
		lea	eax, [ecx+eax]
		imul	ecx, eax, 4DF633A7h
		imul	eax, 6AA4F8DAh
		lea	ecx, [esi+ecx+65075674h]
		mov	esi, [ebp+var_44]
		imul	ecx, 6FF921CBh
		add	eax, 3166960Bh
		add	esi, 44565BA7h
		or	eax, esi
		sub	ecx, eax
		imul	esi, [ebp+var_84], 0A2597A23h
		imul	eax, [ebp+var_A0], 87F604EFh
		lea	eax, [esi+eax-489846BAh]
		mov	esi, [ebp+var_30]
		imul	eax, 9E5E55F1h
		add	eax, esi
		lea	ecx, [ecx+eax-4A2558EBh]
		mov	eax, esi
		imul	esi, [ebp+var_84], 0FD4733E6h
		sub	eax, [ebp+var_A0]
		sub	esi, 44565BA8h
		lea	eax, [eax+eax-3860F21Bh]
		and	eax, esi
		sub	ecx, eax
		mov	edi, ecx
		and	ecx, 0B6E7372Fh
		or	edi, 0B6E7372Fh
		sub	edi, ecx
		mov	ecx, 6DD873F3h
		mov	[ebp+var_C], edi
		imul	esi, [ebp+var_18], 0FCDEE53Fh
		sub	ecx, [ebp+var_50]
		imul	edi, [ebp+var_18], 1CEC398Bh
		lea	eax, [esi+384D39D9h]
		xor	eax, 0E6D4h
		sub	eax, 549A0000h
		xor	eax, ecx
		xor	eax, 0FFFF192Bh
		or	eax, ecx
		imul	ecx, [ebp+var_50], 2B2EDCB5h
		lea	edi, [edi+ecx+74ADC603h]
		imul	ecx, eax, 565DB96Ah
		add	edi, ecx
		add	esi, [ebp+var_50]
		lea	eax, [esi+eax*2]
		lea	ecx, [eax+eax-144A7431h]
		and	ecx, 0F5F479DEh
		imul	ecx, 0D4D1234Bh
		imul	eax, [ebp+var_10], 51AB2979h
		lea	ecx, [edi+ecx]
		imul	esi, ecx, 0A274319Dh
		add	eax, 28E4F0BFh
		xor	eax, 0FF3h
		add	eax, 38BA0000h
		imul	edi, [ebp+var_10], 1D8AACD1h
		sub	esi, 1
		xor	eax, esi
		xor	eax, 0FFFFF00Ch
		or	eax, esi
		imul	esi, ecx, 981D07ABh
		imul	ecx, 0BB179CC6h
		lea	edi, [edi+esi+0A3DE4B2h]
		imul	esi, eax, 0CE514032h
		add	edi, esi
		mov	esi, [ebp+var_78]
		lea	ecx, [esi+ecx-3CC21E7Dh]
		lea	esi, [ecx+eax*4]
		and	esi, 2C2ACF80h
		imul	ecx, [ebp+var_84], 3B83DB49h
		imul	eax, [ebp+var_94], 142FA2F5h
		imul	esi, 98D75FE7h
		lea	esi, [edi+esi]
		lea	edi, [ecx+eax-50E97146h]
		mov	ecx, [ebp+var_BC]
		imul	eax, [ebp+var_94], 68F1AFD2h
		add	ecx, 44565BA7h
		sub	eax, 129E58A1h
		or	eax, ecx
		imul	eax, 0C46A28D3h
		imul	ecx, esi, 82B736F5h
		imul	esi, 8C6687AEh
		add	edi, eax
		imul	edi, 9C8279C1h
		and	esi, 1BC1C3B2h
		imul	esi, 6F857DEDh
		lea	eax, [edi+ecx+5FAF4C54h]
		mov	edi, [ebp+var_8C]
		imul	ecx, [ebp+var_18], 517C4C6Dh
		lea	esi, [eax+esi]
		imul	eax, [ebp+var_10], 0EBD7813Bh
		mov	[ebp+var_44], esi
		lea	eax, [ecx+eax+2C9515B9h]
		imul	ecx, [ebp+var_18], 0F9BDCA7Eh
		imul	eax, 5B3514DBh
		sub	ecx, 38998C4Dh
		or	ecx, [ebp+var_64]
		sub	eax, ecx
		mov	ecx, [ebp+var_60]
		add	eax, 6FF92155h
		xor	eax, 0F1D6h
		sub	eax, 36300000h
		add	ecx, 5402E13Bh
		xor	ecx, 0F1D6h
		sub	ecx, 36300000h
		xor	eax, ecx
		mov	ecx, 3ABDF89Bh
		xor	eax, 0CAEC9531h
		lea	esi, [eax+eax]
		add	eax, [ebp+var_8C]
		and	esi, 95D92A62h
		sub	ecx, esi
		imul	esi, [ebp+var_2C], 0BB5874DDh
		add	ecx, eax
		lea	eax, [edi+edi+1C3790E4h]
		and	eax, 0C36B35F0h
		sub	ecx, eax
		mov	eax, [ebp+var_5C]
		xor	ecx, 4E803381h
		add	ecx, 7A93C2B6h
		mov	[ebp+var_18], ecx
		imul	ecx, [ebp+var_50], 0BD7E4D61h
		xor	eax, 0A12Eh
		add	eax, 0D500000h
		xor	eax, 3C963D45h
		lea	ecx, [esi+ecx-67CA9A43h]
		imul	ecx, 4234E95Fh
		lea	esi, [edx+ecx-29EC441Ch]
		imul	edx, [ebp+var_2C], 7E290606h
		sub	edx, 5F2E6DECh
		and	edx, [ebp+var_3C]
		sub	esi, edx
		xor	esi, 0A12Eh
		imul	edi, [ebp+var_84], 12FF09F3h
		add	esi, 0D500000h
		imul	ecx, [ebp+var_E4], 8CB33893h
		xor	eax, esi
		lea	edx, [eax+6A61B696h]
		add	eax, eax
		and	eax, 792C7A8Ah
		sub	eax, edx
		lea	esi, [edi+ecx+22B35F27h]
		mov	edi, [ebp+var_BC]
		imul	ecx, [ebp+var_40], 91BA5FFEh
		imul	eax, 956AFA3h
		add	esi, ecx
		imul	ecx, [ebp+var_E4], 0BD946EDAh
		lea	ecx, [edi+ecx+44565BABh]
		mov	edi, [ebp+var_40]
		lea	ecx, [ecx+edi*4]
		mov	edi, [ebp+arg_4]
		and	ecx, 0CF0DE99Ah
		imul	ecx, 0B722D001h
		lea	ecx, [esi+ecx]
		imul	ecx, 0E303C05Dh
		lea	eax, [ecx+eax-72DAD330h]
		mov	ecx, [ebp+var_180]
		mov	[ebp+var_50], eax
		imul	eax, [ebp+var_6C], 0B6B46C22h
		lea	edx, [ecx+ecx-76FB7997h]
		imul	ecx, [ebp+var_164], 2674CB97h
		sub	eax, 654CF0C0h
		and	eax, edx
		imul	edx, [ebp+var_1EC], 0D98B3469h
		add	ecx, edx
		imul	edx, [ebp+var_6C], 70C95F07h
		lea	edx, [ecx+edx]
		mov	ecx, 0F773CC4Eh
		imul	edx, 0D17D9BD9h
		sub	ecx, [ebp+var_1A8]
		lea	edx, [eax+edx]
		lea	eax, [edx+13A76295h]
		lea	edx, [edx+edx-23B795AAh]
		and	edx, 4994728Ch
		sub	eax, edx
		imul	esi, eax, 0C9D363EFh
		lea	edx, [eax+eax-171E848h]
		and	edx, 4994728Ch
		add	ecx, esi
		imul	esi, edx, 362C9C11h
		sub	edx, eax
		imul	eax, [ebp+var_1A8], 3CD8561Eh
		add	ecx, esi
		add	eax, 5C0F3290h
		lea	esi, [edx+edx-48228A45h]
		and	esi, eax
		imul	esi, 0C9D363EFh
		lea	esi, [ecx+esi]
		mov	[edi], esi
		mov	eax, [ebp+arg_0]
		mov	esi, 970A3C78h
		mov	ecx, [ebp+var_4C]
		mov	edx, [eax+24h]
		sub	ecx, 42E79334h
		xor	ecx, 838Ch
		sub	ecx, 60350000h
		sub	esi, edx
		mov	eax, esi
		xor	eax, 0FFFF7C73h
		xor	eax, ecx
		mov	ecx, 0A1F3C56Bh
		or	eax, esi
		imul	esi, edx, 7473F597h
		add	edx, [ebp+var_4C]
		sub	ecx, esi
		imul	esi, [ebp+var_80], 6AC60FEFh
		add	ecx, esi
		imul	esi, eax, 171814D2h
		lea	eax, [edx+eax*2]
		add	ecx, esi
		lea	esi, [eax+eax-744D9F55h]
		and	esi, 7D1F3CBAh
		imul	esi, 7473F597h
		add	ecx, esi
		mov	esi, [edi+4]
		imul	edx, ecx, 6AC5DA27h
		imul	ecx, 0D58BB44Eh
		sub	edx, 13F798E7h
		and	ecx, 0D810CE32h
		sub	edx, ecx
		mov	ecx, 15A38ED3h
		lea	eax, [edx+4AF5C6Fh]
		add	edx, edx
		and	edx, 99555E5Ch
		sub	ecx, esi
		sub	eax, edx
		imul	edi, eax, 0C9D363EFh
		lea	edx, [eax+eax-70095A82h]
		and	edx, 99555E5Ch
		add	ecx, edi
		imul	edi, edx, 362C9C11h
		add	ecx, edi
		sub	edx, eax
		imul	esi, 3CD8561Eh
		lea	edi, [edx+edx-294C03DBh]
		mov	edx, [ebp+arg_4]
		imul	eax, [ebp+var_58], 0CD0F79Ah
		add	esi, 5C0F3290h
		and	edi, esi
		imul	edi, 0C9D363EFh
		sub	eax, 2A028A74h
		lea	edi, [ecx+edi]
		mov	ecx, [ebp+arg_0]
		mov	[edx+4], edi
		mov	edi, [ebp+arg_4]
		mov	edx, [ecx+28h]
		mov	ecx, [ebp+var_110]
		mov	esi, [edi+8]
		sub	ecx, edx
		lea	ecx, [ecx+ecx-76FB7997h]
		and	eax, ecx
		imul	edx, 0CE2FF8F1h
		imul	ecx, [ebp+var_110], 31D0070Fh
		lea	edx, [ecx+edx]
		imul	ecx, [ebp+var_58], 8F11DC03h
		add	edx, ecx
		mov	ecx, 55A6B2FAh
		imul	edx, 0F817F811h
		sub	ecx, esi
		imul	esi, 3CD8561Eh
		lea	edx, [eax+edx]
		lea	eax, [edx-73AD71B1h]
		add	esi, 5C0F3290h
		lea	edx, [edx+edx-5F01FBF6h]
		and	edx, 6A2F3980h
		sub	eax, edx
		imul	edi, eax, 0C9D363EFh
		lea	edx, [eax+eax-0D77DF14h]
		and	edx, 6A2F3980h
		add	ecx, edi
		imul	edi, edx, 362C9C11h
		sub	edx, eax
		mov	eax, [ebp+arg_4]
		add	ecx, edi
		lea	edi, [edx+edx-5CB75A6Dh]
		and	edi, esi
		mov	esi, 970A3C78h
		imul	edi, 0C9D363EFh
		lea	edi, [ecx+edi]
		mov	ecx, [ebp+arg_0]
		mov	[eax+8], edi
		mov	edi, [ebp+arg_4]
		mov	edx, [ecx+2Ch]
		mov	ecx, [ebp+var_9C]
		sub	esi, edx
		sub	ecx, 1C233694h
		mov	eax, esi
		xor	ecx, 8C56h
		xor	eax, 0FFFF73A9h
		sub	ecx, 652F0000h
		xor	eax, ecx
		mov	ecx, [ebp+var_54]
		or	eax, esi
		mov	esi, eax
		not	esi
		add	ecx, 1
		imul	ecx, 0DA89BC3h
		sub	ecx, edx
		add	edx, [ebp+var_9C]
		lea	ecx, [ecx+esi*2]
		mov	esi, [edi+0Ch]
		lea	eax, [edx+eax*2]
		lea	eax, [eax+eax-30B8E615h]
		and	eax, 0FE10CF52h
		add	ecx, eax
		lea	eax, [ecx+ecx+1756DF40h]
		and	eax, 5B1F3DDAh
		lea	edx, [ecx-46C4F173h]
		mov	ecx, 54C84333h
		sub	edx, eax
		sub	ecx, esi
		lea	eax, [edx-6C91A2ADh]
		add	edx, edx
		and	edx, 5E0710E0h
		sub	eax, edx
		imul	edi, eax, 0C9D363EFh
		lea	edx, [eax+eax+372A563Ah]
		and	edx, 5E0710E0h
		imul	esi, 3CD8561Eh
		add	ecx, edi
		imul	edi, edx, 362C9C11h
		sub	edx, eax
		mov	eax, [ebp+arg_4]
		add	esi, 5C0F3290h
		add	ecx, edi
		lea	edi, [edx+edx+6ACE98E5h]
		and	edi, esi
		mov	esi, 970A3C78h
		imul	edi, 0C9D363EFh
		lea	edi, [ecx+edi]
		mov	ecx, [ebp+arg_0]
		mov	[eax+0Ch], edi
		mov	edx, [ecx+30h]
		mov	ecx, [ebp+var_48]
		sub	esi, edx
		sub	ecx, 59E3AA08h
		mov	eax, esi
		xor	ecx, 764Ch
		xor	eax, 0FFFF89B3h
		sub	ecx, 2D690000h
		xor	eax, ecx
		mov	ecx, 0C5D52AD4h
		or	eax, esi
		imul	esi, edx, 0A5E5D543h
		sub	ecx, esi
		imul	esi, [ebp+var_68], 17566793h
		add	edx, [ebp+var_48]
		add	ecx, esi
		imul	esi, eax, 0B434557Ah
		lea	eax, [edx+eax*2]
		add	ecx, esi
		lea	esi, [eax+eax-3CADCCFDh]
		and	esi, 6E12A7C4h
		imul	esi, 0A5E5D543h
		add	ecx, esi
		mov	esi, [ebp+arg_4]
		imul	eax, ecx, 53445F6Bh
		imul	ecx, 0A688BED6h
		mov	edx, [esi+10h]
		and	ecx, 0CB1D554Ch
		sub	eax, ecx
		imul	eax, 0B2F58C63h
		sub	eax, 39E21611h
		imul	ecx, eax, 4B5BA205h
		imul	eax, 829D556Ah
		lea	ecx, [edx+ecx-36BEE8C2h]
		imul	edx, 0C327A9E2h
		add	eax, 684072BDh
		sub	edx, 5C0F3291h
		or	eax, edx
		imul	eax, 0C9D363EFh
		lea	eax, [ecx+eax]
		mov	ecx, 970A3C78h
		mov	[esi+10h], eax
		mov	edi, [ebp+arg_0]
		mov	eax, [ebp+var_14]
		mov	esi, [esi+14h]
		mov	[ebp+var_40], 970A3C78h
		mov	edx, [edi+34h]
		add	eax, 49E401B2h
		sub	ecx, edx
		or	eax, ecx
		lea	ecx, [eax+eax]
		mov	eax, [ebp+var_14]
		sub	eax, edx
		sub	edx, [ebp+var_14]
		sub	eax, ecx
		add	edx, ecx
		mov	ecx, 6CF805B9h
		lea	edx, [edx+edx+3E2383ADh]
		sub	ecx, esi
		and	edx, 3A74A034h
		lea	edx, [eax+edx-7ED478EFh]
		lea	eax, [edx+2D8A4B17h]
		lea	edx, [edx+edx-7AEF3204h]
		and	edx, 6A9B7F80h
		sub	eax, edx
		lea	edx, [eax+eax-6B6848B2h]
		and	edx, 6A9B7F80h
		imul	edi, eax, 0C9D363EFh
		imul	esi, 3CD8561Eh
		add	ecx, edi
		imul	edi, edx, 362C9C11h
		sub	edx, eax
		add	esi, 5C0F3290h
		mov	eax, 22B5C28Ch
		sub	eax, [ebp+var_B8]
		add	ecx, edi
		lea	edi, [edx+edx+0CCC931h]
		and	edi, esi
		mov	esi, [ebp+arg_0]
		imul	edi, 0C9D363EFh
		lea	edi, [ecx+edi]
		mov	ecx, [ebp+arg_4]
		mov	[ecx+14h], edi
		mov	ecx, [esi+38h]
		mov	edi, [ebp+var_B8]
		lea	edx, [ecx+68F5C387h]
		or	eax, edx
		sub	edi, ecx
		add	eax, eax
		mov	edx, ecx
		sub	edx, eax
		lea	eax, [edi+eax]
		mov	edi, [ebp+arg_4]
		sub	edx, [ebp+var_B8]
		lea	eax, [eax+eax-17570C25h]
		and	eax, 392ABA76h
		lea	eax, [edx+eax]
		mov	edx, [ebp+arg_4]
		imul	eax, 0FBC3F7F9h
		mov	ecx, [edx+18h]
		add	eax, 7D1466E9h
		imul	edx, eax, 0CFD6C527h
		imul	eax, 1B1CB6Eh
		lea	esi, [ecx+edx-258F50D7h]
		imul	ecx, 0C327A9E2h
		add	eax, 255BB333h
		imul	edx, [ebp+var_1C], 76CF5292h
		sub	ecx, 5C0F3291h
		or	eax, ecx
		mov	ecx, [ebp+arg_4]
		add	edx, 6B9ADE40h
		imul	eax, 0C9D363EFh
		lea	eax, [esi+eax]
		mov	esi, [ebp+arg_0]
		mov	[ecx+18h], eax
		mov	ecx, [esi+3Ch]
		lea	eax, [ecx+ecx-2E1478F2h]
		and	eax, 0A50FF288h
		mov	esi, eax
		sub	esi, ecx
		imul	eax, 4998ADE1h
		imul	ecx, 0B667521Fh
		lea	esi, [esi+esi-76FB7997h]
		and	edx, esi
		add	eax, ecx
		mov	ecx, [edi+1Ch]
		imul	esi, [ebp+var_1C], 17DA1E29h
		add	eax, esi
		imul	eax, 0BA17A9DFh
		lea	eax, [edx+eax]
		imul	eax, 0AE9C851Bh
		sub	eax, 38483958h
		imul	edx, eax, 34744DBDh
		imul	eax, 0E4C965DAh
		lea	esi, [ecx+edx+30D7D58Ch]
		imul	ecx, 0C327A9E2h
		sub	eax, 39280E67h
		sub	ecx, 5C0F3291h
		or	eax, ecx
		imul	eax, 0C9D363EFh
		imul	ecx, [ebp+var_74], 47987C4Bh
		lea	eax, [esi+eax]
		mov	esi, 970A3C78h
		mov	[edi+1Ch], eax
		mov	eax, [ebp+arg_0]
		sub	ecx, 54ADFBFAh
		xor	ecx, 0DBFEh
		add	ecx, 78450000h
		mov	edx, [eax]
		sub	esi, edx
		mov	eax, esi
		xor	eax, 0FFFF2401h
		xor	eax, ecx
		mov	ecx, [ebp+var_74]
		or	eax, esi
		mov	esi, eax
		not	esi
		not	ecx
		imul	ecx, 47987C4Bh
		sub	ecx, edx
		lea	ecx, [ecx+esi*2]
		imul	esi, [ebp+var_74], 0C7987C4Bh
		lea	edx, [esi+edx]
		mov	esi, [ebp+var_C]
		lea	eax, [edx+eax*2]
		lea	eax, [eax+eax+19198F1Fh]
		and	eax, 0B95F9A44h
		add	ecx, eax
		lea	edx, [ecx+ecx-434830CAh]
		and	edx, 1C5068CCh
		lea	eax, [ecx+6C841C01h]
		sub	eax, edx
		mov	edx, [edi+20h]
		imul	ecx, eax, 0C9D363EFh
		add	eax, eax
		not	eax
		lea	ecx, [edx+ecx-362C9C11h]
		imul	edx, 0C327A9E2h
		sub	edx, 5C0F3291h
		or	eax, edx
		imul	eax, 0C9D363EFh
		lea	eax, [ecx+eax]
		mov	ecx, [ebp+arg_0]
		mov	[edi+20h], eax
		mov	eax, [ebp+var_C]
		mov	edx, [ecx+4]
		not	eax
		lea	ecx, [edx+68F5C387h]
		or	eax, ecx
		sub	esi, edx
		lea	ecx, [eax+eax]
		lea	eax, [edx+4D5691F1h]
		sub	eax, [ebp+var_C]
		lea	edx, [ecx+esi+5D3286EAh]
		lea	edx, [edx+edx+73AF6B21h]
		sub	eax, ecx
		and	edx, 373E6328h
		add	eax, edx
		mov	ecx, eax
		and	ecx, 0C091B1A7h
		imul	ecx, 0C8E738C2h
		imul	eax, 1B8C639Fh
		lea	edx, [ecx+eax-497B1447h]
		mov	ecx, [edi+24h]
		imul	esi, edx, 888407A1h
		imul	eax, ecx, 6193D4F1h
		sub	esi, 1
		sub	eax, 1C419949h
		xor	eax, 0F064h
		add	eax, 6E3A0000h
		xor	eax, 0FFFF0F9Bh
		xor	eax, esi
		or	eax, esi
		imul	esi, edx, 34E9624Fh
		imul	edx, 0EEF7F0BEh
		lea	edi, [ecx+esi-3F0437C7h]
		imul	ecx, 0C327A9E2h
		imul	esi, eax, 6C593822h
		lea	edx, [ecx+edx-5C0F328Dh]
		lea	esi, [edi+esi]
		lea	edi, [edx+eax*4]
		mov	eax, [ebp+arg_4]
		and	edi, 8123634Eh
		imul	edi, 0C9D363EFh
		lea	edi, [esi+edi]
		mov	esi, 970A3C78h
		mov	[eax+24h], edi
		mov	ecx, [ebp+arg_0]
		mov	edi, [ebp+arg_4]
		mov	edx, [ecx+8]
		imul	ecx, [ebp+var_44], 8A1C67E5h
		sub	esi, edx
		sub	ecx, 534915Dh
		mov	eax, esi
		xor	ecx, 69F1h
		xor	eax, 0FFFF960Eh
		sub	ecx, 6BE0000h
		xor	eax, ecx
		mov	ecx, [ebp+var_44]
		or	eax, esi
		mov	esi, eax
		not	esi
		add	ecx, 1
		imul	ecx, 75E3981Bh
		sub	ecx, edx
		lea	ecx, [ecx+esi*2]
		imul	esi, [ebp+var_44], 0A1C67E5h
		lea	edx, [esi+edx]
		mov	esi, [ebp+arg_4]
		lea	eax, [edx+eax*2]
		mov	edx, 216CA10Ah
		lea	eax, [eax+eax-45F99BA7h]
		and	eax, 0F33DDD0Eh
		add	ecx, eax
		lea	eax, [ecx+ecx+66F48E66h]
		sub	edx, ecx
		and	eax, 56322F86h
		lea	ecx, [edx+eax]
		mov	edx, [esi+28h]
		imul	ecx, 3ADD92ABh
		lea	eax, [ecx-26B356B6h]
		imul	eax, 3C792C33h
		lea	esi, [edx+eax-9850DCFh]
		mov	eax, 26B356B6h
		sub	eax, ecx
		mov	ecx, [ebp+var_18]
		imul	eax, 0A144FFAh
		imul	edx, 0C327A9E2h
		sub	eax, 51CD7BDh
		sub	edx, 5C0F3291h
		or	eax, edx
		imul	eax, 0C9D363EFh
		lea	eax, [esi+eax]
		mov	[edi+28h], eax
		mov	eax, [ebp+arg_0]
		mov	edx, [eax+0Ch]
		lea	esi, [edx+ecx-119DFF2Eh]
		neg	ecx
		neg	edx
		lea	eax, [ecx+ecx-0AD87A95h]
		mov	ecx, 11BDF534h
		lea	edx, [edx+edx+2E1478F1h]
		or	eax, edx
		lea	eax, [esi+eax]
		mov	esi, [edi+2Ch]
		xor	eax, 2135CF3Eh
		lea	edx, [eax+3D3205FBh]
		add	eax, eax
		and	eax, 7A640BF6h
		sub	edx, eax
		sub	ecx, esi
		lea	eax, [edx-48A7158h]
		add	edx, edx
		and	edx, 0D3C5DB44h
		sub	eax, edx
		imul	edi, eax, 0C9D363EFh
		lea	edx, [eax+eax-2325420Ch]
		and	edx, 0D3C5DB44h
		add	ecx, edi
		imul	edi, edx, 362C9C11h
		sub	edx, eax
		add	ecx, edi
		imul	esi, 3CD8561Eh
		lea	edi, [edx+edx+4F5F66C7h]
		imul	edx, [ebp+var_50], 2F9207EAh
		add	esi, 5C0F3290h
		and	edi, esi
		mov	esi, [ebp+arg_4]
		imul	edi, 0C9D363EFh
		add	edx, 9C4C3AAh
		lea	edi, [ecx+edi]
		mov	[esi+2Ch], edi
		mov	edi, [ebp+arg_0]
		mov	ecx, [edi+10h]
		lea	eax, [ecx+ecx-2E1478F2h]
		and	eax, 0A50FF288h
		mov	esi, eax
		sub	esi, ecx
		lea	esi, [esi+esi-76FB7997h]
		imul	ecx, 0A2E93C89h
		and	edx, esi
		imul	eax, 5D16C377h
		imul	esi, [ebp+var_50], 48275E3h
		add	eax, ecx
		mov	ecx, 0EE92E0CDh
		add	eax, esi
		imul	eax, 4C82F9B9h
		add	edx, eax
		lea	eax, [edx-0D6827F7h]
		lea	edx, [edx+edx+6D36B5ECh]
		and	edx, 1AE54AA6h
		sub	eax, edx
		mov	edx, [ebp+arg_4]
		imul	edi, eax, 0C9D363EFh
		mov	esi, [edx+30h]
		lea	edx, [eax+eax-5D13AF80h]
		and	edx, 1AE54AA6h
		sub	ecx, esi
		add	ecx, edi
		imul	esi, 3CD8561Eh
		imul	edi, edx, 362C9C11h
		sub	edx, eax
		add	esi, 5C0F3290h
		add	ecx, edi
		lea	edi, [edx+edx+422E64D9h]
		and	edi, esi
		mov	esi, [ebp+arg_0]
		imul	edi, 0C9D363EFh
		lea	edi, [ecx+edi]
		mov	ecx, [ebp+arg_4]
		mov	[ecx+30h], edi
		mov	edx, [esi+14h]
		mov	edi, 970A3C78h
		imul	esi, [ebp+var_70], 0F16E4323h
		sub	edi, edx
		lea	ecx, [esi+15CEA676h]
		mov	eax, edi
		xor	ecx, 0C10Dh
		xor	eax, 0FFFF3EF2h
		sub	ecx, 63530000h
		xor	eax, ecx
		mov	ecx, [ebp+var_70]
		or	eax, edi
		mov	edi, eax
		not	edi
		add	ecx, 1
		imul	ecx, 0E91BCDDh
		sub	ecx, edx
		lea	edx, [esi+edx]
		lea	eax, [edx+eax*2]
		lea	eax, [eax+eax+36E2D3FFh]
		and	eax, 0C6FC784Ch
		lea	ecx, [ecx+edi*2]
		mov	edi, [ebp+arg_4]
		add	ecx, eax
		lea	edx, [ecx+ecx-1B02C602h]
		and	edx, 63F38AC4h
		lea	eax, [ecx-5B879D9Fh]
		mov	ecx, [edi+34h]
		sub	eax, edx
		imul	edx, eax, 0F5FCE131h
		and	eax, 355A4AA2h
		imul	eax, 14063D9Eh
		lea	edx, [edx+eax+1358AB02h]
		imul	eax, ecx, 6193D4F1h
		imul	esi, edx, 38D3282Fh
		sub	eax, 1C419949h
		xor	eax, 0F064h
		sub	esi, 1
		add	eax, 6E3A0000h
		xor	eax, 0FFFF0F9Bh
		xor	eax, esi
		or	eax, esi
		imul	esi, edx, 0BB69B0E1h
		imul	edx, 8E59AFA2h
		lea	edi, [ecx+esi-3551B1Ch]
		imul	ecx, 0C327A9E2h
		imul	esi, eax, 6C593822h
		lea	edx, [ecx+edx-5C0F328Dh]
		mov	ecx, [ebp+arg_0]
		lea	esi, [edi+esi]
		lea	edi, [edx+eax*4]
		mov	eax, [ebp+arg_4]
		and	edi, 6AB49544h
		imul	edi, 0C9D363EFh
		lea	edi, [esi+edi]
		mov	[eax+34h], edi
		mov	eax, [ebp+var_38]
		mov	edx, [ecx+18h]
		sub	[ebp+var_40], edx
		mov	edi, [ebp+arg_4]
		add	eax, 7B62F20Bh
		or	eax, [ebp+var_40]
		mov	esi, [edi+38h]
		lea	ecx, [eax+eax]
		mov	eax, [ebp+var_38]
		sub	eax, edx
		sub	eax, ecx
		sub	edx, [ebp+var_38]
		add	edx, ecx
		mov	ecx, 147B2154h
		lea	edx, [edx+edx-24DA5D05h]
		sub	ecx, esi
		and	edx, 4231F42h
		lea	edx, [eax+edx+2539D74Bh]
		lea	eax, [edx+274D51B2h]
		lea	edx, [edx+edx-29BC70D4h]
		and	edx, 0E17ACC98h
		sub	eax, edx
		imul	edi, eax, 0C9D363EFh
		lea	edx, [eax+eax+6923B860h]
		and	edx, 0E17ACC98h
		imul	esi, 3CD8561Eh
		add	ecx, edi
		imul	edi, edx, 362C9C11h
		sub	edx, eax
		mov	eax, [ebp+arg_4]
		add	esi, 5C0F3290h
		add	ecx, edi
		lea	edi, [edx+edx-4A9E84F9h]
		mov	edx, [ebp+arg_0]
		and	edi, esi
		mov	esi, [ebp+var_15C]
		imul	edi, 0C9D363EFh
		lea	edi, [ecx+edi]
		mov	[eax+38h], edi
		mov	eax, [edx+1Ch]
		imul	ecx, [ebp+var_15C], 6B705F87h
		mov	edi, [ebp+arg_4]
		imul	edx, eax, 948FA079h
		sub	esi, eax
		lea	eax, [esi+esi-76FB7997h]
		add	ecx, edx
		imul	edx, [ebp+var_20], 0E0067023h
		lea	edx, [ecx+edx]
		imul	ecx, [ebp+var_20], 0EC24F30Ah
		imul	edx, 111CC9C9h
		add	ecx, 6BAE6FCAh
		and	ecx, eax
		lea	eax, [edx+ecx+5A684E6h]
		mov	ecx, [edi+3Ch]
		mov	edx, eax
		and	edx, 8CE34580h
		imul	eax, 0B318E4D3h
		imul	edx, 99CE365Ah
		lea	edx, [edx+eax-72C7B780h]
		imul	eax, ecx, 6193D4F1h
		imul	esi, edx, 50B6ECA5h
		sub	eax, 1C419949h
		xor	eax, 0F064h
		sub	esi, 1
		add	eax, 6E3A0000h
		xor	eax, 0FFFF0F9Bh
		xor	eax, esi
		or	eax, esi
		imul	esi, edx, 0B149BD0Bh
		imul	edx, 5E9226B6h
		lea	edi, [ecx+esi+37CAD5A2h]
		imul	ecx, 0C327A9E2h
		imul	esi, eax, 6C593822h
		lea	edx, [ecx+edx-5C0F328Dh]
		lea	esi, [edi+esi]
		lea	edi, [edx+eax*4]
		mov	eax, [ebp+arg_4]
		and	edi, 19C68B00h
		imul	edi, 0C9D363EFh
		add	esi, edi
		mov	[eax+3Ch], esi
		add	esp, 1F0h
		pop	esi
		pop	edi
		pop	ebp
		retn
gen_buff2	endp

; ---------------------------------------------------------------------------

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

		public gen_tab190
gen_tab190	proc near		; CODE XREF: _gen_tab190j
					; DATA XREF: .got.plt:off_1C008o

var_309		= byte ptr -309h
var_2FC		= dword	ptr -2FCh
var_2F4		= dword	ptr -2F4h
var_2F0		= dword	ptr -2F0h
var_2EC		= dword	ptr -2ECh
var_2E8		= dword	ptr -2E8h
var_2E4		= dword	ptr -2E4h
var_2E0		= dword	ptr -2E0h
var_2DC		= dword	ptr -2DCh
var_2D8		= dword	ptr -2D8h
var_2D4		= dword	ptr -2D4h
var_2D0		= dword	ptr -2D0h
var_2CC		= dword	ptr -2CCh
var_2C8		= dword	ptr -2C8h
var_2C4		= dword	ptr -2C4h
var_2C0		= dword	ptr -2C0h
var_2BC		= dword	ptr -2BCh
var_2B8		= dword	ptr -2B8h
var_2B4		= dword	ptr -2B4h
var_2B0		= dword	ptr -2B0h
var_2AC		= dword	ptr -2ACh
var_29C		= dword	ptr -29Ch
var_298		= dword	ptr -298h
var_294		= dword	ptr -294h
var_290		= dword	ptr -290h
var_28C		= dword	ptr -28Ch
var_288		= dword	ptr -288h
var_284		= dword	ptr -284h
var_280		= dword	ptr -280h
var_27C		= dword	ptr -27Ch
var_278		= dword	ptr -278h
var_274		= dword	ptr -274h
var_270		= dword	ptr -270h
var_26C		= dword	ptr -26Ch
var_268		= dword	ptr -268h
var_264		= dword	ptr -264h
var_260		= dword	ptr -260h
var_25C		= byte ptr -25Ch
var_23C		= dword	ptr -23Ch
var_238		= dword	ptr -238h
var_234		= dword	ptr -234h
var_230		= dword	ptr -230h
var_22C		= dword	ptr -22Ch
var_228		= dword	ptr -228h
var_224		= dword	ptr -224h
var_220		= dword	ptr -220h
var_21C		= byte ptr -21Ch
var_204		= dword	ptr -204h
var_200		= dword	ptr -200h
var_1FC		= dword	ptr -1FCh
var_1F8		= dword	ptr -1F8h
var_1F4		= dword	ptr -1F4h
var_1F0		= dword	ptr -1F0h
var_1EC		= dword	ptr -1ECh
var_1E8		= dword	ptr -1E8h
var_1E4		= dword	ptr -1E4h
var_1E0		= dword	ptr -1E0h
var_1DC		= byte ptr -1DCh
var_1DB		= byte ptr -1DBh
var_11C		= byte ptr -11Ch
var_9C		= byte ptr -9Ch
var_9B		= byte ptr -9Bh
var_9A		= byte ptr -9Ah
var_99		= byte ptr -99h
var_98		= byte ptr -98h
var_97		= byte ptr -97h
var_96		= byte ptr -96h
var_95		= byte ptr -95h
var_94		= byte ptr -94h
var_93		= byte ptr -93h
var_92		= byte ptr -92h
var_91		= byte ptr -91h
var_90		= byte ptr -90h
var_8F		= byte ptr -8Fh
var_8E		= byte ptr -8Eh
var_8D		= byte ptr -8Dh
var_8C		= byte ptr -8Ch
var_8B		= byte ptr -8Bh
var_8A		= byte ptr -8Ah
var_89		= byte ptr -89h
var_88		= byte ptr -88h
var_87		= byte ptr -87h
var_86		= byte ptr -86h
var_85		= byte ptr -85h
var_84		= byte ptr -84h
var_83		= byte ptr -83h
var_82		= byte ptr -82h
var_81		= byte ptr -81h
var_80		= byte ptr -80h
var_7F		= byte ptr -7Fh
var_7E		= byte ptr -7Eh
var_7D		= byte ptr -7Dh
var_7C		= byte ptr -7Ch
var_7B		= byte ptr -7Bh
var_7A		= byte ptr -7Ah
var_79		= byte ptr -79h
var_78		= byte ptr -78h
var_77		= byte ptr -77h
var_76		= byte ptr -76h
var_75		= byte ptr -75h
var_74		= byte ptr -74h
var_73		= byte ptr -73h
var_72		= byte ptr -72h
var_71		= byte ptr -71h
var_70		= byte ptr -70h
var_6F		= byte ptr -6Fh
var_6E		= byte ptr -6Eh
var_6D		= byte ptr -6Dh
var_6C		= byte ptr -6Ch
var_6B		= byte ptr -6Bh
var_6A		= byte ptr -6Ah
var_69		= byte ptr -69h
var_68		= byte ptr -68h
var_67		= byte ptr -67h
var_66		= byte ptr -66h
var_65		= byte ptr -65h
var_64		= byte ptr -64h
var_63		= byte ptr -63h
var_62		= byte ptr -62h
var_61		= byte ptr -61h
var_60		= byte ptr -60h
var_5F		= byte ptr -5Fh
var_5E		= byte ptr -5Eh
var_5D		= byte ptr -5Dh
var_5C		= dword	ptr -5Ch
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= byte ptr -3Ch
var_38		= byte ptr -38h
var_34		= byte ptr -34h
var_30		= byte ptr -30h
var_2C		= byte ptr -2Ch
var_28		= byte ptr -28h
var_24		= byte ptr -24h
var_20		= byte ptr -20h
var_1C		= dword	ptr -1Ch
arg_0		= dword	ptr  8
arg_4		= dword	ptr  0Ch

		push	ebp
		mov	ebp, esp
		push	edi
		push	esi
		push	ebx
		call	sub_917
		add	ebx, 4B89h
		sub	esp, 31Ch
		mov	eax, [ebp+arg_4]
		lea	esi, [ebp+var_21C]
		mov	edx, [ebp+arg_0]
		mov	ecx,dword ptr [gsdata]	;mov	ecx, large gs:14h
		mov	[ebp+var_1C], ecx
		xor	ecx, ecx
		mov	[ebp+var_9C], 55h
		mov	[ebp+var_2F4], eax
		xor	eax, eax
		mov	[ebp+var_9B], 0D3h
		mov	[ebp+var_9A], 0Eh
		mov	[ebp+var_99], 2Ah
		mov	[ebp+var_98], 11h
		mov	[ebp+var_97], 1Fh
		mov	[ebp+var_96], 0A8h
		mov	[ebp+var_95], 0EAh
		mov	[ebp+var_94], 0CDh
		mov	[ebp+var_93], 6Ah
		mov	[ebp+var_92], 41h
		mov	[ebp+var_91], 0ABh
		mov	[ebp+var_90], 89h
		mov	[ebp+var_8F], 0B6h
		mov	[ebp+var_8E], 0DAh
		mov	[ebp+var_8D], 6Bh
		mov	[ebp+var_8C], 45h
		mov	[ebp+var_8B], 2
		mov	[ebp+var_8A], 74h
		mov	[ebp+var_89], 2Ch
		mov	[ebp+var_88], 1
		mov	[ebp+var_87], 4Eh
		mov	[ebp+var_86], 0Dh
		mov	[ebp+var_85], 0EDh
		mov	[ebp+var_84], 0BDh
		mov	[ebp+var_83], 99h
		mov	[ebp+var_82], 0A6h
		mov	[ebp+var_81], 0ADh
		mov	[ebp+var_80], 79h
		mov	[ebp+var_7F], 0E5h
		mov	[ebp+var_7E], 3Fh
		mov	[ebp+var_7D], 6Eh
		mov	[ebp+var_7C], 35h
		mov	[ebp+var_7B], 31h
		mov	[ebp+var_7A], 0D9h
		mov	[ebp+var_79], 2Eh
		mov	[ebp+var_78], 0F1h
		mov	[ebp+var_77], 7Ch
		mov	[ebp+var_76], 72h
		mov	[ebp+var_75], 0EFh
		mov	[ebp+var_74], 0ADh
		mov	[ebp+var_73], 0C8h
		mov	[ebp+var_72], 0Bh
		mov	[ebp+var_71], 0B0h
		mov	[ebp+var_70], 69h
		mov	[ebp+var_6F], 14h
		mov	[ebp+var_6E], 0A5h
		mov	[ebp+var_6D], 70h
		mov	[ebp+var_6C], 25h
		mov	[ebp+var_6B], 60h
		mov	[ebp+var_6A], 3Eh
		mov	[ebp+var_69], 31h
		mov	[ebp+var_68], 0E1h
		mov	[ebp+var_67], 0ABh
		mov	[ebp+var_66], 0D7h
		mov	[ebp+var_65], 0F1h
		mov	[ebp+var_64], 9Dh
		mov	[ebp+var_63], 0F7h
		mov	[ebp+var_62], 70h
		mov	[ebp+var_61], 0B2h
		mov	[ebp+var_60], 59h
		mov	[ebp+var_5F], 43h
		mov	[ebp+var_5E], 0Ah
		mov	[ebp+var_5D], 73h
		mov	[ebp+var_2B8], esi
		lea	esi, [esi+0]

loc_175F8:				; CODE XREF: gen_tab190+454j
		movzx	edi, byte ptr [edx+eax*4+16h]
		movzx	esi, byte ptr [edx+eax*4+14h]
		mov	[ebp+var_2B0], edi
		movzx	ecx, byte ptr [edx+eax*4+17h]
		mov	[ebp+var_2B4], ecx
		imul	ecx, esi, 0BFh
		imul	esi, 17Eh
		sub	ecx, 3BDE1D71h
		and	esi, 8843C51Eh
		sub	ecx, esi
		movzx	esi, byte ptr [edx+eax*4+15h]
		imul	esi, 0BFh
		mov	edi, esi
		and	esi, 0DAh
		and	edi, 0FFh
		imul	edi, 0F2838C2Dh
		imul	esi, 1AF8E7A6h
		lea	esi, [edi+esi+35BB697Fh]
		imul	edi, esi, 0A68EA3A5h
		imul	esi, 0B2E2B8B6h
		sub	esi, 572E49FFh
		and	esi, 21E82DCEh
		lea	esi, [edi+esi-543BFB52h]
		mov	edi, 802CDFAEh
		sub	edi, esi
		lea	esi, [esi+esi-2241ED2Ch]
		and	esi, 21E82DCEh
		lea	esi, [edi+esi]
		movzx	edi, cl
		shl	esi, 8
		add	esi, 100h
		imul	esi, 0A84934Bh
		imul	edi, 3DB307C3h
		sub	esi, 12A93093h
		mov	[ebp+var_2AC], esi
		mov	esi, ecx
		and	ecx, 55h
		and	esi, 0B3h
		xor	esi, 11h
		lea	ecx, [esi+ecx]
		imul	ecx, 8499F07Ah
		lea	ecx, [edi+ecx+29BCDF18h]
		imul	ecx, 0BA1AA0EBh
		xor	ecx, 9BEE0BBBh
		lea	esi, [ecx+ecx]
		and	esi, 0DFA38210h
		mov	[ebp+var_2C4], esi
		imul	edi, ecx, 0CA01D67Dh
		imul	esi, 35FE2983h
		lea	edi, [edi+esi-5FD78CBBh]
		mov	[ebp+var_2BC], edi
		imul	edi, [ebp+var_2AC], 5849A7A9h
		add	edi, [ebp+var_2BC]
		mov	[ebp+var_2C0], esi
		sub	ecx, [ebp+var_2C4]
		imul	esi, [ebp+var_2AC], 7AFF219Dh
		lea	ecx, [ecx+esi-5EBB81D1h]
		and	ecx, 8BE8043Ah
		imul	ecx, 6BFC5306h
		imul	esi, [ebp+var_2B0], 17Eh
		lea	ecx, [edi+ecx]
		mov	[ebp+var_2AC], ecx
		and	esi, 2A50DFCAh
		imul	ecx, [ebp+var_2B0], 0BFh
		sub	ecx, 6AD7901Bh
		sub	ecx, esi
		mov	esi, ecx
		movzx	edi, cl
		and	esi, 87h
		and	ecx, 3Fh
		xor	esi, 7
		lea	ecx, [esi+ecx]
		imul	edi, 76391227h
		imul	ecx, 138DDBB2h
		lea	ecx, [edi+ecx+5D4B362Ah]
		imul	ecx, 95C53D97h
		imul	edi, [ebp+var_2B4], 0FFFFFF41h
		xor	ecx, 0EC690B78h
		shl	ecx, 10h
		add	ecx, 10000h
		imul	esi, ecx, 1A0D9E7Dh
		lea	ecx, [ecx+ecx-1]
		and	ecx, 0D622126Eh
		imul	ecx, 0E5F26183h
		lea	esi, [esi+ecx+58CC71DBh]
		imul	ecx, [ebp+var_2B4], 17Eh
		or	ecx, 8822CD8h
		lea	edi, [edi+ecx-441166Ch]
		mov	ecx, edi
		and	edi, 0FFh
		and	ecx, 0B6h
		neg	ecx
		lea	edi, [edi+ecx*2]
		mov	ecx, edi
		neg	ecx
		lea	ecx, [ecx+ecx-16Dh]
		and	ecx, 275CF832h
		lea	ecx, [edi+ecx-13AE7B63h]
		mov	edi, 7377B64Eh
		xor	ecx, 9F2635A8h
		sub	edi, ecx
		add	ecx, ecx
		and	ecx, 19109362h
		lea	ecx, [edi+ecx]
		imul	edi, esi, 6804BD9Dh
		imul	esi, 0E3916A56h
		shl	ecx, 18h
		add	ecx, 1000000h
		imul	ecx, 197C007h
		and	esi, 0D622126Eh
		imul	esi, 4A507BA9h
		lea	edi, [edi+esi-50C8252Ch]
		imul	esi, [ebp+var_2AC], 0CC95859Dh
		lea	esi, [edi+esi]
		imul	edi, [ebp+var_2AC], 1AFDA5AAh
		or	edi, 17D00874h
		imul	edi, 0B5AF8457h
		add	esi, edi
		imul	esi, 85102C2Fh
		lea	ecx, [ecx+esi+1CED5D70h]
		imul	esi, ecx, 90085249h
		imul	ecx, 0DFEF5B6Eh
		sub	ecx, 73EC5183h
		and	ecx, 0A50FF288h
		lea	ecx, [esi+ecx+7E786BF6h]
		mov	esi, [ebp+var_2B8]
		mov	[esi+eax*4], ecx
		add	eax, 1
		cmp	eax, 6
		jnz	loc_175F8
		movzx	eax, byte ptr [edx+1]
		movzx	ecx, byte ptr [edx]
		movzx	edi, byte ptr [edx+2]
		imul	eax, 0BFh
		imul	ecx, 0BFh
		mov	esi, eax
		and	eax, 0FFh
		and	esi, 0DAh
		imul	esi, 151B4282h
		imul	eax, 0F5725EBFh
		lea	eax, [esi+eax-7B3835Dh]
		imul	esi, eax, 0B370113Fh
		imul	eax, 991FDD82h
		add	eax, 5ED2FC85h
		and	eax, 0BAEE8D72h
		lea	eax, [esi+eax+25B8AF0Bh]
		mov	esi, ecx
		and	esi, 0DAh
		and	ecx, 0FFh
		imul	esi, 2856866Eh
		imul	ecx, 0EBD4BCC9h
		lea	ecx, [esi+ecx-6245D15Ah]
		mov	esi, 0D5222D4Dh
		sub	esi, eax
		imul	ecx, 0B16FE287h
		lea	eax, [eax+eax-6532E80Eh]
		and	eax, 0BAEE8D72h
		lea	eax, [esi+eax]
		shl	eax, 8
		lea	eax, [ecx+eax+75A8DA9Bh]
		mov	ecx, eax
		and	eax, 0DB7827D0h
		or	ecx, 0DB7827D0h
		sub	ecx, 5ABDFD8Eh
		sub	ecx, eax
		imul	eax, edi, 0FFFFFF41h
		imul	edi, 17Eh
		or	edi, 770B4670h
		lea	esi, [eax+edi-3B85A338h]
		mov	edi, 0FFFF0000h
		mov	eax, esi
		and	esi, 0FFh
		and	eax, 0E2h
		neg	eax
		lea	esi, [esi+eax*2]
		mov	eax, esi
		neg	eax
		lea	eax, [eax+eax-1C5h]
		and	eax, 1FE9DD6Eh
		lea	eax, [esi+eax+700B122Bh]
		mov	esi, 0CD03508Fh
		xor	eax, 3D6E8A2Bh
		sub	esi, eax
		add	eax, eax
		and	eax, 6534C938h
		lea	esi, [esi+eax-7F9DB52Ch]
		shl	esi, 10h
		sub	edi, esi
		mov	eax, esi
		mov	esi, edi
		neg	eax
		or	esi, 0A80498Dh
		add	eax, 6C255820h
		add	esi, esi
		sub	eax, esi
		movzx	esi, byte ptr [edx+3]
		imul	esi, 0BFh
		mov	edi, esi
		and	esi, 0DAh
		and	edi, 0FFh
		imul	edi, 95DE26A7h
		imul	esi, 0D443B2B2h
		lea	esi, [edi+esi+7A32543Bh]
		imul	edi, esi, 74DB8217h
		imul	esi, 0CB4DBDD2h
		add	esi, 7BC856E5h
		and	esi, 74A30ECh
		imul	esi, 3734701h
		lea	esi, [edi+esi-1009E2E9h]
		mov	edi, eax
		sub	edi, ecx
		lea	ecx, [ecx+ecx-4A8404E4h]
		or	ecx, 490FB05Eh
		lea	eax, [eax+eax+3CB3E2D8h]
		lea	ecx, [edi+ecx]
		and	eax, 0EAFF6CE4h
		shl	esi, 18h
		sub	eax, ecx
		xor	esi, 89000000h
		lea	ecx, [esi+eax-1393D222h]
		mov	eax, ecx
		and	ecx, 0AC150EDh
		or	eax, 0AC150EDh
		sub	eax, ecx
		xor	eax, 0A7B95656h
		sub	eax, 68F5C387h
		mov	[ebp+var_204], eax
		movzx	eax, byte ptr [edx+5]
		movzx	ecx, byte ptr [edx+4]
		movzx	edi, byte ptr [edx+6]
		imul	eax, 0BFh
		imul	ecx, 0BFh
		mov	esi, eax
		and	esi, 0DAh
		imul	esi, 151B4282h
		and	eax, 0FFh
		imul	eax, 0F5725EBFh
		lea	eax, [esi+eax-7B3835Dh]
		imul	esi, eax, 0B370113Fh
		imul	eax, 991FDD82h
		add	eax, 5ED2FC85h
		and	eax, 0BAEE8D72h
		lea	eax, [esi+eax+25B8AF0Bh]
		mov	esi, ecx
		and	esi, 0DAh
		and	ecx, 0FFh
		imul	esi, 2856866Eh
		imul	ecx, 0EBD4BCC9h
		lea	ecx, [esi+ecx-6245D15Ah]
		mov	esi, 0D5222D4Dh
		sub	esi, eax
		imul	ecx, 0B16FE287h
		lea	eax, [eax+eax-6532E80Eh]
		and	eax, 0BAEE8D72h
		lea	eax, [esi+eax]
		shl	eax, 8
		lea	eax, [ecx+eax+75A8DA9Bh]
		mov	ecx, eax
		and	eax, 0DB7827D0h
		or	ecx, 0DB7827D0h
		sub	ecx, 5ABDFD8Eh
		sub	ecx, eax
		imul	eax, edi, 17Eh
		imul	esi, edi, 0FFFFFF41h
		mov	edi, 0FFFF0000h
		or	eax, 770B4670h
		lea	esi, [esi+eax-3B85A338h]
		mov	eax, esi
		and	esi, 0FFh
		and	eax, 0E2h
		neg	eax
		lea	esi, [esi+eax*2]
		mov	eax, esi
		neg	eax
		lea	eax, [eax+eax-1C5h]
		and	eax, 1FE9DD6Eh
		lea	eax, [esi+eax+700B122Bh]
		mov	esi, 0CD03508Fh
		xor	eax, 3D6E8A2Bh
		sub	esi, eax
		add	eax, eax
		and	eax, 6534C938h
		lea	esi, [esi+eax-7F9DB52Ch]
		shl	esi, 10h
		mov	eax, esi
		neg	eax
		add	eax, 6C255820h
		sub	edi, esi
		mov	esi, edi
		or	esi, 0A80498Dh
		add	esi, esi
		sub	eax, esi
		movzx	esi, byte ptr [edx+7]
		imul	esi, 0BFh
		mov	edi, esi
		and	esi, 0DAh
		and	edi, 0FFh
		imul	edi, 95DE26A7h
		imul	esi, 0D443B2B2h
		lea	esi, [edi+esi+7A32543Bh]
		imul	edi, esi, 74DB8217h
		imul	esi, 0CB4DBDD2h
		add	esi, 7BC856E5h
		and	esi, 74A30ECh
		imul	esi, 3734701h
		lea	esi, [edi+esi-1009E2E9h]
		mov	edi, eax
		sub	edi, ecx
		lea	ecx, [ecx+ecx-4A8404E4h]
		or	ecx, 490FB05Eh
		lea	eax, [eax+eax+3CB3E2D8h]
		lea	ecx, [edi+ecx]
		and	eax, 0EAFF6CE4h
		shl	esi, 18h
		sub	eax, ecx
		xor	esi, 89000000h
		lea	ecx, [esi+eax-1393D222h]
		mov	eax, ecx
		and	ecx, 0AC150EDh
		or	eax, 0AC150EDh
		sub	eax, ecx
		xor	eax, 0A7B95656h
		sub	eax, 68F5C387h
		mov	[ebp+var_200], eax
		movzx	eax, byte ptr [edx+9]
		movzx	ecx, byte ptr [edx+8]
		movzx	edi, byte ptr [edx+0Ah]
		imul	eax, 0BFh
		imul	ecx, 0BFh
		mov	esi, eax
		and	eax, 0FFh
		and	esi, 0DAh
		imul	esi, 151B4282h
		imul	eax, 0F5725EBFh
		lea	eax, [esi+eax-7B3835Dh]
		imul	esi, eax, 0B370113Fh
		imul	eax, 991FDD82h
		add	eax, 5ED2FC85h
		and	eax, 0BAEE8D72h
		lea	eax, [esi+eax+25B8AF0Bh]
		mov	esi, ecx
		and	esi, 0DAh
		and	ecx, 0FFh
		imul	esi, 2856866Eh
		imul	ecx, 0EBD4BCC9h
		lea	ecx, [esi+ecx-6245D15Ah]
		mov	esi, 0D5222D4Dh
		sub	esi, eax
		imul	ecx, 0B16FE287h
		lea	eax, [eax+eax-6532E80Eh]
		and	eax, 0BAEE8D72h
		lea	eax, [esi+eax]
		shl	eax, 8
		lea	eax, [ecx+eax+75A8DA9Bh]
		mov	ecx, eax
		and	eax, 0DB7827D0h
		or	ecx, 0DB7827D0h
		sub	ecx, 5ABDFD8Eh
		sub	ecx, eax
		imul	eax, edi, 17Eh
		imul	esi, edi, 0FFFFFF41h
		mov	edi, 0FFFF0000h
		or	eax, 770B4670h
		lea	esi, [esi+eax-3B85A338h]
		mov	eax, esi
		and	esi, 0FFh
		and	eax, 0E2h
		neg	eax
		lea	esi, [esi+eax*2]
		mov	eax, esi
		neg	eax
		lea	eax, [eax+eax-1C5h]
		and	eax, 1FE9DD6Eh
		lea	eax, [esi+eax+700B122Bh]
		mov	esi, 0CD03508Fh
		xor	eax, 3D6E8A2Bh
		sub	esi, eax
		add	eax, eax
		and	eax, 6534C938h
		lea	esi, [esi+eax-7F9DB52Ch]
		shl	esi, 10h
		sub	edi, esi
		mov	eax, esi
		mov	esi, edi
		neg	eax
		or	esi, 0A80498Dh
		add	eax, 6C255820h
		add	esi, esi
		sub	eax, esi
		movzx	esi, byte ptr [edx+0Bh]
		imul	esi, 0BFh
		mov	edi, esi
		and	esi, 0DAh
		and	edi, 0FFh
		imul	edi, 95DE26A7h
		imul	esi, 0D443B2B2h
		lea	esi, [edi+esi+7A32543Bh]
		imul	edi, esi, 74DB8217h
		imul	esi, 0CB4DBDD2h
		add	esi, 7BC856E5h
		and	esi, 74A30ECh
		imul	esi, 3734701h
		lea	esi, [edi+esi-1009E2E9h]
		mov	edi, eax
		sub	edi, ecx
		lea	ecx, [ecx+ecx-4A8404E4h]
		or	ecx, 490FB05Eh
		lea	eax, [eax+eax+3CB3E2D8h]
		lea	ecx, [edi+ecx]
		and	eax, 0EAFF6CE4h
		shl	esi, 18h
		sub	eax, ecx
		xor	esi, 89000000h
		lea	ecx, [esi+eax-1393D222h]
		mov	eax, ecx
		and	ecx, 0AC150EDh
		or	eax, 0AC150EDh
		sub	eax, ecx
		xor	eax, 0A7B95656h
		sub	eax, 68F5C387h
		mov	[ebp+var_1FC], eax
		movzx	eax, byte ptr [edx+0Dh]
		movzx	ecx, byte ptr [edx+0Ch]
		movzx	edi, byte ptr [edx+0Eh]
		imul	eax, 0BFh
		imul	ecx, 0BFh
		mov	esi, eax
		and	eax, 0FFh
		and	esi, 0DAh
		imul	esi, 151B4282h
		imul	eax, 0F5725EBFh
		lea	eax, [esi+eax-7B3835Dh]
		imul	esi, eax, 0B370113Fh
		imul	eax, 991FDD82h
		add	eax, 5ED2FC85h
		and	eax, 0BAEE8D72h
		lea	eax, [esi+eax+25B8AF0Bh]
		mov	esi, ecx
		and	esi, 0DAh
		imul	esi, 2856866Eh
		and	ecx, 0FFh
		imul	ecx, 0EBD4BCC9h
		lea	ecx, [esi+ecx-6245D15Ah]
		mov	esi, 0D5222D4Dh
		sub	esi, eax
		imul	ecx, 0B16FE287h
		lea	eax, [eax+eax-6532E80Eh]
		and	eax, 0BAEE8D72h
		lea	eax, [esi+eax]
		shl	eax, 8
		lea	eax, [ecx+eax+75A8DA9Bh]
		mov	ecx, eax
		and	eax, 0DB7827D0h
		or	ecx, 0DB7827D0h
		sub	ecx, 5ABDFD8Eh
		sub	ecx, eax
		imul	eax, edi, 17Eh
		imul	esi, edi, 0FFFFFF41h
		mov	edi, 0FFFF0000h
		or	eax, 770B4670h
		lea	esi, [esi+eax-3B85A338h]
		mov	eax, esi
		and	esi, 0FFh
		and	eax, 0E2h
		neg	eax
		lea	esi, [esi+eax*2]
		mov	eax, esi
		neg	eax
		lea	eax, [eax+eax-1C5h]
		and	eax, 1FE9DD6Eh
		lea	eax, [esi+eax+700B122Bh]
		mov	esi, 0CD03508Fh
		xor	eax, 3D6E8A2Bh
		sub	esi, eax
		add	eax, eax
		and	eax, 6534C938h
		lea	esi, [esi+eax-7F9DB52Ch]
		shl	esi, 10h
		sub	edi, esi
		mov	eax, esi
		mov	esi, edi
		neg	eax
		or	esi, 0A80498Dh
		add	eax, 6C255820h
		add	esi, esi
		sub	eax, esi
		movzx	esi, byte ptr [edx+0Fh]
		imul	esi, 0BFh
		mov	edi, esi
		and	esi, 0DAh
		and	edi, 0FFh
		imul	edi, 95DE26A7h
		imul	esi, 0D443B2B2h
		lea	esi, [edi+esi+7A32543Bh]
		imul	edi, esi, 74DB8217h
		imul	esi, 0CB4DBDD2h
		add	esi, 7BC856E5h
		and	esi, 74A30ECh
		imul	esi, 3734701h
		lea	esi, [edi+esi-1009E2E9h]
		mov	edi, eax
		sub	edi, ecx
		lea	ecx, [ecx+ecx-4A8404E4h]
		or	ecx, 490FB05Eh
		lea	eax, [eax+eax+3CB3E2D8h]
		lea	ecx, [edi+ecx]
		and	eax, 0EAFF6CE4h
		shl	esi, 18h
		sub	eax, ecx
		xor	esi, 89000000h
		lea	ecx, [esi+eax-1393D222h]
		mov	eax, ecx
		and	ecx, 0AC150EDh
		or	eax, 0AC150EDh
		sub	eax, ecx
		xor	eax, 0A7B95656h
		sub	eax, 68F5C387h
		mov	[ebp+var_1F8], eax
		movzx	eax, byte ptr [edx+11h]
		movzx	ecx, byte ptr [edx+10h]
		movzx	edi, byte ptr [edx+12h]
		movzx	edx, byte ptr [edx+13h]
		imul	eax, 0BFh
		imul	ecx, 0BFh
		mov	[ebp+var_1EC], 0E99235C1h
		mov	[ebp+var_1E8], 0E99235BDh
		mov	esi, eax
		and	eax, 0FFh
		and	esi, 0DAh
		imul	esi, 151B4282h
		imul	eax, 0F5725EBFh
		mov	[ebp+var_1E4], 0E99235BDh
		mov	[ebp+var_1E0], 0E99235BDh
		mov	[ebp+var_1F0], 0E99235BDh
		lea	eax, [esi+eax-7B3835Dh]
		imul	esi, eax, 0B370113Fh
		imul	eax, 991FDD82h
		add	eax, 5ED2FC85h
		and	eax, 0BAEE8D72h
		lea	eax, [esi+eax+25B8AF0Bh]
		mov	esi, ecx
		and	esi, 0DAh
		and	ecx, 0FFh
		imul	esi, 2856866Eh
		imul	ecx, 0EBD4BCC9h
		lea	ecx, [esi+ecx-6245D15Ah]
		mov	esi, 0D5222D4Dh
		sub	esi, eax
		imul	ecx, 0B16FE287h
		lea	eax, [eax+eax-6532E80Eh]
		and	eax, 0BAEE8D72h
		lea	eax, [esi+eax]
		shl	eax, 8
		lea	ecx, [ecx+eax+75A8DA9Bh]
		mov	eax, ecx
		and	ecx, 0DB7827D0h
		or	eax, 0DB7827D0h
		sub	eax, 5ABDFD8Eh
		sub	eax, ecx
		imul	ecx, edi, 17Eh
		imul	esi, edi, 0FFFFFF41h
		mov	edi, 0FFFF0000h
		imul	edx, 0BFh
		or	ecx, 770B4670h
		lea	esi, [esi+ecx-3B85A338h]
		mov	ecx, esi
		and	esi, 0FFh
		and	ecx, 0E2h
		neg	ecx
		lea	esi, [esi+ecx*2]
		mov	ecx, esi
		neg	ecx
		lea	ecx, [ecx+ecx-1C5h]
		and	ecx, 1FE9DD6Eh
		lea	ecx, [esi+ecx+700B122Bh]
		mov	esi, 0CD03508Fh
		xor	ecx, 3D6E8A2Bh
		sub	esi, ecx
		add	ecx, ecx
		and	ecx, 6534C938h
		lea	esi, [esi+ecx-7F9DB52Ch]
		shl	esi, 10h
		sub	edi, esi
		mov	ecx, esi
		mov	esi, edi
		neg	ecx
		or	esi, 0A80498Dh
		add	ecx, 6C255820h
		add	esi, esi
		sub	ecx, esi
		movzx	esi, dl
		and	edx, 0DAh
		imul	esi, 95DE26A7h
		imul	edx, 0D443B2B2h
		lea	edi, [ebp+var_2C]
		lea	edx, [esi+edx+7A32543Bh]
		imul	esi, edx, 74DB8217h
		imul	edx, 0CB4DBDD2h
		add	edx, 7BC856E5h
		and	edx, 74A30ECh
		imul	edx, 3734701h
		lea	edx, [esi+edx-1009E2E9h]
		mov	esi, ecx
		sub	esi, eax
		lea	eax, [eax+eax-4A8404E4h]
		or	eax, 490FB05Eh
		lea	ecx, [ecx+ecx+3CB3E2D8h]
		lea	eax, [esi+eax]
		and	ecx, 0EAFF6CE4h
		shl	edx, 18h
		sub	ecx, eax
		xor	edx, 89000000h
		lea	edx, [edx+ecx-1393D222h]
		mov	eax, edx
		and	edx, 0AC150EDh
		or	eax, 0AC150EDh
		sub	eax, edx
		xor	eax, 0A7B95656h
		sub	eax, 68F5C387h
		mov	[ebp+var_1F4], eax
		lea	eax, [ebp+var_3C]
		mov	[ebp+var_2D0], eax
		lea	edx, [ebp+var_38]
		lea	ecx, [ebp+var_34]
		lea	esi, [ebp+var_30]
		lea	eax, [ebp+var_28]
		mov	[ebp+var_2F0], edx
		lea	edx, [ebp+var_24]
		mov	[ebp+var_2EC], ecx
		lea	ecx, [ebp+var_20]
		mov	[ebp+var_2E8], esi
		lea	esi, [ebp+var_1DC]
		mov	[ebp+var_2E4], edi
		lea	edi, [ebp+var_25C]
		mov	[ebp+var_2E0], eax
		lea	eax, [ebp+var_9C]
		mov	[ebp+var_2DC], edx
		mov	[ebp+var_2D8], ecx
		mov	[ebp+var_2D4], 0
		mov	[ebp+var_2C4], esi
		mov	[ebp+var_2B4], edi
		mov	[ebp+var_2CC], eax
		db	66h
		nop

loc_18260:				; CODE XREF: gen_tab190+1902j
		mov	ecx, [ebp+var_2B8]
		mov	[ebp+var_2C8], ecx
		lea	esi, [esi+0]

loc_18270:				; CODE XREF: gen_tab190+1237j
		mov	edi, [ecx]
		lea	edx, [edi+68F5C387h]
		mov	esi, edi
		xor	dl, dl
		sub	esi, edx
		lea	eax, [esi+68F5C387h]
		or	eax, 7C31C87Bh
		neg	eax
		lea	eax, [esi+eax*2-1AD873FFh]
		mov	esi, dword ptr [oba_1BFE4]	;offset
		xor	eax, 61FEF89Ch
		mov	edx, eax
		and	eax, 0E230CF5Ch
		or	edx, 0E230CF5Ch
		sub	edx, eax
		movzx	eax, byte ptr [edx+esi+40h]
		lea	esi, [edi+edi-2E1478F2h]
		and	esi, 0A50FF288h
		imul	edx, eax, 7Bh
		imul	eax, 0FFFFFF0Ah
		add	eax, 0A079h
		and	eax, 0D2D6FBEh
		lea	edx, [edx+eax-697081Ch]
		mov	eax, 44824334h
		sub	eax, edi
		lea	esi, [eax+esi]
		shr	esi, 8
		mov	eax, esi
		not	esi
		add	esi, 1000000h
		neg	eax
		or	esi, 0AD7806BBh
		add	eax, 45824332h
		add	esi, esi
		sub	eax, esi
		lea	esi, [eax+68F5C387h]
		and	esi, 0FFh
		mov	edi, esi
		or	edi, 0FFFFFFBBh
		imul	edi, 178141BEh
		imul	esi, 0F43F5F21h
		lea	esi, [esi+edi-7CC6995h]
		mov	edi, dword ptr [oba_1BFE4]	;offset
		imul	esi, 0D514E4E1h
		movzx	esi, byte ptr [esi+edi+215580EFh]
		lea	edi, [esi+esi*4+45581958h]
		imul	esi, -0Ah
		add	esi, 6B7h
		and	esi, 754FC698h
		add	edi, esi
		and	edi, 0FFh
		mov	esi, edi
		neg	esi
		lea	esi, [esi+esi-1]
		and	esi, 98h
		lea	esi, [edi+esi-4Ch]
		imul	edi, esi, 9177218Bh
		and	esi, 0F052BE1Ch
		imul	esi, 0DD11BCEAh
		lea	esi, [edi+esi+6272D534h]
		movzx	edi, dl
		mov	edx, edi
		neg	edx
		lea	edx, [edx+edx-1]
		and	edx, 1BEh
		lea	edi, [edx+edi]
		mov	edx, 0DEh
		sub	edx, edi
		imul	edi, esi, 6648E93Bh
		imul	esi, 9A38FC46h
		shl	edx, 8
		imul	edx, 3AEBC1F7h
		and	esi, 0E0A57C38h
		imul	esi, 3AEBC1F7h
		lea	edx, [edx+edi+7C961F35h]
		lea	esi, [edx+esi]
		imul	edx, esi, 0F4E74FC7h
		mov	[ebp+var_2B0], esi
		shl	edx, 8
		sub	edx, 795A4F00h
		imul	esi, edx, 0D3E0A23Fh
		lea	edx, [edx+edx-1]
		and	edx, 0DBDCC260h
		imul	edx, 2C1F5DC1h
		lea	esi, [esi+edx+12A4AD0h]
		imul	edx, esi, 1519B241h
		imul	esi, 2A336482h
		sub	edx, 12119ED0h
		and	esi, 0DBDCC260h
		sub	edx, esi
		imul	esi, edx, 436C3937h
		and	edx, 418C243Dh
		imul	edx, 79278D92h
		lea	edx, [esi+edx-7616A1E5h]
		mov	[ebp+var_2AC], edx
		mov	edx, 44824334h
		sub	edx, eax
		lea	eax, [eax+eax-2E1478F2h]
		and	eax, 0A50FF288h
		add	edx, eax
		shr	edx, 8
		mov	eax, edx
		not	edx
		neg	eax
		add	eax, 45824332h
		add	edx, 1000000h
		or	edx, 0AD7806BBh
		add	edx, edx
		sub	eax, edx
		lea	esi, [eax+68F5C387h]
		mov	edx, esi
		mov	edi, esi
		and	edx, 52843104h
		and	esi, 0FE943370h
		xor	esi, 52843140h
		neg	edx
		and	edi, 0FE94338Fh
		lea	edi, [edi+edx*2]
		mov	edx, esi
		sub	edx, edi
		mov	[ebp+var_2BC], edx
		mov	edx, 0AD7BCEFBh
		sub	edx, edi
		mov	edi, [ebp+var_2B0]
		or	edx, esi
		imul	edx, 0EA478586h
		imul	esi, [ebp+var_2BC], 8ADC3D3Dh
		lea	edx, [esi+edx+224612C7h]
		mov	esi, dword ptr [oba_1BFE4]	;offset
		imul	edx, 0D18E8215h
		movzx	edx, byte ptr [edx+esi+66D138E7h]
		mov	esi, edx
		shl	esi, 5
		sub	esi, edx
		imul	edx, -3Eh
		add	edx, 231Dh
		and	edx, 893C2904h
		lea	esi, [esi+edx+3B61D9EFh]
		and	esi, 0FFh
		xor	esi, 84DAD334h
		lea	edx, [esi+3EE9621h]
		add	esi, esi
		and	esi, 90981254h
		sub	edx, esi
		lea	esi, [edx+10F44DA5h]
		lea	edx, [edx+edx-774519EEh]
		and	edx, 992DB538h
		sub	esi, edx
		imul	esi, 0C5143E09h
		imul	edx, [ebp+var_2AC], 745E2BFh
		lea	esi, [edi+esi+4780C25h]
		add	esi, edx
		imul	edx, [ebp+var_2AC], 42B5990Eh
		and	edx, 8318487Ah
		imul	edx, 3AEBC1F7h
		lea	edx, [esi+edx]
		mov	esi, 44824334h
		sub	esi, eax
		lea	eax, [eax+eax-2E1478F2h]
		and	eax, 0A50FF288h
		lea	eax, [esi+eax]
		shr	eax, 8
		mov	esi, eax
		not	eax
		add	eax, 1000000h
		neg	esi
		or	eax, 0AD7806BBh
		add	eax, eax
		sub	esi, eax
		sub	esi, 5187F947h
		mov	eax, esi
		and	esi, 4B7AC337h
		and	eax, 4B7AC3C8h
		xor	eax, 953C058Eh
		xor	eax, esi
		lea	esi, [eax+eax]
		sub	eax, 6AC3FA36h
		and	esi, 2A780B94h
		sub	eax, esi
		mov	esi, dword ptr [oba_1BFE4]	;offset 
		movzx	eax, byte ptr [eax+esi+340h]
		sub	eax, 25h
		movzx	esi, al
		and	eax, 0DEh
		imul	eax, 0F4320056h
		imul	esi, 85E6FFD5h
		lea	esi, [esi+eax-4DA12D0Bh]
		imul	esi, 0FA40417Dh
		lea	eax, [esi+17E0D10Fh]
		lea	esi, [esi+esi-563A6B86h]
		and	esi, 9A8A50B8h
		sub	eax, esi
		lea	esi, [eax+eax+148E4314h]
		and	esi, 9A8A50B8h
		sub	eax, esi
		imul	esi, edx, 0F4E74FC7h
		imul	eax, 0C5143E09h
		add	esi, 3686A5B0h
		shl	esi, 8
		imul	esi, 3AEBC1F7h
		lea	edx, [edx+esi-143E0900h]
		lea	esi, [eax+edx-2E33B2EAh]
		mov	eax, 795A4F00h
		imul	edx, esi, 0F4E74FC7h
		shl	edx, 8
		sub	eax, edx
		imul	edx, eax, 0A5BAA0D5h
		and	eax, 1E69D9ACh
		imul	eax, 0B48ABE56h
		lea	eax, [edx+eax+79159C1Ch]
		imul	edx, eax, 9BFCA265h
		imul	eax, 0F6BB30FAh
		lea	edx, [esi+edx+11E04F0Ch]
		and	eax, 3CD3B358h
		imul	eax, 3AEBC1F7h
		add	edx, eax
		imul	esi, edx, 0B18B039h
		imul	edx, 0E9CE9F8Eh
		lea	eax, [edx+6D0D4B61h]
		and	eax, 0A50FF288h
		lea	eax, [esi+eax+0DFB9D84h]
		mov	[ecx], eax
		add	ecx, 4
		cmp	ecx, [ebp+var_2C4]
		jnz	loc_18270
		mov	edi, [ebp+var_2CC]
		mov	edx, [ebp+var_2B4]
		mov	eax, [edi]
		mov	[edx], eax
		mov	eax, [edi+4]
		mov	[edx+4], eax
		mov	eax, [edi+8]
		mov	[edx+8], eax
		mov	eax, [edi+0Ch]
		mov	[edx+0Ch], eax
		mov	eax, [edi+10h]
		mov	[edx+10h], eax
		mov	eax, [edi+14h]
		mov	[edx+14h], eax
		mov	eax, [edi+18h]
		mov	[edx+18h], eax
		mov	eax, [edi+1Ch]
		mov	[edx+1Ch], eax
		mov	eax, [edi+20h]
		mov	[edx+20h], eax
		mov	eax, [edi+24h]
		mov	[edx+24h], eax
		mov	eax, [edi+28h]
		mov	[edx+28h], eax
		mov	eax, [edi+2Ch]
		mov	[edx+2Ch], eax
		mov	eax, [edi+30h]
		mov	[edx+30h], eax
		mov	eax, [edi+34h]
		mov	[edx+34h], eax
		mov	eax, [edi+38h]
		mov	[edx+38h], eax
		mov	eax, [edi+3Ch]
		mov	[edx+3Ch], eax
		mov	[ebp+var_2B0], 0

loc_18711:				; CODE XREF: gen_tab190+15FAj
		mov	ecx, [ebp+var_2B4]
		mov	esi, [ebp+var_2B8]
		mov	[esp+4], ecx
		mov	[esp], esi
		call	gen_buff2
		xor	edx, edx
		nop
		lea	esi, [esi+0]

loc_18730:				; CODE XREF: gen_tab190+15E6j
		mov	edi, [ebp+var_2B4]
		mov	esi, 3Fh
		imul	ecx, [edi+edx*4], 0AC672587h
		mov	edi, dword ptr [oba_1BFE4]	;offset
		lea	eax, [ecx+4B484C1h]
		imul	eax, 0F4E74FC7h
		add	eax, 3686A5B0h
		or	eax, 0FFFFFF00h
		sub	esi, eax
		movzx	eax, byte ptr [esi+edi]
		imul	esi, eax, 7Bh
		imul	eax, 0FFFFFF0Ah
		add	eax, 0A079h
		and	eax, 568FBF96h
		lea	esi, [esi+eax+54B7CFF8h]
		and	esi, 0FFh
		mov	eax, esi
		neg	eax
		lea	eax, [eax+eax-1]
		and	eax, 196h
		add	eax, esi
		imul	eax, 0C5143E09h
		lea	eax, [ecx+eax-4258AC62h]
		imul	eax, 0F4E74FC7h
		lea	ecx, [eax+3686A5B0h]
		add	eax, 3686A5B1h
		shr	ecx, 15h
		imul	eax, 2C3A4800h
		imul	ecx, 682BFFBFh
		sub	eax, 6DBC683h
		sub	ecx, 68DC1E44h
		imul	edi, eax, 0D020BF3Fh
		imul	esi, ecx, 604D4BC9h
		imul	eax, 4A435F2h
		imul	ecx, 59AFE07Eh
		lea	esi, [edi+esi-5AA7C026h]
		add	eax, 33C6C6D5h
		sub	ecx, 74B1AA87h
		or	ecx, eax
		imul	ecx, 0C5143E09h
		lea	ecx, [esi+ecx]
		imul	eax, ecx, 0F4E74FC7h
		mov	[ebp+var_2AC], ecx
		add	eax, 3686A5B0h
		or	eax, 0FFFFFF00h
		xor	eax, 57D0703Dh
		lea	ecx, [eax+eax]
		and	ecx, 505F1F84h
		sub	eax, 57D06EFEh
		sub	eax, ecx
		mov	ecx, dword ptr [oba_1BFE4]	;offset
		imul	edi, [ebp+var_2AC], 16316072h
		movzx	eax, byte ptr [eax+ecx]
		sub	edi, 6D0D4B62h
		lea	ecx, [eax+eax*4+24326A60h]
		imul	eax, -0Ah
		add	eax, 6B7h
		and	eax, 0B79B2488h
		lea	eax, [ecx+eax]
		movzx	esi, al
		and	eax, 2Ch
		imul	ecx, eax, 7CAC5DFAh
		lea	eax, [esi+1F47CE2Ch]
		imul	eax, 0C1A9D103h
		lea	eax, [ecx+eax]
		imul	ecx, eax, 9FE021ABh
		imul	eax, 3FC04356h
		add	ecx, 1F47CE68h
		and	eax, 3E8F9CD0h
		sub	ecx, eax
		lea	eax, [ecx+3F308200h]
		add	ecx, ecx
		and	ecx, 88CAAC28h
		sub	eax, ecx
		lea	ecx, [eax+eax+0A69A828h]
		and	ecx, 88CAAC28h
		mov	esi, ecx
		sub	esi, eax
		lea	esi, [esi+esi+6CCBABAFh]
		and	esi, edi
		mov	edi, 5B228DDAh
		sub	edi, [ebp+var_2AC]
		lea	eax, [esi+eax]
		sub	ecx, eax
		imul	edi, 0F4E74FC7h
		lea	eax, [ecx+edi+3686A5B0h]
		mov	ecx, eax
		shl	ecx, 0Ah
		shr	eax, 16h
		imul	ecx, 1BB961CFh
		imul	eax, 3571A725h
		sub	ecx, 3B78BBADh
		add	eax, 65252C4Fh
		imul	edi, eax, 85717EBh
		imul	esi, ecx, 3CF06F59h
		imul	ecx, 0BD240A5Eh
		imul	eax, 0DA44395Ah
		lea	edi, [edi+esi+7B462DD9h]
		sub	ecx, 55024C7Bh
		add	eax, 1F14CD3Bh
		or	ecx, eax
		imul	ecx, 0C5143E09h
		lea	esi, [edi+ecx]
		imul	ecx, esi, 0F4E74FC7h
		add	ecx, 3686A5B0h
		mov	eax, ecx
		mov	edi, ecx
		and	eax, 0C38BE746h
		and	ecx, 0C38BE7B9h
		neg	eax
		and	edi, 0C38BE700h
		sub	eax, ecx
		sub	eax, 3C741847h
		imul	edi, 0E163A642h
		imul	eax, 0F0B1D321h
		lea	eax, [edi+eax+31E48340h]
		mov	edi, dword ptr [oba_1BFE4]	;offset
		imul	eax, 237770E1h
		movzx	eax, byte ptr [eax+edi-598F3FBAh]
		mov	ecx, eax
		shl	ecx, 5
		sub	ecx, eax
		imul	eax, -3Eh
		add	eax, 231Dh
		and	eax, 3A7309B2h
		lea	ecx, [ecx+eax+62C66998h]
		and	ecx, 0FFh
		mov	eax, ecx
		neg	eax
		lea	eax, [eax+eax-1]
		and	eax, 1B2h
		add	eax, ecx
		imul	eax, 0C5143E09h
		sub	esi, eax
		lea	eax, [esi+0E2895A1h]
		imul	eax, 0F4E74FC7h
		add	eax, 3686A5B0h
		mov	ecx, eax
		shl	ecx, 7
		imul	ecx, 7EBD483Bh
		add	ecx, 21C4D674h
		shr	eax, 19h
		imul	eax, 7BA5D30Fh
		imul	esi, ecx, 0D4104D75h
		imul	ecx, 924CA1E6h
		add	eax, 44CB1331h
		imul	edi, eax, 9A2D8299h
		imul	eax, 217977DEh
		add	ecx, 0BD860C7h
		lea	esi, [edi+esi+7C3F6FECh]
		sub	eax, 712F6C7Dh
		or	ecx, eax
		mov	eax, 6D0D4B61h
		imul	ecx, 0C5143E09h
		add	esi, ecx
		mov	ecx, [ebp+var_2B8]
		imul	edi, esi, 0B18B039h
		imul	esi, 16316072h
		sub	eax, esi
		and	eax, 0A50FF288h
		lea	eax, [edi+eax+0DFB9D84h]
		mov	[ecx+edx*4], eax
		add	edx, 1
		cmp	edx, 10h
		jnz	loc_18730
		add	[ebp+var_2B0], 1
		cmp	[ebp+var_2B0], 3
		jnz	loc_18711
		mov	esi, [ebp+var_2B4]
		mov	[esp], ecx
		mov	[esp+4], esi
		call	gen_buff2
		mov	edi, [ebp+var_2D0]
		imul	eax, [ebp+var_23C], 8F6AAEF5h
		mov	edx, [ebp+var_2F0]
		mov	ecx, [ebp+var_2EC]
		mov	esi, [ebp+var_2E8]
		add	eax, 1A313B21h
		mov	[edi], eax
		mov	edi, [ebp+var_2E4]
		imul	eax, [ebp+var_238], 8F6AAEF5h
		add	eax, 1A313B21h
		mov	[edx], eax
		mov	edx, [ebp+var_2E0]
		imul	eax, [ebp+var_234], 8F6AAEF5h
		add	eax, 1A313B21h
		mov	[ecx], eax
		mov	ecx, [ebp+var_2DC]
		imul	eax, [ebp+var_230], 8F6AAEF5h
		add	eax, 1A313B21h
		mov	[esi], eax
		mov	esi, [ebp+var_2D8]
		imul	eax, [ebp+var_22C], 8F6AAEF5h
		add	eax, 1A313B21h
		mov	[edi], eax
		imul	eax, [ebp+var_228], 8F6AAEF5h
		add	eax, 1A313B21h
		mov	[edx], eax
		imul	eax, [ebp+var_224], 8F6AAEF5h
		add	eax, 1A313B21h
		mov	[ecx], eax
		xor	ecx, ecx
		imul	eax, [ebp+var_220], 8F6AAEF5h
		add	eax, 1A313B21h
		mov	[esi], eax
		mov	eax, [ebp+var_2D4]
		shl	eax, 5
		add	eax, [ebp+var_2C4]
		mov	[ebp+var_2BC], eax
		lea	esi, [esi+0]

loc_18B48:				; CODE XREF: gen_tab190+18CBj
		mov	edi, [ebp+var_2D0]
		mov	edx, 0B03B421Ch
		mov	[ebp+var_2B0], 0CB7B9CB5h
		imul	esi, [edi+ecx*4], 8630988Dh
		add	esi, 4D8F3D8Ah
		mov	eax, esi
		mov	edi, esi
		and	eax, 0E3295B5Ch
		and	edi, 0E3295BA3h
		mov	[ebp+var_2AC], eax
		mov	eax, 0E3295B5Ch
		sub	edx, edi
		sub	eax, [ebp+var_2AC]
		mov	edi, edx
		mov	edx, 37CAD2E1h
		or	eax, 8C6C4A67h
		sub	edx, eax
		mov	eax, [ebp+var_2AC]
		add	edx, edx
		sub	edx, eax
		lea	eax, [edi-0B83D906h]
		add	edi, 32EE1987h
		or	edi, 0C18E0D74h
		add	edi, edi
		sub	eax, edi
		mov	edi, esi
		xor	edx, eax
		mov	eax, esi
		shr	eax, 8
		xor	edx, 0B462C07Dh
		sub	eax, 1000000h
		or	eax, 0FFFFFF00h
		shr	edi, 10h
		xor	eax, 75CC7D4Ah
		sub	edi, 10000h
		mov	[ebp+var_2AC], eax
		mov	eax, edi
		mov	[ebp+var_2FC], edx
		mov	edx, edi
		not	edi
		and	edi, 800880A0h
		and	eax, 0E3288A0Fh
		and	edx, 0E3288AF0h
		or	edi, 6FB40B52h
		sub	[ebp+var_2B0], eax
		mov	eax, 52DC9641h
		sub	eax, edx
		add	edi, edi
		mov	edx, [ebp+var_2B0]
		sub	eax, edi
		mov	edi, [ebp+var_2B0]
		xor	eax, 0F1E16122h
		sub	edx, 761F3AA5h
		add	edi, 17ACED5Ah
		or	edi, 7233D802h
		add	edi, edi
		sub	edx, edi
		xor	eax, edx
		movzx	edx, byte ptr [ebp+var_2FC]
		shr	esi, 18h
		sub	esi, 100h
		or	esi, 0FFFFFF00h
		sub	edx, 78h
		xor	esi, 0F3B78EABh
		mov	byte ptr [ebp+var_2B0],	dl
		shl	edx, 6
		sub	dl, byte ptr [ebp+var_2B0]
		mov	edi, edx
		movzx	edx, byte ptr [ebp+var_2FC]
		and	edx, 0FFFFFFB4h
		lea	edx, [edi+edx*2-2Ch]
		mov	edi, [ebp+var_2BC]
		mov	[edi+ecx*4], dl
		movzx	edx, byte ptr [ebp+var_2AC]
		sub	edx, 16h
		mov	edi, edx
		shl	edx, 6
		mov	byte ptr [ebp+var_2B0],	dl
		mov	edx, edi
		sub	byte ptr [ebp+var_2B0],	dl
		movzx	edx, byte ptr [ebp+var_2AC]
		and	edx, 6Fh
		mov	byte ptr [ebp+var_2AC],	dl
		shl	edx, 7
		mov	edi, edx
		movzx	edx, byte ptr [ebp+var_2AC]
		lea	edi, [edi+edx*2]
		movzx	edx, byte ptr [ebp+var_2B0]
		lea	edx, [edx+edi-45h]
		mov	edi, [ebp+var_2BC]
		mov	[ebp+var_309], dl
		mov	[edi+ecx*4+1], dl
		lea	edi, [eax+1]
		and	eax, 0FFFFFFA8h
		mov	edx, edi
		shl	edx, 6
		mov	byte ptr [ebp+var_2AC],	dl
		mov	edx, edi
		mov	edi, [ebp+var_2BC]
		sub	byte ptr [ebp+var_2AC],	dl
		movzx	edx, byte ptr [ebp+var_2AC]
		lea	eax, [edx+eax*2+19h]
		lea	edx, [esi+7]
		and	esi, 0FFFFFF8Eh
		mov	[edi+ecx*4+2], al
		mov	eax, edx
		shl	eax, 6
		sub	al, dl
		lea	eax, [eax+esi*2+39h]
		mov	[edi+ecx*4+3], al
		add	ecx, 1
		cmp	ecx, 8
		jnz	loc_18B48
		add	[ebp+var_2D4], 1
		cmp	[ebp+var_2D4], 5
		jz	short loc_18D67
		mov	edx, [ebp+var_2D4]
		mov	eax, 0E99235B9h
		sub	edx, 166DCA43h
		cmp	[ebp+var_2D4], 4
		cmovnz	eax, edx
		mov	[ebp+var_1F0], eax
		jmp	loc_18260
; ---------------------------------------------------------------------------

loc_18D67:				; CODE XREF: gen_tab190+18DFj
		mov	edx, dword ptr [oba_1BFE4]	;offset
		imul	eax, [edx], 14243245h
		sub	eax, 3F7784FDh
		mov	[ebp+var_29C], eax
		imul	eax, [edx+4], 14243245h
		sub	eax, 3F7784FDh
		mov	[ebp+var_298], eax
		imul	eax, [edx+8], 14243245h
		sub	eax, 3F7784FDh
		mov	[ebp+var_294], eax
		imul	eax, [edx+0Ch],	14243245h
		sub	eax, 3F7784FDh
		mov	[ebp+var_290], eax
		imul	eax, [edx+10h],	14243245h
		sub	eax, 3F7784FDh
		mov	[ebp+var_28C], eax
		imul	eax, [edx+14h],	14243245h
		sub	eax, 3F7784FDh
		mov	[ebp+var_288], eax
		imul	eax, [edx+18h],	14243245h
		sub	eax, 3F7784FDh
		mov	[ebp+var_284], eax
		imul	eax, [edx+1Ch],	14243245h
		sub	eax, 3F7784FDh
		mov	[ebp+var_280], eax
		imul	eax, [edx+20h],	14243245h
		sub	eax, 3F7784FDh
		mov	[ebp+var_27C], eax
		imul	eax, [edx+24h],	14243245h
		sub	eax, 3F7784FDh
		mov	[ebp+var_278], eax
		imul	eax, [edx+28h],	14243245h
		sub	eax, 3F7784FDh
		mov	[ebp+var_274], eax
		imul	eax, [edx+2Ch],	14243245h
		sub	eax, 3F7784FDh
		mov	[ebp+var_270], eax
		imul	eax, [edx+30h],	14243245h
		sub	eax, 3F7784FDh
		mov	[ebp+var_26C], eax
		imul	eax, [edx+34h],	14243245h
		sub	eax, 3F7784FDh
		mov	[ebp+var_268], eax
		imul	eax, [edx+38h],	14243245h
		sub	eax, 3F7784FDh
		mov	[ebp+var_264], eax
		imul	eax, [edx+3Ch],	14243245h
		sub	eax, 3F7784FDh
		mov	[ebp+var_260], eax
		mov	[ebp+var_1F0], 0E99235BAh
		mov	ecx, [ebp+var_2B8]
		mov	edi, [ebp+var_2C8]
		add	ecx, 40h
		mov	[ebp+var_2B0], ecx
		nop
		lea	esi, [esi+0]

loc_18EB0:				; CODE XREF: gen_tab190+1F90j
		mov	esi, [edi]
		mov	edi, 9CC83CDDh
		lea	eax, [esi+68F5C387h]
		mov	edx, eax
		mov	ecx, eax
		and	edx, 3374000h
		and	ecx, 17F75CDCh
		neg	edx
		and	eax, 17F75C23h
		lea	edx, [ecx+edx*2]
		xor	eax, 12875800h
		sub	edi, edx
		mov	ecx, eax
		sub	ecx, edx
		mov	edx, edi
		mov	edi, dword ptr [oba_1BFF0]	;offset 
		or	edx, eax
		imul	ecx, 6530037Dh
		imul	edx, 359FF906h
		lea	eax, [ecx+edx+1BBC4B6Ch]
		mov	ecx, dword ptr [oba_1BFF0]	;offset
		imul	edx, eax, 39D59BAAh
		imul	eax, 9CEACDD5h
		and	edx, 0E36136CCh
		add	eax, 71B09B66h
		sub	eax, edx
		movzx	edx, byte ptr [eax+ecx]
		lea	eax, [edx+59353493h]
		lea	edx, [edx+edx-9Ah]
		and	edx, 0B26A69C0h
		sub	eax, edx
		mov	edx, eax
		movzx	ecx, al
		and	edx, 37h
		and	eax, 76h
		xor	edx, 36h
		lea	eax, [edx+eax]
		mov	edx, 3EE22563h
		neg	eax
		lea	eax, [ecx+eax*2+18E1CC48h]
		mov	ecx, 3EE22462h
		sub	edx, eax
		lea	eax, [eax+eax-57C3F136h]
		and	eax, 0D9FFA66Eh
		add	edx, eax
		mov	eax, 0FFFFFF00h
		shl	edx, 8
		sub	eax, edx
		sub	ecx, edx
		or	eax, 13002CC8h
		neg	eax
		lea	ecx, [ecx+eax*2]
		mov	eax, 44824334h
		lea	edx, [esi+esi-2E1478F2h]
		sub	eax, esi
		and	edx, 0A50FF288h
		mov	esi, 0E99235BDh
		add	eax, edx
		shr	eax, 8
		sub	eax, 1000000h
		sub	esi, eax
		lea	eax, [eax+eax+1]
		or	eax, 5AF00D77h
		add	esi, eax
		lea	eax, [esi+68F5C387h]
		movzx	eax, al
		lea	edx, [eax+10037140h]
		or	eax, 0FCE579DAh
		imul	edx, 8B8F00Dh
		imul	eax, 0EE8E1FE6h
		lea	eax, [edx+eax-1A7E203Bh]
		imul	edx, eax, 5529BD8Ah
		imul	eax, 2A94DEC5h
		and	edx, 6350CC2h
		add	eax, 31A8661h
		sub	eax, edx
		movzx	eax, byte ptr [eax+edi+100h]
		mov	edi, 3EE22563h
		mov	edx, eax
		shl	edx, 5
		sub	edx, eax
		imul	eax, -3Eh
		add	eax, 3B17h
		and	eax, 0A0C32AAAh
		lea	eax, [edx+eax-5061B2E1h]
		and	eax, 0FFh
		lea	edx, [eax+76E592FFh]
		imul	edx, 5B360B27h
		imul	eax, 4993E9B2h
		add	edx, eax
		imul	eax, edx, 0DF78B497h
		imul	edx, 0BEF1692Eh
		add	eax, 76E592AAh
		and	edx, 0EDCB2554h
		sub	eax, edx
		lea	edx, [eax-695452F7h]
		add	eax, eax
		and	eax, 685CC95Eh
		sub	edx, eax
		lea	eax, [ecx-109341B9h]
		lea	ecx, [ecx+ecx-57C3F136h]
		and	ecx, 0D9FFA66Eh
		sub	eax, ecx
		sub	eax, edx
		lea	edx, [edx+edx+3B056F4Ch]
		or	edx, 685CC95Eh
		add	eax, edx
		mov	edx, 0FFFFFF00h
		xor	eax, 0ECFFD337h
		lea	ecx, [eax+2BE1F89Bh]
		add	eax, eax
		and	eax, 0D9FFA66Eh
		sub	edi, ecx
		add	edi, eax
		sub	ecx, eax
		shl	edi, 8
		mov	eax, 44824334h
		sub	edx, edi
		sub	eax, esi
		imul	edi, edx, 0ECDAACA1h
		and	edx, 7A89CF55h
		lea	esi, [esi+esi-2E1478F2h]
		imul	edx, 264AA6BEh
		and	esi, 0A50FF288h
		lea	esi, [eax+esi]
		shr	esi, 8
		mov	eax, esi
		not	esi
		lea	edx, [edi+edx-6DA57F8Bh]
		add	esi, 1000000h
		imul	edi, edx, 8D4E3761h
		neg	eax
		or	esi, 0AD7806BBh
		add	eax, 45824332h
		add	esi, esi
		sub	eax, esi
		lea	esi, [eax+68F5C387h]
		mov	[ebp+var_2AC], esi
		lea	ecx, [edi+ecx]
		mov	edi, [ebp+var_2AC]
		and	esi, 186E5840h
		neg	esi
		imul	edx, 1A9C6EC2h
		and	edi, 0D86E5CD0h
		lea	edi, [edi+esi*2]
		mov	[ebp+var_2B4], edi
		mov	edi, [ebp+var_2AC]
		and	edx, 0F5139EAAh
		sub	ecx, edx
		add	ecx, 3BA7A9F1h
		and	edi, 0D86E5C2Fh
		xor	ecx, 0ECFFD337h
		xor	edi, 50065804h
		mov	esi, edi
		sub	esi, [ebp+var_2B4]
		lea	edx, [ecx+2BE1F89Bh]
		add	ecx, ecx
		and	ecx, 0D9FFA66Eh
		imul	esi, 5184D39Fh
		sub	edx, ecx
		mov	[ebp+var_2AC], esi
		mov	esi, 0C5818593h
		sub	esi, [ebp+var_2B4]
		or	esi, edi
		mov	edi, [ebp+var_2AC]
		imul	esi, 5CF658C2h
		lea	esi, [edi+esi+7DD14BAEh]
		imul	edi, esi, 0A82F10BEh
		imul	esi, 5417885Fh
		and	edi, 0D4F04458h
		sub	esi, edi
		mov	edi, dword ptr [oba_1BFF0]	;offset 
		movzx	esi, byte ptr [esi+edi+6A78242Ch]
		imul	edi, esi, 2Bh
		imul	esi, -56h
		add	esi, 3ED1h
		and	esi, 2FB01874h
		lea	edi, [edi+esi+6827D45Dh]
		and	edi, 0FFh
		xor	edi, 17CF682Bh
		lea	esi, [edi-7CD6C630h]
		add	edi, edi
		and	edi, 39DCFD0Ah
		sub	esi, edi
		lea	ecx, [esi+esi+338A896Ah]
		and	ecx, 16422D28h
		sub	esi, ecx
		lea	ecx, [esi-3B4AEA01h]
		mov	esi, 9D93057Eh
		sub	esi, ecx
		lea	ecx, [edx+ecx-5EB0E01Ah]
		sub	esi, edx
		add	ecx, ecx
		or	ecx, 0D9FFA66Eh
		lea	ecx, [esi+ecx]
		mov	esi, 3EE22563h
		lea	edx, [ecx+ecx-57C3F136h]
		sub	esi, ecx
		and	edx, 0D9FFA66Eh
		add	esi, edx
		shl	esi, 8
		add	esi, 100h
		imul	edi, esi, 26D3B093h
		lea	esi, [esi+esi-1]
		and	esi, 0B9A86480h
		sub	ecx, edx
		imul	esi, 0D92C4F6Dh
		lea	edi, [edi+esi+1B24DAC0h]
		imul	esi, edi, 4B4B1265h
		imul	edi, 969624CAh
		and	edi, 0B9A86480h
		sub	esi, edi
		add	esi, 5CD43240h
		imul	edi, esi, 94260BE5h
		and	esi, 0A4B769BCh
		imul	esi, 0D7B3E836h
		lea	esi, [edi+esi-647B56D4h]
		imul	edi, esi, 578D39EDh
		imul	esi, 0AF1A73DAh
		lea	edx, [ecx+edi+65D54458h]
		mov	edi, dword ptr [oba_1BFF0]	;offset 
		and	esi, 496ED378h
		sub	edx, esi
		mov	esi, 44824334h
		sub	esi, eax
		xor	edx, 0ECFFD337h
		lea	eax, [eax+eax-2E1478F2h]
		and	eax, 0A50FF288h
		add	esi, eax
		shr	esi, 8
		mov	eax, esi
		not	esi
		add	esi, 1000000h
		neg	eax
		or	esi, 0AD7806BBh
		add	eax, 45824332h
		add	esi, esi
		sub	eax, esi
		lea	esi, [eax+68F5C387h]
		and	esi, 0FFFFFF00h
		sub	eax, esi
		mov	esi, eax
		add	eax, 68F5C387h
		or	eax, 5D3D9103h
		neg	eax
		lea	eax, [esi+eax*2-39CCAB77h]
		xor	eax, 56475815h
		mov	esi, eax
		and	eax, 0F48536ADh
		or	esi, 0F48536ADh
		sub	esi, eax
		movzx	eax, byte ptr [esi+edi+300h]
		lea	ecx, [edx+2BE1F89Bh]
		add	edx, edx
		and	edx, 0D9FFA66Eh
		mov	edi, [ebp+var_2C8]
		sub	ecx, edx
		imul	esi, eax, 95h
		imul	eax, 0FFFFFED6h
		add	eax, 0FC99h
		and	eax, 402EA6Eh
		lea	eax, [esi+eax-201F384h]
		mov	esi, 3EE22563h
		movzx	edx, al
		mov	eax, edx
		neg	eax
		lea	eax, [eax+eax-1]
		and	eax, 6Eh
		lea	edx, [edx+eax+42E84745h]
		mov	eax, 0C0AC9244h
		sub	eax, edx
		lea	edx, [ecx+edx+7E359320h]
		sub	eax, ecx
		add	edx, edx
		or	edx, 0D9FFA66Eh
		add	eax, edx
		lea	edx, [eax+eax-57C3F136h]
		sub	esi, eax
		and	edx, 0D9FFA66Eh
		mov	ecx, eax
		sub	ecx, edx
		lea	edx, [esi+edx]
		mov	esi, 0A17C6567h
		shl	edx, 8
		mov	eax, ecx
		sub	esi, edx
		neg	eax
		lea	edx, [ecx+esi+1FA17435h]
		sub	eax, esi
		add	edx, edx
		or	edx, 0D9FFA66Eh
		lea	edx, [eax+edx+1F40B12Fh]
		mov	eax, edx
		neg	eax
		lea	eax, [eax+eax+57C3F135h]
		and	eax, 7CF054E6h
		lea	eax, [edx+eax-534FE695h]
		mov	[edi], eax
		mov	eax, [ebp+var_2B0]
		add	edi, 4
		mov	[ebp+var_2C8], edi
		cmp	edi, eax
		jnz	loc_18EB0
		mov	ecx, [ebp+var_2B8]
		lea	edx, [ebp+var_29C]
		mov	[ebp+var_2B4], edx
		mov	[esp+4], edx
		mov	[esp], ecx
		call	gen_buff2
		mov	[ebp+var_2B0], 0

loc_1941E:				; CODE XREF: gen_tab190+2472j
		mov	[ebp+var_2AC], 0
		mov	esi, [ebp+var_2AC]
		db	66h
		nop

loc_19430:				; CODE XREF: gen_tab190+244Cj
		mov	edi, [ebp+var_2B4]
		mov	eax, [edi+esi*4]
		mov	edi, 0C47DDEA7h
		imul	edx, eax, 9E6C2B0Fh
		imul	eax, 0C327A9E2h
		sub	eax, 5C0F3291h
		and	eax, 0D9FFA66Eh
		lea	eax, [edx+eax-13164154h]
		mov	edx, eax
		sub	edx, 2BE1F89Bh
		mov	[ebp+var_2BC], eax
		mov	eax, edx
		mov	ecx, edx
		and	eax, 0B022140h
		mov	esi, edx
		and	esi, 0F3FFFE7h
		and	ecx, 0F3FFF18h
		neg	eax
		xor	ecx, 0C3FD310h
		lea	eax, [esi+eax*2]
		add	edx, edx
		sub	edi, eax
		and	edx, 0D9FFA66Eh
		lea	esi, [ecx-6D278DCDh]
		sub	esi, eax
		mov	eax, edi
		mov	edi, [ebp+var_2BC]
		or	eax, ecx
		neg	eax
		lea	eax, [esi+eax*2]
		mov	esi, 2D1C4A3Bh
		lea	ecx, [eax+eax+634AD8E6h]
		add	eax, 69635EF2h
		and	ecx, 6F7BE4FEh
		sub	edi, edx
		sub	eax, ecx
		mov	ecx, dword ptr [oba_1BFF0]	;offset 
		sub	esi, edi
		movzx	eax, byte ptr [eax+ecx]
		sub	eax, 4Dh
		movzx	ecx, al
		and	eax, 96h
		imul	ecx, 0D405C01Bh
		imul	eax, 57F47FCAh
		lea	eax, [ecx+eax+2878B92Bh]
		imul	eax, 3109F69Bh
		sub	eax, 38A819E8h
		imul	edx, eax, 33F2E5E9h
		imul	eax, 0CC0D1A17h
		lea	ecx, [edi+edx+11C5DB29h]
		mov	edi, esi
		add	ecx, ecx
		add	edi, eax
		or	ecx, 0D9FFA66Eh
		mov	esi, 3EE22563h
		add	ecx, edi
		lea	eax, [ecx+ecx-57C3F136h]
		sub	esi, ecx
		and	eax, 0D9FFA66Eh
		add	esi, eax
		mov	eax, 0FFFFF800h
		mov	edx, esi
		shr	esi, 15h
		shl	edx, 0Bh
		imul	esi, 6F6D945Dh
		sub	eax, edx
		lea	ecx, [edx+800h]
		or	eax, 0B7CE13D6h
		imul	eax, 43079F02h
		imul	ecx, 2183CF81h
		lea	edi, [esi-39315C19h]
		sub	esi, 39315C18h
		imul	esi, 8934DFF5h
		imul	edi, 1269BFEAh
		lea	ecx, [ecx+eax+241FC6ABh]
		imul	edx, ecx, 97CC7081h
		lea	eax, [esi+4B4E02F8h]
		xor	eax, 4856h
		sub	eax, 2F80000h
		sub	edx, 1
		xor	eax, 0FFFFB7A9h
		imul	ecx, 0D0671EFEh
		xor	eax, edx
		or	eax, edx
		sub	edx, esi
		mov	esi, eax
		not	esi
		lea	ecx, [edi+ecx-5CEA3A21h]
		lea	edx, [edx+esi*2+3EBDB685h]
		lea	esi, [ecx+eax*4]
		and	esi, 499C7E3Ch
		lea	esi, [edx+esi]
		lea	ecx, [esi-2BE1F89Bh]
		mov	eax, ecx
		mov	edx, ecx
		and	eax, 124214A2h
		and	ecx, 13D234EBh
		neg	eax
		and	edx, 13D23414h
		lea	edi, [ecx+eax*2]
		mov	eax, 0C9B5A949h
		xor	edx, 0D21014h
		sub	eax, edi
		or	eax, edx
		lea	ecx, [edx-5813AB4Bh]
		neg	eax
		sub	ecx, edi
		mov	edi, dword ptr [oba_1BFF0]	;offset
		lea	eax, [ecx+eax*2]
		mov	ecx, 2BAFA9EFh
		lea	edx, [eax+eax+4392A926h]
		and	edx, 6D308D2Ah
		add	eax, 58619C28h
		sub	eax, edx
		movzx	eax, byte ptr [eax+edi]
		mov	edx, eax
		shl	edx, 5
		sub	edx, eax
		imul	eax, -3Eh
		add	eax, 3B17h
		and	eax, 4FE71FC2h
		lea	edx, [edx+eax-27F3AD6Dh]
		and	edx, 0FFh
		mov	eax, edx
		neg	eax
		lea	eax, [eax+eax-1]
		and	eax, 1C2h
		add	eax, edx
		mov	edx, 2BE1F89Ah
		sub	ecx, eax
		sub	edx, esi
		lea	edi, [ecx+422B71F4h]
		mov	eax, 0C59F0C38h
		sub	ecx, 46B2A90Fh
		sub	eax, esi
		xor	ecx, 9224h
		mov	esi, edx
		add	ecx, 1B030000h
		xor	esi, 0FFFF6DDBh
		xor	esi, ecx
		sub	eax, edi
		or	esi, edx
		mov	ecx, 3EE22563h
		not	esi
		lea	eax, [eax+esi*2]
		sub	ecx, eax
		lea	eax, [eax+eax-57C3F136h]
		and	eax, 0D9FFA66Eh
		add	ecx, eax
		mov	eax, 0FFFFFC00h
		mov	esi, ecx
		shl	esi, 0Ah
		sub	eax, esi
		mov	edx, esi
		shr	ecx, 16h
		neg	edx
		or	eax, 0D147F879h
		add	edx, 1EB542BFh
		add	eax, eax
		mov	esi, ecx
		not	ecx
		sub	edx, eax
		neg	esi
		add	ecx, 400h
		or	ecx, 1ED1FAAh
		add	esi, 4693E491h
		add	ecx, ecx
		sub	esi, ecx
		lea	eax, [edx+esi+6DEBF0D1h]
		neg	esi
		neg	edx
		lea	ecx, [esi+esi-76B27E2Fh]
		lea	edx, [edx+edx-65256373h]
		or	edx, ecx
		add	eax, edx
		xor	eax, 3C5534E4h
		mov	edx, eax
		mov	ecx, eax
		and	edx, 22281100h
		and	ecx, 623D9994h
		neg	edx
		lea	edi, [ecx+edx*2]
		mov	ecx, eax
		and	ecx, 623D996Bh
		mov	edx, 54578EBFh
		xor	ecx, 603D9123h
		sub	edx, edi
		or	edx, ecx
		lea	esi, [ecx-39DC3B3h]
		neg	edx
		sub	esi, edi
		lea	edx, [esi+edx*2]
		lea	ecx, [edx+edx-50155B1Eh]
		add	edx, 238B34C5h
		and	ecx, 972BC0A8h
		sub	edx, ecx
		mov	ecx, dword ptr [oba_1BFF0]	;offset 
		movzx	edx, byte ptr [edx+ecx]
		imul	ecx, edx, 2Bh
		imul	edx, -56h
		add	edx, 3ED1h
		and	edx, 7CB7AD9Ch
		lea	ecx, [ecx+edx-3E5BF637h]
		and	ecx, 0FFh
		xor	ecx, 52973F4Eh
		lea	edx, [ecx-7BE0E275h]
		add	ecx, ecx
		and	ecx, 1DA21B8Ah
		sub	edx, ecx
		lea	ecx, [edx-1907DD81h]
		lea	edx, [edx+edx+1563E074h]
		and	edx, 0B88C648Ah
		sub	ecx, edx
		lea	edx, [ecx-6D71E052h]
		add	ecx, ecx
		and	ecx, 9CC7665Ch
		sub	edx, ecx
		lea	ecx, [eax-8C6E61Bh]
		add	eax, eax
		and	eax, 0D9FFA66Eh
		sub	ecx, eax
		lea	eax, [edx+edx+77AB2700h]
		add	ecx, edx
		or	eax, 9CC7665Ch
		sub	ecx, eax
		mov	eax, 3EE22563h
		xor	ecx, 0ECFFD337h
		sub	eax, ecx
		add	ecx, ecx
		and	ecx, 0D9FFA66Eh
		lea	ecx, [eax+ecx-2BE1F89Bh]
		mov	eax, 0FFFFFF80h
		mov	esi, ecx
		shl	esi, 7
		sub	eax, esi
		mov	edx, esi
		neg	edx
		or	eax, 0EA339D7Bh
		add	eax, eax
		sub	edx, 119860C7h
		shr	ecx, 19h
		sub	edx, eax
		imul	eax, ecx, 5F932E07h
		mov	ecx, 434023Eh
		sub	ecx, edx
		lea	esi, [eax+4FDF38F0h]
		add	eax, 4FDF38F1h
		imul	eax, 553EDFB7h
		add	eax, 1AF5C39h
		xor	eax, 0A576h
		sub	eax, 5C390000h
		xor	eax, 0FFFF5A8Ah
		xor	eax, ecx
		or	eax, ecx
		mov	ecx, esi
		not	ecx
		mov	edi, eax
		imul	ecx, 553EDFB7h
		not	edi
		sub	ecx, edx
		imul	esi, 553EDFB7h
		lea	ecx, [ecx+edi*2-6E941313h]
		mov	edi, [ebp+var_2B8]
		lea	esi, [edx+esi]
		lea	eax, [esi+eax*2]
		mov	esi, [ebp+var_2AC]
		lea	eax, [eax+eax-12FD8C99h]
		and	eax, 0F2676366h
		add	ecx, eax
		mov	eax, ecx
		neg	eax
		lea	eax, [eax+eax+57C3F135h]
		and	eax, 7CF054E6h
		lea	eax, [ecx+eax-534FE695h]
		mov	[edi+esi*4], eax
		add	esi, 1
		cmp	esi, 10h
		mov	[ebp+var_2AC], esi
		jnz	loc_19430
		mov	eax, [ebp+var_2B4]
		mov	[esp], edi
		mov	[esp+4], eax
		call	gen_buff2
		add	[ebp+var_2B0], 1
		cmp	[ebp+var_2B0], 3
		jnz	loc_1941E
		mov	edi, [ebp+var_26C]
		mov	esi, [ebp+var_27C]
		mov	ecx, [ebp+var_278]
		mov	edx, [ebp+var_274]
		mov	[ebp+var_4C], edi
		mov	edi, [ebp+var_268]
		mov	[ebp+var_5C], esi
		imul	esi, 8F6AAEF5h
		mov	eax, [ebp+var_270]
		mov	[ebp+var_58], ecx
		imul	ecx, 8F6AAEF5h
		mov	[ebp+var_54], edx
		imul	edx, 8F6AAEF5h
		mov	[ebp+var_48], edi
		mov	edi, [ebp+var_264]
		add	esi, 1A313B21h
		mov	[ebp+var_50], eax
		add	ecx, 1A313B21h
		add	edx, 1A313B21h
		mov	[ebp+var_44], edi
		mov	edi, [ebp+var_260]
		imul	eax, 8F6AAEF5h
		mov	[ebp+var_40], edi
		mov	edi, [ebp+var_2D0]
		add	eax, 1A313B21h
		mov	[edi], esi
		mov	esi, [ebp+var_2F0]
		mov	edi, [ebp+var_2EC]
		mov	[esi], ecx
		mov	ecx, [ebp+var_2E4]
		mov	[edi], edx
		mov	edx, [ebp+var_2E8]
		mov	esi, [ebp+var_2E0]
		mov	edi, [ebp+var_2DC]
		mov	[edx], eax
		mov	edx, [ebp+var_2D8]
		imul	eax, [ebp+var_26C], 8F6AAEF5h
		add	eax, 1A313B21h
		mov	[ecx], eax
		lea	ecx, [ebp+var_11C]
		imul	eax, [ebp+var_268], 8F6AAEF5h
		add	eax, 1A313B21h
		mov	[esi], eax
		imul	eax, [ebp+var_264], 8F6AAEF5h
		add	eax, 1A313B21h
		mov	[edi], eax
		imul	eax, [ebp+var_260], 8F6AAEF5h
		add	eax, 1A313B21h
		mov	[edx], eax
		xor	edx, edx
		mov	[ebp+var_2B0], ecx
		lea	esi, [esi+0]

loc_199E0:				; CODE XREF: gen_tab190+26EEj
		mov	ecx, [ebp+var_2D0]
		imul	eax, [ecx+edx*4], 8630988Dh
		add	eax, 4D8F3D8Ah
		mov	esi, eax
		mov	edi, eax
		or	esi, 0FFFFFF00h
		imul	esi, 68FCAB2Dh
		shr	edi, 10h
		sub	edi, 10000h
		or	edi, 0FFFFFF00h
		lea	ecx, [esi+404C3EEFh]
		mov	esi, eax
		shr	eax, 18h
		sub	eax, 100h
		or	eax, 0FFFFFF00h
		imul	eax, 232636F5h
		imul	edi, 70E67ACDh
		shr	esi, 8
		sub	esi, 1000000h
		sub	eax, 2AEC5FF9h
		or	esi, 0FFFFFF00h
		mov	[ebp+var_2AC], eax
		imul	eax, ecx, 4AE8235Bh
		xor	esi, 2CD5DEAAh
		add	edi, 22D3382Bh
		mov	[ebp+var_2B4], edi
		lea	edi, [esi+esi]
		or	edi, 9C1A138Ah
		lea	ecx, [eax-76h]
		mov	eax, 0FFFFFFE9h
		imul	eax, ecx
		mov	ecx, eax
		lea	eax, [ecx+46h]
		mov	ecx, [ebp+var_2B0]
		mov	[ecx+edx*4], al
		mov	eax, esi
		mov	esi, 17h
		neg	eax
		mov	ecx, esi
		lea	edi, [eax+edi+3Bh]
		mov	eax, edi
		imul	eax, ecx
		mov	ecx, 0FFFFFFE9h
		mov	esi, eax
		lea	eax, [edi+edi]
		and	eax, 0FFFFFFDFh
		imul	eax, ecx
		imul	edi, [ebp+var_2B4], 1964040Ah
		lea	eax, [esi+eax-2Ah]
		mov	esi, [ebp+var_2B0]
		add	edi, 33132253h
		and	edi, 0F1638D26h
		mov	[esi+edx*4+1], al
		imul	eax, [ebp+var_2B4], 0F34DFDFBh
		lea	esi, [eax+edi+6DC4A843h]
		mov	edi, [ebp+var_2B0]
		and	esi, 0FFh
		mov	eax, esi
		neg	eax
		lea	eax, [eax+eax-1]
		and	eax, 126h
		add	eax, esi
		imul	eax, ecx
		imul	esi, [ebp+var_2AC], 30AC8ABAh
		sub	eax, 5
		mov	[edi+edx*4+2], al
		sub	esi, 393A0B15h
		imul	eax, [ebp+var_2AC], 67A9BAA3h
		and	esi, 0AF452008h
		lea	esi, [eax+esi+44FA7586h]
		and	esi, 0FFh
		mov	eax, esi
		neg	eax
		lea	eax, [eax+eax-1]
		and	eax, 8
		add	eax, esi
		imul	eax, ecx
		add	eax, 22h
		mov	[edi+edx*4+3], al
		add	edx, 1
		cmp	edx, 20h
		jnz	loc_199E0
		mov	ecx, edi
		xor	dl, dl
		mov	edi, 0FFFFFFE7h
		mov	[ebp+var_2AC], ecx
		nop
		lea	esi, [esi+0]

loc_19B68:				; CODE XREF: gen_tab190+274Bj
		mov	eax, [ebp+var_2AC]
		mov	ecx, edi
		movzx	esi, byte ptr [eax+edx]
		mov	eax, esi
		and	esi, 0FFh
		imul	esi, 0FFFFFF4Eh
		imul	eax, ecx
		add	esi, 0ABh
		and	esi, 0FFFFFFB4h
		mov	ecx, esi
		neg	ecx
		mov	esi, ecx
		lea	eax, [eax+esi-50h]
		mov	esi, [ebp+var_2C4]
		mov	[esi+edx+0A0h],	al
		add	edx, 1
		cmp	edx, 1Eh
		jnz	short loc_19B68
		mov	edi, [ebp+var_2F4]
		mov	eax, 0BEh
		mov	esi, [ebp+var_2C4]
		test	edi, 1
		jnz	short loc_19C08

loc_19BC6:				; CODE XREF: gen_tab190+27BBj
		test	edi, 2
		jnz	short loc_19C1D

loc_19BCE:				; CODE XREF: gen_tab190+27CCj
		mov	ecx, eax
		xor	edx, edx
		shr	ecx, 2
		test	al, 2
		rep movsd
		jz	short loc_19BE6
		movzx	edx, word ptr [esi]
		mov	[edi], dx
		mov	edx, 2

loc_19BE6:				; CODE XREF: gen_tab190+2779j
		test	al, 1
		jz	short loc_19BF1
		movzx	eax, byte ptr [esi+edx]
		mov	[edi+edx], al

loc_19BF1:				; CODE XREF: gen_tab190+2788j
		mov	edi, [ebp+var_1C]
		xor	edi,dword ptr [gsdata]	;xor	edi, large gs:14h
		jnz	short loc_19C2E
		add	esp, 31Ch
		pop	ebx
		pop	esi
		pop	edi
		pop	ebp
		retn
; ---------------------------------------------------------------------------

loc_19C08:				; CODE XREF: gen_tab190+2764j
		movzx	eax, byte ptr [esi]
		lea	esi, [ebp+var_1DB]
		mov	[edi], al
		add	edi, 1
		mov	eax, 0BDh
		jmp	short loc_19BC6
; ---------------------------------------------------------------------------

loc_19C1D:				; CODE XREF: gen_tab190+276Cj
		movzx	edx, word ptr [esi]
		sub	eax, 2
		add	esi, 2
		mov	[edi], dx
		add	edi, 2
		jmp	short loc_19BCE
; ---------------------------------------------------------------------------

loc_19C2E:				; CODE XREF: gen_tab190+279Bj
		call	sub_19D70
gen_tab190	endp

; ---------------------------------------------------------------------------

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

		public get_ibuff
get_ibuff	proc near		; CODE XREF: _get_ibuffj
					; DATA XREF: .got.plt:off_1C004o

var_5D0		= dword	ptr -5D0h
var_5CC		= dword	ptr -5CCh
var_5C8		= dword	ptr -5C8h
var_5C4		= dword	ptr -5C4h
var_5C0		= dword	ptr -5C0h
var_5BC		= dword	ptr -5BCh
var_5B8		= dword	ptr -5B8h
var_5B4		= dword	ptr -5B4h
var_5B0		= dword	ptr -5B0h
var_5AC		= dword	ptr -5ACh
var_5A8		= dword	ptr -5A8h
var_5A4		= dword	ptr -5A4h
var_5A0		= dword	ptr -5A0h
var_59C		= dword	ptr -59Ch
var_598		= dword	ptr -598h
var_594		= dword	ptr -594h
var_590		= dword	ptr -590h
var_58C		= dword	ptr -58Ch
var_588		= dword	ptr -588h
var_584		= dword	ptr -584h
var_580		= dword	ptr -580h
var_57C		= dword	ptr -57Ch
var_578		= dword	ptr -578h
var_574		= dword	ptr -574h
var_570		= dword	ptr -570h
var_56C		= dword	ptr -56Ch
var_568		= dword	ptr -568h
var_564		= dword	ptr -564h
var_560		= dword	ptr -560h
var_55C		= dword	ptr -55Ch
var_558		= dword	ptr -558h
var_554		= dword	ptr -554h
var_550		= dword	ptr -550h
var_54C		= dword	ptr -54Ch
var_548		= dword	ptr -548h
var_544		= dword	ptr -544h
var_53C		= dword	ptr -53Ch
var_538		= dword	ptr -538h
var_534		= dword	ptr -534h
var_530		= dword	ptr -530h
var_52C		= dword	ptr -52Ch
var_528		= dword	ptr -528h
var_524		= dword	ptr -524h
var_520		= dword	ptr -520h
var_51C		= dword	ptr -51Ch
var_518		= dword	ptr -518h
var_514		= dword	ptr -514h
var_504		= dword	ptr -504h
var_4F8		= dword	ptr -4F8h
var_4F0		= dword	ptr -4F0h
var_4D8		= dword	ptr -4D8h
var_4D0		= dword	ptr -4D0h
var_4C0		= dword	ptr -4C0h
var_4AC		= dword	ptr -4ACh
var_49C		= dword	ptr -49Ch
var_498		= dword	ptr -498h
var_494		= dword	ptr -494h
var_490		= dword	ptr -490h
var_48C		= dword	ptr -48Ch
var_480		= dword	ptr -480h
var_47C		= dword	ptr -47Ch
var_46C		= dword	ptr -46Ch
var_468		= dword	ptr -468h
var_464		= dword	ptr -464h
var_458		= dword	ptr -458h
var_454		= dword	ptr -454h
var_450		= dword	ptr -450h
var_43C		= dword	ptr -43Ch
var_420		= dword	ptr -420h
var_40C		= dword	ptr -40Ch
var_408		= dword	ptr -408h
var_3FC		= dword	ptr -3FCh
var_3F4		= dword	ptr -3F4h
var_3E4		= dword	ptr -3E4h
var_3E0		= dword	ptr -3E0h
var_3DC		= dword	ptr -3DCh
var_3BC		= dword	ptr -3BCh
var_3A8		= dword	ptr -3A8h
var_3A4		= dword	ptr -3A4h
var_390		= dword	ptr -390h
var_370		= dword	ptr -370h
var_36C		= dword	ptr -36Ch
var_368		= dword	ptr -368h
var_358		= dword	ptr -358h
var_340		= dword	ptr -340h
var_338		= dword	ptr -338h
var_330		= dword	ptr -330h
var_318		= dword	ptr -318h
var_2A4		= dword	ptr -2A4h
var_284		= dword	ptr -284h
var_274		= dword	ptr -274h
var_228		= dword	ptr -228h
var_220		= dword	ptr -220h
var_21C		= dword	ptr -21Ch
var_218		= dword	ptr -218h
var_208		= dword	ptr -208h
var_1F8		= dword	ptr -1F8h
var_1F0		= dword	ptr -1F0h
var_1E4		= dword	ptr -1E4h
var_1D4		= dword	ptr -1D4h
var_1C8		= dword	ptr -1C8h
var_1C4		= dword	ptr -1C4h
var_1BC		= dword	ptr -1BCh
var_1B8		= dword	ptr -1B8h
var_1B4		= dword	ptr -1B4h
var_1B0		= dword	ptr -1B0h
var_1A4		= dword	ptr -1A4h
var_184		= dword	ptr -184h
var_178		= dword	ptr -178h
var_174		= dword	ptr -174h
var_170		= dword	ptr -170h
var_16C		= dword	ptr -16Ch
var_168		= dword	ptr -168h
var_164		= dword	ptr -164h
var_160		= dword	ptr -160h
var_148		= dword	ptr -148h
var_140		= dword	ptr -140h
var_13C		= dword	ptr -13Ch
var_138		= dword	ptr -138h
var_12C		= dword	ptr -12Ch
var_128		= dword	ptr -128h
var_120		= dword	ptr -120h
var_118		= dword	ptr -118h
var_F0		= dword	ptr -0F0h
var_D8		= dword	ptr -0D8h
var_CC		= dword	ptr -0CCh
var_C8		= dword	ptr -0C8h
var_C4		= dword	ptr -0C4h
var_B0		= dword	ptr -0B0h
var_A8		= dword	ptr -0A8h
var_A4		= dword	ptr -0A4h
var_A0		= dword	ptr -0A0h
var_90		= dword	ptr -90h
var_8C		= dword	ptr -8Ch
var_84		= dword	ptr -84h
var_7C		= dword	ptr -7Ch
var_74		= dword	ptr -74h
var_70		= dword	ptr -70h
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_30		= dword	ptr -30h
var_28		= dword	ptr -28h
var_1C		= dword	ptr -1Ch
arg_0		= dword	ptr  8
arg_4		= dword	ptr  0Ch

		push	ebp
		mov	ebp, esp
		push	edi
		push	esi
		push	ebx
		call	sub_917
		add	ebx, 0A399h
		lea	eax, [ebp+var_118]
		sub	esp, 5DCh
		mov	[ebp+var_538], eax
		mov	eax, 40h
		mov	edi, [ebp+var_538]
		mov	ecx, eax
		lea	esi, offset unk_1A2A0	;;offset nochange
		rep movsd
		lea	esi, [ebp+var_218]
		mov	[ebp+var_53C], esi
		mov	edi, [ebp+var_53C]
		lea	esi, offset unk_1A1A0	;offset nochange
		mov	eax, ecx
		mov	cl, 40h
		rep movsd
		lea	edi, [ebp+var_318]
		lea	esi, offset unk_1A0A0	;offset nochange
		mov	cl, 40h
		rep movsd
		lea	edi, [ebp+var_518]
		mov	[ebp+var_534], edi
		mov	cl, 80h
		rep stosd
		db	66h
		nop

loc_11CC8:				; CODE XREF: get_ibuff+2D8j
		mov	edx, ecx
		mov	eax, 0AC769185h
		mov	edi, [ebp+arg_4]
		shr	edx, 1
		mov	esi, ecx
		mul	edx
		shr	edx, 6
		imul	edx, 0BEh
		sub	esi, edx
		movzx	edx, byte ptr [edi+esi]
		imul	eax, edx, 0BFh
		imul	edx, 17Eh
		add	eax, 3BF07F3Ch
		and	edx, 77E0FE78h
		sub	eax, edx
		mov	edx, eax
		mov	esi, eax
		and	edx, 57h
		and	esi, 0E6h
		xor	edx, 46h
		movzx	eax, al
		add	edx, esi
		imul	eax, 0D558F93Bh
		imul	edx, 554E0D8Ah
		lea	esi, [ecx+1]
		lea	edx, [eax+edx-186FCAF1h]
		imul	eax, edx, 9E06EFE6h
		imul	edx, 0DF5237D9h
		or	eax, 2D72AAAEh
		imul	eax, 0D0230FFDh
		lea	eax, [edx+eax+430DC297h]
		mov	edx, esi
		imul	eax, 0D8593AABh
		shr	edx, 1
		add	eax, 1FF32479h
		mov	[ebp+var_530], eax
		mov	eax, 0AC769185h
		mul	edx
		shr	edx, 6
		imul	edx, 0BEh
		sub	esi, edx
		movzx	eax, byte ptr [edi+esi]
		lea	esi, [ecx+2]
		imul	eax, 0BFh
		mov	edx, eax
		movzx	eax, al
		and	edx, 0DAh
		imul	edx, 0D8164ABAh
		imul	eax, 93F4DAA3h
		lea	eax, [edx+eax-19720829h]
		mov	edx, esi
		imul	eax, 916856F5h
		add	eax, 32879462h
		mov	[ebp+var_528], eax
		shr	edx, 1
		mov	eax, 0AC769185h
		mul	edx
		shr	edx, 6
		imul	edx, 0BEh
		sub	esi, edx
		movzx	eax, byte ptr [edi+esi]
		lea	edi, [ecx+3]
		imul	eax, 0BFh
		mov	edx, eax
		movzx	eax, al
		and	edx, 0DAh
		imul	edx, 0CD79139Eh
		imul	eax, 99437631h
		lea	esi, [edx+eax+1052E4B7h]
		mov	edx, edi
		shr	edx, 1
		mov	eax, 0AC769185h
		mul	edx
		mov	eax, [ebp+arg_4]
		imul	esi, 12A5DD2Fh
		shr	edx, 6
		imul	edx, 0BEh
		add	esi, 2963068Ch
		shl	esi, 8
		imul	esi, 5A7D0D99h
		sub	edi, edx
		movzx	edx, byte ptr [eax+edi]
		shl	[ebp+var_528], 10h
		imul	eax, edx, 0BFh
		imul	edx, 17Eh
		sub	eax, 484442FAh
		and	edx, 6F777A0Ch
		sub	eax, edx
		mov	edx, eax
		mov	edi, eax
		and	edx, 19h
		and	edi, 0DCh
		xor	edx, 18h
		movzx	eax, al
		add	edx, edi
		imul	edx, 78777842h
		imul	eax, 43C443DFh
		lea	eax, [eax+edx+1D26F66Bh]
		imul	eax, 57FD381Fh
		imul	edx, [ebp+var_528], 5A7D0D99h
		xor	eax, 0D09FF555h
		shl	[ebp+var_530], 18h
		lea	edx, [esi+edx-306D1A8Fh]
		imul	esi, [ebp+var_530], 5A7D0D99h
		lea	esi, [edx+esi-1FA237D5h]
		mov	[ebp+var_530], esi
		lea	edx, [eax+eax]
		mov	esi, eax
		imul	edi, [ebp+var_530], 0B1F60957h
		and	edx, 45839698h
		sub	esi, edx
		imul	eax, 6A516471h
		imul	edx, 95AE9B8Fh
		lea	esi, [esi+edi+30F34E48h]
		and	esi, 7ABB25FFh
		mov	[ebp+var_520], esi
		imul	esi, [ebp+var_530], 0A3C71B67h
		imul	edi, [ebp+var_520], 2B5D371Eh
		lea	eax, [eax+edx+1DE40F57h]
		lea	esi, [eax+esi]
		add	esi, edi
		mov	edi, [ebp+var_534]
		imul	edx, esi, 0ACBB922h
		imul	esi, 0FF08CA4Bh
		or	edx, 0F5764BFEh
		imul	edx, 0EE5E68E5h
		lea	eax, [edx+esi-1CF42ED4h]
		mov	[edi+ecx], eax
		add	ecx, 4
		cmp	ecx, 200h
		jnz	loc_11CC8
		xor	edx, edx

loc_11F30:				; CODE XREF: get_ibuff+501j
		lea	eax, [edx+73h]
		and	eax, 7Fh
		imul	ecx, [ebp+eax*4+var_518], 8AA4EB13h
		lea	eax, [ecx+0FA73BBAh]
		shr	eax, 1Dh
		lea	esi, ds:660FDDD7h[ecx*8]
		sub	eax, 172A0008h
		xor	esi, 0ED5Ch
		xor	eax, 0ED5Ch
		add	esi, 172A0000h
		add	eax, 172A0000h
		xor	esi, 95FFA6FEh
		xor	esi, eax
		mov	eax, edx
		and	eax, 7Fh
		sub	esi, 1F64DCC4h
		mov	ecx, [ebp+eax*4+var_518]
		imul	edi, esi, 19189B31h
		mov	[ebp+var_528], eax
		imul	eax, ecx, 8AA4EB13h
		mov	[ebp+var_5C4], ecx
		mov	ecx, 0E09B233Bh
		sub	ecx, esi
		add	eax, 604E3BBAh
		xor	eax, 8502h
		sub	eax, 50A70000h
		xor	eax, 0FFFF7AFDh
		xor	eax, ecx
		or	eax, ecx
		imul	ecx, [ebp+var_5C4], 0B752805Dh
		sub	ecx, 539F5B6h
		sub	ecx, edi
		imul	edi, eax, 32313662h
		shl	eax, 2
		sub	ecx, edi
		imul	edi, [ebp+var_5C4], 0AA4EB13h
		add	esi, edi
		lea	eax, [eax+esi*2+5E183101h]
		and	eax, 26073E2Ah
		imul	eax, 19189B31h
		add	ecx, eax
		lea	eax, [edx+47h]
		and	eax, 7Fh
		imul	edi, [ebp+eax*4+var_518], 8AA4EB13h
		add	edi, 0FA73BBAh
		mov	esi, edi
		shr	edi, 1Bh
		imul	edi, 533C4251h
		shl	esi, 5
		add	esi, 20h
		imul	esi, 156AFC25h
		add	edi, 7A16C498h
		imul	eax, edi, 3F8BC631h
		imul	edi, 9E88D62h
		sub	esi, 43603030h
		mov	[ebp+var_520], eax
		imul	eax, esi, 0E8097F5Ah
		add	edi, 37410591h
		imul	esi, 0C2BE612Dh
		sub	eax, 66973F21h
		or	eax, edi
		mov	edi, [ebp+var_520]
		imul	eax, 8531A87Fh
		lea	esi, [edi+esi-2B6B5494h]
		mov	[ebp+var_530], eax
		imul	eax, ecx, 0EFE1BBA2h
		add	esi, [ebp+var_530]
		imul	ecx, 14786343h
		imul	esi, 0A610CDADh
		and	eax, 0DF873D6h
		lea	ecx, [esi+ecx-341CEFC1h]
		mov	[ebp+var_530], ecx
		lea	ecx, [edx+65h]
		and	ecx, 7Fh
		imul	ecx, [ebp+ecx*4+var_518], 8AA4EB13h
		add	ecx, 0FA73BBAh
		mov	esi, ecx
		shr	ecx, 9
		imul	ecx, 308A955h
		shl	esi, 17h
		imul	esi, 403F8D7h
		add	ecx, 25BB69A7h
		imul	edi, ecx, 0C3EB3DEFh
		imul	ecx, 290417FAh
		sub	esi, 4E787B0h
		sub	ecx, 161F2E15h
		add	edx, 1
		mov	[ebp+var_520], ecx
		imul	ecx, esi, 8898F5CEh
		imul	esi, 5E6E311Dh
		imul	eax, 57936F2Dh
		add	eax, [ebp+var_530]
		sub	ecx, 67556061h
		or	ecx, [ebp+var_520]
		lea	esi, [edi+esi+6127A448h]
		imul	eax, 6E98CC67h
		imul	ecx, 0EA89A8A5h
		lea	ecx, [esi+ecx]
		mov	esi, 0E8EA732Ah
		imul	ecx, 0C7258B41h
		sub	esi, ecx
		mov	ecx, [ebp+var_528]
		cmp	edx, 200h
		lea	eax, [esi+eax]
		mov	[ebp+ecx*4+var_518], eax
		jnz	loc_11F30
		imul	esi, [ebp+var_4C0], 755B14EDh
		mov	eax, 0CCCCCCCDh
		imul	edi, [ebp+var_128], 2BF06481h
		mov	edx, esi
		sub	edx, 0FA73BBBh
		sub	edi, 7DBB7AD1h
		mul	edx
		mov	[ebp+var_5B4], esi
		mov	[ebp+var_530], edi
		shr	edx, 2
		lea	eax, [edx-67BAF6ACh]
		add	edx, edx
		and	edx, 23C63882h
		sub	eax, edx
		mov	edx, 0B87FFB2Bh
		imul	ecx, eax, 16FAC07Ah
		add	eax, 799E12EDh
		or	eax, 11E31C41h
		imul	eax, 0D20A7F0Ch
		sub	edx, ecx
		sub	edx, eax
		imul	ecx, edx, 0E8A44F59h
		imul	edx, 0D1489EB2h
		imul	eax, [ebp+var_21C], 0CA2E8CD3h
		add	ecx, 2B95B958h
		and	edx, 54612184h
		sub	eax, 6448ADFBh
		sub	ecx, edx
		mov	edx, edi
		mov	esi, eax
		or	edx, eax
		or	esi, 6F72B2DAh
		mov	[ebp+var_528], ecx
		mov	ecx, edx
		or	eax, 7F7EF3DBh
		xor	ecx, 164CE359h
		not	edx
		imul	edi, esi, 73DF1A07h
		and	edx, 0E9B31CA6h
		or	eax, ecx
		and	esi, 164CE359h
		and	esi, ecx
		lea	eax, [edx+eax]
		add	eax, esi
		imul	eax, 8C20E5F9h
		lea	eax, [edi+eax-4DEBB223h]
		mov	edi, [ebp+var_530]
		or	edi, 6F72B2DAh
		imul	edx, eax, 6AC333B7h
		mov	ecx, edi
		imul	eax, 953CCC49h
		not	edi
		xor	ecx, 86605088h
		and	edi, 799FAF77h
		sub	edx, 295DAFFCh
		lea	edi, [eax+edi]
		mov	eax, ecx
		or	eax, 86605088h
		and	ecx, 86605088h
		or	eax, edx
		and	ecx, edx
		lea	eax, [edi+eax]
		add	eax, ecx
		imul	edx, eax, 0D0B639EBh
		mov	eax, 0AAAAAAABh
		sub	edx, 4DA857ACh
		mul	edx
		imul	eax, [ebp+var_494], 755B14EDh
		shr	edx, 1
		sub	eax, 0FA73BBBh
		add	edx, 4FD491A8h
		and	eax, 3Fh
		imul	ecx, [ebp+eax*4+var_318], 0CA2E8CD3h
		mov	eax, 0CCCCCCCDh
		mov	[ebp+var_5A4], edx
		sub	ecx, 6448ADFBh
		or	ecx, 0C3456F96h
		add	ecx, 19F50000h
		xor	ecx, 87C9h
		sub	ecx, 19F50000h
		and	ecx, 0BCBBFEEBh
		xor	ecx, 0A69B640Ah
		lea	edx, [ecx+59641D3Ch]
		add	ecx, ecx
		and	ecx, 0B2C83A78h
		sub	edx, ecx
		mov	ecx, [ebp+var_70]
		mul	edx
		lea	eax, [ecx+ecx+3845070Eh]
		and	eax, 842FBC0Ah
		shr	edx, 2
		lea	esi, [edx-88C9600h]
		mov	edx, eax
		sub	edx, ecx
		sub	edx, esi
		sub	esi, eax
		lea	eax, [esi+ecx+66C6F78Ch]
		add	eax, eax
		or	eax, 842FBC0Ah
		lea	eax, [edx+eax+3AFEA6E8h]
		mov	edx, 0FFFFFFFFh
		mov	[ebp+var_70], eax
		imul	eax, [ebp+var_43C], 755B14EDh
		sub	eax, 0FA73BBBh
		and	eax, 3Fh
		imul	ecx, [ebp+eax*4+var_218], 0D40F9B7Fh
		mov	eax, 6F72B2DAh
		add	ecx, 7DBB7AD0h
		and	ecx, 1Fh
		shr	edx, cl
		shr	eax, cl
		not	edx
		lea	eax, [eax+edx+6E3A0000h]
		mov	edx, 20h
		sub	dl, cl
		xor	eax, 3CC0h
		mov	ecx, edx
		mov	edx, 6F72B2DBh
		and	ecx, 1Fh
		sub	eax, 6E3A0000h
		add	ecx, 30h
		xor	eax, 6CE109E9h
		xor	ecx, 30h
		shl	edx, cl
		add	edx, 6E39FFFFh
		xor	edx, 3CC0h
		sub	edx, 6E3A0000h
		xor	eax, edx
		imul	edx, eax, 6325D01h
		or	eax, 931EF616h
		imul	eax, 0F39B45FEh
		lea	eax, [edx+eax+58B28FE3h]
		imul	edx, [ebp+var_3BC], 755B14EDh
		mov	[ebp+var_558], eax
		mov	eax, [ebp+var_1B0]
		sub	edx, 0FA73BBBh
		and	edx, 3Fh
		imul	edx, [ebp+edx*4+var_218], 2BF06481h
		sub	edx, 7DBB7AD1h
		imul	ecx, eax, 2BF06481h
		imul	eax, 0D40F9B7Fh
		sub	ecx, 7DBB7AD1h
		or	edx, ecx

loc_12403:				; DATA XREF: get_ibuff+1D55o
		lea	ecx, [eax+7DBB7AD0h]
		mov	eax, ecx
		and	ecx, 42000990h
		and	eax, 81456606h
		or	ecx, 18801028h
		or	eax, 243A8041h
		add	eax, 5A8019B8h
		sub	eax, ecx
		mov	esi, eax
		mov	ecx, eax
		or	esi, 5A8019B8h
		and	ecx, 5A8019B8h
		or	esi, edx
		and	ecx, edx
		not	eax
		lea	ecx, [esi+ecx]
		and	eax, 0A57FE647h
		mov	esi, [ebp+var_528]
		lea	eax, [ecx+eax]
		mov	ecx, [ebp+var_528]
		imul	edi, edx, 7926FDFBh
		imul	eax, 86D90205h
		sub	esi, 2B95B959h
		sub	ecx, 1652896h
		mov	[ebp+var_520], ecx
		xor	ecx, 0D5CF6F3Dh
		lea	eax, [edi+eax-40FD9311h]
		mov	edi, [ebp+var_528]
		mov	[ebp+var_59C], eax
		mov	[ebp+var_55C], ecx
		lea	eax, [edi+edi-2CA512Ch]
		mov	edi, [ebp+var_520]
		and	eax, 0AB9EDE7Ah
		sub	esi, eax
		mov	[ebp+var_58C], esi
		and	esi, 3Fh
		mov	edx, [ebp+esi*4+var_118]
		mov	[ebp+var_560], esi
		lea	eax, [edx-21C59E74h]
		lea	edx, [edx+edx+3845070Eh]
		and	edx, 842FBC0Ah
		sub	eax, edx
		mov	edx, 0CCCCCCCDh
		mul	edx
		shr	edx, 2
		mov	eax, edx
		and	eax, 12FFAF12h
		neg	eax
		mov	[ebp+var_530], edx
		lea	eax, [edx+eax*2+12FFAF12h]
		imul	edx, [ebp+var_170], 0D40F9B7Fh
		and	eax, ecx
		mov	[ebp+var_548], eax
		mov	eax, 2B60B5D7h
		add	edx, 7DBB7AD0h
		mov	ecx, edx
		not	ecx
		mov	esi, ecx
		and	esi, 14AA8B0Ah
		or	esi, 0A11570A5h
		and	ecx, 0C28A0226h
		sub	eax, esi
		mov	esi, edx
		and	esi, 0B5ABFB0Ah
		add	eax, eax
		and	edx, 0FA8AA2F6h
		sub	eax, esi
		neg	edx
		or	ecx, 3924B1D8h
		imul	esi, [ebp+var_170], 2BF06481h
		add	ecx, ecx
		add	edx, 33AF54CDh
		and	edi, 0EB5F8B4Ch
		sub	edx, ecx
		xor	eax, edx
		mov	ecx, eax
		mov	edx, esi
		sub	edx, 7DBB7AD1h
		and	ecx, 9831C17Dh
		or	eax, 9831C17Dh
		add	ecx, 1998BADh
		mov	[ebp+var_574], esi
		mov	esi, edx
		sub	ecx, eax
		or	esi, 3047874Dh
		mov	[ebp+var_550], edi
		lea	eax, [ecx+esi-1998BAEh]
		mov	edi, [ebp+var_520]
		sub	ecx, 1998BAEh
		or	ecx, esi
		sub	eax, ecx
		mov	ecx, [ebp+var_550]
		and	edi, 0C14F0B0Ch
		xor	eax, 14A074B3h
		add	edi, edi
		and	eax, [ebp+var_55C]
		sub	ecx, edi
		sub	edi, [ebp+var_550]
		sub	ecx, 34E7ACE3h
		sub	ecx, eax
		lea	esi, [edi+3EB0F4F3h]
		mov	edi, [ebp+var_520]
		or	esi, eax
		mov	eax, [ebp+var_520]
		lea	esi, [ecx+esi*2]
		mov	[ebp+var_55C], esi
		mov	esi, edx
		and	edi, 12FFAF12h
		not	esi
		and	eax, 10CF2F10h
		mov	ecx, esi
		add	eax, eax
		and	ecx, 40411003h
		mov	[ebp+var_550], eax
		sub	eax, edi
		or	ecx, 1D9489FCh
		sub	eax, 10CF2F11h
		and	esi, 501A800h
		or	eax, [ebp+var_548]
		or	esi, 0D2FE40B9h
		add	esi, esi
		add	eax, eax
		mov	[ebp+var_56C], eax
		mov	eax, 3B2B0D4Bh
		sub	eax, ecx
		mov	ecx, edx
		and	ecx, 58C1909Bh
		add	eax, eax
		sub	eax, ecx
		mov	ecx, edx
		and	ecx, 9779E829h
		or	edx, 87CD9E0Ah
		neg	ecx
		neg	edx
		add	ecx, 6A7828E1h
		sub	ecx, esi
		mov	esi, [ebp+var_530]
		xor	eax, ecx
		mov	ecx, [ebp+var_574]
		lea	edx, [ecx+edx*2+0A122338h]
		mov	ecx, 52F1EED9h
		and	edx, 4F2159FCh
		sub	ecx, edx
		or	edx, 0AD0E1127h
		lea	edx, [ecx+edx*2]
		mov	ecx, eax
		and	ecx, 0CF6AC945h
		or	eax, 0CF6AC945h
		add	ecx, 0B63FFFFh
		sub	ecx, eax
		mov	eax, edx
		xor	ecx, 0AD69h
		and	eax, 0AD69h
		sub	ecx, 0B640000h
		xor	eax, 46E895D6h
		and	edx, ecx
		and	ecx, 1AD1AF2Ch
		xor	eax, edx
		xor	eax, ecx
		mov	edx, eax
		mov	ecx, eax
		and	edx, 76D41080h
		and	ecx, 0F6DCD284h
		add	edx, edx
		xor	eax, 0B917C701h
		sub	ecx, edx
		mov	edx, [ebp+var_530]
		and	edx, 0F6DCD284h
		neg	edx
		lea	edx, [esi+edx*2-9232D7Ch]
		and	edx, eax
		mov	eax, 8009CF26h
		sub	eax, ecx
		lea	esi, [ecx+7FF630DAh]
		or	eax, edx
		sub	esi, edx
		lea	ecx, [esi+eax*2]
		mov	eax, [ebp+var_55C]
		sub	eax, [ebp+var_550]
		mov	esi, [ebp+var_55C]
		lea	edx, [edi+10CF2F11h]
		sub	edx, [ebp+var_550]
		sub	edx, [ebp+var_548]
		add	edx, [ebp+var_56C]
		lea	eax, [eax+edi+705E701h]
		sub	esi, 9C94810h
		mov	edi, [ebp+var_560]
		sub	eax, [ebp+var_548]
		add	eax, [ebp+var_56C]
		or	edx, esi
		sub	eax, edx
		mov	edx, ecx
		xor	edx, 0CFE2F2D9h
		xor	eax, 687763D5h
		and	eax, edx
		mov	edx, ecx
		and	edx, 20012140h
		and	ecx, 687763D5h
		add	edx, edx
		sub	edx, ecx
		lea	ecx, [edx+eax+5EFFEDF7h]
		sub	edx, 34012143h
		or	edx, eax
		add	edx, edx
		sub	ecx, edx
		lea	eax, [ecx+ecx-26021E76h]
		and	eax, 73978D8h
		lea	edx, [ecx-39488F54h]
		sub	edx, eax
		mov	eax, [ebp+var_1C]
		lea	ecx, [eax+eax+3845070Eh]
		and	ecx, 842FBC0Ah
		mov	esi, ecx
		sub	esi, eax
		add	eax, 34562507h
		sub	eax, ecx
		sub	eax, edx
		add	eax, eax
		lea	esi, [edx+esi+6D6F796Dh]
		or	eax, 842FBC0Ah
		lea	eax, [esi+eax]
		mov	esi, 1D0F63A6h
		mov	[ebp+var_1C], eax
		mov	edx, [ebp+edi*4+var_118]
		lea	eax, [edx+edx+3845070Eh]
		and	eax, 842FBC0Ah
		sub	edx, eax
		imul	eax, edx, 0A79C247Fh
		mov	edx, [ebp+var_1B4]
		lea	eax, [edx+eax+39FE1474h]
		mov	edx, [ebp+var_C4]
		mov	[ebp+var_1B4], eax
		imul	eax, [ebp+var_5A4], 0ED74D93Dh
		sub	edx, 63DD7C79h
		add	eax, 532B4D1Ah
		mov	[ebp+var_550], eax
		and	edx, eax
		mov	eax, [ebp+var_C4]
		mov	ecx, [ebp+var_550]
		sub	eax, edx
		mov	edx, eax
		and	ecx, 4217DE05h
		sub	edx, 63DD7C79h
		or	edx, 683D155Ah
		add	edx, edx
		add	eax, 45F98E0h
		sub	eax, edx
		mov	edx, 0D4BDFD33h
		sub	edx, ecx
		mov	ecx, [ebp+var_550]
		not	ecx
		and	ecx, 4011C000h
		or	ecx, 92A61F2Fh
		add	ecx, ecx
		sub	edx, ecx
		xor	eax, edx
		mov	edx, [ebp+var_C4]
		mov	ecx, eax
		and	ecx, 0FA9B0A75h
		sub	ecx, 6BB0001h
		or	eax, 0FA9B0A75h
		sub	ecx, eax
		lea	eax, [edx+edx+3845070Eh]
		xor	ecx, 42C4h
		and	eax, 842FBC0Ah
		add	ecx, 6BB0000h
		sub	eax, edx
		lea	edx, [eax+43A94950h]
		lea	eax, [eax+eax+438B3CE6h]
		or	eax, 43C755BCh
		sub	edx, eax
		and	edx, 0E048272Ch
		xor	edx, 5E34BA68h
		mov	eax, edx
		and	edx, ecx
		and	eax, 42C4h
		and	ecx, 61C340B7h
		xor	eax, 5264A299h
		xor	eax, edx
		mov	edx, [ebp+var_520]
		xor	eax, ecx
		mov	ecx, [ebp+var_520]
		and	edx, 0A62722h
		and	ecx, 0A00400h
		add	ecx, ecx
		sub	edx, ecx
		imul	ecx, eax, 56A4F59Dh
		or	eax, 5264E21Dh
		imul	eax, 52B614C6h
		mov	edi, edx
		lea	eax, [ecx+eax+5633772Ch]
		imul	ecx, [ebp+var_330], 175088EFh
		add	ecx, 0E00CBB7h
		imul	eax, ecx
		sub	eax, 44072D30h
		mov	[ebp+var_548], eax
		mov	ecx, [ebp+var_528]
		mov	[ebp+var_128], eax
		imul	eax, [ebp+var_338], 755B14EDh
		sub	eax, 0FA73BBBh
		and	eax, 3Fh
		imul	eax, [ebp+eax*4+var_318], 0CA2E8CD3h
		sub	eax, 6448ADFBh
		mov	[ebp+var_56C], eax
		mov	eax, [ebp+var_520]
		or	eax, 2A3090C2h
		neg	eax
		sub	esi, edx
		lea	eax, [ecx+eax*2+28CB682Bh]
		mov	ecx, [ebp+var_520]
		or	eax, [ebp+var_56C]
		and	ecx, 2C34B76Bh
		xor	eax, 5EAE21DBh
		xor	ecx, 4042729h
		or	esi, ecx
		sub	edi, ecx
		add	esi, esi
		sub	ecx, edx
		sub	ecx, esi
		lea	edx, [ecx+ecx+3A1EC74Ah]
		and	edx, 0C4ED76F2h
		lea	edi, [edi+esi+79E0E1h]
		add	edi, edx
		lea	edx, [eax-5EAE21DDh]
		add	eax, eax
		or	eax, 42A3BC48h
		sub	edx, eax
		and	edi, edx
		mov	edx, edi
		and	edx, 0B3D7F4F4h
		imul	eax, edi, 0BD27E347h
		mov	edi, [ebp+var_168]
		imul	edx, 85B03972h
		lea	edx, [eax+edx-6E92D10Dh]
		imul	eax, edx, 2372989h
		imul	edx, 46E5312h
		sub	eax, 4C280B0Ch
		and	edx, 67AFE9E8h
		sub	eax, edx
		lea	edx, [eax+eax]
		and	edx, 0EFE9E010h
		sub	eax, edx
		lea	edx, [eax+eax-10161FF0h]
		and	edx, 0EFE9E010h
		sub	eax, edx
		mov	edx, [ebp+var_504]
		imul	eax, 0EE5E68E5h
		lea	eax, [edx+eax-3AE411B0h]
		mov	edx, [ebp+var_8C]
		mov	[ebp+var_504], eax
		lea	eax, [edx+edx+3845070Eh]
		and	eax, 842FBC0Ah
		mov	ecx, eax
		sub	ecx, edx
		sub	edx, eax
		lea	eax, [edx+edx+1FC491F6h]
		or	eax, 842FBC0Ah
		lea	eax, [ecx+eax-6E1CAA87h]
		mov	[ebp+var_8C], eax
		mov	[ebp+var_520], eax
		imul	eax, [ebp+var_558], 0D52D4602h
		imul	edx, [ebp+var_558], 9E3C6261h
		imul	esi, [ebp+var_2A4], 0CA2E8CD3h
		add	eax, 7799BA65h
		or	eax, 0DEE565B5h
		imul	eax, 0F514609Fh
		mov	[ebp+var_570], esi
		lea	eax, [edx+eax+1AD1F39Ch]
		imul	eax, 9BA4BB5Fh
		add	eax, 7FF4150Fh
		mov	[ebp+var_5B0], eax
		and	eax, 3Fh
		mov	edx, [ebp+eax*4+var_118]
		lea	eax, [edx+edx+3845070Eh]
		and	eax, 842FBC0Ah
		mov	ecx, eax
		sub	ecx, edx
		lea	ecx, [ecx+ecx+438B3CE7h]
		and	ecx, 211A9A4Ah
		lea	edx, [ecx+edx]
		imul	eax, 19ECA8CFh
		imul	edx, 0E6135731h
		lea	edx, [eax+edx-63CA6A0Ch]
		mov	[ebp+var_574], edx
		mov	edx, esi
		sub	edx, 6448ADFBh
		or	edx, 3CBA9069h
		mov	eax, edx
		xor	eax, 0FF65B7A9h
		mov	esi, eax
		and	eax, 6264A509h
		add	eax, eax
		and	esi, 6276A54Dh
		sub	esi, eax
		imul	eax, [ebp+var_4D0], 755B14EDh
		sub	eax, 0FA73BBBh
		and	eax, 3Fh
		imul	eax, [ebp+eax*4+var_318], 0CA2E8CD3h
		sub	eax, 6448ADFBh
		or	eax, 0C3456F96h
		xor	eax, 6276A54Dh
		and	eax, edx
		mov	edx, eax
		sub	edx, esi
		lea	ecx, [edx+edx*2]
		mov	edx, 9D9B5AF6h
		neg	ecx
		add	ecx, 272DEF1Eh
		sub	edx, esi
		or	edx, eax
		imul	edx, -6
		sub	ecx, edx
		mov	edx, ecx
		and	edx, 0F44E6911h
		imul	eax, ecx, 593E77BDh
		imul	edx, 4D831086h
		lea	ecx, [eax+edx+2BD8788Dh]
		imul	eax, edi, 2BF06481h
		imul	edx, ecx, 96E9046Bh
		imul	esi, ecx, 0DF93C2EBh
		imul	ecx, 0D22DF72Ah
		sub	eax, 5D0D7AD1h
		xor	eax, 5654h
		sub	edx, 1
		sub	eax, 20AE0000h
		xor	eax, 0FFFFA9ABh
		xor	eax, edx
		or	eax, edx
		lea	edx, [edi+59BF3393h]
		imul	edi, 57E0C902h
		sub	edx, esi
		imul	esi, eax, 4F3848FEh
		lea	ecx, [edi+ecx+4890A63h]
		lea	eax, [ecx+eax*4]
		sub	edx, esi
		and	eax, 0E89CD222h
		mov	esi, 0FFFFFFFFh
		imul	eax, 0A79C247Fh
		lea	eax, [edx+eax]
		mov	[ebp+var_168], eax
		mov	[ebp+var_5AC], eax
		imul	eax, [ebp+var_468], 755B14EDh
		sub	eax, 0FA73BBBh
		and	eax, 3Fh
		mov	edx, [ebp+eax*4+var_218]
		imul	eax, edx, 2BF06481h
		imul	edx, 57E0C902h
		sub	eax, 373B86C3h
		add	edx, 4890A5Fh
		or	edx, 2BE806B3h
		sub	eax, edx
		imul	edx, [ebp+var_3FC], 755B14EDh
		lea	ecx, [eax+eax-6117E16Ah]
		and	ecx, 0D417F94Ch
		sub	eax, ecx
		sub	edx, 0FA73BBBh
		mov	[ebp+var_558], edx
		mov	edx, [ebp+var_36C]
		imul	eax, 0EE5E68E5h
		sub	edx, 64E29695h
		sub	edx, eax
		mov	eax, [ebp+var_558]
		mov	[ebp+var_36C], edx
		mov	edx, 20h
		and	eax, 1Fh
		sub	edx, eax
		mov	ecx, eax
		mov	edi, edx
		add	edx, edx
		and	edi, 1Fh
		mov	[ebp+var_590], edi
		mov	edi, 0B0DEA603h
		mov	[ebp+var_580], edx
		shr	esi, cl
		mov	edx, edi
		shr	edx, cl
		not	esi
		mov	ecx, [ebp+var_590]
		lea	edx, [edx+esi+29C70000h]
		mov	esi, [ebp+var_580]
		xor	edx, 9D87h
		sub	edx, 29C70000h
		add	ecx, 3Ah
		xor	edx, 80651D5Bh
		and	esi, 14h
		sub	ecx, esi
		mov	esi, 0B0DEA604h
		xor	ecx, 3Ah
		shl	esi, cl
		mov	ecx, esi
		add	ecx, 29C6FFFFh
		xor	ecx, 9D87h
		sub	ecx, 29C70000h
		xor	edx, ecx
		mov	ecx, edx
		and	edx, 10000904h
		and	ecx, 908D4D25h
		or	edx, 0C3FFC6A3h
		add	edx, edx
		sub	ecx, 3C00395Eh
		sub	ecx, edx
		xor	ecx, 0A525DA2Bh
		mov	edx, ecx
		or	edx, 1920EE76h
		and	ecx, 1920EE76h
		sub	edx, ecx
		imul	edx, 0FDD9DDB3h
		sub	edx, 557B4886h
		mov	[ebp+var_55C], edx
		imul	edx, [ebp+var_1A4], 2BF06481h
		sub	edx, 7DBB7AD1h
		mov	ecx, edx
		mov	esi, edx
		or	ecx, 6F72B2DAh
		not	esi
		mov	[ebp+var_57C], ecx
		xor	ecx, 0EC13B6F2h
		and	edx, 0FCB4E3FCh
		mov	[ebp+var_568], ecx
		imul	ecx, [ebp+var_55C], 265BE685h
		sub	ecx, 2828EE63h
		mov	[ebp+var_578], ecx
		mov	ecx, [ebp+var_558]
		mov	[ebp+var_558], esi
		mov	esi, [ebp+var_580]
		and	ecx, 1
		neg	ecx
		and	esi, 4
		lea	ecx, [eax+ecx*2+61h]
		mov	eax, edi
		xor	ecx, 61h
		mov	edi, 0FFFFFFFFh
		and	ecx, 0FFh
		shr	edi, cl
		shr	eax, cl
		mov	ecx, edi
		mov	edi, [ebp+var_40]
		not	ecx
		lea	eax, [eax+ecx+63190000h]
		mov	ecx, [ebp+var_590]
		xor	eax, 2CDAh
		sub	eax, 63190000h
		xor	eax, 0FCB4E3FCh
		add	ecx, 22h
		sub	ecx, esi
		mov	esi, 0B0DEA604h
		xor	ecx, 22h
		shl	esi, cl
		mov	ecx, esi
		mov	esi, [ebp+var_568]
		add	ecx, 6318FFFFh
		xor	ecx, 2CDAh
		sub	ecx, 63190000h
		xor	eax, ecx
		and	eax, [ebp+var_558]
		lea	ecx, [eax-144148ABh]
		or	eax, 0EBBEB756h
		add	eax, eax
		sub	ecx, eax
		mov	eax, 7792F697h
		sub	eax, edx
		mov	edx, [ebp+var_558]
		or	esi, 0EC13B6F2h
		or	esi, [ebp+var_578]
		and	edx, 8420E160h
		or	edx, 7ADE129Ch
		add	edx, edx
		sub	eax, edx
		xor	ecx, eax
		mov	eax, [ebp+var_568]
		mov	edx, ecx
		or	ecx, 9160A5CAh
		and	edx, 9160A5CAh
		add	edx, 3CCD66EBh
		and	eax, 0EC13B6F2h
		sub	edx, ecx
		and	eax, [ebp+var_578]
		imul	ecx, [ebp+var_55C], 53B5A267h
		add	esi, eax
		mov	eax, [ebp+var_57C]
		not	eax
		and	eax, 13EC490Dh
		lea	eax, [esi+eax]
		imul	eax, 0C9827905h
		lea	esi, [edi+edi+3845070Eh]
		and	esi, 842FBC0Ah
		lea	ecx, [ecx+eax-7C430B6Bh]
		imul	ecx, 0EACF9433h
		lea	eax, [edx+ecx+2883CD01h]
		sub	edx, 3CCD66ECh
		add	ecx, 655133EDh
		or	ecx, edx
		mov	edx, esi
		sub	eax, ecx
		sub	edx, edi
		xor	eax, 0D52ED998h
		lea	edi, [eax+edx+6E5C634Fh]
		mov	edx, [ebp+var_40]
		lea	ecx, [eax+eax]
		and	ecx, 55A24CCEh
		sub	edi, ecx
		add	edx, 33693B25h
		sub	edx, esi
		sub	edx, eax
		lea	eax, [edx+ecx]
		mov	edx, [ebp+var_420]
		add	eax, eax
		or	eax, 842FBC0Ah
		lea	eax, [edi+eax]
		imul	ecx, [ebp+var_464], 755B14EDh
		mov	[ebp+var_40], eax
		imul	eax, edx, 1549D626h
		sub	ecx, 0FA73BBBh
		add	eax, 1F4E7775h
		and	ecx, 3Fh
		or	eax, 48585AEDh
		imul	eax, 0EE5E68E5h
		imul	ecx, [ebp+ecx*4+var_318], 0CA2E8CD3h
		lea	eax, [edx+eax+4CAF6572h]
		mov	[ebp+var_588], eax
		sub	ecx, 6448ADFBh
		mov	[ebp+var_420], eax
		imul	eax, [ebp+var_164], 2BF06481h
		sub	eax, 7DBB7AD1h
		mov	esi, eax
		or	eax, ecx
		or	esi, 4CF50FA3h
		xor	eax, 3966A969h
		mov	edx, esi
		and	eax, esi
		xor	edx, 1E041B99h
		mov	esi, edx
		and	edx, 3966A969h
		and	esi, 18040909h
		add	esi, esi
		sub	esi, edx
		lea	edx, [esi+eax-1E6F8CD2h]
		sub	esi, 1804090Ah
		or	esi, eax
		mov	eax, ecx
		add	esi, esi
		and	eax, 0ED2478F4h
		sub	edx, esi
		mov	esi, ecx
		and	esi, 5E2E88A8h
		and	ecx, 4C2408A0h
		neg	ecx
		lea	eax, [esi+eax-4E030EF5h]
		lea	eax, [eax+ecx*2]
		lea	ecx, [eax+edx-5E9C5DA1h]
		sub	eax, 6507E168h
		add	edx, 66B83C7h
		or	edx, eax
		mov	eax, [ebp+var_560]
		sub	ecx, edx
		xor	ecx, 81537636h
		imul	edx, [ebp+eax*4+var_218], 0D40F9B7Fh
		mov	eax, 0CCCCCCCDh
		add	edx, 7DBB7AD0h
		mul	edx
		lea	eax, [ecx+ecx]
		and	eax, 0FD591392h
		mov	esi, eax
		sub	esi, ecx
		sub	ecx, 794AFB1Eh
		shr	edx, 2
		sub	ecx, eax
		add	edx, 8087B19h
		sub	ecx, edx
		add	ecx, ecx
		lea	esi, [edx+esi-5AA175ADh]
		or	ecx, 9D006702h
		lea	ecx, [esi+ecx]
		lea	eax, [ecx+ecx+0AD87A94h]
		and	eax, 9D006702h
		lea	edx, [ecx-1F0504D6h]
		sub	edx, eax
		mov	eax, [ebp+var_CC]
		lea	ecx, [eax+eax+3845070Eh]
		and	ecx, 842FBC0Ah
		mov	esi, ecx
		sub	esi, eax
		add	eax, 6B48EBEBh
		sub	eax, ecx
		sub	eax, edx
		add	eax, eax
		lea	esi, [edx+esi+367CB289h]
		or	eax, 842FBC0Ah
		lea	eax, [esi+eax]
		mov	esi, 63DD7C78h
		mov	[ebp+var_CC], eax
		imul	eax, [ebp+var_574], 0AE60A1D1h
		sub	eax, 0E0CBCDh
		mov	[ebp+var_578], eax
		and	eax, 3Fh
		mov	edx, [ebp+eax*4+var_218]
		mov	eax, 77F1A5A0h
		sub	eax, edx
		imul	eax, edx
		sub	eax, 3295E001h
		imul	edx, eax, 0A19DA7C5h
		imul	eax, 0DEAA1202h
		sub	edx, 678CE662h
		and	eax, 212CA0Ch
		imul	eax, 0F1A3BAC5h
		sub	edx, eax
		imul	eax, edx, 47B9B40Dh
		imul	edx, 8F73681Ah
		sub	esi, [ebp+var_C4]
		sub	eax, 1096507h
		and	edx, 0FDED35F2h
		sub	eax, edx
		and	eax, 3Fh
		mov	ecx, [ebp+eax*4+var_318]
		mov	eax, 376EA40Bh
		imul	edx, ecx, 35D1732Dh
		imul	ecx, 6BA2E65Ah
		sub	eax, ecx
		and	eax, 842FBC0Ah
		lea	eax, [edx+eax-79F1B392h]
		mov	edx, esi
		mov	[ebp+var_558], eax
		xor	edx, 0FFFF2E77h
		imul	eax, [ebp+var_4AC], 755B14EDh
		sub	eax, 0FA73BBBh
		and	eax, 3Fh
		imul	ecx, [ebp+eax*4+var_318], 0CA2E8CD3h
		mov	eax, 2C03A6ECh
		sub	eax, [ebp+var_C4]
		sub	eax, ecx
		add	ecx, 60E95205h
		xor	ecx, 0D188h
		add	ecx, 3ACE0000h
		xor	edx, ecx
		or	edx, esi
		lea	edx, [edx+edx+2]
		sub	eax, edx
		mov	edx, [ebp+var_174]
		mov	[ebp+var_C4], eax
		mov	eax, [ebp+var_548]
		add	eax, edx
		imul	eax, 0BBF8D2D0h
		imul	edx, [ebp+var_548]
		sub	eax, edx
		sub	eax, 3295E001h
		imul	esi, eax, 0DEAA1202h
		imul	edi, eax, 0EF550901h
		mov	eax, esi
		and	eax, 0D2B3E142h
		mov	edx, edi
		sub	edx, eax
		lea	eax, [edx+edx-2D4C1EBEh]
		and	eax, 2D4C1EBCh
		and	esi, 6467679Eh
		lea	ecx, [edx-1]
		mov	edx, 8AF8C947h
		sub	ecx, eax
		mov	eax, 98B99BD8h
		and	ecx, 1Fh
		sub	edi, esi
		shl	eax, cl
		mov	esi, 98B99BD8h
		imul	eax, 750736B9h
		shl	edx, cl
		mov	ecx, 20h
		sub	eax, edx
		lea	edx, [edi-1]
		sub	eax, 3705E0D9h
		and	edx, 1Fh
		sub	ecx, edx
		mov	[ebp+var_560], eax
		mov	edx, ecx
		mov	eax, ecx
		and	eax, 1Fh
		add	edx, edx
		and	edx, 0Ah
		add	eax, 668E5618h
		sub	eax, edx
		movsx	edx, al
		neg	eax
		lea	eax, [eax+eax+5]
		or	al, 0D5h
		lea	ecx, [edx+eax+13h]
		mov	eax, 0FFFFFFFFh
		and	ecx, 1Fh
		shr	eax, cl
		shr	esi, cl
		not	eax
		lea	edi, [eax+esi]
		mov	eax, [ebp+var_28]
		mov	esi, 0FFFFFFFFh
		lea	edx, [eax-21C59E74h]
		lea	eax, [eax+eax+3845070Eh]
		and	eax, 842FBC0Ah
		sub	edx, eax
		imul	eax, [ebp+var_3F4], 628CB593h
		mov	[ebp+var_530], edx
		mov	ecx, [ebp+var_530]
		add	eax, 10A7E50Bh
		mov	[ebp+var_1F0], eax
		neg	ecx
		mov	[ebp+var_5A8], eax
		and	ecx, 1Fh
		imul	eax, [ebp+var_390], 755B14EDh
		sub	eax, 0FA73BBBh
		and	eax, 3Fh
		imul	edx, [ebp+eax*4+var_218], 2BF06481h
		lea	eax, [edx-7DBB7AD1h]
		shr	eax, cl
		shr	esi, cl
		sub	edx, 7DBB7AD0h
		mov	ecx, esi
		movsx	esi, byte ptr [ebp+var_530]
		not	ecx
		lea	eax, [eax+ecx-74060000h]
		xor	eax, 3056h
		mov	ecx, esi
		add	esi, esi
		and	ecx, 1Fh
		and	esi, 18h
		add	ecx, 0Ch
		add	eax, 74060000h
		sub	ecx, esi
		xor	eax, 72272ACAh
		xor	ecx, 0Ch
		mov	esi, 63DD7C78h
		shl	edx, cl
		sub	edx, 74060001h
		xor	edx, 3056h
		add	edx, 74060000h
		xor	eax, edx
		mov	edx, eax
		or	edx, 8DD8D535h
		neg	edx
		lea	ecx, [eax+edx*2]
		mov	edx, [ebp+var_C8]
		mov	eax, 39E223BDh
		sub	eax, edx
		sub	esi, edx
		sub	eax, ecx
		add	ecx, 23B8D534h
		mov	edx, esi
		xor	ecx, 27EFh
		add	ecx, 6A200000h
		xor	edx, 0FFFFD810h
		xor	edx, ecx
		or	edx, esi
		lea	edx, [edx+edx+2]
		sub	eax, edx
		mov	edx, [ebp+var_74]
		imul	ecx, [ebp+var_138], 2BF06481h
		mov	[ebp+var_C8], eax
		lea	eax, [edx-63DD7C79h]
		sub	ecx, 7DBB7AD1h
		and	eax, ecx
		mov	esi, ecx
		sub	edx, eax
		not	ecx
		lea	eax, [edx+38F2B6Ch]
		sub	edx, 63DD7C79h
		or	edx, 676CA7E6h
		and	ecx, 2109004h
		add	edx, edx
		and	esi, 4217DE05h
		sub	eax, edx
		or	ecx, 0F4276E3Bh
		mov	edx, 363F4C3Fh
		add	ecx, ecx
		sub	edx, esi
		imul	esi, [ebp+var_560], 0C9EBDF12h
		sub	edx, ecx
		imul	ecx, [ebp+var_560], 9B0A1077h
		xor	eax, edx
		lea	edx, [edi+edi+1]
		sub	esi, 3A8629BFh
		sub	ecx, edi
		or	edx, esi
		mov	edi, [ebp+var_558]
		lea	edx, [ecx+edx-522F9DFCh]
		mov	[ebp+var_590], edx
		and	edx, 3Fh
		imul	ecx, [ebp+var_138], 0D40F9B7Fh
		mov	[ebp+var_568], edx
		imul	edx, [ebp+edx*4+var_318], 0CA2E8CD3h
		add	ecx, 7DBB7AD0h
		sub	edx, 6448ADFBh
		or	edx, ecx
		mov	ecx, eax
		or	ecx, 934BC9DDh
		and	eax, 934BC9DDh
		sub	eax, ecx
		xor	edx, 0D076D46Ch
		add	eax, 39FDFFFFh
		xor	eax, 83C8h
		lea	ecx, [eax-39FE0000h]
		mov	eax, ecx
		and	ecx, edx
		and	eax, 0D076D46Ch
		and	edx, 83C8h
		xor	eax, 0BD5BDED4h
		xor	eax, ecx
		xor	eax, edx
		mov	edx, 3CA26EBCh
		lea	ecx, [eax+42A4A163h]
		add	eax, eax
		and	eax, 854942C6h
		sub	edx, [ebp+var_558]
		sub	ecx, eax
		lea	eax, [edi+edi+3845070Eh]
		mov	esi, ecx
		or	eax, 842FBC0Ah
		and	ecx, 1ADCD048h
		shr	esi, 1
		lea	eax, [edx+eax]
		add	eax, esi
		sub	esi, ecx
		lea	edx, [esi+esi+1ADCD048h]
		sub	eax, ecx
		and	edx, 1ADCD048h
		sub	eax, edx
		xor	eax, 4217DE05h
		add	eax, 63DD7C79h
		mov	[ebp+var_54], eax
		mov	edx, [ebp+var_7C]
		imul	eax, [ebp+var_184], 2BF06481h
		mov	ecx, edx
		mov	[ebp+var_57C], eax
		sub	eax, 7DBB7AD1h
		mov	[ebp+var_560], eax
		lea	eax, [edx-63DD7C79h]
		and	eax, [ebp+var_560]
		sub	ecx, eax
		imul	eax, [ebp+var_4F0], 755B14EDh
		mov	[ebp+var_55C], ecx
		sub	eax, 0FA73BBBh
		and	eax, 3Fh
		mov	esi, [ebp+eax*4+var_318]
		mov	eax, 69CBABBCh
		sub	eax, esi
		imul	eax, esi
		sub	eax, 275FDEDDh
		imul	ecx, eax, 0E54B75E9h
		imul	eax, 0CA96EBD2h
		add	ecx, 7BA67A22h
		and	eax, 6D28CDEh
		sub	ecx, eax
		mov	eax, 562AF607h
		imul	edi, ecx, 0B1C6B8CDh
		sub	ecx, 783D33B3h
		or	ecx, 0FC96B990h
		sub	eax, edi
		mov	edi, 2CB7111Ah
		imul	ecx, 9C728E66h
		sub	eax, ecx
		imul	ecx, esi, 0E631AEE1h
		add	ecx, 672423E2h
		imul	eax, ecx
		lea	ecx, [edx+edx+3845070Eh]
		and	ecx, 842FBC0Ah
		sub	ecx, edx
		lea	edx, [ecx+ecx+438B3CE6h]
		sub	eax, 2F1614FFh
		or	edx, 0F6B21768h
		lea	esi, [ecx-62E155DAh]
		sub	esi, edx
		mov	edx, esi
		mov	ecx, esi
		and	edx, 60009908h
		and	ecx, 67189F6Ch
		add	edx, edx
		xor	esi, 84A6F44Bh
		sub	ecx, edx
		imul	edx, eax, 630EAFFh
		imul	eax, 0C61D5FEh
		sub	edx, 67189F6Dh
		and	eax, 31CEC126h
		sub	edx, eax
		mov	eax, 73966F4h
		and	edx, esi
		sub	eax, ecx
		lea	esi, [ecx-73966F4h]
		or	eax, edx
		sub	esi, edx
		mov	edx, [ebp+var_55C]
		lea	esi, [esi+eax*2]
		mov	eax, [ebp+var_55C]
		mov	ecx, esi
		xor	ecx, 0FCC60D43h
		sub	edx, 63DD7C79h
		or	edx, 6B3F78BCh
		add	eax, 761FC42h
		add	edx, edx
		sub	eax, edx
		mov	edx, [ebp+var_560]
		not	edx
		and	edx, 40019A05h
		or	edx, 17564430h
		sub	edi, edx
		mov	edx, [ebp+var_560]
		add	edi, edi
		and	edx, 4217DE05h
		sub	edi, edx
		xor	eax, edi
		mov	edi, 0FFFFFFFFh
		xor	eax, 9B8FEE13h
		and	ecx, eax
		mov	eax, esi
		and	eax, 18000D40h
		and	esi, 18192D60h
		add	eax, eax
		sub	eax, esi
		lea	edx, [eax+ecx]
		sub	eax, 18000D41h
		or	eax, ecx
		imul	edx, 388BF7F5h
		imul	eax, 7117EFEAh
		add	edx, 281A0F77h
		sub	edx, eax
		mov	eax, [ebp+var_1B8]
		imul	ecx, edx, 346C79DDh
		imul	edx, 50E778BAh
		lea	ecx, [eax+ecx+6A194303h]
		imul	eax, 57E0C902h
		add	edx, 516FE107h
		add	eax, 4890A5Fh
		or	edx, eax
		imul	eax, [ebp+var_46C], 755B14EDh
		imul	edx, 0A79C247Fh
		sub	eax, 0FA73BBBh
		and	eax, 3Fh
		imul	eax, [ebp+eax*4+var_318], 0CA2E8CD3h
		lea	edx, [ecx+edx]
		mov	ecx, 63272911h
		mov	[ebp+var_558], edx
		mov	[ebp+var_1B8], edx
		mov	edx, 3BEB443Dh
		sub	eax, 6448ADFBh
		mov	esi, eax
		and	eax, 0CF6F4602h
		sub	edx, eax
		and	esi, 7595207Bh
		lea	eax, [edx+13C36F9Dh]
		sub	edx, 6C7BFE3Bh
		or	edx, 803F6DD9h
		add	edx, edx
		sub	eax, edx
		mov	edx, 7595207Bh
		sub	edx, esi
		or	edx, 50B931A8h
		sub	ecx, edx
		add	ecx, ecx
		sub	ecx, esi
		xor	eax, ecx
		xor	eax, 1A0800C2h
		mov	ecx, eax
		mov	edx, eax
		or	ecx, 0BFFBFF7Dh
		and	edx, 3470A34Ch
		not	eax
		lea	edx, [ecx+edx]
		and	eax, 0CA8E5CB3h
		lea	eax, [edx+eax]
		imul	eax, 0C152D525h
		add	eax, 45677977h
		imul	edx, eax, 92A76F4Fh
		imul	eax, 32C982A6h
		add	eax, 54BFCDCFh
		or	eax, 868ADF2Dh
		imul	eax, 0B81DD16Bh
		lea	eax, [edx+eax+2B3B9AB5h]
		mov	[ebp+var_594], eax
		imul	eax, [ebp+var_49C], 755B14EDh
		sub	eax, 0FA73BBBh
		and	eax, 3Fh
		imul	eax, [ebp+eax*4+var_318], 35D1732Dh
		add	eax, 6448ADFAh
		mov	edx, eax
		add	eax, eax
		and	edx, 1Fh
		and	eax, 1Ch
		lea	ecx, [edx+3732C6Fh]
		sub	ecx, eax
		imul	eax, [ebp+var_574], 519F5E2Fh
		lea	esi, [eax+0E0CBCCh]
		mov	[ebp+var_55C], esi
		movsx	esi, cl
		neg	ecx
		lea	ecx, [ecx+ecx+41h]
		or	ecx, 63h
		lea	ecx, [esi+ecx+2Eh]
		mov	esi, [ebp+var_55C]
		shr	edi, cl
		shr	esi, cl
		mov	ecx, edi
		not	ecx
		lea	ecx, [esi+ecx]
		imul	edi, ecx, 7AFCB137h
		mov	ecx, 20h
		sub	cl, dl
		add	eax, 0E0CBCDh
		movzx	edx, cl
		mov	ecx, edx
		and	edx, 1Bh
		neg	edx
		and	ecx, 1Fh
		lea	ecx, [ecx+edx*2-25h]
		add	edi, 57C820F3h
		xor	cl, 0DBh
		shl	eax, cl
		imul	eax, 27912C29h
		lea	esi, [eax-52125686h]
		imul	eax, [ebp+var_450], 755B14EDh
		sub	eax, 0FA73BBBh
		and	eax, 3Fh
		mov	edx, [ebp+eax*4+var_118]
		lea	eax, [edx-63DD7C79h]
		and	eax, 147F3886h
		sub	edx, eax
		lea	eax, [edx+7FDCE4FCh]
		sub	edx, 63DD7C79h
		or	edx, 0E3BA6176h
		add	edx, edx
		sub	eax, edx
		xor	eax, 0F0B34066h
		mov	edx, eax
		and	eax, 0AEF618EEh
		or	edx, 0AEF618EEh
		sub	edx, eax
		imul	edx, 0A57344F1h
		imul	eax, edi, 0B06BD487h
		lea	ecx, [edx-424F35B8h]
		imul	edx, esi, 0F7933019h
		imul	esi, 0EF266032h
		lea	eax, [edx+eax-6E6E0910h]
		imul	edx, edi, 60D7A90Eh
		sub	esi, 2614D9D5h
		add	edx, 4938C7B7h
		or	edx, esi
		sub	eax, edx
		or	eax, 0EB80C779h
		imul	eax, 4C8DD1A7h
		imul	edx, ecx, 3F6F2C11h
		imul	ecx, 0C090D3EFh
		add	eax, 34BD303Ch
		imul	esi, eax, 229239E9h
		imul	eax, 0DD6DC617h
		add	ecx, 68B9CEC7h
		lea	edx, [esi+edx]
		mov	esi, [ebp+var_30]
		sub	eax, 65D9BD64h
		or	eax, ecx
		lea	eax, [edx+eax]
		mov	edx, [ebp+var_1E4]
		imul	eax, 0E108DF17h
		add	eax, 1F985404h
		imul	ecx, eax, 0AD786D9h
		imul	eax, 0B6F6EB2h
		lea	ecx, [edx+ecx-5863DB81h]
		imul	edx, 57E0C902h
		sub	eax, 1
		add	edx, 4890A5Fh
		or	eax, edx
		imul	eax, 0A79C247Fh
		lea	eax, [ecx+eax]
		mov	[ebp+var_1E4], eax
		lea	ecx, [esi-63DD7C79h]
		imul	eax, [ebp+var_59C], 0A8A77ACDh
		sub	eax, 4C42163h
		and	eax, 3Fh
		imul	edi, [ebp+eax*4+var_318], 0CA2E8CD3h
		sub	edi, 6448ADFBh
		mov	eax, edi
		and	eax, ecx
		sub	esi, eax
		mov	eax, edi
		not	eax
		mov	edx, eax
		and	edx, 6C005h
		mov	[ebp+var_560], eax
		or	edx, 0CE311F58h
		mov	eax, 8247EAEh
		sub	eax, edx
		mov	edx, edi
		and	edx, 4217DE05h
		add	eax, eax
		sub	eax, edx
		lea	edx, [esi+6FD47BBBh]
		sub	esi, 63DD7C79h
		or	esi, 0D3B1F835h
		add	esi, esi
		sub	edx, esi
		mov	esi, ecx
		xor	eax, edx
		and	esi, 908D4D25h
		and	ecx, 80894D25h
		mov	edx, 0CDD95DB0h
		sub	edx, esi
		or	ecx, 3226A250h
		lea	edx, [edx+ecx*2]
		mov	ecx, eax
		and	ecx, 1D80E76Dh
		or	eax, 1D80E76Dh
		add	ecx, 4551FFFFh
		sub	ecx, eax
		xor	ecx, 0F9ECh
		lea	eax, [ecx-45520000h]
		mov	ecx, edx
		and	ecx, 0F9ECh
		and	edx, eax
		xor	ecx, 388842FFh
		and	eax, 0CDDC11AAh
		xor	ecx, edx
		mov	edx, [ebp+var_560]
		xor	ecx, eax
		mov	eax, ecx
		mov	esi, ecx
		and	eax, 10005041h
		and	esi, 93105061h
		add	eax, eax
		and	edx, dword ptr [loc_12403]	;offset
		sub	esi, eax
		mov	eax, edi
		and	eax, 8B012EBBh
		or	edx, 0DF5ECABCh
		neg	eax
		add	edx, edx
		add	eax, 6A5FF976h
		and	edi, 1B8C639Eh
		sub	eax, edx
		mov	edx, 8B35768Fh
		sub	edx, edi
		mov	edi, [ebp+var_560]
		xor	ecx, 38885357h
		and	edi, 1004610Ch
		or	edi, 6FA912F2h
		add	edi, edi
		sub	edx, edi
		xor	eax, edx
		mov	edx, 0EFFFAFBEh
		xor	eax, 0DC1877D0h
		sub	edx, esi
		and	ecx, eax
		or	edx, ecx
		lea	eax, [ecx-10005043h]
		mov	ecx, [ebp+var_520]
		add	edx, edx
		sub	eax, esi
		sub	eax, edx
		mov	edx, [ebp+var_520]
		mov	esi, eax
		sub	ecx, 63DD7C79h
		and	esi, 4217DE05h
		and	ecx, eax
		not	eax
		sub	edx, ecx
		and	eax, 40170400h
		mov	ecx, edx
		or	eax, 0BB88DAB5h
		sub	ecx, 63DD7C79h
		add	eax, eax
		or	ecx, 7605107Dh
		add	ecx, ecx
		add	edx, 12279403h
		sub	edx, ecx
		mov	ecx, 0FDA0B8B9h
		sub	ecx, esi
		mov	esi, [ebp+var_A4]
		sub	ecx, eax
		xor	edx, ecx
		mov	eax, edx
		and	edx, 0CD8DCAC8h
		or	eax, 0CD8DCAC8h
		sub	eax, edx
		imul	eax, 0DC7CCE53h
		imul	edx, [ebp+var_520], 3313627Bh
		lea	ecx, [eax-1E72E02Bh]
		mov	eax, 6C6C08FCh
		sub	eax, edx
		mov	edx, 63DD7C78h
		sub	edx, [ebp+var_520]
		or	edx, 0A03C1BBDh
		imul	edx, 99D93B0Ah
		lea	edx, [eax+edx]
		imul	eax, edx, 0D4FF2CB3h
		imul	edx, 0A9FE5966h
		add	eax, 1DD43A46h
		or	edx, 3BA8748Eh
		sub	eax, edx
		lea	edx, [esi-63DD7C79h]
		or	edx, 0BDE821FAh
		neg	edx
		lea	edx, [esi+edx*2+5A0AA580h]
		or	eax, edx
		imul	edx, ecx, 393F5A25h
		mov	esi, eax
		imul	ecx, 0C6C0A5DBh
		not	eax
		xor	esi, 5356336Bh
		and	eax, 0ACA9CC94h
		sub	edx, 79017BCAh
		lea	ecx, [eax+ecx-693A2AC4h]
		mov	eax, esi
		or	eax, 5356336Bh
		and	esi, 5356336Bh
		or	eax, edx
		and	esi, edx
		lea	eax, [ecx+eax]
		mov	ecx, [ebp+var_A8]
		lea	esi, [eax+esi]
		lea	edx, [esi+esi-3B88B2E4h]
		and	edx, 0A06203C6h
		lea	eax, [esi-16DC1D59h]
		sub	eax, edx
		lea	edx, [ecx+77B42939h]
		lea	ecx, [ecx+ecx+3845070Eh]
		and	ecx, 842FBC0Ah
		sub	edx, ecx
		add	edx, eax
		lea	eax, [eax+eax-6D6E746Ch]
		or	eax, 0A06203C6h
		sub	edx, eax
		xor	edx, 4217DE05h
		add	edx, 63DD7C79h
		mov	[ebp+var_A8], edx
		imul	eax, [ebp+var_370], 755B14EDh
		sub	eax, 0FA73BBBh
		and	eax, 3Fh
		imul	ecx, [ebp+eax*4+var_218], 2BF06481h
		mov	eax, [ebp+var_550]
		sub	ecx, 7DBB7AD1h
		or	eax, ecx
		mov	edx, eax
		xor	edx, 126ECC7Ah
		mov	esi, edx
		and	edx, 30300022h
		add	edx, edx
		and	esi, 0B43B0C2Eh
		sub	esi, edx
		mov	edx, [ebp+var_550]
		or	edx, 0D8DA01C4h
		xor	edx, 0B43B0C2Eh
		and	edx, eax
		mov	eax, ecx
		and	eax, 2420CC20h
		and	ecx, 305321Bh
		or	ecx, 88200C4h
		or	eax, 0D0580100h
		sub	eax, ecx
		mov	ecx, 0CD4B7DDDh
		sub	ecx, esi
		not	eax
		sub	eax, 0B8732DFh
		or	ecx, edx
		sub	esi, edx
		lea	edx, [esi+ecx*2+32B48223h]
		mov	ecx, eax
		mov	esi, [ebp+var_1BC]
		xor	ecx, 0F478CD20h
		and	edx, ecx
		mov	ecx, eax
		and	ecx, 0D4604120h
		and	eax, 0DD6171F7h
		add	ecx, ecx
		sub	ecx, eax
		lea	eax, [edx+ecx]
		add	ecx, 2B9FBEDFh
		or	ecx, edx
		mov	edx, [ebp+var_340]
		imul	eax, 0A79C247Fh
		imul	ecx, 4F3848FEh
		lea	eax, [esi+eax+3C5EE822h]
		mov	esi, [ebp+var_558]
		sub	eax, ecx
		mov	[ebp+var_1BC], eax
		mov	eax, 730CCC8Eh
		sub	eax, edx
		imul	eax, edx
		lea	edx, [eax+27A87B76h]
		imul	eax, edx, 8433E369h
		imul	edx, 867C6D2h
		and	edx, 0E7785C6Ah
		sub	eax, edx
		lea	edx, [eax+eax-1887A396h]
		and	edx, 1887A394h
		sub	eax, edx
		imul	edx, eax, 0B42F9B11h
		add	edx, 2CA2EA7Fh
		imul	eax, edx, 0F000268Fh
		imul	edx, 5466941Eh
		lea	ecx, [esi+eax-2DCFD6F1h]
		imul	eax, esi, 57E0C902h
		add	edx, 7ABD191Fh
		add	eax, 4890A5Fh
		or	eax, edx
		imul	eax, 0A79C247Fh
		lea	eax, [ecx+eax]
		mov	[ebp+var_1B8], eax
		mov	eax, [ebp+var_368]
		imul	edx, eax, 2A93AC4Ch
		imul	edi, eax, 1549D626h
		imul	eax, 0FEF4C389h
		add	edx, 3E9CEEEAh
		and	edx, 806AA84Eh
		add	edi, 42DB7E55h
		sub	edi, edx
		add	eax, 697F2F01h
		imul	edx, [ebp+var_140], 2BF06481h
		mov	[ebp+var_560], eax
		mov	eax, 0A0177CD5h
		sub	edx, 7DBB7AD1h
		mov	[ebp+var_550], edx
		lea	edx, [edi-6357B2B9h]
		and	edx, [ebp+var_550]
		sub	edi, edx
		mov	edx, [ebp+var_174]
		mov	ecx, edx
		imul	ecx, edx
		imul	esi, edx, 7DC36110h
		mov	[ebp+var_558], ecx
		imul	ecx, 0C786C2F5h
		sub	ecx, esi
		sub	ecx, 1524887Ch
		sub	ecx, esi
		mov	esi, [ebp+var_550]
		and	esi, 3FCAABD8h
		sub	eax, esi
		mov	esi, [ebp+var_550]
		not	esi
		and	esi, 1F822B00h
		or	esi, 604CD0FEh
		add	esi, esi
		sub	eax, esi
		lea	esi, [edi+5910723Dh]
		sub	edi, 6357B2B9h
		or	edi, 0BC6824F7h
		xor	eax, 31EB2DF5h
		add	edi, edi
		sub	esi, edi
		mov	edi, 4F055E3Fh
		xor	eax, esi
		imul	esi, edx, 82F743F4h
		sub	edi, esi
		imul	esi, edx, 499520DDh
		imul	esi, ecx
		imul	ecx, 6337FD90h
		add	edi, esi
		sub	edi, ecx
		imul	esi, edx, 6BD0EEB0h
		imul	ecx, [ebp+var_558], 0C0178B77h
		or	edi, [ebp+var_550]
		sub	ecx, esi
		xor	edi, 0A27B2315h
		add	ecx, 76DEA124h
		sub	ecx, esi
		imul	esi, edx, 0CDEDC9FCh
		imul	edx, 0C71C9CC7h
		mov	[ebp+var_550], esi
		mov	esi, 2104D4BFh
		imul	edx, ecx
		sub	esi, [ebp+var_550]
		imul	ecx, 7DA29FB0h
		lea	edx, [esi+edx]
		imul	esi, [ebp+var_560], 0A10BCD76h
		sub	edx, ecx
		mov	ecx, edx
		and	ecx, 0BCA7B0ECh
		mov	[ebp+var_550], ecx
		imul	ecx, [ebp+var_560], 0BDE86514h
		and	ecx, 86B09E27h
		lea	esi, [ecx+esi]
		lea	ecx, [esi-4CC81C87h]
		sub	esi, 43584F14h
		and	esi, edx
		sub	ecx, esi
		mov	esi, 7B3D87F6h
		lea	edx, [ecx-23230B27h]
		add	ecx, 96FCD73h
		or	ecx, 0D36D2767h
		add	ecx, ecx
		sub	edx, ecx
		mov	ecx, 0BCA7B0ECh
		sub	ecx, [ebp+var_550]
		or	ecx, 39D35F01h
		sub	esi, ecx
		add	esi, esi
		sub	esi, [ebp+var_550]
		xor	edx, esi
		mov	esi, edx
		xor	esi, 0CE03A165h
		mov	ecx, esi
		and	esi, 1B40243Ch
		add	esi, esi
		and	ecx, 3F70BC3Fh
		sub	ecx, esi
		mov	esi, edx
		mov	edx, edi
		xor	esi, 15418799h
		mov	[ebp+var_558], ecx
		and	edx, 12302603h
		mov	ecx, eax
		and	ecx, 0A27B2315h
		xor	edx, 0C2BF61C1h
		and	eax, edi
		xor	edx, ecx
		xor	edx, eax
		mov	eax, 0E4BFDBC3h
		not	edx
		and	esi, edx
		mov	edx, [ebp+var_558]
		sub	eax, [ebp+var_558]
		sub	edx, esi
		or	eax, esi
		mov	esi, [ebp+var_520]
		lea	edx, [edx+eax*2-4B172E59h]
		lea	eax, [edx-1096A551h]
		lea	edx, [edx+edx-33515AD4h]
		and	edx, 0CAA02C7Eh
		mov	ecx, esi
		sub	eax, edx
		neg	ecx
		lea	edx, [eax+esi-79F6E52h]
		neg	eax
		lea	ecx, [ecx+ecx-3845070Fh]
		lea	eax, [eax+eax+4783E3B3h]
		or	eax, ecx
		lea	eax, [edx+eax]
		xor	eax, 0E550163Fh
		mov	[ebp+var_550], eax
		add	eax, 63DD7C79h
		mov	[ebp+var_560], eax
		mov	[ebp+var_8C], eax
		mov	edx, [ebp+var_57C]
		imul	eax, [ebp+var_47C], 755B14EDh
		mov	esi, [ebp+var_570]
		mov	edi, [ebp+var_55C]
		sub	edx, 5D0D7AD1h
		sub	eax, 0FA73BBBh
		xor	edx, 5654h
		and	eax, 3Fh
		sub	esi, 672E55DEh
		mov	[ebp+var_520], eax
		sub	edx, 20AE0000h
		not	edi
		imul	eax, [ebp+eax*4+var_218], 2BF06481h
		xor	edx, 0BE86D0B3h
		or	esi, [ebp+var_578]
		mov	[ebp+var_558], edi
		sub	eax, 5D0D7AD1h
		xor	eax, 5654h
		sub	eax, 20AE0000h
		xor	edx, eax
		mov	eax, esi
		xor	eax, 7C722C45h
		and	edx, edi
		mov	edi, [ebp+var_55C]
		mov	ecx, eax
		and	eax, 78002C44h
		add	eax, eax
		and	ecx, 0FB813FE6h
		sub	ecx, eax
		lea	eax, [edx+113AD1F3h]
		or	edx, 113AD1F4h
		add	edx, edx
		and	edi, 0BE86D0B3h
		sub	eax, edx
		mov	edx, 0B406439Dh
		sub	edx, edi
		mov	edi, [ebp+var_558]
		and	edi, 0A808010h
		or	edi, 0F57F72EBh
		add	edi, edi
		sub	edx, edi
		xor	eax, edx
		mov	edx, 87FFD3BBh
		xor	eax, 0E03B6306h
		sub	edx, ecx
		and	eax, esi
		mov	esi, eax
		or	edx, eax
		mov	eax, [ebp+var_490]
		sub	esi, ecx
		imul	edx, 52BFBF9Ah
		imul	esi, 295FDFCDh
		sub	esi, edx
		imul	edx, esi, 3F76DA87h
		imul	ecx, esi, 29D04A0Ah
		imul	esi, [ebp+var_178], 2BF06481h
		lea	edx, [eax+edx-4027F562h]
		imul	eax, 1549D626h
		add	ecx, 0FFFA775h
		lea	edi, [esi-7DBB7AD1h]
		add	eax, 1F4E7775h
		or	ecx, eax
		mov	eax, 730CCC8Eh
		imul	ecx, 0EE5E68E5h
		add	edx, ecx
		mov	ecx, edi
		mov	[ebp+var_490], edx
		mov	edx, [ebp+var_3E0]
		or	ecx, 0F70DF28Bh
		neg	ecx
		lea	ecx, [esi+ecx*2+795277B9h]
		sub	eax, edx
		imul	eax, edx
		lea	edx, [eax+27A87B76h]
		imul	eax, edx, 8433E369h
		imul	edx, 867C6D2h
		sub	eax, 17C0747Ah
		and	edx, 0D07F170Ch
		sub	eax, edx
		mov	esi, eax
		mov	edx, eax
		and	esi, 320034h
		and	eax, 8F20D74h
		xor	edx, 17C07479h
		add	esi, esi
		sub	esi, eax
		and	edx, ecx
		lea	ecx, [edx+esi-61800E56h]
		sub	esi, 323F42B8h
		or	esi, edx
		mov	edx, 0D0BF3462h
		imul	eax, [ebp+var_48C], 755B14EDh
		add	esi, esi
		sub	ecx, esi
		sub	edx, ecx
		and	edx, 32FF46C7h
		sub	eax, 0FA73BBBh
		and	eax, 3Fh
		imul	eax, [ebp+eax*4+var_218], 2BF06481h
		sub	eax, 7DBB7AD1h
		or	eax, edi
		mov	esi, eax
		lea	edi, [ecx+2F40CB9Dh]
		or	esi, 0CD00B938h
		mov	ecx, [ebp+var_170]
		or	esi, edi
		lea	edx, [esi+edx]
		mov	esi, [ebp+var_520]
		sub	edx, eax
		and	eax, 0CD00B938h
		and	eax, edi
		mov	edi, [ebp+var_528]
		lea	eax, [edx+eax]
		imul	eax, 0D92815C7h
		sub	eax, 19141D1h
		imul	edx, eax, 0B03F9B89h
		imul	eax, 0F87DC812h
		lea	edx, [ecx+edx+53A0E858h]
		imul	ecx, 57E0C902h
		add	eax, 32AEE8B1h
		add	ecx, 4890A5Fh
		or	eax, ecx
		imul	eax, 0A79C247Fh
		lea	eax, [edx+eax]
		mov	edx, 0ABBFCFD2h
		mov	[ebp+var_170], eax
		mov	eax, [ebp+esi*4+var_118]
		sub	edx, eax
		lea	eax, [eax+eax+3845070Eh]
		and	eax, 842FBC0Ah
		lea	eax, [edx+eax]
		xor	eax, 3D076958h
		lea	edx, [eax+eax]
		and	edx, 7A0ED2B0h
		sub	eax, edx
		lea	edx, [eax+eax*2]
		lea	eax, [edx+1479C429h]
		lea	edx, [edx+edx+6E2C7810h]
		and	edx, 0A709A45Ch
		sub	eax, edx
		lea	edx, [eax+eax-13BD6BE6h]
		and	edx, 0A709A45Ch
		sub	eax, edx
		mov	edx, [ebp+var_454]
		imul	eax, 11A1971Bh
		lea	eax, [edx+eax+6B46C739h]
		mov	[ebp+var_454], eax
		mov	eax, [ebp+var_528]
		imul	edx, [ebp+var_3A4], 755B14EDh
		neg	eax
		lea	eax, [eax+eax+2CA512Bh]
		sub	edx, 0FA73BBBh
		and	eax, 2FB16270h
		and	edx, 3Fh
		lea	eax, [edi+eax-35605D55h]
		mov	[ebp+var_58], eax
		mov	eax, [ebp+var_568]
		mov	ecx, [ebp+eax*4+var_118]
		mov	eax, 2B7C4D71h
		sub	eax, [ebp+edx*4+var_218]
		lea	edx, [ecx+ecx+3845070Eh]
		and	edx, 842FBC0Ah
		sub	ecx, edx
		imul	edx, ecx, 0A79C247Fh
		add	eax, edx
		mov	[ebp+var_120], eax
		imul	eax, [ebp+var_358], 755B14EDh
		sub	eax, 0FA73BBBh
		and	eax, 3Fh
		imul	edi, [ebp+eax*4+var_218], 0D40F9B7Fh
		mov	eax, 0AAAAAAABh
		add	edi, 7DBB7AD0h
		mul	edi
		mov	edi, edx
		shr	edi, 1
		mov	[ebp+var_528], edi
		mov	[ebp+var_524], 0
		mov	edx, [ebp+var_524]
		mov	ecx, [ebp+var_3C]
		mov	dword ptr [esp+8], 3
		mov	dword ptr [esp+0Ch], 0
		mov	[ebp+var_51C], edx
		mov	edx, [ebp+var_530]
		lea	esi, [ecx+ecx+3845070Eh]
		mov	[ebp+var_5C8], ecx
		and	esi, 842FBC0Ah
		mov	[ebp+var_520], edx
		mov	edx, [ebp+var_51C]
		mov	eax, [ebp+var_520]
		mov	[esp+4], edx
		mov	[esp], eax
		call	sub_19C40
		mov	ecx, [ebp+var_5C8]
		mov	[ebp+var_524], 0
		mov	[ebp+var_52C], edx
		mov	edx, esi
		sub	edx, eax
		mov	[ebp+var_530], eax
		sub	edx, ecx
		lea	eax, [ecx+0E603D4Eh]
		mov	ecx, 0A9D20401h
		lea	edi, [edi+edx+438B3CE8h]
		sub	eax, esi
		add	eax, [ebp+var_530]
		sub	eax, [ebp+var_528]
		imul	edx, [ebp+var_228], 0CA2E8CD3h
		imul	esi, [ebp+var_594], 0AF7A2CBDh
		add	eax, 4FDA243Eh
		add	eax, eax
		mov	[ebp+var_530], edx
		mov	edx, 0B1910250h
		or	eax, 842FBC0Ah
		sub	edx, [ebp+var_530]
		add	esi, 4ECB02DCh
		lea	eax, [edi+eax]
		mov	[ebp+var_3C], eax
		mov	eax, edx
		xor	edx, 19AFFC3Fh
		xor	eax, 116B3616h
		and	eax, 41D44D69h
		sub	ecx, eax
		or	eax, 0FEBFFBFFh
		lea	edi, [ecx+eax*2]
		mov	ecx, esi
		xor	edi, 0D59Ah
		not	ecx
		add	edi, 576E0000h
		and	edx, ecx
		mov	[ebp+var_558], edi
		mov	eax, [ebp+var_558]
		lea	edi, [edx+4412F4D6h]
		mov	[ebp+var_528], ecx
		mov	ecx, esi
		and	esi, 19AFFC3Fh
		or	ecx, 0BE2BB296h
		xor	ecx, 0C607FA57h
		mov	[ebp+var_51C], edi
		and	eax, 0C607FA57h
		mov	edi, ecx
		and	ecx, [ebp+var_558]
		and	edi, 0D59Ah
		xor	eax, 0B0E3B2C9h
		xor	eax, edi
		mov	edi, [ebp+var_51C]
		xor	eax, ecx
		mov	ecx, eax
		and	ecx, 0A02160C9h
		add	ecx, ecx
		mov	[ebp+var_520], ecx
		lea	ecx, [edx+0E40D847h]
		or	edx, 0E40D848h
		add	edx, edx
		sub	ecx, edx
		mov	edx, 165D1C4Fh
		sub	edx, esi
		mov	esi, [ebp+var_528]
		and	esi, 102DC2Eh
		or	esi, 0FCAD2011h
		add	esi, esi
		sub	edx, esi
		mov	esi, eax
		xor	ecx, edx
		mov	edx, eax
		xor	edx, 0B0E362DBh
		and	esi, 0EF356DEDh
		xor	ecx, 0E2276A4Bh
		and	ecx, edx
		mov	[ebp+var_528], esi
		mov	esi, [ebp+var_520]
		mov	edx, ecx
		xor	ecx, ecx
		sub	esi, [ebp+var_528]
		sbb	edi, [ebp+var_524]
		mov	[ebp+var_558], esi
		add	esi, edx
		mov	[ebp+var_528], esi
		mov	esi, [ebp+var_558]
		mov	eax, [ebp+var_528]
		mov	[ebp+var_554], edi
		adc	edi, ecx
		mov	ecx, [ebp+var_3E4]
		mov	[ebp+var_524], edi
		neg	eax
		add	esi, 5FDE9F36h
		or	esi, edx
		lea	esi, [eax+esi*2+6E016B6h]
		mov	[ebp+var_520], esi
		mov	eax, [ebp+var_520]
		mov	edi, esi
		sub	edi, 3CA41425h
		add	eax, 19414A14h
		add	ecx, 7682CF5Eh
		add	eax, eax
		and	eax, 7523F1FAh
		sub	edi, eax
		mov	eax, [ebp+var_84]
		imul	edx, [ebp+var_408], 755B14EDh
		add	[ebp+var_13C], 4043378Ah
		lea	eax, [eax+eax+3845070Eh]
		and	eax, 842FBC0Ah
		sub	edx, 0FA73BBBh
		mov	[ebp+var_574], eax
		and	edx, 3Fh
		imul	eax, [ebp+var_548], 0D40F9B7Fh
		mov	edx, [ebp+edx*4+var_118]
		mov	[ebp+var_55C], edi
		add	eax, 7DBB7AD0h
		shr	eax, 1
		and	eax, 3Fh
		imul	eax, [ebp+eax*4+var_318], 5BAC4F41h
		sub	ecx, eax
		lea	eax, [edx-21C59E74h]
		lea	edx, [edx+edx+3845070Eh]
		and	edx, 842FBC0Ah
		sub	eax, edx
		mov	edx, 88888889h
		mul	edx
		mov	[ebp+var_3E4], ecx
		shr	edx, 3
		imul	eax, edx, 0A79C247Fh
		sub	eax, 44072D30h
		mov	[ebp+var_1A4], eax
		imul	eax, [ebp+var_284], 35D1732Dh
		add	eax, 6448ADFAh
		and	eax, 3Fh
		imul	eax, [ebp+eax*4+var_318], 35D1732Dh
		add	eax, 6448ADFAh
		and	eax, 3Fh
		mov	eax, [ebp+eax*4+var_318]
		mov	[ebp+var_520], eax
		imul	edx, eax, 0B1867753h
		mov	eax, [ebp+var_160]
		lea	edx, [eax+edx-4586647Bh]
		mov	[ebp+var_5BC], edx
		imul	eax, 57E0C902h
		imul	edx, [ebp+var_520], 945D19A6h
		add	eax, 4890A5Fh
		add	edx, 376EA40Bh
		or	edx, eax
		mov	eax, 0CCCCCCCDh
		imul	edx, 0A79C247Fh
		mov	[ebp+var_5C0], edx
		imul	edx, [ebp+var_228], 35D1732Dh
		add	edx, 6448ADFAh
		mul	edx
		imul	eax, [ebp+var_12C], 2BF06481h
		mov	esi, edx
		shr	esi, 2
		sub	eax, 7DBB7AD1h
		imul	edx, [ebp+var_2A4], 0CA2E8CD3h
		mov	[ebp+var_520], esi
		mov	esi, [ebp+var_520]
		sub	edx, 6448ADFBh
		not	esi
		mov	ecx, edx
		mov	edi, esi
		or	ecx, eax
		or	edi, eax
		or	eax, 0BE3E7867h
		mov	[ebp+var_558], ecx
		mov	ecx, edi
		or	eax, edx
		xor	ecx, 0BE3E7867h
		not	edi
		mov	[ebp+var_528], esi
		or	eax, ecx
		and	ecx, 0BE3E7867h
		and	ecx, [ebp+var_558]
		and	edi, 41C18798h
		imul	esi, [ebp+var_558], 12C07E19h
		or	edx, [ebp+var_528]
		add	eax, ecx
		add	eax, edi
		imul	eax, 0ED3F81E7h
		mov	[ebp+var_528], 0EFA26749h
		mov	[ebp+var_544], 0
		lea	eax, [esi+eax-3C73D44Fh]
		imul	ecx, eax, 0C99801D7h
		imul	eax, 3667FE29h
		sub	ecx, edx
		sub	eax, 4F039D5Ah
		or	eax, edx
		lea	eax, [ecx+eax]
		imul	eax, 0AA4C44F7h
		sub	[ebp+var_528], eax
		imul	eax, [ebp+var_4D8], 755B14EDh
		sub	eax, 0FA73BBBh
		and	eax, 3Fh
		imul	eax, [ebp+eax*4+var_318], 0CA2E8CD3h
		imul	ecx, [ebp+var_548], 2BF06481h
		sub	eax, 6448ADFBh
		sub	ecx, 7DBB7AD1h
		mov	esi, eax
		mov	[ebp+var_564], eax
		and	esi, 10000BA0h
		and	eax, 49089049h
		mov	edi, ecx
		or	eax, 80D00002h
		or	esi, 26276414h
		not	edi
		sub	esi, eax
		mov	edx, edi
		mov	eax, ecx
		and	edx, 9584AC0Ch
		and	eax, 9594ED1Ch
		or	edx, 285B4331h
		neg	eax
		add	edx, edx
		sub	eax, 420FCFB4h
		and	edi, 4674h
		sub	eax, edx
		mov	edx, ecx
		and	edx, 0CC9C76F5h
		or	edi, 0FFBD3183h
		mov	[ebp+var_548], edx
		mov	edx, 0CC59A877h
		add	edi, edi
		sub	edx, [ebp+var_548]
		not	esi
		add	esi, 36276FB5h
		sub	edx, edi
		mov	edi, [ebp+var_530]
		xor	eax, edx
		mov	edx, esi
		xor	edx, 36276FB4h
		xor	eax, 1711AD9Ah
		and	eax, edx
		mov	edx, esi
		and	edx, 36002094h
		and	esi, 3F0820D7h
		add	edx, edx
		sub	edx, esi
		lea	esi, [eax+edx+2E918B9Dh]
		sub	edx, 36002095h
		or	edx, eax
		add	edx, edx
		sub	edi, 6448ADFBh
		or	ecx, [ebp+var_564]
		sub	esi, edx
		mov	[ebp+var_530], edi
		mov	eax, [ebp+var_530]
		mov	edx, [ebp+var_530]
		lea	edi, [esi+ecx-6491AC33h]
		sub	esi, 6491AC33h
		or	esi, ecx
		mov	ecx, [ebp+var_530]
		not	eax
		sub	edi, esi
		mov	[ebp+var_564], eax
		and	eax, 4047h
		and	edx, 0D96930h
		or	eax, 472D9FA8h
		xor	edi, 0A89E1E9Eh
		and	ecx, 42204B47h
		add	eax, eax
		neg	ecx
		sub	ecx, 76B21512h
		sub	ecx, eax
		mov	eax, 6C2D7729h
		sub	eax, edx
		mov	edx, [ebp+var_564]
		lea	esi, [edi+5761E160h]
		add	edi, edi
		or	edi, 0AEC3C2C2h
		sub	esi, edi
		and	edx, 896000h
		or	esi, 42F92277h
		or	edx, 6B540DFAh
		xor	esi, 9A1E0B1Dh
		add	edx, edx
		sub	eax, edx
		xor	ecx, eax
		mov	eax, ecx
		xor	ecx, 0D3866DADh
		xor	eax, 42EC4B5h
		and	esi, ecx
		mov	edx, eax
		and	eax, 9A1E0B1Dh
		and	edx, 92080918h
		add	edx, edx
		mov	[ebp+var_520], edx
		mov	edx, [ebp+var_520]
		mov	[ebp+var_548], eax
		mov	[ebp+var_51C], esi
		mov	ecx, [ebp+var_51C]
		sub	edx, [ebp+var_548]
		sbb	ecx, [ebp+var_544]
		mov	[ebp+var_5D0], edx
		add	edx, 6DF7F6E7h
		mov	[ebp+var_5CC], ecx
		adc	ecx, 0
		or	edx, esi
		mov	[ebp+var_554], ecx
		mov	[ebp+var_548], edx
		mov	[ebp+var_544], ecx
		mov	edx, [ebp+var_5D0]
		mov	eax, [ebp+var_548]
		add	edx, esi
		lea	esi, [edx+2C312CA2h]
		neg	eax
		lea	eax, [esi+eax*2]
		mov	esi, [ebp+var_548]
		add	esi, esi
		sub	edx, esi
		neg	edx
		lea	edx, [edx+edx-3DAD39D6h]
		or	edx, 9C635F78h
		lea	edx, [eax+edx]
		mov	[ebp+var_5A0], edx
		imul	edx, [ebp+var_220], 0CA2E8CD3h
		sub	edx, 6448ADFBh
		mov	eax, edx
		or	edx, 2052A202h
		mov	ecx, edx
		or	eax, 0A9DDFE2Ah
		xor	ecx, 186F4F65h
		not	edx
		mov	edi, ecx
		and	edx, 0E790B09Ah
		imul	esi, eax, 198CD067h
		or	edi, eax
		and	eax, 186F4F65h
		add	edx, edi
		and	eax, ecx
		lea	eax, [edx+eax]
		imul	eax, 0E6732F99h
		lea	edx, [esi+eax-32562A65h]
		imul	eax, edx, 34D14B57h
		imul	edx, 2E3A432Dh
		add	eax, 7A28FF52h
		mov	ecx, eax
		or	eax, 0EBFFFF3Fh
		and	ecx, 42200115h
		lea	eax, [ecx+eax]
		imul	eax, 0EE5E68E5h
		lea	eax, [edx+eax+79D35DADh]
		mov	[ebp+var_4F0], eax
		imul	eax, [ebp+var_148], 57E0C902h
		imul	edx, [ebp+var_148], 2BF06481h
		add	eax, 4890A5Fh
		or	eax, 0FAA661FBh
		lea	ecx, [edx-4143059Ah]
		sub	edx, 7DBB7AD1h
		sub	ecx, eax
		or	edx, 6F72B2DAh
		lea	eax, [ecx+40DABBC6h]
		and	eax, 0A6784BDFh
		mov	[ebp+var_548], edx
		sub	ecx, eax
		add	edx, 60C70000h
		xor	edx, 0D6CEh
		lea	eax, [ecx-7591C136h]
		add	ecx, 40DABBC6h
		sub	edx, 60C70000h
		or	ecx, 49938305h
		add	ecx, ecx
		mov	esi, edx
		sub	eax, ecx
		and	esi, 0F35AE7DEh
		xor	eax, 0BA4DE0DBh
		xor	esi, 61C0DC9h
		mov	ecx, eax
		and	eax, edx
		and	ecx, 0D6CEh
		xor	esi, ecx
		mov	ecx, [ebp+var_458]
		imul	edx, [ebp+var_528], 65908672h
		xor	esi, eax
		imul	eax, [ebp+var_528], 32C84339h
		imul	edi, ecx, 8AA4EB13h
		imul	ecx, 1549D626h
		add	edx, 61525237h
		mov	[ebp+var_580], eax
		lea	eax, [eax+edi+405064D5h]
		add	ecx, 1F4E7775h
		or	edx, ecx
		mov	ecx, 206FD1E7h
		sub	eax, edx
		mov	edx, eax
		and	edx, 3A51FFE4h
		sub	ecx, edx
		mov	edx, esi
		and	edx, 8CAEFFB2h
		mov	[ebp+var_558], edx
		mov	edx, esi
		and	esi, 0DDBC82BDh
		and	edx, 88CEDA0h
		xor	esi, 0D9A000B8h
		add	edx, edx
		mov	[ebp+var_568], edx
		mov	edx, [ebp+var_558]
		mov	[ebp+var_570], edi
		mov	edi, [ebp+var_568]
		sub	edi, [ebp+var_558]
		add	edx, 199DEDA5h
		sub	edx, [ebp+var_568]
		sub	edi, 199DEDA5h
		or	edi, esi
		sub	edx, esi
		lea	esi, [edx+edi*2]
		mov	edx, eax
		not	edx
		mov	edi, 676F3564h
		and	edx, 8410021h
		or	edx, 639AE7DEh
		sub	edi, edx
		and	eax, 6B4382EBh
		add	edi, edi
		sub	edi, eax
		lea	eax, [ecx-4AD69CF1h]
		add	ecx, 19E22DFDh
		or	ecx, 9B473513h
		add	ecx, ecx
		sub	eax, ecx
		xor	edi, eax
		mov	eax, edi
		or	edi, 0F8DDD2CDh
		and	eax, 0F8DDD2CDh
		add	eax, 7135FFFFh
		sub	eax, edi
		xor	eax, 2BB5h
		lea	edx, [eax-71360000h]
		mov	eax, esi
		and	eax, 2BB5h
		and	esi, edx
		xor	eax, 0EDF82796h
		and	edx, 913FD914h
		xor	eax, esi
		mov	esi, 0F3BB7BF7h
		xor	eax, edx
		mov	edx, [ebp+var_548]
		xor	edx, 8C5E84A8h
		mov	edi, edx
		and	edx, 0C448408h
		add	edx, edx
		and	edi, 1E65CF5Eh
		sub	edi, edx
		imul	edx, [ebp+var_148], 0D40F9B7Fh
		sub	esi, edi
		add	edx, 7DBB7AD0h
		or	edx, 0A6784BDFh
		xor	edx, 1E65CF5Eh
		and	edx, [ebp+var_548]
		lea	ecx, [edx-0C44840Ah]
		or	esi, edx
		mov	edx, [ebp+var_570]
		sub	ecx, edi
		add	esi, esi
		sub	ecx, esi
		mov	esi, [ebp+var_580]
		mov	edi, ecx
		not	ecx
		sub	edx, 0A76C446h
		and	edi, 78B3F5E4h
		xor	edx, 8502h
		add	esi, 168B291Bh
		add	edx, 1A1E0000h
		xor	esi, 8502h
		xor	edx, 78B3F5E4h
		add	esi, 1A1E0000h
		xor	edx, esi
		mov	esi, 78B3F5E4h
		and	edx, ecx
		sub	esi, edi
		lea	ecx, [edx-20323F39h]
		or	edx, 0DFCDC0C8h
		add	edx, edx
		or	esi, 0BE71DE32h
		sub	ecx, edx
		mov	edx, 3725D415h
		sub	edx, edi
		add	esi, esi
		sub	edx, esi
		mov	edi, 0FFFFFFFFh
		xor	ecx, edx
		mov	edx, ecx
		and	ecx, 61BC1EFAh
		or	edx, 61BC1EFAh
		sub	edx, ecx
		imul	edx, 0B9B8BD4Dh
		lea	esi, [edx-2E53C51Fh]
		imul	ecx, esi, 23DB3C7Bh
		imul	esi, 0DC24C385h
		sub	ecx, 3D08061Ch
		mov	edx, ecx
		and	ecx, 0EDF82E82h
		or	edx, 0EDF82E82h
		and	ecx, eax
		or	edx, eax
		not	eax
		lea	edx, [esi+edx+3D08061Ch]
		add	edx, ecx
		and	eax, 1207D17Dh
		mov	ecx, [ebp+var_528]
		lea	eax, [edx+eax]
		imul	edx, eax, 6EBA9935h
		and	eax, 3E121F2Dh
		imul	eax, 228ACD96h
		imul	ecx, ecx
		imul	esi, [ebp+var_528], 0A561CFBAh
		lea	edx, [edx+eax-54EBA6AFh]
		imul	eax, edx, 23736F1h
		imul	edx, 1427623Ah
		add	eax, [ebp+var_4F8]
		and	edx, 7C243E5Ah
		imul	edx, 11A1971Bh
		lea	eax, [eax+edx+2B662B41h]
		mov	edx, [ebp+var_1C8]
		mov	[ebp+var_4F8], eax
		imul	eax, [ebp+var_514], 755B14EDh
		sub	eax, 0FA73BBBh
		and	eax, 3Fh
		imul	eax, [ebp+eax*4+var_318], 0B1867753h
		lea	eax, [edx+eax+12DD7706h]
		mov	[ebp+var_1C8], eax
		imul	eax, ecx, 11F5DA23h
		imul	edx, [ebp+var_528], 2D94F68Ch
		sub	eax, edx
		add	eax, 6F17E1EAh
		sub	eax, edx
		mov	edx, 0AE721A04h
		sub	edx, [ebp+var_528]
		imul	eax, edx
		lea	eax, [esi+eax-6F97523Dh]
		mov	esi, 0AE721A04h
		imul	edx, eax, 0E9BF0E87h
		imul	eax, 10EEABFAh
		sub	edx, 1E828A4Eh
		and	eax, 91FAFC8Ch
		imul	eax, 9E8F9BD3h
		sub	edx, eax
		imul	eax, edx, 2F48745Bh
		imul	edx, 5E90E8B6h
		add	eax, 370281B9h
		and	edx, 6E050372h
		sub	al, dl
		imul	edx, [ebp+var_528], 87B6292Ch
		movsx	eax, al
		imul	ecx, 6F91E2CBh
		sub	esi, [ebp+var_528]
		sub	ecx, edx
		sub	ecx, 3E204FBBh
		sub	ecx, edx
		imul	esi, ecx
		imul	edx, [ebp+var_528], 0E5409395h
		lea	edx, [edx+esi-7AC35141h]
		mov	esi, eax
		imul	ecx, edx, 91D37CE5h
		and	esi, 1Fh
		imul	edx, 23A6F9CAh
		add	eax, eax
		and	eax, 12h
		sub	esi, 57h
		sub	esi, eax
		mov	eax, 20h
		sub	ecx, 45C4E0A0h
		xor	esi, 0A9h
		and	edx, 0F7202476h
		and	esi, 0FFh
		sub	ecx, edx
		lea	edx, [ecx+45C4E09Fh]
		lea	ecx, [ecx+ecx-7D561A4Ah]
		and	ecx, 8DFDB88h
		sub	edx, ecx
		and	edx, 1Fh
		sub	eax, edx
		mov	edx, 0C7AD237h
		mov	ecx, eax
		add	eax, eax
		and	ecx, 1Fh
		and	eax, 2
		add	ecx, 71h
		sub	ecx, eax
		mov	eax, 0C7AD238h
		xor	ecx, 71h
		shl	eax, cl
		mov	ecx, esi
		sub	eax, 2A430001h
		xor	eax, 8BAEh
		add	eax, 2A430000h
		shr	edi, cl
		xor	eax, 0BFBEA390h
		mov	esi, edi
		shr	edx, cl
		not	esi
		lea	edx, [edx+esi-2A430000h]
		mov	esi, 0FFFFFFFFh
		xor	edx, 8BAEh
		add	edx, 2A430000h
		xor	eax, edx
		imul	edx, [ebp+var_3A8], 0CCEE3EDh
		lea	ecx, [eax+eax]
		and	ecx, 7F7D4720h
		sub	eax, ecx
		add	edx, 476096E6h
		mov	[ebp+var_5B8], edx
		mov	edx, [ebp+var_498]
		imul	eax, 0EE5E68E5h
		mov	[ebp+var_584], 0
		add	edx, 19253030h
		sub	edx, eax
		mov	[ebp+var_498], edx
		mov	edx, [ebp+var_74]
		lea	eax, [edx-21C59E74h]
		lea	edx, [edx+edx+3845070Eh]
		and	edx, 842FBC0Ah
		sub	eax, edx
		movsx	edx, al
		neg	eax
		mov	ecx, edx
		and	edx, 14h
		neg	edx
		and	ecx, 1Fh
		lea	ecx, [ecx+edx*2+54h]
		mov	edx, 46EF99F4h
		xor	ecx, 54h
		and	eax, 1Fh
		and	ecx, 0FFh
		shr	esi, cl
		shr	edx, cl
		not	esi
		lea	edx, [esi+edx]
		mov	ecx, eax
		mov	esi, [ebp+var_550]
		imul	edx, 65D6417Dh
		mov	eax, 591D1678h
		add	edx, 15ED5520h
		mov	[ebp+var_548], edx
		mov	edx, 46EF99F5h
		shl	edx, cl
		imul	edx, 3C81BD23h
		lea	ecx, [edx-0EF67924h]
		imul	edx, [ebp+var_560], 0D1F667ADh
		sub	eax, edx
		mov	edx, 63DD7C78h
		sub	edx, [ebp+var_560]
		or	edx, 6ADC22E1h
		imul	edx, 5C1330A6h
		and	esi, 4F2159FCh
		lea	edx, [eax+edx]
		imul	eax, edx, 0EB9F9425h
		imul	edx, 0D73F284Ah
		sub	eax, 28CBFCE6h
		or	edx, 0AE680636h
		sub	eax, edx
		mov	edx, eax
		and	eax, 40500058h
		and	edx, 80040920h
		or	eax, 2D221200h
		or	edx, 1289E487h
		add	edx, 6D721258h
		sub	edx, eax
		mov	eax, [ebp+var_550]
		mov	edi, edx
		and	edi, 0B309F411h
		and	eax, 0E2151E8h
		or	eax, 0F108AC15h
		neg	eax
		lea	esi, [esi+eax*2-0EF753ECh]
		mov	eax, esi
		and	edx, esi
		and	eax, 6D721258h
		xor	eax, 7E4CE04Eh
		xor	eax, edi
		xor	eax, edx
		imul	esi, [ebp+var_548], 0A2A6A7B7h
		not	eax
		imul	edx, ecx, 4AA49869h
		lea	esi, [esi+edx+568EE441h]
		imul	edx, ecx, 1760B516h
		imul	ecx, [ebp+var_548], 0EF01FFAAh
		imul	esi, 0F5195CD3h
		add	edx, 3654DD17h
		sub	ecx, 2C85673Fh
		or	edx, ecx
		sub	esi, edx
		lea	ecx, [esi+34463D58h]
		mov	esi, eax
		xor	ecx, 5EA7h
		add	ecx, 1F7B0000h
		mov	edx, ecx
		and	edx, 0A0B30FA1h
		and	esi, 5EA7h
		xor	edx, 9FBDDE36h
		and	eax, ecx
		xor	edx, esi
		mov	esi, 0FFFFFFEDh
		xor	edx, eax
		lea	eax, [edx+edx]
		and	eax, 0C0845ED0h
		sub	edx, eax
		lea	eax, [edx-68397A14h]
		lea	edx, [edx+edx-3F7BA130h]
		and	edx, 0F7C98F86h
		sub	eax, edx
		lea	edx, [eax+eax-773F1D82h]
		and	edx, 0F7C98F86h
		sub	eax, edx
		mov	edx, [ebp+var_208]
		imul	eax, 5863DB81h
		lea	eax, [edx+eax-29938FFEh]
		mov	[ebp+var_208], eax
		imul	eax, [ebp+var_3A4], 755B14EDh
		imul	edx, [ebp+var_588], 755B14EDh
		sub	eax, 0FA73BBBh
		and	eax, 3Fh
		sub	edx, 0FA73BBBh
		mov	edi, [ebp+eax*4+var_118]
		mov	[ebp+var_A0], 0E28ACAE5h
		lea	eax, [edi+edi+3845070Eh]
		and	eax, 842FBC0Ah
		sub	edi, eax
		mov	eax, 0AAAAAAABh
		mul	edx
		shr	edx, 1
		mov	eax, edx
		and	eax, 0D3ACBC87h
		imul	ecx, edx, 29EA41C9h
		not	edx
		imul	eax, 0AC2B7C6Eh
		lea	ecx, [ecx+eax+0E44CFFh]
		mov	eax, esi
		mul	byte ptr [ebp+var_4C0]
		mov	esi, eax
		imul	eax, ecx, 0EE3C5787h
		imul	ecx, 238750F2h
		lea	esi, [esi+edi-2Fh]
		and	esi, 0FFh
		and	ecx, 0A759790Eh
		lea	eax, [eax+ecx+2C534379h]
		mov	ecx, esi
		and	ecx, 1Fh
		add	esi, esi
		add	ecx, 0Ch
		and	esi, 18h
		sub	ecx, esi
		xor	ecx, 0Ch
		shl	eax, cl
		imul	eax, 44F00FDBh
		lea	esi, [eax-17B37BABh]
		mov	eax, [ebp+var_5B4]
		lea	ecx, [edi+eax-316CDA2Fh]
		xor	ecx, 61F63439h
		lea	eax, [ecx+61F63439h]
		add	ecx, ecx
		and	ecx, 0C3EC6872h
		sub	eax, ecx
		mov	ecx, 20h
		and	eax, 1Fh
		sub	ecx, eax
		mov	eax, ecx
		and	ecx, 1Fh
		add	eax, eax
		sub	ecx, 77C6986Dh
		and	eax, 18h
		sub	ecx, eax
		movsx	eax, cl
		neg	ecx
		lea	ecx, [ecx+ecx-13h]
		or	cl, 0C7h
		lea	ecx, [eax+ecx-5Ah]
		mov	eax, 0FFFFFFFFh
		and	ecx, 1Fh
		shr	eax, cl
		shr	edx, cl
		not	eax
		add	eax, edx
		imul	eax, 47CC8BE3h
		imul	ecx, esi, 69FB7ED3h
		sub	eax, 12150C2h
		imul	edx, eax, 0C823A04Bh
		imul	eax, 47C22396h
		lea	edx, [ecx+edx-3ECF2C69h]
		imul	ecx, esi, 0F82AA8A6h
		add	eax, 3893D7ADh
		add	ecx, 199868E1h
		or	eax, ecx
		imul	eax, 0A79C247Fh
		lea	eax, [edx+eax]
		mov	[ebp+var_580], eax
		mov	[ebp+var_128], eax
		imul	eax, [ebp+var_330], 755B14EDh
		sub	eax, 0FA73BBBh
		and	eax, 3Fh
		imul	edx, [ebp+eax*4+var_318], 0CA2E8CD3h
		imul	esi, [ebp+var_274], 0CA2E8CD3h
		add	edx, 489B075h
		mov	eax, edx
		and	edx, 0F35A3DDCh
		or	eax, 0F35A3DDCh
		sub	esi, 6448ADFBh
		sub	eax, edx
		lea	edx, [eax-2098333Fh]
		add	eax, eax
		and	eax, 194B8446h
		sub	eax, edx
		mov	[ebp+var_51C], edx
		lea	edx, [eax-0B7856F1h]
		lea	eax, [eax+eax-5A7BEAC6h]
		or	eax, 7BD043F4h
		sub	edx, eax
		imul	eax, [ebp+var_48C], 755B14EDh
		mov	[ebp+var_F0], edx
		mov	[ebp+var_588], esi
		sub	eax, 0FA73BBBh
		and	eax, 3Fh
		mov	eax, [ebp+eax*4+var_318]
		mov	[ebp+var_568], eax
		imul	eax, 0CA2E8CD3h
		sub	eax, 6448ADFBh
		mov	[ebp+var_520], eax
		imul	eax, [ebp+var_1F8], 2BF06481h
		sub	eax, 7DBB7AD1h
		mov	ecx, eax
		mov	edx, eax
		and	edx, 7B619BDBh
		and	ecx, 88B20BBCh
		lea	ecx, [ecx+edx-79114338h]
		mov	edx, eax
		and	edx, 8200B98h
		neg	edx
		lea	edx, [ecx+edx*2]
		mov	ecx, [ebp+var_584]
		mov	[ebp+var_558], edx
		mov	edx, [ebp+var_588]
		add	edx, [ebp+var_520]
		adc	ecx, [ebp+var_51C]
		xor	edi, edi
		or	esi, [ebp+var_520]
		sub	edx, esi
		mov	esi, edx
		sbb	ecx, edi
		xor	esi, 17EB6BF5h
		mov	edx, eax
		mov	[ebp+var_548], esi
		mov	edi, esi
		mov	esi, [ebp+var_548]
		and	edx, 0E814940Ah
		and	edi, eax
		mov	[ebp+var_550], edi
		mov	eax, 99E35793h
		mov	edi, [ebp+var_558]
		mov	[ebp+var_544], ecx
		mov	ecx, [ebp+var_558]
		sub	esi, edx
		mov	edx, esi
		mov	esi, [ebp+var_550]
		sub	edx, [ebp+var_550]
		mov	[ebp+var_54C], 0
		sub	eax, edx
		mov	edx, [ebp+var_548]
		and	esi, 0E814940Ah
		and	edx, 0E814940Ah
		sub	esi, edx
		sub	ecx, 7AC24D30h
		neg	esi
		lea	edx, [eax+esi*2]
		mov	eax, [ebp+var_588]
		or	eax, [ebp+var_520]
		lea	edi, [edx+edi+345C732h]
		add	edx, 7E081462h
		or	edx, ecx
		mov	ecx, 8907F5A7h
		sub	edi, edx
		mov	[ebp+var_548], edi
		mul	ecx
		mov	[ebp+var_51C], edi
		mov	edi, [ebp+var_568]
		add	edi, [ebp+var_274]
		mov	[ebp+var_550], eax
		mov	edx, [ebp+var_550]
		imul	edi, 0CA17335Bh
		mov	eax, [ebp+var_548]
		lea	edx, [edi+edx]
		xor	eax, 1B554123h
		mov	edi, [ebp+var_5BC]
		imul	edx, 20569DE9h
		sub	edx, 56B2825Ch
		mov	[ebp+var_520], edx
		mov	ecx, [ebp+var_520]
		lea	edx, [eax-1B554125h]
		mov	esi, [ebp+var_520]
		add	eax, eax
		or	eax, 0C9557DB8h
		sub	edx, eax
		mov	eax, 0A9DF3BBCh
		sub	ecx, 71DED99Ah
		or	ecx, 0C2C6F98h
		xor	ecx, 0A9DF3BBCh
		sub	eax, ecx
		add	esi, 8E212666h
		or	esi, 0C2C6F98h
		add	esi, esi
		and	esi, 0AC418886h
		add	eax, esi
		mov	esi, [ebp+var_5C0]
		and	edx, eax
		imul	eax, edx, 655C29CDh
		or	edx, 5F5B8445h
		imul	edx, 3547AC66h
		lea	ecx, [edi+esi-35F3ADC5h]
		lea	edx, [eax+edx+60E7CE74h]
		imul	eax, edx, 0B224EB05h
		imul	edx, 6449D60Ah
		and	edx, 0BEB7088Ah
		sub	eax, edx
		mov	edx, 0CA2E8CD3h
		imul	eax, 0A79C247Fh
		lea	eax, [ecx+eax]
		mov	[ebp+var_160], eax
		imul	eax, [ebp+var_390], 755B14EDh
		sub	eax, 0FA73BBBh
		and	eax, 3Fh
		mov	eax, [ebp+eax*4+var_318]
		imul	esi, eax, 0C32D3283h
		mul	edx
		add	eax, 9BB75205h
		or	eax, 0E60836D9h
		imul	eax, 0BC3D14DEh
		lea	ecx, [esi+eax-31B979D3h]
		imul	eax, [ebp+var_40C], 755B14EDh
		sub	eax, 0FA73BBBh
		and	eax, 3Fh
		imul	edx, [ebp+eax*4+var_318], 0CA2E8CD3h
		mov	eax, [ebp+var_56C]
		sub	edx, 6448ADFBh
		mov	[ebp+var_51C], edx
		lea	eax, [edx+eax]
		or	edx, [ebp+var_56C]
		sub	eax, edx
		imul	edx, ecx, 581FEB71h
		xor	eax, 9A4F1C8h
		imul	ecx, 0B03FD6E2h
		sub	edx, 679B651Dh
		and	ecx, 33EF924Ch
		sub	edx, ecx
		add	edx, eax
		add	eax, eax
		and	eax, 0ECB61C6Eh
		sub	edx, eax
		imul	eax, edx, 3185517h
		mov	[ebp+var_520], edx
		mov	edx, [ebp+var_520]
		add	edx, 77EE3C7Ah
		and	edx, 0DA9741C7h
		imul	edx, 0F9CF55D2h
		lea	edx, [eax+edx+5601ECD7h]
		mov	[ebp+var_570], edx
		imul	eax, [ebp+var_480], 755B14EDh
		sub	eax, 0FA73BBBh
		and	eax, 3Fh
		imul	eax, [ebp+eax*4+var_218], 0D40F9B7Fh
		add	eax, 7DBB7AD0h
		shr	eax, 1
		lea	ecx, [eax+eax]
		mov	esi, eax
		mov	edx, ecx
		mov	edi, eax
		and	edx, 5BDF02h
		and	ecx, 711E4AEEh
		sub	esi, edx
		sub	edi, ecx
		mov	edx, esi
		mov	ecx, edi
		sub	edx, 7FD2107Fh
		add	ecx, 388F2577h
		or	edx, 7FD2107Eh
		or	ecx, 0C770DA88h
		imul	esi, 0A7D201B3h
		imul	edx, 0B05BFC9Ah
		imul	ecx, 0AB16D50Ah
		mov	[ebp+var_51C], eax
		lea	edx, [esi+edx-4FA40366h]
		imul	esi, edi, 2A74957Bh
		mov	edi, [ebp+var_1D4]
		lea	ecx, [esi+ecx-54E92AF6h]
		imul	edx, ecx
		mov	ecx, 655A8589h
		sub	ecx, edi
		imul	edx, eax
		lea	eax, [edx+5CFD056Fh]
		add	edx, edx
		and	edx, 0B63D2D06h
		sub	eax, edx
		lea	edx, [eax+eax-3BCDDD8h]
		and	edx, 0B63D2D06h
		imul	esi, edx, 5863DB81h
		sub	edx, eax
		lea	edx, [edx+edx+4D7FB0D1h]
		add	ecx, esi
		imul	esi, edi, 0A81F36FEh
		mov	edi, [ebp+var_B0]
		sub	esi, 4890A60h
		and	edx, esi
		lea	eax, [edx+eax]
		mov	edx, [ebp+var_5AC]
		imul	eax, 0A79C247Fh
		lea	eax, [ecx+eax]
		mov	[ebp+var_1D4], eax
		imul	eax, [ebp+var_220], 0B1867753h
		lea	eax, [edx+eax+12DD7706h]
		mov	[ebp+var_168], eax
		imul	eax, [ebp+var_594], 5085D343h
		sub	eax, 4ECB02DDh
		mov	edx, eax
		and	edx, 3Fh
		mov	[ebp+var_598], eax
		lea	eax, [edi+edi+3845070Eh]
		imul	ecx, [ebp+edx*4+var_318], 35D1732Dh
		and	eax, 842FBC0Ah
		mov	esi, eax
		sub	esi, edi
		add	edi, 79F1B392h
		sub	edi, eax
		sub	edi, ecx
		add	edi, edi
		or	edi, 842FBC0Ah
		lea	esi, [ecx+esi-582C151Eh]
		add	esi, edi
		mov	edi, [ebp+var_90]
		mov	[ebp+var_B0], esi
		mov	edx, [ebp+edx*4+var_118]
		mov	[ebp+var_520], edx
		mov	esi, [ebp+var_520]
		lea	ecx, [edx-63DD7C79h]
		mov	eax, edx
		mov	edx, ecx
		mov	[ebp+var_568], ecx
		add	esi, 9C228387h
		and	edx, 0CEC13EA2h
		add	eax, 4F78012Eh
		sub	eax, edx
		mov	edx, esi
		and	edx, 0CEC13EA2h
		sub	esi, edx
		sub	edi, 63DD7C79h
		or	esi, 0B3557DA8h
		add	esi, esi
		sub	eax, esi
		mov	esi, edi
		xor	eax, 956A0F06h
		and	esi, 503197FFh
		mov	edx, eax
		or	eax, 0D9D64D54h
		and	edx, 0D9D64D54h
		add	edx, 6B6960E3h
		sub	edx, eax
		imul	eax, [ebp+var_580], 2BF06481h
		sub	edx, 6B6960E4h
		mov	[ebp+var_550], esi
		sub	eax, 7DBB7AD1h
		mov	[ebp+var_56C], eax
		or	eax, 313EC15Dh
		add	eax, edx
		or	edx, 313EC15Dh
		or	edx, [ebp+var_56C]
		sub	eax, edx
		mov	edx, edi
		xor	edx, 4217DE05h
		xor	eax, 0AFCE6800h
		and	eax, edx
		mov	edx, edi
		and	edx, 40119605h
		add	edx, edx
		mov	[ebp+var_594], edx
		imul	edx, [ebp+var_3DC], 755B14EDh
		sub	edx, 0FA73BBBh
		and	edx, 3Fh
		imul	edx, [ebp+edx*4+var_318], 0CA2E8CD3h
		sub	edx, 6448ADFBh
		mov	[ebp+var_548], edx
		mov	ecx, [ebp+var_548]
		and	edx, 342A9029h
		or	edx, 40444014h
		and	ecx, 8900040h
		or	ecx, 83012F82h
		sub	edx, ecx
		not	edx
		add	edx, 746ED03Eh
		mov	esi, edx
		mov	ecx, edx
		and	esi, 20209011h
		and	edx, 21319613h
		xor	ecx, 746ED03Dh
		add	esi, esi
		and	ecx, 0D2EE7984h
		sub	esi, edx
		lea	edx, [esi+ecx]
		sub	esi, 20209012h
		or	esi, ecx
		mov	ecx, [ebp+var_548]
		imul	edx, 591ED319h
		imul	esi, 0B23DA632h
		or	ecx, 0B0DEA603h
		sub	edx, 42FF7E2Bh
		sub	edx, esi
		imul	edx, 0A620D929h
		mov	[ebp+var_558], ecx
		lea	ecx, [edx+ecx-2BE2E830h]
		sub	edx, 2BE2E830h
		or	edx, [ebp+var_558]
		sub	ecx, edx
		mov	esi, ecx
		and	esi, edi
		mov	edi, [ebp+var_90]
		sub	edi, esi
		mov	esi, edi
		sub	esi, 63DD7C79h
		lea	edx, [edi-1E1D438Eh]
		or	esi, 45C038ECh
		mov	edi, ecx
		not	ecx
		add	esi, esi
		and	ecx, 40108804h
		sub	edx, esi
		and	edi, 4217DE05h
		or	ecx, 0A2A77641h
		mov	esi, 0E4BF5445h
		sub	esi, edi
		add	ecx, ecx
		sub	esi, ecx
		xor	edx, esi
		mov	esi, [ebp+var_594]
		mov	ecx, edx
		and	ecx, 0E7674EADh
		add	ecx, 7142C069h
		or	edx, 0E7674EADh
		sub	ecx, edx
		mov	edx, [ebp+var_550]
		sub	esi, [ebp+var_550]
		sub	edx, [ebp+var_594]
		sub	esi, 40119606h
		sub	edx, eax
		or	esi, eax
		lea	eax, [edx+esi*2]
		lea	edx, [eax+ecx-31312A64h]
		sub	ecx, 7142C06Ah
		add	eax, 40119606h
		or	eax, ecx
		mov	ecx, 2DA55683h
		sub	edx, eax
		xor	edx, 7B009154h
		mov	[ebp+var_550], edx
		mov	edx, [ebp+var_568]
		mov	eax, [ebp+var_568]
		mov	esi, [ebp+var_56C]
		mov	edi, [ebp+var_560]
		and	edx, 313EC15Dh
		or	eax, 0FFE93FFAh
		imul	edx, 0AB56AD4Dh
		and	esi, 2DA55683h
		imul	eax, 0A952A566h
		sub	ecx, esi
		or	ecx, 6462905Bh
		add	ecx, ecx
		lea	eax, [edx+eax+3960CFE0h]
		mov	edx, 6B90665Eh
		mov	[ebp+var_568], eax
		mov	eax, [ebp+var_56C]
		and	eax, 0E3646821h
		sub	edx, eax
		lea	eax, [edx-34F05B49h]
		add	edx, 77D401C3h
		or	edx, 533BA2F5h
		add	edx, edx
		sub	eax, edx
		mov	edx, 9207E6DDh
		sub	edx, esi
		sub	edx, ecx
		mov	ecx, [ebp+var_548]
		xor	eax, edx
		mov	edx, eax
		mov	[ebp+var_51C], eax
		or	edx, 375932AEh
		and	eax, 375932AEh
		sub	edx, eax
		not	ecx
		imul	edx, 0F8D3FF65h
		mov	eax, 32EB945Eh
		sub	edx, 7564AE19h
		mov	[ebp+var_56C], edx
		mov	edx, ecx
		and	ecx, 4204C8Ah
		and	edx, 610A0h
		or	ecx, 0F9DEB365h
		or	edx, 0D4F8CC1Bh
		add	ecx, ecx
		sub	eax, edx
		mov	edx, [ebp+var_548]
		add	eax, eax
		and	edx, 90DE5CA2h
		sub	eax, edx
		mov	edx, [ebp+var_548]
		and	edx, 0AC64CCCBh
		neg	edx
		sub	edx, 59BC7FD1h
		sub	edx, ecx
		xor	eax, edx
		mov	esi, eax
		mov	edx, eax
		and	edx, 2D267F7Eh
		or	esi, 2D267F7Eh
		sub	esi, edx
		imul	esi, 0D00C2665h
		imul	ecx, [ebp+var_568], 0A61D1CBDh
		sub	esi, 2076CBFAh
		imul	eax, esi, 0BA519EF1h
		mov	[ebp+var_51C], esi
		imul	esi, 3444E493h
		add	esi, 6849C88Dh
		or	esi, 0F3DFEF97h
		imul	esi, 0E3177B15h
		lea	edx, [eax+esi-47063863h]
		imul	eax, [ebp+var_56C], 2FAFF65h
		imul	esi, [ebp+var_568], 0DB17AC7Bh
		imul	edx, 0BEFC03C3h
		lea	ecx, [ecx+eax-107FDC17h]
		imul	eax, [ebp+var_56C], 5023E593h
		add	esi, 15C85F66h
		imul	ecx, 0F980AD97h
		add	eax, 15F7555Ah
		or	eax, esi
		mov	esi, [ebp+var_558]
		sub	ecx, eax
		lea	eax, [ecx-4699EEAFh]
		lea	ecx, [edx+esi-7BFC2B73h]
		sub	edx, 7BFC2B73h
		or	edx, esi
		sub	ecx, edx
		mov	edx, 7B009154h
		or	eax, ecx
		mov	ecx, [ebp+var_550]
		sub	edx, [ebp+var_550]
		xor	eax, 0B9FAE8A1h
		add	ecx, ecx
		and	ecx, 9FEDD56h
		add	edx, ecx
		lea	ecx, [eax+4605175Dh]
		add	eax, eax
		or	eax, 8C0A2EBCh
		sub	ecx, eax
		and	edx, ecx
		imul	eax, edx, 0EE0FBD73h
		or	edx, 3D401CD4h
		imul	edx, 23E0851Ah
		lea	eax, [eax+edx-4C8E4637h]
		imul	edx, eax, 9845AFBBh
		imul	eax, 308B5F76h
		add	edx, 3D401CD4h
		and	eax, 7A8039A8h
		sub	edx, eax
		mov	[ebp+var_520], edx
		mov	esi, [ebp+var_520]
		mov	eax, edx
		add	edx, edx
		add	eax, 5A86DE3Ah
		and	edx, 7C4C7CAEh
		sub	eax, edx
		add	esi, esi
		mov	edx, esi
		mov	esi, [ebp+var_520]
		and	edx, 7C4C7CAEh
		sub	esi, edx
		mov	edx, esi
		mov	esi, 8C1D6E23h
		add	edx, 3E263E57h
		add	edx, edx
		or	edx, 7C4C7CAEh
		sub	eax, edx
		add	eax, [ebp+var_560]
		lea	edx, [edi+edi+3845070Eh]
		and	edx, 842FBC0Ah
		sub	eax, edx
		xor	eax, 4217DE05h
		add	eax, 63DD7C79h
		mov	[ebp+var_8C], eax
		imul	eax, [ebp+var_184], 2BF06481h
		imul	ecx, [ebp+var_4AC], 755B14EDh
		sub	eax, 7DBB7AD1h
		mov	[ebp+var_520], eax
		sub	ecx, 0FA73BBBh
		imul	eax, [ebp+var_174], 2BF06481h
		shr	ecx, 1
		sub	eax, 7DBB7AD1h
		mov	[ebp+var_548], eax
		imul	eax, [ebp+var_16C], 2BF06481h
		sub	eax, 7DBB7AD1h
		mov	[ebp+var_560], eax
		mov	edx, [ebp+var_560]
		mov	eax, ecx
		not	eax
		or	eax, edx
		mov	[ebp+var_558], eax
		xor	eax, 8D7BB75h
		mov	[ebp+var_550], eax
		mov	eax, [ebp+var_51C]
		mov	edi, [ebp+var_548]
		or	edi, [ebp+var_520]
		imul	eax, 8C1D6E23h
		sub	eax, edi
		mov	[ebp+var_568], eax
		mov	eax, edi
		mov	edi, [ebp+var_550]
		mul	esi
		mov	edx, [ebp+var_550]
		and	edi, 0A008020h
		mov	esi, eax
		mov	eax, [ebp+var_184]
		add	eax, [ebp+var_174]
		imul	eax, 0C455D45Dh
		add	eax, esi
		imul	eax, 11EA4E75h
		add	eax, 4890A5Eh
		or	eax, [ebp+var_560]
		xor	eax, 0E83D820h
		and	eax, [ebp+var_558]
		add	edi, edi
		and	edx, 0E83D820h
		sub	edi, edx
		lea	edx, [ecx+5228B98Ah]
		add	ecx, ecx
		and	ecx, 0A4517314h
		sub	edx, ecx
		mov	ecx, [ebp+var_520]
		mov	[ebp+var_558], edi
		mov	edi, [ebp+var_548]
		mov	esi, edx
		xor	esi, 5228B98Ah
		mov	[ebp+var_51C], edx
		mov	[ebp+var_550], ecx
		mov	ecx, [ebp+var_548]
		or	edi, [ebp+var_550]
		add	ecx, [ebp+var_550]
		sub	ecx, edi
		mov	edi, [ebp+var_558]
		xor	ecx, 0F309D58Fh
		and	esi, ecx
		mov	ecx, edx
		and	ecx, 0CF62A70h
		and	edx, 202800h
		mov	[ebp+var_548], ecx
		lea	ecx, [edx+edx]
		mov	edx, 4A50A32Dh
		sub	edx, [ebp+var_558]
		sub	edi, 4A50A32Dh
		or	edi, eax
		sub	edx, eax
		mov	eax, [ebp+var_548]
		lea	edx, [edx+edi*2]
		mov	edi, [ebp+var_51C]
		sub	eax, ecx
		sub	ecx, [ebp+var_548]
		sub	eax, esi
		sub	ecx, 202801h
		or	ecx, esi
		mov	esi, 63DD7C78h
		lea	ecx, [eax+ecx*2-4F51D7FFh]
		xor	ecx, 0AFF7h
		add	ecx, 4F720000h
		mov	eax, ecx
		and	ecx, 0BD2CC4F3h
		xor	eax, 0AFF7h
		and	eax, edx
		mov	edx, 0C2956E94h
		xor	eax, 66B63889h
		xor	eax, ecx
		sub	edx, eax
		add	eax, eax
		and	eax, 3292870Ah
		lea	eax, [edx+eax]
		mov	edx, [ebp+var_D8]
		mov	[ebp+var_520], eax
		mov	eax, 2399AB0Bh
		sub	esi, edx
		sub	eax, edx
		mov	[ebp+var_548], esi
		mov	edx, esi
		mov	esi, [ebp+var_520]
		sub	eax, [ebp+var_520]
		xor	edx, 0FFFFEB43h
		add	esi, 16AE4DE6h
		mov	[ebp+var_550], esi
		mov	esi, [ebp+var_550]
		adc	edi, 0
		mov	[ebp+var_54C], edi
		xor	esi, 14BCh
		add	esi, 8D730000h
		xor	edx, esi
		mov	esi, [ebp+var_548]
		or	esi, edx
		mov	edx, 0E28ACAE5h
		add	esi, 1
		add	esi, esi
		sub	eax, esi
		mov	[ebp+var_D8], eax
		mov	eax, [ebp+var_530]
		mov	ecx, [ebp+var_564]
		mov	[ebp+var_54C], 0
		and	eax, 7EAD4E6Ch
		and	ecx, 2125001h
		sub	edx, eax
		or	ecx, 60CDAEEEh
		mov	eax, 5172C679h
		sub	eax, ecx
		mov	ecx, [ebp+var_530]
		add	eax, eax
		and	ecx, 4217DE05h
		sub	eax, ecx
		lea	ecx, [edx+61731381h]
		sub	edx, 63DD7C79h
		or	edx, 0C5508FFBh
		add	edx, edx
		sub	ecx, edx
		xor	eax, ecx
		mov	ecx, [ebp+var_530]
		mov	edx, eax
		mov	[ebp+var_51C], eax
		or	edx, 0A59D2115h
		and	eax, 0A59D2115h
		sub	edx, eax
		imul	eax, edx, 0E879C45Fh
		and	ecx, 4669DDE1h
		sub	eax, 464E923Ch
		imul	edx, eax, 6E1DEFFBh
		imul	eax, 0D5AA6861h
		sub	eax, 68FA3745h
		or	eax, 0D3DDFFB6h
		imul	eax, 0AE7B3A25h
		lea	eax, [edx+eax-4D7B439Ch]
		mov	edx, [ebp+var_564]
		mov	[ebp+var_548], eax
		mov	eax, [ebp+var_530]
		and	edx, 610670A0h
		and	eax, 0EB0EF0A8h
		or	edx, 8EB8875Ch
		neg	eax
		add	edx, edx
		add	eax, 79C77803h
		sub	eax, edx
		mov	edx, 1A8C762Bh
		sub	edx, ecx
		mov	ecx, [ebp+var_564]
		and	ecx, 24945A0h
		or	ecx, 0D422984Bh
		add	ecx, ecx
		sub	edx, ecx
		xor	eax, edx
		xor	eax, 5A72AD68h
		imul	edx, [ebp+var_548], 4E3BAE53h
		mov	edi, eax
		not	edi
		mov	[ebp+var_520], edi
		mov	esi, [ebp+var_520]
		xor	edi, edi
		lea	ecx, [edx+6EC2BC05h]
		mov	edx, eax
		or	edx, 0FF174D80h
		or	edx, ecx
		and	esi, 0E8B27Fh
		mov	[ebp+var_550], edx
		add	[ebp+var_550], esi
		adc	[ebp+var_54C], edi
		and	eax, ecx
		mov	esi, eax
		xor	edi, edi
		and	esi, 0FF174D80h
		add	[ebp+var_550], esi
		mov	esi, 0C56C620Dh
		mov	eax, [ebp+var_550]
		adc	[ebp+var_54C], edi
		imul	ecx, [ebp+var_54C], 0C56C620Dh
		sub	ecx, [ebp+var_550]
		mul	esi
		imul	esi, [ebp+var_548], 0C4385FC9h
		add	edx, ecx
		mov	[ebp+var_530], eax
		mov	eax, 94392B3Ah
		mov	[ebp+var_52C], edx
		mov	edx, [ebp+var_530]
		imul	ecx, [ebp+var_340], 755B14EDh
		lea	edx, [esi+edx]
		imul	edx, 3BB21BC7h
		mov	esi, ecx
		sub	eax, edx
		mov	[ebp+var_494], eax
		mov	eax, [ebp+var_30]
		sub	esi, eax
		lea	edx, [eax+eax+3845070Eh]
		add	eax, 6DE19D47h
		and	edx, 842FBC0Ah
		sub	eax, ecx
		sub	eax, edx
		add	eax, eax
		lea	esi, [edx+esi+33E4012Dh]
		or	eax, 842FBC0Ah
		lea	eax, [esi+eax]
		mov	[ebp+var_30], eax
		mov	edx, [ebp+var_28]
		mov	edi, [ebp+var_5A0]
		mov	[ebp+var_520], edx
		mov	esi, [ebp+var_520]
		mov	edx, [ebp+var_1C4]
		add	esi, 1C228387h
		add	esi, esi
		mov	eax, esi
		mov	esi, [ebp+var_520]
		and	eax, 842FBC0Ah
		sub	esi, eax
		imul	eax, esi, 0A79C247Fh
		lea	eax, [edx+eax+39FE1474h]
		mov	[ebp+var_1C4], eax
		mov	eax, [ebp+var_5A8]
		sub	eax, 44072D30h
		sub	eax, [ebp+var_580]
		mov	[ebp+var_1F0], eax
		mov	eax, 0DA3BCFD5h
		mov	ecx, eax
		add	eax, eax
		and	eax, 94h
		and	ecx, 0D5h
		mov	esi, ecx
		mov	edx, eax
		shl	esi, 6
		shl	edx, 6
		sub	ecx, esi
		sub	edx, eax
		lea	esi, [edx+ecx-75h]
		mov	eax, esi
		mov	byte ptr [ebp+var_520],	al
		mov	eax, 193396F7h
		mov	ecx, eax
		add	eax, eax
		and	eax, 0D0h
		and	ecx, 0F7h
		mov	esi, ecx
		mov	edx, eax
		shl	esi, 6
		shl	edx, 6
		sub	ecx, esi
		sub	edx, eax
		lea	esi, [edx+ecx+29h]
		mov	eax, esi
		mov	byte ptr [ebp+var_530],	al
		lea	edx, [edi+edi+48E7811Ah]
		mov	eax, edi
		and	edx, 9C635F78h
		sub	eax, 0D5A8FB7h
		sub	eax, edx
		movzx	edx, al
		and	eax, 0A0h
		imul	edx, 58559219h
		imul	eax, 4F54DBCEh
		lea	eax, [edx+eax-69D8DA60h]
		imul	ecx, eax, 7E58F863h
		imul	edx, eax, 0A0BF5452h
		imul	eax, 505FAA29h
		and	edx, 3428D40h
		add	eax, 1A1475Eh
		sub	eax, edx
		and	eax, 0F9B3FA24h
		imul	edx, 6AC84855h
		imul	eax, 0D59090AAh
		lea	edx, [ecx+edx-6F4B502Ah]
		add	edx, eax
		imul	eax, edx, 53DD8B03h
		imul	edx, 0A7BB1606h
		add	eax, 1302DB50h
		and	edx, 2605B6A0h
		sub	eax, edx
		mov	edx, eax
		or	edx, 0EAB121AEh
		imul	eax, -3Fh
		imul	edx, 7Eh
		lea	esi, [eax+edx+2Eh]
		mov	edx, 595D0E8Ah
		lea	eax, [edx-6F9BFA3Fh]
		add	edx, edx
		and	edx, 20C80B82h
		mov	ecx, esi
		sub	eax, edx
		mov	edx, eax
		or	edx, 0C9390A2Bh
		imul	eax, -3Fh
		imul	edx, 7Eh
		mov	byte ptr [ebp+var_548],	cl
		lea	esi, [eax+edx+6Bh]
		mov	edx, 9Ch
		imul	eax, edx, 17Eh
		mov	ecx, esi
		imul	edx, 0FFFFFF41h
		mov	byte ptr [ebp+var_550],	cl
		or	eax, 21AE72CCh
		lea	eax, [edx+eax-66h]
		mov	edx, 0FFFFFE87h
		movzx	eax, al
		lea	esi, [eax+eax]
		mov	ecx, eax
		and	ecx, 0BCh
		sub	edx, esi
		lea	edx, [edx+ecx*4]
		add	ecx, ecx
		sub	eax, ecx
		and	edx, 28D8669Ah
		lea	eax, [eax+edx+2169B8Eh]
		imul	edx, [ebp+var_528], 0CD37BCC7h
		sub	edx, 30A9291Ch
		mov	ecx, edx
		and	ecx, 6Eh
		imul	edx, 0D2D27257h
		imul	ecx, 5A5B1B52h
		and	edx, 0FFh
		lea	ecx, [edx+ecx-618C029Eh]
		lea	edx, [eax+eax-2D059C3Eh]
		and	edx, 28D8669Ah
		sub	eax, edx
		imul	edx, ecx, 7C6532CEh
		and	edx, 987D08DCh
		sub	eax, edx
		imul	eax, 8BBD1AF7h
		imul	ecx, 54717861h
		lea	edx, [eax+ecx+50E1A649h]
		imul	eax, edx, 74787272h
		imul	edx, 45C3C6C7h
		sub	eax, 1B1061BBh
		and	eax, 5ADF91F6h
		lea	eax, [edx+eax-1FE7981Eh]
		movzx	ecx, al
		add	eax, eax
		and	eax, 1BCh
		mov	esi, ecx
		mov	edx, eax
		shl	esi, 6
		shl	edx, 6
		sub	ecx, esi
		sub	edx, eax
		lea	esi, [edx+ecx+1Fh]
		mov	eax, esi
		mov	byte ptr [ebp+var_528],	al
		mov	eax, [ebp+var_578]
		imul	edx, [ebp+var_578], 0B5544DF7h
		and	eax, 0D8h
		imul	eax, 95576412h
		and	edx, 0FFh
		lea	edx, [edx+eax-1F5C1098h]
		imul	eax, edx, 70FD078Eh
		imul	edx, 8017194Bh
		and	eax, 3042A3B0h
		imul	eax, 237F09A3h
		lea	edx, [edx+eax-78558ACEh]
		imul	eax, edx, 0DF80E416h
		imul	edx, 903F8DF5h
		add	eax, 2FB6C087h
		and	eax, 7D7C8D44h
		lea	eax, [edx+eax+2966591Ah]
		movzx	ecx, al
		add	eax, eax
		and	eax, 10Eh
		mov	esi, ecx
		mov	edx, eax
		shl	esi, 6
		shl	edx, 6
		sub	ecx, esi
		sub	edx, eax
		lea	esi, [edx+ecx-78h]
		mov	eax, esi
		mov	byte ptr [ebp+var_564],	al
		mov	eax, 0EB3FDB6Dh
		mov	edx, eax
		mov	ecx, eax
		and	edx, 1Fh
		and	ecx, 0D3h
		xor	edx, 13h
		movzx	eax, al
		add	edx, ecx
		imul	edx, 53821EE6h
		imul	eax, 563EF08Dh
		lea	eax, [eax+edx-66F83FB6h]
		imul	ecx, eax, 9181489Dh
		imul	edx, [ebp+var_58C], 0C2B6A7BFh
		imul	eax, 5DD8A48Ah
		and	edx, 0FFh
		and	eax, 95CD0E3Eh
		sub	edx, 428B8779h
		imul	eax, 53B1D187h
		imul	edx, 6DA877C7h
		lea	eax, [ecx+eax-37844CA4h]
		lea	edx, [eax+edx]
		imul	eax, edx, 5686486Eh
		imul	edx, 54BCDBC9h
		sub	eax, 1120BD55h
		and	eax, 0EF4084E6h
		lea	eax, [edx+eax-6F0FE3C9h]
		movzx	ecx, al
		add	eax, eax
		and	eax, 0ACh
		mov	esi, ecx
		mov	edx, eax
		shl	esi, 6
		shl	edx, 6
		sub	ecx, esi
		sub	edx, eax
		lea	esi, [edx+ecx-69h]
		mov	eax, esi
		mov	byte ptr [ebp+var_560],	al
		mov	eax, 0AF6A3C87h
		mov	ecx, eax
		add	eax, eax
		and	eax, 82h
		and	ecx, 87h
		mov	esi, ecx
		mov	edx, eax
		shl	esi, 6
		shl	edx, 6
		sub	ecx, esi
		sub	edx, eax
		lea	esi, [edx+ecx-3Eh]
		mov	ecx, 5FDAE1FCh
		mov	eax, esi
		mov	byte ptr [ebp+var_558],	al
		mov	eax, [ebp+var_590]
		imul	edx, [ebp+var_590], 0F0710B49h
		and	eax, 12h
		imul	eax, 1F1DE96Eh
		and	edx, 0FFh
		lea	edx, [edx+eax+4BC12322h]
		imul	eax, edx, 0D16BADF2h
		and	eax, 92873024h
		imul	edi, edx, 0FF4FC0Bh
		imul	esi, ecx, 35F62FCFh
		imul	edx, 68B5D6F9h
		imul	ecx, 4C938E65h
		lea	edx, [ecx+edx-525579Ch]
		sub	edx, eax
		and	edx, 0D754761Dh
		imul	eax, 5B74A7DDh
		imul	edx, 0B6E94FBAh
		lea	ecx, [esi+edi+22F883A3h]
		lea	eax, [ecx+eax]
		lea	edx, [eax+edx]
		imul	eax, edx, 0EFA4178Bh
		imul	edx, 0DF482F16h
		add	eax, 60908AE1h
		and	edx, 0C12115C2h
		sub	eax, edx
		mov	edx, eax
		or	edx, 0B7C4FC26h
		imul	eax, -3Fh
		imul	edx, 7Eh
		lea	esi, [eax+edx-5Ah]
		movzx	edx, byte ptr [ebp+var_5B0]
		mov	ecx, esi
		mov	byte ptr [ebp+var_56C],	cl
		lea	eax, [edx-395088B1h]
		add	edx, edx
		and	edx, 1CE0329Ah
		sub	eax, edx
		lea	edx, [eax+eax-707EBC04h]
		and	edx, 1CE0329Ah
		sub	eax, edx
		imul	edx, eax, 0AD50B185h
		add	edx, 43C09FFCh
		imul	eax, edx, 0E934C166h
		imul	edx, 0B659F4Dh
		add	eax, 4111CD85h
		and	eax, 0CC5FD9FCh
		lea	eax, [edx+eax-6B8D3C1h]
		movzx	ecx, al
		add	eax, eax
		and	eax, 1B6h
		mov	esi, ecx
		mov	edx, eax
		shl	esi, 6
		shl	edx, 6
		sub	edx, eax
		sub	ecx, esi
		lea	esi, [edx+ecx-24h]
		mov	edx, 9Ch
		mov	eax, esi
		mov	byte ptr [ebp+var_578],	al
		imul	eax, edx, 17Eh
		imul	edx, 0FFFFFF41h
		or	eax, 7EF9D7E4h
		lea	ecx, [edx+eax-3F7CEBF2h]
		mov	edx, ecx
		and	ecx, 28h
		and	edx, 0FEh
		lea	esi, [edx+edx]
		lea	eax, ds:0FFFFFFAFh[ecx*4]
		add	ecx, ecx
		sub	eax, esi
		sub	edx, ecx
		and	eax, 0FE75A438h
		lea	eax, [edx+eax-710A5D1Ch]
		lea	edx, [eax+eax-1C60E9B0h]
		sub	eax, 43800034h
		and	edx, 0FE75A438h
		sub	eax, edx
		imul	eax, 93C2D247h
		lea	edx, [eax+26B1D64Eh]
		imul	eax, edx, 31B59112h
		imul	edx, 0E7253777h
		add	eax, 2CD51949h
		and	eax, 0BFB10E60h
		lea	eax, [edx+eax+9BCEC2Bh]
		movzx	ecx, al
		add	eax, eax
		and	eax, 2Ah
		mov	esi, ecx
		mov	edx, eax
		shl	esi, 6
		shl	edx, 6
		sub	ecx, esi
		sub	edx, eax
		lea	esi, [edx+ecx-6Ah]
		mov	ecx, 7243FDDCh
		mov	eax, esi
		movzx	edx, cl
		mov	byte ptr [ebp+var_58C],	al
		mov	eax, edx
		and	ecx, 62h
		and	eax, 0B0h
		xor	eax, 20h
		add	eax, ecx
		imul	eax, 0D3FFEA2h
		imul	edx, 0F96000AFh
		lea	edx, [edx+eax-31748BB2h]
		imul	eax, edx, 3CD6AC9Eh
		and	eax, 0AD6A2F60h
		imul	ecx, [ebp+var_5B8], 0FDEEE425h
		imul	edx, 2221C7F1h
		imul	eax, 47885241h
		sub	ecx, 46F20245h
		and	ecx, 0FFh
		sub	ecx, 7787388Ah
		imul	ecx, 522CE213h
		lea	edx, [ecx+edx+670B3557h]
		add	edx, eax
		imul	eax, edx, 1B017B82h
		imul	edx, 0F27F423Fh
		sub	eax, 5EFC1D13h
		and	eax, 281F160Eh
		lea	eax, [edx+eax+1B6E8382h]
		movzx	ecx, al
		add	eax, eax
		and	eax, 44h
		mov	esi, ecx
		mov	edx, eax
		shl	esi, 6
		shl	edx, 6
		sub	ecx, esi
		sub	edx, eax
		lea	esi, [edx+ecx+63h]
		movzx	edx, byte ptr [ebp+var_520]
		mov	eax, esi
		mov	byte ptr [ebp+var_568],	al
		imul	eax, edx, 17Eh
		imul	edx, 0FFFFFF41h
		or	eax, 9CB5D35Eh
		lea	ecx, [edx+eax+31A51651h]
		movzx	edx, cl
		and	ecx, 75h
		lea	esi, [edx+edx]
		lea	eax, ds:0FFFFFF15h[ecx*4]
		add	ecx, ecx
		sub	eax, esi
		sub	edx, ecx
		mov	ecx, [ebp+var_574]
		and	eax, 0C082435Eh
		mov	esi, 2BB36416h
		lea	edi, [edx+eax+0E66E3C8h]
		imul	edx, [ebp+var_59C], 514EF59Ah
		sub	ecx, [ebp+var_84]
		imul	eax, [ebp+var_574], 7926FDFBh
		sub	eax, [ebp+var_59C]
		sub	edx, 98842C6h
		lea	ecx, [ecx+ecx+438B3CE7h]
		and	edx, ecx
		add	edx, [ebp+var_84]
		lea	ecx, [edi+edi+22AFF5FCh]
		imul	edx, 86D90205h
		sub	esi, edi
		mov	edi, [ebp+arg_0]
		or	ecx, 0C082435Eh
		lea	ecx, [esi+ecx]
		lea	edx, [eax+edx+4197D99Ah]
		imul	edx, 0A8A77ACDh
		sub	edx, 4C42163h
		and	edx, 0FFh
		lea	eax, [edx+265F786Fh]
		add	edx, edx
		and	edx, 43ABF932h
		sub	eax, edx
		lea	edx, [eax+eax-912F7ACh]
		and	edx, 43ABF932h
		lea	eax, [ecx+eax]
		sub	eax, edx
		xor	eax, 0DA4DD853h
		mov	ecx, eax
		sub	eax, 70h
		and	ecx, 0DA4DD889h
		mov	edx, eax
		imul	ecx, -7Eh
		shl	edx, 6
		sub	dl, al
		lea	edx, [edx+ecx+47h]
		mov	[edi], dl
		mov	byte ptr [edi+1], 0F3h
		movzx	eax, byte ptr [ebp+var_530]
		imul	eax, 0BFh
		mov	edx, eax
		movzx	eax, al
		and	edx, 0DAh
		imul	eax, 0AA870DBBh
		imul	edx, 0AAF1E48Ah
		lea	edx, [edx+eax+17C8FEECh]
		imul	edx, 0A0842305h
		sub	edx, 3165C6C1h
		imul	eax, edx, 0CBF8FBD2h
		imul	edx, 9A038217h
		add	eax, 7FFF1EBh
		and	eax, 7396BF24h
		lea	eax, [edx+eax-3DCB5888h]
		movzx	ecx, al
		add	eax, eax
		and	eax, 16Eh
		mov	esi, ecx
		mov	edx, eax
		shl	esi, 6
		shl	edx, 6
		sub	ecx, esi
		sub	edx, eax
		lea	edx, [edx+ecx-48h]
		mov	[edi+2], dl
		movzx	edx, byte ptr [ebp+var_548]
		imul	eax, edx, 17Eh
		imul	edx, 0FFFFFF41h
		or	eax, 959B1E18h
		lea	eax, [edx+eax-0Ch]
		mov	edx, 0FFFFFE53h
		movzx	eax, al
		lea	esi, [eax+eax]
		mov	ecx, eax
		and	ecx, 0D6h
		sub	edx, esi
		lea	edx, [edx+ecx*4]
		add	ecx, ecx
		sub	eax, ecx
		and	edx, 29E32544h
		lea	edx, [eax+edx+560254F7h]
		lea	eax, [edx+edx+2A18327Ah]
		sub	edx, 56024C44h
		and	eax, 29E32544h
		sub	edx, eax
		xor	edx, 59D6CAAFh
		mov	ecx, edx
		sub	edx, 4Ch
		and	ecx, 59D6CA75h
		mov	eax, edx
		imul	ecx, -7Eh
		shl	eax, 6
		sub	al, dl
		lea	eax, [eax+ecx+7Fh]
		mov	[edi+3], al
		movzx	edx, byte ptr [ebp+var_550]
		imul	eax, edx, 17Eh
		imul	edx, 0FFFFFF41h
		or	eax, 4368BC92h
		lea	eax, [edx+eax-49h]
		mov	edx, 0FFFFFED9h
		movzx	eax, al
		lea	esi, [eax+eax]
		mov	ecx, eax
		and	ecx, 93h
		sub	edx, esi
		lea	edx, [edx+ecx*4]
		add	ecx, ecx
		sub	eax, ecx
		and	edx, 27B3EDF4h
		lea	edx, [eax+edx-68CBFB36h]
		imul	eax, [ebp+var_5A4], 0D0B802DFh
		lea	ecx, [eax+1ADDC8E9h]
		lea	eax, [edx+edx-561BF662h]
		and	ecx, 0FFh
		and	eax, 27B3EDF4h
		sub	edx, eax
		imul	eax, edx, 0A8D68C53h
		lea	edx, [ecx-6F16F4DEh]
		imul	edx, 1DDA22E7h
		lea	edx, [eax+edx-5E4CC740h]
		imul	eax, edx, 0E128D04Ah
		sub	eax, 6A7F475Fh
		imul	edx, 8F6B97DBh
		and	eax, 15B6E4F4h
		lea	eax, [edx+eax+2A643135h]
		movzx	ecx, al
		add	eax, eax
		and	eax, 0BEh
		mov	esi, ecx
		mov	edx, eax
		shl	esi, 6
		shl	edx, 6
		sub	ecx, esi
		sub	edx, eax
		lea	edx, [edx+ecx+60h]
		mov	ecx, 0C7DC3527h
		mov	[edi+4], dl
		movzx	edx, cl
		and	ecx, 9Dh
		mov	eax, edx
		and	eax, 0E3h
		xor	al, 81h
		add	eax, ecx
		imul	eax, 1B70DA92h
		imul	edx, 0F24792B7h
		lea	edx, [edx+eax+408F6C80h]
		imul	eax, edx, 2B17D60Eh
		imul	edx, 7AC55505h
		and	eax, 0AC0AEDC6h
		imul	eax, 64105F6Dh
		lea	edx, [edx+eax+3B74B4BEh]
		imul	eax, edx, 369304CAh
		imul	edx, 64B67D9Bh
		sub	eax, 28A7FD6Dh
		and	eax, 6040C3A8h
		lea	eax, [edx+eax-1BCC631Eh]
		movzx	ecx, al
		add	eax, eax
		and	eax, 1E2h
		mov	esi, ecx
		mov	edx, eax
		shl	esi, 6
		shl	edx, 6
		sub	ecx, esi
		sub	edx, eax
		lea	edx, [edx+ecx+72h]
		mov	[edi+5], dl
		movzx	edx, byte ptr [ebp+var_528]
		imul	eax, edx, 17Eh
		imul	edx, 0FFFFFF41h
		or	eax, 19426266h
		lea	eax, [edx+eax-33h]
		mov	edx, 0FFFFFE2Dh
		movzx	eax, al
		lea	esi, [eax+eax]
		mov	ecx, eax
		sub	edx, esi
		and	ecx, 0E9h
		lea	edx, [edx+ecx*4]
		add	ecx, ecx
		sub	eax, ecx
		and	edx, 21B4802h
		lea	eax, [eax+edx+0E72AC79h]
		lea	edx, [eax+eax-1F009F22h]
		sub	eax, 35FBA47Bh
		and	edx, 21B4802h
		sub	eax, edx
		xor	eax, 7B8959DAh
		lea	edx, [eax-5B31B34Bh]
		add	eax, eax
		and	eax, 499C996Ah
		sub	edx, eax
		mov	eax, edx
		or	eax, 0DF4715B5h
		imul	edx, -3Fh
		imul	eax, 7Eh
		lea	eax, [edx+eax+75h]
		mov	[edi+6], al
		mov	eax, 244F2568h
		mov	edx, eax
		and	eax, 80D174EEh
		or	edx, 80D174EEh
		sub	edx, eax
		lea	eax, [edx+8B0208Ah]
		add	edx, edx
		and	edx, 11604114h
		sub	eax, edx
		mov	edx, eax
		or	edx, 779EAB41h
		imul	edx, 7Eh
		imul	eax, -3Fh
		lea	eax, [eax+edx+1]
		mov	[edi+7], al
		movzx	eax, byte ptr [ebp+var_564]
		imul	edx, [ebp+var_598], 98E19F79h
		imul	eax, 0BFh
		and	edx, 0FFh
		sub	edx, 7BD446EAh
		imul	edx, 0CD7C6537h
		mov	ecx, eax
		movzx	eax, al
		and	ecx, 0DAh
		imul	ecx, 8CB09262h
		imul	eax, 0B9A7B6CFh
		lea	eax, [ecx+eax-3BF4AE8Dh]
		imul	eax, 61306FD1h
		lea	edx, [edx+eax+47CF3188h]
		mov	eax, edx
		or	eax, 4671804h
		sub	eax, 76F52E3h
		and	edx, 4671804h
		sub	eax, edx
		lea	ecx, [eax+76F52E3h]
		mov	edx, eax
		and	ecx, 0FB98E721h
		imul	ecx, -7Eh
		shl	edx, 6
		sub	edx, eax
		lea	edx, [edx+ecx-4]
		mov	[edi+8], dl
		movzx	edx, byte ptr [ebp+var_560]
		imul	eax, edx, 17Eh
		imul	edx, 0FFFFFF41h
		or	eax, 0A6E96792h
		lea	ecx, [edx+eax-5374B3C9h]
		movzx	edx, cl
		and	ecx, 13h
		lea	esi, [edx+edx]
		lea	eax, ds:0FFFFFFD9h[ecx*4]
		add	ecx, ecx
		sub	eax, esi
		sub	edx, ecx
		and	eax, 296A6130h
		lea	edx, [edx+eax+13576622h]
		lea	eax, [edx+edx-50192D4Eh]
		and	eax, 296A6130h
		sub	edx, eax
		imul	edx, 9CFBF781h
		sub	edx, 5483CF0Ch
		imul	eax, edx, 0C5276EFEh
		imul	edx, 1D6C4881h
		add	eax, 79257333h
		and	eax, 840031B2h
		lea	eax, [edx+eax-7E92D273h]
		movzx	ecx, al
		add	eax, eax
		and	eax, 1F8h
		mov	esi, ecx
		mov	edx, eax
		shl	esi, 6
		shl	edx, 6
		sub	ecx, esi
		sub	edx, eax
		lea	edx, [edx+ecx-43h]
		mov	[edi+9], dl
		movzx	eax, byte ptr [ebp+var_558]
		imul	eax, 0BFh
		mov	edx, eax
		movzx	eax, al
		and	edx, 0DAh
		imul	eax, 9BC2B8FDh
		imul	edx, 0C87A8E06h
		lea	edx, [edx+eax-7F2FC1FEh]
		imul	edx, 1062FCD5h
		sub	edx, 7A4B5A1Dh
		imul	eax, edx, 26796CFEh
		imul	edx, 0ECC34981h
		add	eax, 771A5F93h
		and	eax, 0CA77B950h
		lea	eax, [edx+eax-20C90C72h]
		movzx	ecx, al
		add	eax, eax
		and	eax, 11Ah
		mov	esi, ecx
		mov	edx, eax
		shl	esi, 6
		shl	edx, 6
		sub	ecx, esi
		sub	edx, eax
		lea	edx, [edx+ecx+0Eh]
		mov	[edi+0Ah], dl
		movzx	edx, byte ptr [ebp+var_56C]
		imul	eax, edx, 17Eh
		imul	edx, 0FFFFFF41h
		or	eax, 0CD2BE3ECh
		lea	ecx, [edx+eax+196A0E0Ah]
		movzx	edx, cl
		and	ecx, 2Ch
		lea	esi, [edx+edx]
		lea	eax, ds:0FFFFFFA7h[ecx*4]
		add	ecx, ecx
		sub	eax, esi
		sub	edx, ecx
		and	eax, 0B01C8198h
		lea	ecx, [edx+eax-63EFF735h]
		mov	edx, 673F39D7h
		lea	eax, [ecx+ecx+17C36D2Ah]
		sub	edx, ecx
		or	eax, 0B01C8198h
		add	edx, eax
		imul	edx, 860C4A45h
		sub	edx, 6DC10633h
		imul	eax, edx, 46678EE6h
		imul	edx, 0DCCC388Dh
		sub	eax, 4C40C291h
		and	eax, 0C785DC9Eh
		lea	eax, [edx+eax-3DA28D07h]
		movzx	ecx, al
		add	eax, eax
		and	eax, 0D4h
		mov	esi, ecx
		mov	edx, eax
		shl	esi, 6
		shl	edx, 6
		sub	edx, eax
		sub	ecx, esi
		lea	edx, [edx+ecx-55h]
		mov	[edi+0Bh], dl
		movzx	eax, byte ptr [ebp+var_578]
		mov	esi, [ebp+var_55C]
		imul	ecx, eax, 0BFh
		imul	eax, 17Eh
		add	ecx, 5A4D4FA1h
		and	eax, 0B49A9F42h
		sub	ecx, eax
		movzx	edx, cl
		and	ecx, 7Bh
		mov	eax, edx
		and	eax, 0ECh
		xor	eax, 68h
		add	eax, ecx
		imul	edx, 0EAE963F3h
		imul	eax, 2A2D381Ah
		lea	ecx, [edx+eax+110CABC5h]
		lea	edx, [esi+esi+20EEAE6Ch]
		and	edx, 7523F1FAh
		sub	esi, edx
		mov	edx, esi
		sub	edx, 783C1F64h
		imul	edx, 0FD7E0063h
		imul	eax, ecx, 9835DA76h
		imul	ecx, 5E493B6Dh
		and	edx, 0FFh
		sub	edx, 2203280Dh
		and	eax, 2DE5EDD8h
		imul	edx, 78B9FEDDh
		imul	eax, 764C7089h
		lea	edx, [ecx+edx-5A66A493h]
		add	edx, eax
		imul	eax, edx, 38200B72h
		imul	edx, 0E3EFFA47h
		sub	eax, 3BACE501h
		and	eax, 0DC56D86h
		lea	eax, [edx+eax-690C4443h]
		movzx	ecx, al
		add	eax, eax
		and	eax, 1CCh
		mov	esi, ecx
		mov	edx, eax
		shl	esi, 6
		shl	edx, 6
		sub	edx, eax
		sub	ecx, esi
		lea	edx, [edx+ecx+27h]
		mov	[edi+0Ch], dl
		movzx	edx, byte ptr [ebp+var_58C]
		imul	eax, edx, 17Eh
		imul	edx, 0FFFFFF41h
		or	eax, 68BA8A8Eh
		lea	eax, [edx+eax-47h]
		mov	edx, 0FFFFFEC5h
		movzx	eax, al
		lea	esi, [eax+eax]
		mov	ecx, eax
		and	ecx, 9Dh
		sub	edx, esi
		lea	edx, [edx+ecx*4]
		add	ecx, ecx
		sub	eax, ecx
		and	edx, 2D0129F2h
		lea	ecx, [eax+edx-61C7FC12h]
		imul	edx, [ebp+var_570], 1D9C654Eh
		imul	eax, [ebp+var_570], 8ECE32A7h
		and	edx, 0B52E838Eh
		sub	eax, edx
		imul	edx, eax, 0CBA08E43h
		mov	eax, 73B18E49h
		sub	eax, edx
		imul	eax, 4051AE6Bh
		add	eax, 131E381Fh
		mov	edx, eax
		and	edx, 11h
		imul	eax, 0F0BE6B87h
		imul	edx, 1E8328F2h
		and	eax, 0FFh
		lea	edx, [eax+edx+55DD1CF7h]
		imul	esi, edx, 0CB276A37h
		imul	edx, 964ED46Eh
		lea	eax, [ecx+ecx-69713094h]
		and	eax, 2D0129F2h
		lea	ecx, [esi+ecx]
		sub	ecx, eax
		and	edx, 8E40FE22h
		sub	ecx, edx
		lea	eax, [ecx-57178440h]
		and	eax, 0B2C020BAh
		imul	ecx, 0DA098237h
		imul	eax, 4BECFB92h
		lea	edx, [ecx+eax-4B066DCAh]
		imul	eax, edx, 0E61FD387h
		imul	edx, 0CC3FA70Eh
		add	eax, 7FE9F537h
		and	edx, 0FFD3EA6Eh
		sub	eax, edx
		mov	edx, eax
		or	edx, 0CD29D557h
		imul	edx, 7Eh
		imul	eax, -3Fh
		lea	eax, [eax+edx-69h]
		mov	edx, 7
		mov	[edi+0Dh], al
		imul	eax, edx, 17Eh
		imul	edx, 0FFFFFF41h
		or	eax, 985B4282h
		lea	eax, [edx+eax-41h]
		mov	edx, 0FFFFFEC9h
		movzx	eax, al
		lea	esi, [eax+eax]
		mov	ecx, eax
		and	ecx, 9Bh
		sub	edx, esi
		lea	edx, [edx+ecx*4]
		add	ecx, ecx
		sub	eax, ecx
		and	edx, 64005FF6h
		lea	edx, [eax+edx+6E8024D9h]
		lea	eax, [edx+edx-4100A872h]
		and	eax, 64005FF6h
		sub	edx, eax
		imul	edx, 0A449D1FFh
		sub	edx, 2DED722Ah
		imul	eax, edx, 0B91BA402h
		imul	edx, 23722DFFh
		add	eax, 6FF991FDh
		and	eax, 181A73DCh
		lea	eax, [edx+eax-440A02EDh]
		movzx	ecx, al
		add	eax, eax
		and	eax, 196h
		mov	esi, ecx
		mov	edx, eax
		shl	esi, 6
		shl	edx, 6
		sub	ecx, esi
		sub	edx, eax
		lea	edx, [edx+ecx-34h]
		mov	[edi+0Eh], dl
		movzx	eax, byte ptr [ebp+var_568]
		imul	eax, 0BFh
		mov	edx, eax
		movzx	eax, al
		and	edx, 0DAh
		imul	eax, 978011B9h
		imul	edx, 0D0FFDC8Eh
		lea	edx, [edx+eax-1E231675h]
		imul	edx, 98035B77h
		add	edx, 772BD61Fh
		mov	eax, edx
		or	eax, 90049195h
		and	edx, 90049195h
		add	eax, 5F95B93Bh
		sub	eax, edx
		lea	ecx, [eax-5F95B93Bh]
		mov	edx, eax
		and	ecx, 6FFB6EB0h
		imul	ecx, -7Eh
		shl	edx, 6
		sub	edx, eax
		lea	edx, [edx+ecx-35h]
		xor	ecx, ecx
		mov	[edi+0Fh], dl
		lea	esi, [esi+0]

loc_16DE8:				; CODE XREF: get_ibuff+52B2j
		mov	eax, ecx
		and	eax, 0Fh
		add	eax, [ebp+arg_0]
		mov	[ebp+var_530], eax
		movzx	eax, byte ptr [eax]
		imul	eax, 0BFh
		mov	edx, eax
		movzx	eax, al
		and	edx, 0DAh
		imul	edx, 78FE4C5Eh
		imul	eax, 0C380D9D1h
		lea	edi, [edx+eax+346E49B5h]
		mov	eax, [ebp+var_538]
		imul	esi, edi, 5DE9E0CFh
		imul	edi, 8D1B7CA3h
		mov	edx, [eax+ecx*4]
		mov	[ebp+var_528], esi
		add	esi, 689205CAh
		xor	esi, 0E5ADh
		sub	esi, 24FB0000h
		lea	eax, [edx-21C59E74h]
		lea	edx, [edx+edx+3845070Eh]
		and	edx, 842FBC0Ah
		sub	eax, edx
		movzx	edx, al
		add	eax, eax
		and	eax, 0CCh
		sub	edx, 30F1456Ah
		sub	edx, eax
		mov	eax, 41487AFh
		sub	eax, edx
		mov	[ebp+var_520], eax
		xor	eax, 0FFFF1A52h
		xor	eax, esi
		imul	esi, edx, 0FA96EC13h
		or	eax, [ebp+var_520]
		add	edx, [ebp+var_528]
		mov	[ebp+var_520], esi
		mov	esi, 34C2E9E1h
		sub	esi, [ebp+var_520]
		add	esi, edi
		imul	edi, eax, 0F52DD826h
		shl	eax, 2
		lea	eax, [eax+edx*2+7F04FC39h]
		and	eax, 0A2E9B250h
		imul	eax, 0FA96EC13h
		sub	esi, edi
		mov	edi, [ebp+var_530]
		add	esi, eax
		imul	eax, esi, 9385BE1Bh
		sub	eax, 394F2EFBh
		add	ecx, 1
		imul	esi, 270B7C36h
		and	esi, 8D61A20Ah
		sub	eax, esi
		mov	edx, eax
		or	edx, 0DD3E3A11h
		imul	eax, -3Fh
		imul	edx, 7Eh
		cmp	ecx, 40h
		lea	eax, [eax+edx-2Fh]
		mov	[edi], al
		jnz	loc_16DE8
		xor	eax, eax
		lea	esi, [esi+0]

loc_16F10:				; CODE XREF: get_ibuff+53F0j
		mov	edx, eax
		and	edx, 0Fh
		add	edx, [ebp+arg_0]
		mov	[ebp+var_520], edx
		movzx	ecx, byte ptr [edx]
		imul	edx, ecx, 17Eh
		imul	ecx, 0FFFFFF41h
		or	edx, 88B4459Ch
		lea	edx, [ecx+edx-445A22CEh]
		mov	esi, edx
		movzx	ecx, dl
		and	esi, 14h
		lea	edi, [ecx+ecx]
		lea	edx, ds:0FFFFFFD7h[esi*4]
		add	esi, esi
		sub	edx, edi
		sub	ecx, esi
		and	edx, 0A856BA18h
		lea	edx, [ecx+edx+22085BB7h]
		mov	ecx, [ebp+var_53C]
		mov	[ebp+var_538], edx
		imul	edx, [ecx+eax*4], 0D40F9B7Fh
		imul	ecx, [ebp+var_538], 70C5BA41h
		add	edx, 7DBB7AD0h
		mov	esi, edx
		and	esi, 5Bh
		imul	edx, 0D05A7207h
		imul	esi, 5F4B1BF2h
		and	edx, 0FFh
		lea	esi, [edx+esi-3A13B783h]
		mov	edx, 0F633B8AEh
		imul	edi, esi, 5CB05BB7h
		sub	edx, [ebp+var_538]
		or	edx, edi
		imul	edi, esi, 0B0C2C089h
		imul	esi, 234FA449h
		add	esi, [ebp+var_538]
		lea	edi, [edi+ecx+519B5AEAh]
		mov	[ebp+var_528], edi
		imul	edi, edx, 0E18B7482h
		shl	edx, 2
		lea	edx, [edx+esi*2+13988EA5h]
		and	edx, 0DF6E3AAEh
		imul	edx, 8F3A45BFh
		add	edi, [ebp+var_528]
		add	edi, edx
		imul	edx, edi, 10AEAB82h
		imul	edi, 0F7A8AA3Fh
		add	edx, 515C507Fh
		and	edx, 15E58BF6h
		lea	edx, [edi+edx+4C5F11C5h]
		movzx	esi, dl
		mov	edi, esi
		shl	edi, 6
		add	edx, edx
		and	edx, 1BCh
		sub	esi, edi
		mov	ecx, edx
		add	eax, 1
		shl	ecx, 6
		sub	ecx, edx
		mov	edx, [ebp+var_520]
		cmp	eax, 40h
		lea	ecx, [ecx+esi+1Fh]
		mov	[edx], cl
		jnz	loc_16F10
		xor	al, al

loc_17048:				; CODE XREF: get_ibuff+57F3j
		mov	esi, [ebp+var_534]
		imul	ecx, [esi+eax*4], 755B14EDh
		sub	ecx, 0FA73BBBh
		imul	esi, ecx, 0B03F3D17h
		and	esi, 0FFh
		sub	esi, 108A13E1h
		imul	edx, esi, 2EA46AB2h
		imul	esi, 0E8ADCAA7h
		sub	edx, 299F038Fh
		and	edx, 661CBE0h
		lea	edx, [esi+edx-6E616429h]
		movzx	esi, dl
		neg	edx
		lea	edx, [edx+edx-1]
		and	edx, 1E0h
		imul	edx, 0E1h
		imul	esi, 0E1h
		movzx	edx, dl
		lea	esi, [esi+edx-2]
		imul	edx, esi, -42h
		mov	edi, esi
		shl	edi, 5
		lea	esi, [esi+edi+558FD512h]
		mov	edi, ecx
		shr	edi, 8
		add	edx, 3D5Bh
		and	edx, 54E01880h
		lea	edx, [esi+edx]
		imul	edi, 0B6E3FBBDh
		movzx	esi, dl
		neg	esi
		lea	esi, [esi+esi-1]
		and	esi, 80h
		and	edi, 0FFh
		lea	edx, [esi+edx]
		sub	edi, 66884ED4h
		imul	edx, 8D88D541h
		imul	edi, 8E2775D5h
		lea	esi, [edx+edi+74D54004h]
		imul	edx, esi, 0AD328A7Eh
		imul	esi, 0A966BAC1h
		sub	edx, 21F98441h
		and	edx, 64225936h
		lea	edx, [esi+edx+5EEB9585h]
		movzx	esi, dl
		neg	edx
		lea	edx, [edx+edx-1]
		and	edx, 136h
		imul	edx, 0E1h
		imul	esi, 0E1h
		lea	esi, [esi+edx-4Dh]
		and	esi, 0FFh
		imul	edx, esi, -42h
		mov	edi, esi
		shl	edi, 5
		lea	edi, [esi+edi-54855524h]
		add	edx, 3D5Bh
		and	edx, 0A90A6CECh
		lea	edx, [edi+edx]
		movzx	esi, dl
		neg	esi
		lea	esi, [esi+esi-1]
		and	esi, 0ECh
		lea	edi, [esi+edx]
		mov	esi, ecx
		shr	esi, 10h
		mov	edx, 930075h
		imul	esi, 0D80F36D1h
		sub	edx, edi
		xor	edx, 0EBC2h
		sub	edx, 930000h
		and	esi, 0FFh
		sub	esi, 630F4F2Dh
		imul	esi, 63ED1DCFh
		sub	esi, 766AE19Eh
		xor	esi, 0EBC2h
		sub	esi, 930000h
		xor	esi, 3F47F1F9h
		xor	esi, edx
		lea	edx, [esi+esi]
		add	esi, 32B74AB0h
		and	edx, 656E9560h
		sub	esi, edx
		mov	edx, esi
		or	edx, 0F20F44B6h
		imul	edx, 0FFFFFE3Eh
		imul	esi, 0E1h
		lea	esi, [esi+edx+3]
		and	esi, 0FFh
		imul	edx, esi, -42h
		mov	edi, esi
		shl	edi, 5
		lea	esi, [esi+edi-6E4EB891h]
		add	edx, 3D5Bh
		and	edx, 0DC9D33C6h
		lea	edx, [esi+edx]
		movzx	edx, dl
		mov	edi, edx
		sub	edx, 7CC3A4B1h
		and	edi, 833C5B4Fh
		imul	edx, 0BA77CF59h
		imul	esi, edi, 8B10614Eh
		shr	ecx, 18h
		lea	esi, [edx+esi]
		mov	edx, ecx
		and	edx, 0FDh
		imul	ecx, 0DE03D97Bh
		imul	edx, 43F84D0Ah
		and	ecx, 0FFh
		lea	ecx, [ecx+edx-7608EF71h]
		imul	edx, ecx, 0FD441DB3h
		imul	ecx, 0FA883B66h
		or	ecx, 5B398DFAh
		sub	edx, ecx
		imul	ecx, esi, 149588E9h
		imul	esi, 292B11D2h
		lea	edx, [edx+ecx-4F26DD58h]
		or	esi, 678B758h
		sub	edx, esi
		mov	ecx, edx
		and	edx, 0CC191846h
		or	ecx, 0CC191846h
		add	ecx, 65F51474h
		sub	ecx, edx
		lea	edx, [ecx+68D6B70Bh]
		lea	ecx, [ecx+ecx+3415D718h]
		and	ecx, 9D9796FEh
		sub	edx, ecx
		imul	ecx, edx, 0E1h
		or	edx, 2D2D339h
		imul	edx, 0FFFFFE3Eh
		movzx	edx, dl
		lea	edx, [ecx+edx+26h]
		mov	[ebp+var_538], edx
		mov	edx, eax
		and	edx, 0Fh
		add	edx, [ebp+arg_0]
		mov	[ebp+var_520], edx
		movzx	esi, byte ptr [edx]
		imul	edx, esi, 17Eh
		imul	esi, 0FFFFFF41h
		or	edx, 6F27E0E0h
		lea	esi, [esi+edx-70h]
		mov	edx, 0FFFFFEABh
		and	esi, 0FFh
		mov	edi, esi
		and	edi, 0AAh
		mov	[ebp+var_530], edi
		mov	ecx, [ebp+var_530]
		lea	edi, [esi+esi]
		sub	edx, edi
		mov	[ebp+var_528], edx
		mov	edi, ecx
		lea	edx, [edx+ecx*4]
		add	edi, edi
		mov	ecx, [ebp+var_538]
		sub	esi, edi
		and	edx, 0A396BADCh
		mov	edi, [ebp+var_538]
		lea	esi, [esi+edx-73A12FDFh]
		lea	edx, [esi+esi+43ABA636h]
		and	edx, 0A396BADCh
		imul	edx, 42F42BD7h
		imul	esi, 0BD0BD429h
		shl	edi, 5
		lea	edi, [ecx+edi+7E50C45Bh]
		lea	esi, [esi+edx-2025135Fh]
		imul	edx, [ebp+var_538], 0BEh
		add	edx, 3D5Bh
		and	edx, 35E39EEh
		lea	edx, [edi+edx]
		movzx	ecx, dl
		neg	ecx
		lea	ecx, [ecx+ecx-1]
		and	ecx, 1EEh
		add	ecx, edx
		imul	ecx, 0F3D5F209h
		imul	edx, esi, 1F41EFCEh
		imul	esi, 31FA2EFDh
		sub	ecx, 7009C58Ch
		imul	edi, ecx, 2F69878Eh
		sub	edx, 3819A1h
		imul	ecx, 0BCFA839Dh
		add	edi, 7046995h
		or	edx, edi
		imul	edx, 0FDDA0A85h
		lea	ecx, [ecx+esi-416534CFh]
		lea	edx, [ecx+edx]
		imul	ecx, edx, 0C0934366h
		imul	edx, 1FB65E4Dh
		add	ecx, 24CE876Dh
		and	ecx, 0A98071BEh
		lea	edx, [edx+ecx-67277C96h]
		movzx	esi, dl
		neg	edx
		lea	edx, [edx+edx-1]
		and	edx, 1BEh
		imul	esi, 0CBh
		imul	edx, 0CBh
		add	edx, esi
		movsx	ecx, dl
		mov	edx, 0BDh
		imul	esi, ecx, 1C6h
		sub	edx, esi
		mov	esi, [ebp+var_520]
		and	edx, 1B4h
		add	eax, 1
		imul	ecx, 37DDh
		sub	cl, dl
		add	ecx, 79h
		cmp	eax, 80h
		mov	[esi], cl
		jnz	loc_17048
		add	esp, 5DCh
		pop	ebx
		pop	esi
		pop	edi
		pop	ebp
		retn
get_ibuff	endp

; ---------------------------------------------------------------------------
;

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

		public get_random_bytes_from_hashAB
get_random_bytes_from_hashAB proc near

var_15C		= dword	ptr -15Ch
var_14C		= dword	ptr -14Ch
var_140		= dword	ptr -140h
var_13C		= dword	ptr -13Ch
var_134		= byte ptr -134h
var_55		= dword	ptr -55h
var_51		= dword	ptr -51h
var_4D		= dword	ptr -4Dh
var_49		= dword	ptr -49h
var_45		= dword	ptr -45h
var_41		= dword	ptr -41h
var_3D		= dword	ptr -3Dh
var_39		= dword	ptr -39h
var_35		= dword	ptr -35h
var_31		= dword	ptr -31h
var_2D		= dword	ptr -2Dh
var_29		= dword	ptr -29h
var_25		= dword	ptr -25h
var_21		= dword	ptr -21h
var_1D		= byte ptr -1Dh
var_1C		= dword	ptr -1Ch
arg_0		= dword	ptr  8
arg_4		= dword	ptr  0Ch

		push	ebp
		mov	ecx, 37h
		mov	ebp, esp
		push	edi
		push	esi
		push	ebx
		sub	esp, 15Ch
		mov	eax, [ebp+arg_0]
		mov	edx,dword ptr [gsdata]	;mov	edx, large gs:14h
		mov	[ebp+var_1C], edx
		xor	edx, edx
		lea	esi, [ebp+var_134]
		call	sub_917
		add	ebx, 1B6A9h
		mov	[ebp+var_140], eax
		mov	eax, [ebp+arg_4]
		mov	edx, [eax]
		mov	[ebp+var_55], edx
		mov	edx, [eax+4]
		mov	[ebp+var_51], edx
		mov	edx, [eax+8]
		mov	[ebp+var_4D], edx
		mov	edx, [eax+0Ch]
		mov	[ebp+var_49], edx
		mov	edx, [eax+10h]
		mov	[ebp+var_45], edx
		mov	edx, [eax+14h]
		mov	[ebp+var_41], edx
		mov	edx, [eax+18h]
		mov	[ebp+var_3D], edx
		mov	edx, [eax+1Ch]
		mov	[ebp+var_39], edx
		mov	edx, [eax+20h]
		mov	[ebp+var_35], edx
		mov	edx, [eax+24h]
		mov	[ebp+var_31], edx
		mov	edx, [eax+28h]
		mov	[ebp+var_2D], edx
		mov	edx, [eax+2Ch]
		mov	[ebp+var_29], edx
		mov	edx, [eax+30h]
		mov	[ebp+var_25], edx
		mov	edx, [eax+34h]
		mov	[ebp+var_21], edx
		movzx	eax, byte ptr [eax+38h]
		mov	[ebp+var_13C], esi
		mov	edi, [ebp+var_13C]
		lea	esi, offset unk_19E20	;;offset nochange	
		rep movsd
		lea	edi, [ebp+var_55+2]
		lea	ecx, [ebp+var_55]
		mov	[ebp+var_1D], al
		mov	eax, 36h
		mov	[ebp+var_15C], edi
		lea	esi, [esi+0]

loc_9E0:				; CODE XREF: get_random_bytes_from_hashAB+F1j
		mov	edi, [ebp+var_13C]
		mov	edx, [ebp+var_15C]
		add	edx, [edi+eax*4]
		mov	[ebp+var_14C], edx
		movzx	esi, byte ptr [edx]
		mov	edi, [ebp+var_14C]
		movzx	edx, byte ptr [ecx+eax+2]
		mov	[edi], dl
		mov	edx, esi
		mov	[ecx+eax+2], dl
		sub	eax, 1
		cmp	eax, 0FFFFFFFFh
		jnz	short loc_9E0
		mov	edi, [ebp+var_15C]
		mov	esi, [ebp+var_140]
		mov	eax, [edi]
		mov	[esi], eax
		mov	eax, [edi+4]
		mov	[esi+4], eax
		mov	eax, [edi+8]
		mov	[esi+8], eax
		mov	eax, [edi+0Ch]
		mov	[esi+0Ch], eax
		mov	eax, [edi+10h]
		mov	[esi+10h], eax
		movzx	eax, word ptr [edi+14h]
		mov	[esi+14h], ax
		movzx	eax, byte ptr [edi+16h]
		mov	[esi+16h], al
		mov	edi, [ebp+var_1C]
		xor	edi,dword ptr [gsdata]	;xor	edi, large gs:14h
		jnz	short loc_A61
		add	esp, 15Ch
		pop	ebx
		pop	esi
		pop	edi
		pop	ebp
		retn
; ---------------------------------------------------------------------------

loc_A61:				; CODE XREF: get_random_bytes_from_hashAB+134j
		call	sub_19D70
get_random_bytes_from_hashAB endp

; ---------------------------------------------------------------------------
; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_8E0		proc near		; CODE XREF: _init_proc:loc_7BEp
		push	ebp
		mov	ebp, esp
		push	ebx
		call	sub_917
		add	ebx, 1B70Bh
		sub	esp, 14h
		mov	edx, dword ptr [dword_1BEDC]	;offset 
		test	edx, edx
		jz	short loc_911
		mov	eax, dword ptr [oba_1BFAC]	;offset
		test	eax, eax
		jz	short loc_911
		lea	edx, dword ptr [dword_1BEDC]	;offset 
		mov	[esp], edx
		call	eax

loc_911:				; CODE XREF: sub_8E0+1Aj sub_8E0+24j
		add	esp, 14h
		pop	ebx
		pop	ebp
		retn
sub_8E0		endp

;
; +-------------------------------------------------------------------------+

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_19C40	proc near		; CODE XREF: get_ibuff+267Ap

var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
arg_0		= dword	ptr  8
arg_4		= dword	ptr  0Ch
arg_8		= dword	ptr  10h
arg_C		= dword	ptr  14h

		push	ebp
		mov	ebp, esp
		push	edi
		push	esi
		sub	esp, 10h
		mov	eax, [ebp+arg_C]
		mov	edx, [ebp+arg_0]
		mov	esi, [ebp+arg_8]
		mov	edi, [ebp+arg_4]
		test	eax, eax
		mov	[ebp+var_10], edx
		jnz	short loc_19C90
		cmp	esi, edi
		ja	short loc_19CC0
		test	esi, esi
		jnz	short loc_19C6E
		mov	eax, 1
		xor	edx, edx
		div	esi
		mov	esi, eax

loc_19C6E:				; CODE XREF: sub_19C40+21j
		mov	ecx, [ebp+var_10]
		xor	edx, edx
		mov	eax, edi
		div	esi
		mov	edi, eax
		mov	eax, ecx
		div	esi
		mov	ecx, eax
		mov	edx, edi
		mov	eax, ecx
		add	esp, 10h
		pop	esi
		pop	edi
		pop	ebp
		retn
; ---------------------------------------------------------------------------
		align 10h

loc_19C90:				; CODE XREF: sub_19C40+19j
		cmp	eax, edi
		ja	short loc_19CB0
		bsr	edx, eax
		xor	edx, 1Fh
		mov	[ebp+var_C], edx
		jnz	short loc_19CD8
		cmp	esi, [ebp+var_10]
		jbe	loc_19D48
		cmp	eax, edi
		jb	loc_19D48

loc_19CB0:				; CODE XREF: sub_19C40+52j
		xor	edi, edi
		xor	ecx, ecx

loc_19CB4:				; CODE XREF: sub_19C40+FEj
					; sub_19C40+10Fj
		mov	eax, ecx
		mov	edx, edi
		add	esp, 10h
		pop	esi
		pop	edi
		pop	ebp
		retn
; ---------------------------------------------------------------------------
		align 10h

loc_19CC0:				; CODE XREF: sub_19C40+1Dj
		mov	ecx, edx
		mov	edx, edi
		mov	eax, ecx
		xor	edi, edi
		div	esi
		mov	ecx, eax
		mov	edx, edi
		mov	eax, ecx
		add	esp, 10h
		pop	esi
		pop	edi
		pop	ebp
		retn
; ---------------------------------------------------------------------------
		align 4

loc_19CD8:				; CODE XREF: sub_19C40+5Dj
		movzx	ecx, byte ptr [ebp+var_C]
		mov	edx, esi
		shl	eax, cl
		mov	[ebp+var_14], eax
		mov	eax, 20h
		sub	eax, [ebp+var_C]
		mov	ecx, eax
		shr	edx, cl
		movzx	ecx, byte ptr [ebp+var_C]
		or	edx, [ebp+var_14]
		shl	esi, cl
		mov	ecx, eax
		mov	[ebp+var_18], esi
		mov	esi, edi
		shr	esi, cl
		movzx	ecx, byte ptr [ebp+var_C]
		mov	[ebp+var_14], edx
		mov	edx, [ebp+var_10]
		shl	edi, cl
		mov	ecx, eax
		shr	edx, cl
		or	edi, edx
		mov	edx, esi
		mov	eax, edi
		div	[ebp+var_14]
		mov	esi, edx
		mov	edi, eax
		mul	[ebp+var_18]
		cmp	esi, edx
		mov	[ebp+var_14], edx
		jb	short loc_19D58
		mov	edx, [ebp+var_10]
		movzx	ecx, byte ptr [ebp+var_C]
		shl	edx, cl
		cmp	edx, eax
		jnb	short loc_19D3A
		cmp	esi, [ebp+var_14]
		jz	short loc_19D58

loc_19D3A:				; CODE XREF: sub_19C40+F3j
		mov	ecx, edi
		xor	edi, edi
		jmp	loc_19CB4
; ---------------------------------------------------------------------------
		align 8

loc_19D48:				; CODE XREF: sub_19C40+62j
					; sub_19C40+6Aj
		xor	edi, edi
		mov	ecx, 1
		jmp	loc_19CB4
; ---------------------------------------------------------------------------
		align 8

loc_19D58:				; CODE XREF: sub_19C40+E6j
					; sub_19C40+F8j
		lea	ecx, [edi-1]
		xor	edi, edi
		mov	eax, ecx
		mov	edx, edi
		add	esp, 10h
		pop	esi
		pop	edi
		pop	ebp
		retn
sub_19C40	endp

; ---------------------------------------------------------------------------

; =============== S U B	R O U T	I N E =======================================

; Attributes: noreturn bp-based	frame

sub_19D70	proc near		; CODE XREF: get_random_bytes_from_hashAB:loc_A61p
					; calcHashAB:loc_57BFp	...
		push	ebp
		mov	ebp, esp
		push	ebx
		call	sub_917
		add	ebx, 227Bh
		;call	___stack_chk_fail
sub_19D70	endp

; ---------------------------------------------------------------------------

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_19D90	proc near		; CODE XREF: _init_proc+27p
		push	ebp
		mov	ebp, esp
		push	esi
		push	ebx
		call	sub_917
		add	ebx, 225Ah
		mov	eax, dword ptr [dword_1BECC]	;offset 
		cmp	eax, 0FFFFFFFFh
		jz	short loc_19DC4
		lea	esi, dword ptr [dword_1BECC]	;offset 
		lea	esi, [esi+0]

loc_19DB8:				; CODE XREF: sub_19D90+32j
		sub	esi, 4
		call	eax
		mov	eax, [esi]
		cmp	eax, 0FFFFFFFFh
		jnz	short loc_19DB8

loc_19DC4:				; CODE XREF: sub_19D90+19j
		pop	ebx
		pop	esi
		pop	ebp
		retn
sub_19D90	endp

; =============== S U B	R O U T	I N E =======================================


sub_917		proc near		; CODE XREF: start+5p sub_8E0+4p ...
		mov	ebx, [esp+0]
		retn
sub_917		endp

; ---------------------------------------------------------------------------


end start     	
                   