# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

TEXLIVE_MODULE_CONTENTS="
	collection-latexrecommended.r71527
	anysize.r15878
	attachfile2.r69505
	booktabs.r53402
	breqn.r60881
	caption.r68425
	cite.r36428
	cmap.r57640
	crop.r55424
	ctable.r38672
	eso-pic.r67001
	etoolbox.r56554
	euenc.r19795
	euler.r42428
	everysel.r57489
	everyshi.r57001
	extsizes.r17263
	fancybox.r18304
	fancyref.r15878
	fancyvrb.r69536
	filehook.r64822
	float.r15878
	fontspec.r71237
	footnotehyper.r60374
	fp.r49719
	grffile.r52756
	hologo.r61719
	index.r24099
	infwarerr.r53023
	jknapltx.r19440
	koma-script.r72643
	l3experimental.r71991
	latexbug.r72762
	lineno.r67171
	listings.r72368
	lwarp.r70067
	mathspec.r42773
	mathtools.r72487
	mdwtools.r15878
	memoir.r69600
	metalogo.r18611
	microtype.r70805
	newfloat.r68434
	ntgclass.r65522
	parskip.r58358
	pdfcolfoot.r65512
	pdflscape.r64851
	pdfmanagement-testphase.r72677
	pdfpages.r72691
	polyglossia.r72368
	psfrag.r15878
	ragged2e.r67441
	rcs.r15878
	sansmath.r17997
	section.r20180
	seminar.r59801
	sepnum.r20186
	setspace.r65206
	subfig.r15878
	textcase.r67755
	thumbpdf.r62518
	translator.r59412
	typehtml.r17134
	ucharcat.r38907
	underscore.r18261
	unicode-math.r67919
	xcolor.r72484
	xfrac.r71430
	xkeyval.r63616
	xltxtra.r56594
	xunicode.r30466
"
TEXLIVE_MODULE_DOC_CONTENTS="
	anysize.doc.r15878
	attachfile2.doc.r69505
	booktabs.doc.r53402
	breqn.doc.r60881
	caption.doc.r68425
	cite.doc.r36428
	cmap.doc.r57640
	crop.doc.r55424
	ctable.doc.r38672
	eso-pic.doc.r67001
	etoolbox.doc.r56554
	euenc.doc.r19795
	euler.doc.r42428
	everysel.doc.r57489
	everyshi.doc.r57001
	extsizes.doc.r17263
	fancybox.doc.r18304
	fancyref.doc.r15878
	fancyvrb.doc.r69536
	filehook.doc.r64822
	float.doc.r15878
	fontspec.doc.r71237
	footnotehyper.doc.r60374
	fp.doc.r49719
	grffile.doc.r52756
	hologo.doc.r61719
	index.doc.r24099
	infwarerr.doc.r53023
	jknapltx.doc.r19440
	l3experimental.doc.r71991
	latexbug.doc.r72762
	lineno.doc.r67171
	listings.doc.r72368
	lwarp.doc.r70067
	mathspec.doc.r42773
	mathtools.doc.r72487
	mdwtools.doc.r15878
	memoir.doc.r69600
	metalogo.doc.r18611
	microtype.doc.r70805
	newfloat.doc.r68434
	ntgclass.doc.r65522
	parskip.doc.r58358
	pdfcolfoot.doc.r65512
	pdflscape.doc.r64851
	pdfmanagement-testphase.doc.r72677
	pdfpages.doc.r72691
	polyglossia.doc.r72368
	psfrag.doc.r15878
	ragged2e.doc.r67441
	rcs.doc.r15878
	sansmath.doc.r17997
	section.doc.r20180
	seminar.doc.r59801
	sepnum.doc.r20186
	setspace.doc.r65206
	subfig.doc.r15878
	textcase.doc.r67755
	thumbpdf.doc.r62518
	translator.doc.r59412
	typehtml.doc.r17134
	ucharcat.doc.r38907
	underscore.doc.r18261
	unicode-math.doc.r67919
	xcolor.doc.r72484
	xfrac.doc.r71430
	xkeyval.doc.r63616
	xltxtra.doc.r56594
	xunicode.doc.r30466
"
TEXLIVE_MODULE_SRC_CONTENTS="
	attachfile2.source.r69505
	booktabs.source.r53402
	breqn.source.r60881
	caption.source.r68425
	crop.source.r55424
	ctable.source.r38672
	eso-pic.source.r67001
	euenc.source.r19795
	euler.source.r42428
	everysel.source.r57489
	everyshi.source.r57001
	fancyref.source.r15878
	filehook.source.r64822
	float.source.r15878
	fontspec.source.r71237
	footnotehyper.source.r60374
	grffile.source.r52756
	hologo.source.r61719
	index.source.r24099
	infwarerr.source.r53023
	l3experimental.source.r71991
	latexbug.source.r72762
	listings.source.r72368
	lwarp.source.r70067
	mathtools.source.r72487
	mdwtools.source.r15878
	memoir.source.r69600
	metalogo.source.r18611
	microtype.source.r70805
	newfloat.source.r68434
	ntgclass.source.r65522
	parskip.source.r58358
	pdfcolfoot.source.r65512
	pdflscape.source.r64851
	pdfmanagement-testphase.source.r72677
	pdfpages.source.r72691
	psfrag.source.r15878
	ragged2e.source.r67441
	rcs.source.r15878
	subfig.source.r15878
	textcase.source.r67755
	typehtml.source.r17134
	ucharcat.source.r38907
	unicode-math.source.r67919
	xcolor.source.r72484
	xfrac.source.r71430
	xkeyval.source.r63616
	xltxtra.source.r56594
"

inherit texlive-module

DESCRIPTION="TeXLive LaTeX recommended packages"

LICENSE="CC0-1.0 GPL-1+ LPPL-1.2 LPPL-1.3 LPPL-1.3a LPPL-1.3c MIT TeX-other-free public-domain"
SLOT="0"
KEYWORDS="~amd64"
COMMON_DEPEND="
	>=dev-texlive/texlive-latex-2024
"
RDEPEND="
	${COMMON_DEPEND}
"
PDEPEND="
"
DEPEND="
	${COMMON_DEPEND}
"

TEXLIVE_MODULE_BINSCRIPTS="
	texmf-dist/scripts/attachfile2/pdfatfi.pl
	texmf-dist/scripts/lwarp/lwarpmk.lua
	texmf-dist/scripts/thumbpdf/thumbpdf.pl
"
