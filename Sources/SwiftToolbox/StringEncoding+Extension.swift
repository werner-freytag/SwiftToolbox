//
//  Copyright © Werner Freytag. All rights reserved.
//

import Foundation

/**
 Add missing static vars for values returned by String.availableStringEncodings. Names match
 CFStringEncodings
 */
public extension String.Encoding {
    /// Japanese (Mac OS)
    static let macJapanese = String.Encoding(rawValue: 2_147_483_649)

    /// Traditional Chinese (Mac OS)
    static let macTraditional = String.Encoding(rawValue: 2_147_483_650)

    /// Korean (Mac OS)
    static let macKorean = String.Encoding(rawValue: 2_147_483_651)

    /// Arabic (Mac OS)
    static let macArabic = String.Encoding(rawValue: 2_147_483_652)

    /// Hebrew (Mac OS)
    static let macHebrew = String.Encoding(rawValue: 2_147_483_653)

    /// Greek (Mac OS)
    static let macGreek = String.Encoding(rawValue: 2_147_483_654)

    /// Cyrillic (Mac OS)
    static let macCyrillic = String.Encoding(rawValue: 2_147_483_655)

    /// Devanagari (Mac OS)
    static let macDevanagari = String.Encoding(rawValue: 2_147_483_657)

    /// Gurmukhi (Mac OS)
    static let macGurmukhi = String.Encoding(rawValue: 2_147_483_658)

    /// Gujarati (Mac OS)
    static let macGujarati = String.Encoding(rawValue: 2_147_483_659)

    /// Thai (Mac OS)
    static let macThai = String.Encoding(rawValue: 2_147_483_669)

    /// Simplified Chinese (Mac OS)
    static let macSimplified = String.Encoding(rawValue: 2_147_483_673)

    /// Tibetan (Mac OS)
    static let macTibetan = String.Encoding(rawValue: 2_147_483_674)

    /// Central European (Mac OS)
    static let macCentral = String.Encoding(rawValue: 2_147_483_677)

    /// Dingbats (Mac OS)
    static let macDingbats = String.Encoding(rawValue: 2_147_483_682)

    /// Turkish (Mac OS)
    static let macTurkish = String.Encoding(rawValue: 2_147_483_683)

    /// Croatian (Mac OS)
    static let macCroatian = String.Encoding(rawValue: 2_147_483_684)

    /// Icelandic (Mac OS)
    static let macIcelandic = String.Encoding(rawValue: 2_147_483_685)

    /// Romanian (Mac OS)
    static let macRomanian = String.Encoding(rawValue: 2_147_483_686)

    /// Celtic (Mac OS)
    static let macCeltic = String.Encoding(rawValue: 2_147_483_687)

    /// Gaelic (Mac OS)
    static let macGaelic = String.Encoding(rawValue: 2_147_483_688)

    /// Keyboard Symbols (Mac OS)
    static let macKeyboard = String.Encoding(rawValue: 2_147_483_689)

    /// Farsi (Mac OS)
    static let macFarsi = String.Encoding(rawValue: 2_147_483_788)

    /// Cyrillic (Mac OS Ukrainian)
    static let macUkrainian = String.Encoding(rawValue: 2_147_483_800)

    /// Inuit (Mac OS)
    static let macInuit = String.Encoding(rawValue: 2_147_483_884)

    /// Western (ISO Latin 3)
    static let isoLatin3 = String.Encoding(rawValue: 2_147_484_163)

    /// Central European (ISO Latin 4)
    static let isoLatin4 = String.Encoding(rawValue: 2_147_484_164)

    /// Cyrillic (ISO 8859-5)
    static let isoLatinCyrillic = String.Encoding(rawValue: 2_147_484_165)

    /// Arabic (ISO 8859-6)
    static let isoLatinArabic = String.Encoding(rawValue: 2_147_484_166)

    /// Greek (ISO 8859-7)
    static let isoLatinGreek = String.Encoding(rawValue: 2_147_484_167)

    /// Hebrew (ISO 8859-8)
    static let isoLatinHebrew = String.Encoding(rawValue: 2_147_484_168)

    /// Turkish (ISO Latin 5)
    static let isoLatin5 = String.Encoding(rawValue: 2_147_484_169)

    /// Nordic (ISO Latin 6)
    static let isoLatin6 = String.Encoding(rawValue: 2_147_484_170)

    /// Thai (ISO 8859-11)
    static let isoLatinThai = String.Encoding(rawValue: 2_147_484_171)

    /// Baltic (ISO Latin 7)
    static let isoLatin7 = String.Encoding(rawValue: 2_147_484_173)

    /// Celtic (ISO Latin 8)
    static let isoLatin8 = String.Encoding(rawValue: 2_147_484_174)

    /// Western (ISO Latin 9)
    static let isoLatin9 = String.Encoding(rawValue: 2_147_484_175)

    /// Romanian (ISO Latin 10)
    static let isoLatin10 = String.Encoding(rawValue: 2_147_484_176)

    /// Latin-US (DOS)
    static let dosLatinUS = String.Encoding(rawValue: 2_147_484_672)

    /// Greek (DOS)
    static let dosGreek = String.Encoding(rawValue: 2_147_484_677)

    /// Baltic (DOS)
    static let dosBalticRim = String.Encoding(rawValue: 2_147_484_678)

    /// Western (DOS Latin 1)
    static let dosLatin1 = String.Encoding(rawValue: 2_147_484_688)

    /// Greek (DOS Greek 1)
    static let dosGreek1 = String.Encoding(rawValue: 2_147_484_689)

    /// Central European (DOS Latin 2)
    static let dosLatin2 = String.Encoding(rawValue: 2_147_484_690)

    /// Cyrillic (DOS)
    static let dosCyrillic = String.Encoding(rawValue: 2_147_484_691)

    /// Turkish (DOS)
    static let dosTurkish = String.Encoding(rawValue: 2_147_484_692)

    /// Portuguese (DOS)
    static let dosPortuguese = String.Encoding(rawValue: 2_147_484_693)

    /// Icelandic (DOS)
    static let dosIcelandic = String.Encoding(rawValue: 2_147_484_694)

    /// Hebrew (DOS)
    static let dosHebrew = String.Encoding(rawValue: 2_147_484_695)

    /// Canadian French (DOS)
    static let dosCanadianFrench = String.Encoding(rawValue: 2_147_484_696)

    /// Arabic (DOS)
    static let dosArabic = String.Encoding(rawValue: 2_147_484_697)

    /// Nordic (DOS)
    static let dosNordic = String.Encoding(rawValue: 2_147_484_698)

    /// Russian (DOS)
    static let dosRussian = String.Encoding(rawValue: 2_147_484_699)

    /// Greek (DOS Greek 2)
    static let dosGreek2 = String.Encoding(rawValue: 2_147_484_700)

    /// Thai (Windows, DOS)
    static let dosThai = String.Encoding(rawValue: 2_147_484_701)

    /// Simplified Chinese (Windows, DOS)
    static let dosChineseSimplif = String.Encoding(rawValue: 2_147_484_705)

    /// Korean (Windows, DOS)
    static let dosKorean = String.Encoding(rawValue: 2_147_484_706)

    /// Traditional Chinese (Windows, DOS)
    static let dosChineseTrad = String.Encoding(rawValue: 2_147_484_707)

    /// Hebrew (Windows)
    static let windowsHebrew = String.Encoding(rawValue: 2_147_484_933)

    /// Arabic (Windows)
    static let windowsArabic = String.Encoding(rawValue: 2_147_484_934)

    /// Baltic (Windows)
    static let windowsBalticRim = String.Encoding(rawValue: 2_147_484_935)

    /// Vietnamese (Windows)
    static let windowsVietnamese = String.Encoding(rawValue: 2_147_484_936)

    /// Japanese (Shift JIS X0213)
    static let shiftJIS_X0213 = String.Encoding(rawValue: 2_147_485_224)

    /// Chinese (GBK)
    static let GBK_95 = String.Encoding(rawValue: 2_147_485_233)

    /// Chinese (GB 18030)
    static let GB_18030_2000 = String.Encoding(rawValue: 2_147_485_234)

    /// Japanese (ISO 2022-JP-2)
    static let ISO_2022_JP_2 = String.Encoding(rawValue: 2_147_485_729)

    /// Japanese (ISO 2022-JP-1)
    static let ISO_2022_JP_1 = String.Encoding(rawValue: 2_147_485_730)

    /// Chinese (ISO 2022-CN)
    static let ISO_2022_CN = String.Encoding(rawValue: 2_147_485_744)

    /// Korean (ISO 2022-KR)
    static let ISO_2022_KR = String.Encoding(rawValue: 2_147_485_760)

    /// Simplified Chinese (GB 2312)
    static let EUC_CN = String.Encoding(rawValue: 2_147_486_000)

    /// Traditional Chinese (EUC)
    static let EUC_TW = String.Encoding(rawValue: 2_147_486_001)

    /// Korean (EUC)
    static let EUC_KR = String.Encoding(rawValue: 2_147_486_016)

    /// Japanese (Shift JIS)
    static let shiftJIS_plain = String.Encoding(rawValue: 2_147_486_209)

    /// Cyrillic (KOI8-R)
    static let KOI8_R = String.Encoding(rawValue: 2_147_486_210)

    /// Traditional Chinese (Big 5)
    static let big5 = String.Encoding(rawValue: 2_147_486_211)

    /// Western (Mac Mail)
    static let macRomanLatin1 = String.Encoding(rawValue: 2_147_486_212)

    /// Simplified Chinese (HZ GB 2312)
    static let HZ_GB_2312 = String.Encoding(rawValue: 2_147_486_213)

    /// Traditional Chinese (Big 5 HKSCS)
    static let big5_HKSCS_1999 = String.Encoding(rawValue: 2_147_486_214)

    /// Ukrainian (KOI8-U)
    static let KOI8_U = String.Encoding(rawValue: 2_147_486_216)

    /// Traditional Chinese (Big 5-E)
    static let big5_E = String.Encoding(rawValue: 2_147_486_217)

    /// Western (EBCDIC Latin Core)
    static let EBCDIC_US = String.Encoding(rawValue: 2_147_486_721)

    /// Western (EBCDIC Latin 1)
    static let EBCDIC_CP037 = String.Encoding(rawValue: 2_147_486_722)

    /// Unicode (UTF-7)
    static let UTF7 = String.Encoding(rawValue: 2_214_592_768)
}
